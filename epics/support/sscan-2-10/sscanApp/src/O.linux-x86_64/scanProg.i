# 1 "../scanProg.st"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "../scanProg.st"
program scanProgress ("S=34ide:, P=34ide:scanProgress:")
# 29 "../scanProg.st"
# 1 "../seqPVmacros.h" 1
# 30 "../scanProg.st" 2

%% #include <string.h>
%% #include <epicsThread.h>
%% #include <epicsTime.h>
%% #include <string.h>
%% #include <time.h>

# 1 "../seqPVmacros.h" 1
# 38 "../scanProg.st" 2
# 54 "../scanProg.st"
short scanProgressDebug; assign scanProgressDebug to "{P}debug" ; monitor scanProgressDebug; evflag scanProgressDebug_mon; sync scanProgressDebug scanProgressDebug_mon;
double fractionDone; assign fractionDone to "{P}fractionDone" ;
double percentDone; assign percentDone to "{P}percentDone" ;
string startingTimeStr; assign startingTimeStr to "{P}startingTimeStr" ;
string endingTimeStr; assign endingTimeStr to "{P}endingTimeStr" ;
string remainingTimeStr; assign remainingTimeStr to "{P}remainingTimeStr" ;
string pauseTimeStr; assign pauseTimeStr to "{P}pauseTimeStr" ;
string totalElapsedTimeStr; assign totalElapsedTimeStr to "{P}totalElapsedTimeStr" ;
string totalActiveTimeStr; assign totalActiveTimeStr to "{P}totalActiveTimeStr" ;
int pauseSec; assign pauseSec to "{P}pauseSec" ;
int remainingSec; assign remainingSec to "{P}remainingSec" ;
int npts; assign npts to "{P}Ntotal" ;
int cpt; assign cpt to "{P}Nfinished" ;
short running; assign running to "{P}running" ;
short paused; assign paused to "{P}paused" ;
int Npauses; assign Npauses to "{P}Npauses" ;
double version; assign version to "{P}version" ;

int npts1; assign npts1 to "{S}scan1.NPTS" ;
int npts2; assign npts2 to "{S}scan2.NPTS" ;
int npts3; assign npts3 to "{S}scan3.NPTS" ;
int npts4; assign npts4 to "{S}scan4.NPTS" ;
int cpt1; assign cpt1 to "{S}scan1.CPT" ;
int cpt2; assign cpt2 to "{S}scan2.CPT" ;
int cpt3; assign cpt3 to "{S}scan3.CPT" ;
int cpt4; assign cpt4 to "{S}scan4.CPT" ;
short pause1; assign pause1 to "{S}scan1.PAUS" ; monitor pause1; evflag pause1_mon; sync pause1 pause1_mon;
short pause2; assign pause2 to "{S}scan2.PAUS" ; monitor pause2; evflag pause2_mon; sync pause2 pause2_mon;
short pause3; assign pause3 to "{S}scan3.PAUS" ; monitor pause3; evflag pause3_mon; sync pause3 pause3_mon;
short pause4; assign pause4 to "{S}scan4.PAUS" ; monitor pause4; evflag pause4_mon; sync pause4 pause4_mon;
short busy1; assign busy1 to "{S}scan1.BUSY" ; monitor busy1; evflag busy1_mon; sync busy1 busy1_mon;
short busy2; assign busy2 to "{S}scan2.BUSY" ; monitor busy2; evflag busy2_mon; sync busy2 busy2_mon;
short busy3; assign busy3 to "{S}scan3.BUSY" ; monitor busy3; evflag busy3_mon; sync busy3 busy3_mon;
short busy4; assign busy4 to "{S}scan4.BUSY" ; monitor busy4; evflag busy4_mon; sync busy4 busy4_mon;


char *SNLtaskName;
char new_msg[256];


long predictEnd;
long startTime;
long pauseStart;
long now;
char tStr[100];
char tStr1[100];
int beginPause;
int almostPaused;
int stopped;
int aPause;
int scanDim;

%% static void clocks2str(long isec, char *str);
%% static void formatTimeStr(char *tStr, int tStrLen, long final, int full);
%% static long calc_cpt(void);
%% static int allStopped(void);




ss scanProgress {

 state init {
  when () {
   SNLtaskName = macValueGet("name");
   scanDim = 1;
   pvGet(scanProgressDebug);
   { version = ( 2.1 ); pvPut(version,SYNC); }
   { fractionDone = ( 0.0 ); pvPut(fractionDone,SYNC); }
   { percentDone = ( 0.0 ); pvPut(percentDone,SYNC); }
   { strcpy(endingTimeStr,""); pvPut(endingTimeStr,SYNC); epicsThreadSleep(0.01); }
   { strcpy(remainingTimeStr,""); pvPut(remainingTimeStr,SYNC); epicsThreadSleep(0.01); }
   { strcpy(pauseTimeStr,""); pvPut(pauseTimeStr,SYNC); epicsThreadSleep(0.01); }
   { strcpy(startingTimeStr,""); pvPut(startingTimeStr,SYNC); epicsThreadSleep(0.01); }
   { strcpy(totalElapsedTimeStr,""); pvPut(totalElapsedTimeStr,SYNC); epicsThreadSleep(0.01); }
   { strcpy(totalActiveTimeStr,""); pvPut(totalActiveTimeStr,SYNC); epicsThreadSleep(0.01); }
   { pauseSec = ( 0 ); pvPut(pauseSec,SYNC); }
   { remainingSec = ( 0 ); pvPut(remainingSec,SYNC); }
   { npts = ( 0 ); pvPut(npts,SYNC); }
   { cpt = ( 0 ); pvPut(cpt,SYNC); }
   { Npauses = ( 0 ); pvPut(Npauses,SYNC); }
   { running = ( 0 ); pvPut(running,SYNC); }
   pvGet(busy1);
   pvGet(busy2);
   pvGet(busy3);
   pvGet(busy4);
   beginPause = 0;
   efClear(scanProgressDebug_mon);
   if (scanProgressDebug >= 1) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 142, SNLtaskName, 1);; printf("%s\n", "init complete in state init"); epicsThreadSleep(0.01); };
  } state idle
 }


 state idle {
  when (efTest(scanProgressDebug_mon)) {
   sprintf(new_msg, "changed debug flag to %d", scanProgressDebug);
   if (scanProgressDebug >= 1) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 150, SNLtaskName, 1);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
   efClear(scanProgressDebug_mon);
  } state idle

  when (busy1||busy2||busy3||busy4) {
   if (scanProgressDebug >= 1) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 155, SNLtaskName, 1);; printf("%s\n", "scan started"); epicsThreadSleep(0.01); };
   if (busy4) scanDim=4;
   else if (busy3) scanDim=3;
   else if (busy2) scanDim=2;
   else scanDim=1;
   sprintf(new_msg, "got scanDim = %d", scanDim);
   if (scanProgressDebug >= 2) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 161, SNLtaskName, 2);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
%% startTime = time(0L);
%% formatTimeStr(startingTimeStr,40,startTime,1);
   pvPut(startingTimeStr);
   { Npauses = ( 0 ); pvPut(Npauses,SYNC); }
   { pauseSec = ( 0 ); pvPut(pauseSec,SYNC); }
   { fractionDone = ( 0.0 ); pvPut(fractionDone,SYNC); }
   { percentDone = ( 0.0 ); pvPut(percentDone,SYNC); }
   { running = ( 1 ); pvPut(running,SYNC); }
   { strcpy(totalElapsedTimeStr,"00:00:00"); pvPut(totalElapsedTimeStr,SYNC); epicsThreadSleep(0.01); }
   { strcpy(totalActiveTimeStr,"00:00:00"); pvPut(totalActiveTimeStr,SYNC); epicsThreadSleep(0.01); }
   { strcpy(pauseTimeStr,"00:00:00"); pvPut(pauseTimeStr,SYNC); epicsThreadSleep(0.01); }
   pvGet(npts1);
   npts = npts1;
   if (scanDim>=2) {
    pvGet(npts2);
    npts *= npts2;
    if (scanDim>=3) {
     pvGet(npts3);
     npts *= npts3;
     if (scanDim>=4) {
      pvGet(npts4);
      npts *= npts4;
     }
    }
   }
   pvPut(npts);

  } state duringScan
 }


 state duringScan {
  when (!(busy1||busy2||busy3||busy4)) {
   if (scanProgressDebug >= 2) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 195, SNLtaskName, 2);; printf("%s\n", "in duringScan, scan is done, goto scanFinish"); epicsThreadSleep(0.01); };
  } state scanFinish

  when (paused) {
   beginPause = 1;
   if (scanProgressDebug >= 2) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 200, SNLtaskName, 2);; printf("%s\n", "in duringScan, scan is paused, goto duringScanPause"); epicsThreadSleep(0.01); };
  } state duringScanPause

  when (delay(2.)) {
   if (scanProgressDebug >= 3) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 204, SNLtaskName, 3);; printf("%s\n", "in duringScan, do a regular update to progress"); epicsThreadSleep(0.01); };
   pvGet(cpt1);
   if (scanDim>=2) {
    pvGet(cpt2);
    if (scanDim>=3) {
     pvGet(cpt3);
     if (scanDim>=4) {
      pvGet(cpt4);
     }
    }
   }
   cpt = calc_cpt();
   pvPut(cpt);
%% fractionDone = (double)cpt/(double)npts;
   sprintf(new_msg, "scanDim = %d,  completed = {%d/%d,  %d/%d,  %d/%d,  %d/%d}, fractionDone = %g", scanDim,cpt1,npts1,cpt2,npts2,cpt3,npts3,cpt4,npts4,fractionDone);
   if (scanProgressDebug >= 4) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 219, SNLtaskName, 4);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
   if (fractionDone>1.0) fractionDone = 1.0;
   else if (fractionDone<=0.0) fractionDone = 0.0;
   if (fractionDone>0.0) {
%% now = time(0L);
%% remainingSec = (1.0-fractionDone)/fractionDone * (double)(now-startTime-pauseSec);
    pvPut(remainingSec);
    predictEnd = now + remainingSec;
%% clocks2str(remainingSec,tStr);
    { strcpy(remainingTimeStr,tStr); pvPut(remainingTimeStr,SYNC); epicsThreadSleep(0.01); }
%% clocks2str(now-startTime,tStr);
    { strcpy(totalElapsedTimeStr,tStr); pvPut(totalElapsedTimeStr,SYNC); epicsThreadSleep(0.01); }
%% clocks2str(now-startTime-pauseSec,tStr);
    { strcpy(totalActiveTimeStr,tStr); pvPut(totalActiveTimeStr,SYNC); epicsThreadSleep(0.01); }
%% formatTimeStr(endingTimeStr,40,predictEnd,0);
    pvPut(endingTimeStr);
    sprintf(new_msg, "   now = %ld sec,   remaining = %d,  predictEnd = %ld",now,remainingSec,predictEnd);
    if (scanProgressDebug >= 5) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 236, SNLtaskName, 5);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
    sprintf(new_msg, "   remainingTimeStr = '%s',   endingTimeStr = '%s'",remainingTimeStr,endingTimeStr);
    if (scanProgressDebug >= 5) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 238, SNLtaskName, 5);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
   }
   else {
    { strcpy(remainingTimeStr,""); pvPut(remainingTimeStr,SYNC); epicsThreadSleep(0.01); }
    { strcpy(totalActiveTimeStr,""); pvPut(totalActiveTimeStr,SYNC); epicsThreadSleep(0.01); }
    { strcpy(endingTimeStr,""); pvPut(endingTimeStr,SYNC); epicsThreadSleep(0.01); }
    { strcpy(totalElapsedTimeStr,""); pvPut(totalElapsedTimeStr,SYNC); epicsThreadSleep(0.01); }
    { remainingSec = ( 0 ); pvPut(remainingSec,SYNC); }
   }
   pvPut(fractionDone);
   { percentDone = ( 100.0*fractionDone ); pvPut(percentDone,SYNC); }
  } state duringScan
 }


 state duringScanPause {
  when (!(busy1||busy2||busy3||busy4)) {
   if (scanProgressDebug >= 2) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 255, SNLtaskName, 2);; printf("%s\n", "in duringScanPause, scan is done, goto scanFinish"); epicsThreadSleep(0.01); };
  } state scanFinish

  when (beginPause) {
   beginPause = 0;
%% pauseStart = time(0L);
   { Npauses = ( Npauses+1 ); pvPut(Npauses,SYNC); }
   if (scanProgressDebug >= 2) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 262, SNLtaskName, 2);; printf("%s\n", "in duringScanPause, started a scan pause"); epicsThreadSleep(0.01); };
  } state duringScanPause

  when (!paused) {
%% pauseSec += time(0L) - pauseStart;
   pvPut(pauseSec);
%% clocks2str(pauseSec,tStr);
   { strcpy(pauseTimeStr,tStr); pvPut(pauseTimeStr,SYNC); epicsThreadSleep(0.01); }
   if (scanProgressDebug >= 2) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 270, SNLtaskName, 2);; printf("%s\n", "in duringScanPause, scan pause rescinded"); epicsThreadSleep(0.01); };
  } state duringScan

  when (delay(2.)) {
%% now = time(0L);
%% clocks2str(now-pauseStart,tStr);
%% clocks2str(now-pauseStart+pauseSec,tStr1);
   sprintf(pauseTimeStr,"current %s,  total %s",tStr,tStr1);
   pvPut(pauseTimeStr);
%% clocks2str(now-startTime,tStr);
   { strcpy(totalElapsedTimeStr,tStr); pvPut(totalElapsedTimeStr,SYNC); epicsThreadSleep(0.01); }
   if (fractionDone>0.0) {
%% remainingSec = (1.0-fractionDone)/fractionDone * (double)(now-startTime-pauseSec);
    pvPut(remainingSec);
    predictEnd = now + remainingSec;
%% formatTimeStr(endingTimeStr,40,predictEnd,0);
    pvPut(endingTimeStr);
   }
   sprintf(new_msg, "   periodic check in duringScanPause, time paused; '%s', ",pauseTimeStr);
   if (scanProgressDebug >= 5) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 289, SNLtaskName, 5);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
  } state duringScanPause
 }


 state scanFinish {
  when (1) {
%% now = time(0L);
   { strcpy(remainingTimeStr,"00:00:00"); pvPut(remainingTimeStr,SYNC); epicsThreadSleep(0.01); }
%% clocks2str(now-startTime-pauseSec,tStr);
   { strcpy(totalActiveTimeStr,tStr); pvPut(totalActiveTimeStr,SYNC); epicsThreadSleep(0.01); }
%% clocks2str(now-startTime,tStr);
   { strcpy(totalElapsedTimeStr,tStr); pvPut(totalElapsedTimeStr,SYNC); epicsThreadSleep(0.01); }
%% formatTimeStr(endingTimeStr,40,now,1);
   pvPut(endingTimeStr);
   { running = ( 0 ); pvPut(running,SYNC); }
   { remainingSec = ( 0 ); pvPut(remainingSec,SYNC); }


   pvGet(cpt1);
   if (scanDim>=2) {
    pvGet(cpt2);
    if (scanDim>=3) {
     pvGet(cpt3);
     if (scanDim>=4) {
      pvGet(cpt4);
     }
    }
   }
   cpt = calc_cpt();
   pvPut(cpt);
%% fractionDone = (double)cpt/(double)npts;
   if (fractionDone>1.0) fractionDone = 1.0;
   pvPut(fractionDone);
   { percentDone = ( 100.0*fractionDone ); pvPut(percentDone,SYNC); }
   if (scanProgressDebug >= 2) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 324, SNLtaskName, 2);; printf("%s\n", "no scan is busy in duringScan, back to idle"); epicsThreadSleep(0.01); };
  } state idle
 }
}






ss scanPauseUpdate {

 state initPause {
  when () {
   { paused = ( 0 ); pvPut(paused,SYNC); }
   almostPaused = 0;
   epicsThreadSleep(1.0);
   efSet(pause1_mon);
   if (scanProgressDebug >= 1) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 342, SNLtaskName, 1);; printf("%s\n", "completed state initPause"); epicsThreadSleep(0.01); };
  } state idlePause
 }


 state idlePause {
  when (efTest(pause1_mon) || efTest(pause2_mon) || efTest(pause3_mon) || efTest(pause4_mon)) {
   sprintf(new_msg, "at top of state idlePause, monitors are : =%d,  %d,  %d,  %d",pause1_mon,pause2_mon,pause3_mon,pause4_mon);
   if (scanProgressDebug >= 7) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 350, SNLtaskName, 7);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };

   efClear(pause1_mon);
   efClear(pause2_mon);
   efClear(pause3_mon);
   efClear(pause4_mon);
  } state checkAndSetPause


  when (almostPaused && (efTest(busy1_mon) || efTest(busy2_mon) || efTest(busy3_mon) || efTest(busy4_mon))) {
   sprintf(new_msg, "paused but waiting for busy, busy flags are:  busy1=%d, busy2=%d, busy3=%d, busy4=%d", busy1,busy2,busy3,busy4);
   if (scanProgressDebug >= 6) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 361, SNLtaskName, 6);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
   efClear(busy1_mon);
   efClear(busy2_mon);
   efClear(busy3_mon);
   efClear(busy4_mon);
  } state checkAndSetPause

  when (delay(20.)) {
   if (scanProgressDebug >= 7) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 369, SNLtaskName, 7);; printf("%s\n", "delay(UPDATE_DELAY_LONG) in scanPauseUpdate"); epicsThreadSleep(0.01); };
  } state checkAndSetPause
 }


 state checkAndSetPause {
  when (1) {
   sprintf(new_msg, "paused flags are pause1=%d, pause2=%d, pause3=%d, pause4=%d", pause1,pause2,pause3,pause4);
   if (scanProgressDebug >= 8) { printf("<%s,%d,%s,%d> ", "../scanProg.st", 377, SNLtaskName, 8);; printf("%s\n", new_msg); epicsThreadSleep(0.01); };
   aPause = pause1;
   if (scanDim>1) {
    aPause = aPause || pause2;
    if (scanDim>2) {
     aPause = aPause || pause3;
     if (scanDim>3) {
      aPause = aPause || pause4;
     }
    }
   }
   stopped = allStopped();
   almostPaused = aPause && !stopped;
   paused = aPause && stopped;
   pvPut(paused);
  } state idlePause
 }
}



%{

static long calc_cpt(void)
{
 long lcpt;
 long nBelow;

 lcpt = cpt1;
 if (scanDim<2) return lcpt;

 nBelow = npts1;
 lcpt += cpt2 * nBelow;
 if (scanDim<3) return lcpt;

 nBelow *= npts2;
 lcpt += cpt3 * nBelow;
 if (scanDim<4) return lcpt;

 nBelow *= npts3;
 lcpt += cpt4*nBelow;
 return lcpt;
}




static void clocks2str(long isec, char *str)
{
 int hh,mm,ss;
 int sign=1;
 if (isec>32000000) {
  strcpy(str,"infinite");
  return;
 }
 else if (isec<-32000000) {
  strcpy(str,"-infinite");
  return;
 }
 else if (isec<0) {
  isec *= -1;
  sign = -1;
 }
 ss = isec % 60;
 isec /= 60;
 mm = isec % 60;
 hh = sign * isec / 60;
 sprintf(str,"%02d:%02d:%02d",hh,mm,ss);
 return;
}



static void formatTimeStr(
char *tStr,
int tStrLen,
long final,
int full)
{
 long now;
 struct tm *tm1;
 int isToday=0;
 int isTomorrow=0;
 int isYesterday=0;
 int hh,mm,ss;

 if (!full) {
  tm1 = localtime(&final);
  hh = tm1->tm_hour;
  mm = tm1->tm_min;
  ss = tm1->tm_sec;

  now = time(0L);
  tm1 = localtime(&now);
  tm1->tm_hour = hh;
  tm1->tm_min = mm;
  tm1->tm_sec = ss;
  isToday = (final==mktime(tm1));
  if (!isToday) {
   tm1->tm_mday++;
   isTomorrow = (final==mktime(tm1));
  }
  if (!isToday && !isTomorrow) {
   tm1->tm_mday -= 2;
   isYesterday = (final==mktime(tm1));
  }
 }

 tm1 = localtime(&final);
 if (isToday) strftime(tStr,tStrLen, "%T Today (%A)",tm1);
 else if (isTomorrow) strftime(tStr,tStrLen, "%T Tomorrow (%A)",tm1);
 else if (isYesterday) strftime(tStr,tStrLen, "%T Yesterday (%A)",tm1);
 else strftime(tStr,tStrLen, "%T  (%a) %b %e, %Y",tm1);
 return;
}


static int allStopped(void)
{
 int stopCount;

 stopCount = (pause1 || !busy1) ? 1 : 0;
 stopCount += (scanDim<2) || (pause2 || !busy2) ? 2 : 0;
 stopCount += (scanDim<3) || (pause3 || !busy3) ? 4 : 0;
 stopCount += (scanDim<4) || (pause4 || !busy4) ? 8 : 0;
 return (stopCount==15);
}

}%
