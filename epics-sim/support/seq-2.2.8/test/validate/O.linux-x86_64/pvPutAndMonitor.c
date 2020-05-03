/* C code for program pvPutAndMonitorTest, generated by snc from ../pvPutAndMonitor.st */
#include <string.h>
#include <stddef.h>
#include <stdio.h>
#include <limits.h>

#include "seq_snc.h"
# line 3 "../pvPutAndMonitor.st"
#include "../testSupport.h"

/* Variable declarations */
struct seqg_vars {
# line 7 "../pvPutAndMonitor.st"
	int x;
};


/* Function declarations */

#define seqg_var (*(struct seqg_vars *const *)seqg_env)

/* Program init func */
static void seqg_init(PROG_ID seqg_env)
{
}

/* Program entry func */
static void seqg_entry(SS_ID seqg_env)
{
# line 12 "../pvPutAndMonitor.st"
	seq_test_init(1);
}

/****** Code for state "put_then_incr" in state set "test" ******/

/* Event function for state "put_then_incr" in state set "test" */
static seqBool seqg_event_test_0_put_then_incr(SS_ID seqg_env, int *seqg_ptrn, int *seqg_pnst)
{
	if (TRUE)
	{
		*seqg_pnst = 1;
		*seqg_ptrn = 0;
		return TRUE;
	}
	return FALSE;
}

/* Action function for state "put_then_incr" in state set "test" */
static void seqg_action_test_0_put_then_incr(SS_ID seqg_env, int seqg_trn, int *seqg_pnst)
{
	switch(seqg_trn)
	{
	case 0:
		{
# line 18 "../pvPutAndMonitor.st"
			seqg_var->x++;
# line 19 "../pvPutAndMonitor.st"
			testDiag("before put: x==%d", seqg_var->x);
# line 20 "../pvPutAndMonitor.st"
			seq_pvPutTmo(seqg_env, 0/*x*/, DEFAULT, DEFAULT_TIMEOUT);
# line 21 "../pvPutAndMonitor.st"
			seqg_var->x++;
		}
		return;
	}
}

/****** Code for state "test_x" in state set "test" ******/

/* Entry function for state "test_x" in state set "test" */
static void seqg_entry_test_0_test_x(SS_ID seqg_env)
{
# line 26 "../pvPutAndMonitor.st"
	testDiag("on entry to state test_x: x==%d", seqg_var->x);
}

/* Event function for state "test_x" in state set "test" */
static seqBool seqg_event_test_0_test_x(SS_ID seqg_env, int *seqg_ptrn, int *seqg_pnst)
{
# line 28 "../pvPutAndMonitor.st"
	if (seq_delay(seqg_env, 1) && seqg_var->x > 1)
	{
		seq_exit(seqg_env);
		*seqg_ptrn = 0;
		return TRUE;
	}
# line 31 "../pvPutAndMonitor.st"
	if (seq_delay(seqg_env, 1))
	{
		seq_exit(seqg_env);
		*seqg_ptrn = 1;
		return TRUE;
	}
	return FALSE;
}

/* Action function for state "test_x" in state set "test" */
static void seqg_action_test_0_test_x(SS_ID seqg_env, int seqg_trn, int *seqg_pnst)
{
	switch(seqg_trn)
	{
	case 0:
		{
# line 29 "../pvPutAndMonitor.st"
			testFail("when (x>1): x==%d (you should never see this)", seqg_var->x);
		}
		return;
	case 1:
		{
# line 32 "../pvPutAndMonitor.st"
			testPass("when(): x==%d", seqg_var->x);
		}
		return;
	}
}

/* Program exit func */
static void seqg_exit(SS_ID seqg_env)
{
# line 38 "../pvPutAndMonitor.st"
	seq_test_done();
}

#undef seqg_var

/************************ Tables ************************/

/* Channel table */
static seqChan seqg_chans[] = {
	/* chName, offset, varName, varType, count, eventNum, efId, monitored, queueSize, queueIndex */
	{"counter", offsetof(struct seqg_vars, x), "x", P_INT, 1, 1, 0, 1, 0, 0},
};

/* Event masks for state set "test" */
static const seqMask seqg_mask_test_0_put_then_incr[] = {
	0x00000000,
};
static const seqMask seqg_mask_test_0_test_x[] = {
	0x00000002,
};

/* State table for state set "test" */
static seqState seqg_states_test[] = {
	{
	/* state name */        "put_then_incr",
	/* action function */   seqg_action_test_0_put_then_incr,
	/* event function */    seqg_event_test_0_put_then_incr,
	/* entry function */    0,
	/* exit function */     0,
	/* event mask array */  seqg_mask_test_0_put_then_incr,
	/* state options */     (0)
	},
	{
	/* state name */        "test_x",
	/* action function */   seqg_action_test_0_test_x,
	/* event function */    seqg_event_test_0_test_x,
	/* entry function */    seqg_entry_test_0_test_x,
	/* exit function */     0,
	/* event mask array */  seqg_mask_test_0_test_x,
	/* state options */     (0)
	},
};

/* State set table */
static seqSS seqg_statesets[] = {
	{
	/* state set name */    "test",
	/* states */            seqg_states_test,
	/* number of states */  2
	},
};

/* Program table (global) */
seqProgram pvPutAndMonitorTest = {
	/* magic number */      2002008,
	/* program name */      "pvPutAndMonitorTest",
	/* channels */          seqg_chans,
	/* num. channels */     1,
	/* state sets */        seqg_statesets,
	/* num. state sets */   1,
	/* user var size */     sizeof(struct seqg_vars),
	/* param */             "",
	/* num. event flags */  0,
	/* encoded options */   (0 | OPT_CONN | OPT_NEWEF | OPT_REENT | OPT_SAFE),
	/* init func */         seqg_init,
	/* entry func */        seqg_entry,
	/* exit func */         seqg_exit,
	/* num. queues */       0
};

#define PROG_NAME pvPutAndMonitorTest
#include "seqMain.c"

/* Register sequencer commands and program */
#include "epicsExport.h"
static void pvPutAndMonitorTestRegistrar (void) {
    seqRegisterSequencerCommands();
    seqRegisterSequencerProgram (&pvPutAndMonitorTest);
}
epicsExportRegistrar(pvPutAndMonitorTestRegistrar);
