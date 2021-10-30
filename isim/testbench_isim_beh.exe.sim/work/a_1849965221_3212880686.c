/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/ISE_Projects/data_recovery_v8/var_shift_reg.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1849965221_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;

LAB0:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3520);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1352U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t3 = (t0 + 3616);
    t9 = (t3 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t8;
    xsi_driver_first_trans_delta(t3, 7U, 1, 0LL);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t13 = (8 - 2);
    t14 = (7 - t13);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t1 = (t3 + t16);
    t4 = (t0 + 3616);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 7U);
    xsi_driver_first_trans_delta(t4, 0U, 7U, 0LL);
    goto LAB6;

}

static void work_a_1849965221_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(56, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3680);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3536);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1849965221_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1849965221_3212880686_p_0,(void *)work_a_1849965221_3212880686_p_1};
	xsi_register_didat("work_a_1849965221_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_1849965221_3212880686.didat");
	xsi_register_executes(pe);
}
