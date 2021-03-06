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
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


char *work_p_3116869533_sub_1708206647_4164996226(char *t1, char *t2, unsigned char t3, char *t4)
{
    char t5[128];
    char t6[24];
    char t7[16];
    char t12[16];
    char t17[16];
    char *t0;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned char t23;
    char *t24;
    char *t25;
    int t26;
    char *t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;
    int t37;
    char *t38;
    int t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    unsigned char t45;
    int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;

LAB0:    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 15;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t10 = (0 - 15);
    t11 = (t10 * -1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = (t12 + 0U);
    t13 = (t9 + 0U);
    *((int *)t13) = 15;
    t13 = (t9 + 4U);
    *((int *)t13) = 0;
    t13 = (t9 + 8U);
    *((int *)t13) = -1;
    t14 = (0 - 15);
    t11 = (t14 * -1);
    t11 = (t11 + 1);
    t13 = (t9 + 12U);
    *((unsigned int *)t13) = t11;
    t13 = (t5 + 4U);
    t15 = ((IEEE_P_2592010699) + 4024);
    t16 = (t13 + 88U);
    *((char **)t16) = t15;
    t18 = (t13 + 56U);
    *((char **)t18) = t17;
    xsi_type_set_default_value(t15, t17, t12);
    t19 = (t13 + 64U);
    *((char **)t19) = t12;
    t20 = (t13 + 80U);
    *((unsigned int *)t20) = 16U;
    t21 = (t6 + 4U);
    *((unsigned char *)t21) = t3;
    t22 = (t6 + 5U);
    t23 = (t4 != 0);
    if (t23 == 1)
        goto LAB3;

LAB2:    t24 = (t6 + 13U);
    *((char **)t24) = t7;
    t25 = (t7 + 0U);
    t26 = *((int *)t25);
    t27 = (t7 + 8U);
    t28 = *((int *)t27);
    t29 = (15 - t26);
    t11 = (t29 * t28);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t32 = (t4 + t31);
    t33 = *((unsigned char *)t32);
    t34 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t3, t33);
    t35 = (t13 + 56U);
    t36 = *((char **)t35);
    t35 = (t12 + 0U);
    t37 = *((int *)t35);
    t38 = (t12 + 8U);
    t39 = *((int *)t38);
    t40 = (0 - t37);
    t41 = (t40 * t39);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t44 = (t36 + t43);
    *((unsigned char *)t44) = t34;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (0 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (1 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (1 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t33 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t3, t23);
    t16 = (t7 + 0U);
    t28 = *((int *)t16);
    t18 = (t7 + 8U);
    t29 = *((int *)t18);
    t37 = (15 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t19 = (t4 + t43);
    t34 = *((unsigned char *)t19);
    t45 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t33, t34);
    t20 = (t13 + 56U);
    t25 = *((char **)t20);
    t20 = (t12 + 0U);
    t39 = *((int *)t20);
    t27 = (t12 + 8U);
    t40 = *((int *)t27);
    t46 = (2 - t39);
    t47 = (t46 * t40);
    t48 = (1U * t47);
    t49 = (0 + t48);
    t32 = (t25 + t49);
    *((unsigned char *)t32) = t45;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (2 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (3 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (3 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (4 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (4 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (5 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (5 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (6 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (6 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (7 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (7 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (8 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (8 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (9 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (9 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (10 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (10 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (11 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (11 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (12 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (12 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (13 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (13 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t16 = (t13 + 56U);
    t18 = *((char **)t16);
    t16 = (t12 + 0U);
    t28 = *((int *)t16);
    t19 = (t12 + 8U);
    t29 = *((int *)t19);
    t37 = (14 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t20 = (t18 + t43);
    *((unsigned char *)t20) = t23;
    t8 = (t7 + 0U);
    t10 = *((int *)t8);
    t9 = (t7 + 8U);
    t14 = *((int *)t9);
    t26 = (14 - t10);
    t11 = (t26 * t14);
    t30 = (1U * t11);
    t31 = (0 + t30);
    t15 = (t4 + t31);
    t23 = *((unsigned char *)t15);
    t33 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t3, t23);
    t16 = (t7 + 0U);
    t28 = *((int *)t16);
    t18 = (t7 + 8U);
    t29 = *((int *)t18);
    t37 = (15 - t28);
    t41 = (t37 * t29);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t19 = (t4 + t43);
    t34 = *((unsigned char *)t19);
    t45 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t33, t34);
    t20 = (t13 + 56U);
    t25 = *((char **)t20);
    t20 = (t12 + 0U);
    t39 = *((int *)t20);
    t27 = (t12 + 8U);
    t40 = *((int *)t27);
    t46 = (15 - t39);
    t47 = (t46 * t40);
    t48 = (1U * t47);
    t49 = (0 + t48);
    t32 = (t25 + t49);
    *((unsigned char *)t32) = t45;
    t8 = (t13 + 56U);
    t9 = *((char **)t8);
    t8 = (t12 + 12U);
    t11 = *((unsigned int *)t8);
    t11 = (t11 * 1U);
    t0 = xsi_get_transient_memory(t11);
    memcpy(t0, t9, t11);
    t15 = (t12 + 0U);
    t10 = *((int *)t15);
    t16 = (t12 + 4U);
    t14 = *((int *)t16);
    t18 = (t12 + 8U);
    t26 = *((int *)t18);
    t19 = (t2 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = t10;
    t20 = (t19 + 4U);
    *((int *)t20) = t14;
    t20 = (t19 + 8U);
    *((int *)t20) = t26;
    t28 = (t14 - t10);
    t30 = (t28 * t26);
    t30 = (t30 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t30;

LAB1:    return t0;
LAB3:    *((char **)t22) = t4;
    goto LAB2;

LAB4:;
}


extern void work_p_3116869533_init()
{
	static char *se[] = {(void *)work_p_3116869533_sub_1708206647_4164996226};
	xsi_register_didat("work_p_3116869533", "isim/testbench_isim_beh.exe.sim/work/p_3116869533.didat");
	xsi_register_subprogram_executes(se);
}
