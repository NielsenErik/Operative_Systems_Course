#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <fcntl.h>
#include <termios.h>

#define MAX_INPUT1 10
#define MAX_PATH 60
#define MAX_CHD 100
#define PIDLEN 15
#define MAX_COUNT_CLIENT 10

/////////////////////////////////////////////////////////////////////////////
/////////////////////////PARTE DATA DAL TESTO///////////////////////
/////////////////////////////////////////////////////////////////////////////
typedef enum {
KP_ECHO_OFF,
KP_ECHO_ON,
} kp_echo_t;
int keypress(const kp_echo_t echo) {
struct termios savedState, newState;
unsigned char echo_bit; //flag
int c;
if (-1 == tcgetattr(STDIN_FILENO, &savedState)) { return EOF; }; //error
newState = savedState;
if (KP_ECHO_OFF == echo) { echo_bit = ECHO; } else { echo_bit = 0; };
/* canonical input + set echo with minimal input as 1. */
newState.c_lflag &= ~(echo_bit | ICANON);
newState.c_cc[VMIN] = 1;
if (-1 == tcsetattr(STDIN_FILENO, TCSANOW, &newState)) { return EOF; }; //error;
c = getchar(); /* block until key press */
if (-1 == tcsetattr(STDIN_FILENO, TCSANOW, &savedState)) { return EOF; }; //error
return c;
}
/////////////////////////////////////////////////////////////////////////////
////////////////////////////CODICE//////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

int logFile = 0;
char logName[MAX_PATH];
pid_t parent = 0;
int count = 0, countClient=0;
pid_t chd[MAX_CHD]={0};

void perr(char * msg){
    fprintf(stderr, "%s\n", msg);
}

void quit( int err){
    switch(err){
        case 0: exit(0);
                break;
        case 1: perr("Input error");
                exit(1);
                break;
        case 2: perr("Wrong mode");
                exit(2);
                break;
        case 3: perr("Error logFile");
                exit(3);
                break;
        case 4: perr("LogFile already exists");
                exit(4);
                break;
        case 5: perr("Error fork");
                exit(5);
                break;
        default:break;
    }
}

void intHandler(){
    char tmp[MAX_PATH];
    sprintf(tmp, "%d\n", count);
    write(logFile, tmp, strlen(tmp));
    exit(0);
}

int forking(){
    int f = fork();
    if(f<0){
        quit(5);
    }
    return f;
}

void s1Handler(int signo){
    char tmp[MAX_PATH];
    int f = forking();
    if(f == 0){
        chd[count]=getpid();
        signal(SIGINT, SIG_IGN);
        while(1);
    }
    else{
        chd[count]=f;       
        fflush(stdout);
        printf("[server] %d\n", chd[count]); 
        sprintf(tmp, "+%d\n", chd[count]);
        write(logFile, tmp, strlen(tmp));        
        count++;
    }
}

void s2Handler(int signo){
    if(count>0){
        char tmp[MAX_PATH];
        sprintf(tmp, "-%d\n", chd[count-1]);
        fflush(stdout);
        printf("[server] %d\n", chd[count-1]); 
        write(logFile, tmp, strlen(tmp));  
        kill(chd[count-1], SIGTERM);
        count--;
    }
    else{
        fflush(stdout);
        printf("[server] 0\n"); 
        write(logFile, "0\n", strlen("0\n"));
    }
}

void serverMode(){
    if((logFile = open(logName, O_RDONLY))>0){
        quit(4);
    }
    if((logFile = open(logName, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR))<0){
        quit(3);
    }
    fflush(stdout);
    printf("[server:%d]\n", parent);
    char tmp[MAX_PATH];
    sprintf(tmp, "%d\n", parent);
    write(logFile, tmp, strlen(tmp));
    while(1);
}

void intClient(int signo){
    quit(0);
}

void clientMode(){
    char c;
    char buffer[PIDLEN];
    int serverPid;
   while(1){
       logFile = open(logName, O_RDONLY);
       if(logFile>0){
           break;
       }
    }
    sleep(1);
    //logFile = open(logName, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR);
    int r = read(logFile, &buffer, PIDLEN);
    serverPid = atoi(buffer);
    fflush(stdout);
    if(r>0){
        printf("[client] server:%d\n", serverPid);
    }
    else{
        fprintf(stderr, "No input server\n");
    }    
    while(1){
        c = keypress(KP_ECHO_OFF); // read single keypress without echoing
        if (c=='+') {
            if(countClient<=10){
                kill(serverPid, SIGUSR1);
                countClient++;
                fflush(stdout);
                printf("[client] %d\n", countClient);
            }
        };
        if (c=='-') {
            if(countClient>0){
                kill(serverPid, SIGUSR2);
                countClient--;
                fflush(stdout);
                printf("[client] %d\n", countClient);
            }            
        };
        if (c=='\n') {
            int k = countClient;
            for(int i = k; i>0; i--){
                kill(serverPid, SIGUSR2);
                sleep(1);
                countClient--;
                fflush(stdout);
                printf("[client] %d\n", countClient);
            }
            kill(serverPid, SIGINT);
            break;
        };
    }
}

void signalHandlerServer(){
    signal(SIGINT, intHandler);
    signal(SIGUSR1, s1Handler);
    signal(SIGUSR2, s2Handler);
}

void signalHandlerClient(){
    signal(SIGINT, intClient);
}


int main(int argc, char ** argv){
    if(argc != 3){
        quit(1);
    }
    strcpy(logName, argv[2]);
    /*if((logFile = open(logName, O_RDONLY))>0){
        quit(4);
    }
    if((logFile = open(logName, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR))<0){
        quit(3);
    }*/
    fflush(stdout);
    parent = getpid();
    char input1[10];
    strcpy(input1, argv[1]);
    if(strcmp(input1, "server")==0 || strcmp(input1, "client")==0){
        if(strcmp(input1, "server")==0){
            signalHandlerServer();
            serverMode();
        }
        else if(strcmp(input1, "client")==0){
            signalHandlerClient();
            clientMode();
        }
    }
    else{
        quit(2);
    }

    return 0;
}