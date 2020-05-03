# 1 "../editSseq.st"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "../editSseq.st"
program editSseq ("P=xxx:, Q=ES:")
# 24 "../editSseq.st"
option +r;
# 34 "../editSseq.st"
# 1 "/usr/local/epics/support/seq-2.2.8/include/seq_release.h" 1
# 35 "../editSseq.st" 2




%% static int lineNum(char c);
%% static char fieldChar(int n);
%% static char fieldCharCheck(char c);
%% static int reconcilePVs(SS_ID ssId, struct UserVar *pVar,
%% char *pattern, string *PV, int *PVIndex, char c_dest);

short Debug;
assign Debug to "{P}{Q}Debug";
monitor Debug;

string message;
assign message to "{P}{Q}message";

short opAlert;
assign opAlert to "{P}{Q}Alert";

short opAck;
assign opAck to "{P}{Q}OperAck";
monitor opAck;

string recordName;
assign recordName to "{P}{Q}recordName";
monitor recordName;
evflag recordNameMon; sync recordName recordNameMon;




int recType;

string recordType;
assign recordType to "";

string command;
assign command to "{P}{Q}command";
monitor command;
evflag commandMon; sync command commandMon;




string DOL[11];
assign DOL to {""};
double DLY[11];
assign DLY to {""};
string STR[11];
assign STR to {""};
double DO[11];
assign DO to {""};
string LNK[11];
assign LNK to {""};
string WAIT[11];
assign WAIT to {""};

int DOLIndex[10];
int STRIndex[10];
int LNKIndex[10];
int WAITIndex[10];

int i, j, src, dest, inc, n, permit;
string fieldName, pattern;
int rewroteRecordName;
char *s, c, c_src, c_dest;
int ic;

%%#include <string.h>
%%#include <math.h>
%%#include <stdlib.h>
%%#include <ctype.h>





ss editSseq
{
 state init {
  entry {
   if (Debug) printf("editSseq:init: entry\n");
  }
  when () {
   rewroteRecordName = 0;
   strcpy(recordType, "");
   recType = 0;
   strcpy(message, "");
   pvPut(message);
   opAlert = 0;
   pvPut(opAlert);
   efClear(commandMon);
  } state waitForCmnd
 }

 state waitForCmnd {
  entry {
   if (Debug>10) printf("editSseq:waitForCmnd: entry\n");
   if (rewroteRecordName) {
    efClear(recordNameMon);
    rewroteRecordName = 0;
   }
  }
  when (efTestAndClear(commandMon)) {
  } state newCommand
  when (efTestAndClear(recordNameMon)) {
  } state newRecordName
  when (opAck) {
   strcpy(message, "");
   pvPut(message);
   opAlert = 0;
   pvPut(opAlert);
   opAck = 0;
   pvPut(opAck);
  } state waitForCmnd
 }

 state newRecordName {
  entry {
   if (Debug) printf("editSseq:newRecordName: entry\n");
   if (Debug) printf("editSseq:newRecordName: recordName='%s'\n", recordName);

   if (*recordName) {
    s = strchr(recordName, '.');
    if (s) {
     *s = '\0';
     pvPut(recordName);
     rewroteRecordName = 1;
    }
   }
   if (Debug) printf("editSseq:newRecordName: recordName='%s'\n", recordName);
   strcpy(recordType, "");
   recType = 0;
  }
  when () {
   sprintf(fieldName, "%s.RTYP", recordName);
   pvAssign(recordType, fieldName);
   pvGet(recordType);
   if (strcmp(recordType, "sseq")==0) {
    recType = 1;
   } else if (strcmp(recordType, "seq")==0) {
    recType = 2;
   } else {
    recType = 0;
   }
   for (i=0; i<10; i++) {
    sprintf(fieldName, "%s.DOL%c", recordName, fieldChar(i));
    pvAssign(DOL[i], fieldName);
    DOLIndex[i] = pvIndex(DOL[i]);

    sprintf(fieldName, "%s.DLY%c", recordName, fieldChar(i));
    pvAssign(DLY[i], fieldName);

    sprintf(fieldName, "%s.DO%c", recordName, fieldChar(i));
    pvAssign(DO[i], fieldName);

    sprintf(fieldName, "%s.LNK%c", recordName, fieldChar(i));
    pvAssign(LNK[i], fieldName);
    LNKIndex[i] = pvIndex(LNK[i]);

    if (recType == 1) {
     sprintf(fieldName, "%s.STR%c", recordName, fieldChar(i));
     pvAssign(STR[i], fieldName);
     STRIndex[i] = pvIndex(STR[i]);

     sprintf(fieldName, "%s.WAIT%c", recordName, fieldChar(i));
     pvAssign(WAIT[i], fieldName);
     WAITIndex[i] = pvIndex(WAIT[i]);
    }
   }
  } state waitForCmnd
 }


 state newCommand {
  entry {
   if (Debug) {
    printf("editSseq:newCommand: entry\n");
    printf("editSseq:newCommand: command: '%s'\n", command);
    printf("editSseq:newCommand: recordType=%s\n", recordType);
    printf("editSseq:newCommand: recType=%d\n", recType);
   }
   for (i=0; i<10; i++) {
    if (recType == 2 || recType == 1) {
     pvGet(DOL[i]);
     pvGet(DLY[i]);
     pvGet(DO[i]);
     pvGet(LNK[i]);
     if (recType == 1) {
      pvGet(STR[i]);
      pvGet(WAIT[i]);
     }
    }
   }
   strcpy(message, "");
   pvPut(message);
   opAlert = 0;
   pvPut(opAlert);
  }

  when (strcmp(command, "")==0) {
  } state waitForCmnd

  when (recType == 0) {
   sprintf(message, "unsupported recordType '%s'", recordType);
   pvPut(message);
   opAlert = 1;
   pvPut(opAlert);
  } state waitForCmnd


  when ((command[1] == '+') || (command[1] == '-')) {
   if (Debug) printf("command '+/-'\n");
   c_src = fieldCharCheck(command[0]);
   src = lineNum(c_src);
   if (command[1]=='+') {
    dest = src+1;
   } else {
    dest = src-1;
   }
   c_dest = fieldChar(dest);
   if (Debug) printf("src='%c'(%d), dest='%c'(%d)\n", c_src, src, c_dest, dest);

   permit = 1;


   sprintf(pattern, "%s.DO%c", recordName, c_dest);
   for (i=0; i<10; i++) {
    if (strstr(DOL[i], pattern) != 0) {
     permit = 0;
     sprintf(message, ("DOL%c would be orphaned"), (fieldChar(i))); pvPut(message); opAlert = 1; pvPut(opAlert);
    }
   }

   sprintf(pattern, "%s.DO%c", recordName, c_dest);
   for (i=0; i<10; i++) {
    if (strstr(LNK[i], pattern) != 0) {
     permit = 0;
     sprintf(message, ("LNK%c would be orphaned"), (fieldChar(i))); pvPut(message); opAlert = 1; pvPut(opAlert);
    }
   }
   if (recType == 1) {

    sprintf(pattern, "After%c", c_dest);
    for (i=0; i<10; i++) {
     if (strstr(WAIT[i], pattern) != 0) {
      permit = 0;
      sprintf(message, ("WAIT%c would be orphaned"), (fieldChar(i))); pvPut(message); opAlert = 1; pvPut(opAlert);
     }
    }


    sprintf(pattern, "%s.STR%c", recordName, c_dest);
    for (i=0; i<10; i++) {
     if (strstr(DOL[i], pattern) != 0) {
      permit = 0;
      sprintf(message, ("DOL%c would be orphaned"), (fieldChar(i))); pvPut(message); opAlert = 1; pvPut(opAlert);
     }
    }

    sprintf(pattern, "%s.STR%c", recordName, c_dest);
    for (i=0; i<10; i++) {
     if (strstr(LNK[i], pattern) != 0) {
      permit = 0;
      sprintf(message, ("LNK%c would be orphaned"), (fieldChar(i))); pvPut(message); opAlert = 1; pvPut(opAlert);
     }
    }
   }

   if (permit && src>=0 && src<=9 && dest>=0 && dest<=9) {
    strcpy(DOL[dest], DOL[src]);
    strcpy(DOL[src], "");
    DLY[dest] = DLY[src];
    DLY[src] = 0;
    DO[dest] = DO[src];
    DO[src] = 0;
    strcpy(LNK[dest], LNK[src]);
    strcpy(LNK[src], "");


    sprintf(pattern, "%s.DO%c", recordName, c_src);
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, pVar->c_dest);


    sprintf(pattern, "%s.DO%c", recordName, c_src);
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, pVar->c_dest);

    pvPut(DOL[src]);
    pvPut(DOL[dest]);
    pvPut(DLY[src]);
    pvPut(DLY[dest]);
    pvPut(DO[src]);
    pvPut(DO [dest]);
    pvPut(LNK[src]);
    pvPut(LNK[dest]);

    if (recType == 1) {
     strcpy(STR[dest], STR[src]);
     strcpy(STR[src], "");
     strcpy(WAIT[dest], WAIT[src]);
     strcpy(WAIT[src], "NoWait");


     sprintf(pattern, "After%c", c_src);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->WAIT, pVar->WAITIndex, pVar->c_dest);


     sprintf(pattern, "%s.STR%c", recordName, c_src);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, pVar->c_dest);


     sprintf(pattern, "%s.STR%c", recordName, c_src);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, pVar->c_dest);

     pvPut(STR[src]);
     pvPut(STR[dest]);
     pvPut(WAIT[src]);
     pvPut(WAIT[dest]);
    }
   } else {
    if (permit) sprintf(message, ("src (%c) out of range"), (command[1])); pvPut(message); opAlert = 1; pvPut(opAlert);
   }
  } state waitForCmnd


  when (strchr(command, '/')!=0) {
   if (Debug) printf("command '/'\n");
   c_src = fieldCharCheck(command[0]);
   src = lineNum(c_src);
   c_dest = fieldCharCheck(command[2]);
   dest = lineNum(c_dest);
   if (Debug) printf("swap src='%c'(%d), dest='%c'(%d)\n", c_src, src, c_dest, dest);

   if (src>=0 && src<=9 && dest>=0 && dest<=9) {
    strcpy(DOL[10], DOL[dest]);
    strcpy(DOL[dest], DOL[src]);
    strcpy(DOL[src], DOL[10]);

    DLY[10] = DLY[dest];
    DLY[dest] = DLY[src];
    DLY[src] = DLY[10];

    DO[10] = DO[dest];
    DO[dest] = DO[src];
    DO[src] = DO[10];

    strcpy(LNK[10], LNK[dest]);
    strcpy(LNK[dest], LNK[src]);
    strcpy(LNK[src], LNK[10]);


    sprintf(pattern, "%s.DO%c", recordName, c_src);
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, '*');
    sprintf(pattern, "%s.DO%c", recordName, c_dest);
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, pVar->c_src);
    sprintf(pattern, "%s.DO%c", recordName, '*');
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, pVar->c_dest);


    sprintf(pattern, "%s.DO%c", recordName, c_src);
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, '*');
    sprintf(pattern, "%s.DO%c", recordName, c_dest);
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, pVar->c_src);
    sprintf(pattern, "%s.DO%c", recordName, '*');
    %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, pVar->c_dest);

    pvPut(DOL[src]);
    pvPut(DOL[dest]);
    pvPut(DLY[src]);
    pvPut(DLY[dest]);
    pvPut(DO[src]);
    pvPut(DO [dest]);
    pvPut(LNK[src]);
    pvPut(LNK[dest]);

    if (recType == 1) {
     strcpy(STR[10], STR[dest]);
     strcpy(STR[dest], STR[src]);
     strcpy(STR[src], STR[10]);

     strcpy(WAIT[10], WAIT[dest]);
     strcpy(WAIT[dest], WAIT[src]);
     strcpy(WAIT[src], WAIT[10]);


     sprintf(pattern, "After%c", c_src);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->WAIT, pVar->WAITIndex, '*');
     sprintf(pattern, "After%c", c_dest);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->WAIT, pVar->WAITIndex, pVar->c_src);
     sprintf(pattern, "After%c", '*');
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->WAIT, pVar->WAITIndex, pVar->c_dest);


     sprintf(pattern, "%s.STR%c", recordName, c_src);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, '*');
     sprintf(pattern, "%s.STR%c", recordName, c_dest);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, pVar->c_src);
     sprintf(pattern, "%s.STR%c", recordName, '*');
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->LNK, pVar->LNKIndex, pVar->c_dest);


     sprintf(pattern, "%s.STR%c", recordName, c_src);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, '*');
     sprintf(pattern, "%s.STR%c", recordName, c_dest);
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, pVar->c_src);
     sprintf(pattern, "%s.STR%c", recordName, '*');
     %%reconcilePVs(ssId, pVar, pVar->pattern, pVar->DOL, pVar->DOLIndex, pVar->c_dest);

     pvPut(STR[src]);
     pvPut(STR[dest]);
     pvPut(WAIT[src]);
     pvPut(WAIT[dest]);
    }
   } else {
    sprintf(message, "src (%c) out of range", command[1]);
    pvPut(message);
    opAlert = 1;
    pvPut(opAlert);
   }
  } state waitForCmnd

  when () {
   if (Debug) printf("unimplemented command '%s'\n", command);
  } state waitForCmnd
 }
}



%{
static int lineNum(char c) {
 int n;
 if (isdigit((int)c)) {
  if (c=='0') {
   n = 9;
  } else {
   n = c-'1';
  }
 } else if (toupper((int)c) == 'A') {
  n = 9;
 } else {
  n = 10;
 }
 return(n);
}
static char fieldChars[10] = {'1', '2', '3', '4', '5', '6', '7', '8', '9', 'A'};
static char fieldChar(int n) {
 char c;
 if (n>=0 && n<10) {
  c = fieldChars[n];
 } else {
  c = '?';
 }
 return(c);
}

static char fieldCharCheck(char c) {
 if (c=='0' || c=='a') c = 'A';
 return(c);
}




static int reconcilePVs(SS_ID ssId, struct UserVar *pVar,
 char *pattern, string *PV, int *PVIndex, char c_dest) {
 int i;

 for (i=0; i<10; i++) {
  if (strstr(PV[i], pattern) != 0) {
   PV[i][strlen(pattern)-1] = c_dest;
   if (c_dest != '*') {
    seq_pvPut(ssId, PVIndex[i], 0);
   }
  }
 }
 return(0);
}

}%
