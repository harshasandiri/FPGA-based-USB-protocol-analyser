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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_TEXTIO;
char *WORK_P_1738517631;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *WORK_P_3116869533;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_3116869533_init();
    work_p_1738517631_init();
    work_a_0072905740_3212880686_init();
    ieee_p_1242562249_init();
    work_a_1849965221_3212880686_init();
    work_a_4000226436_3212880686_init();
    work_a_2427319928_3212880686_init();
    work_a_1405411456_3212880686_init();
    work_a_1949178628_2762913819_init();


    xsi_register_tops("work_a_1949178628_2762913819");

    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    WORK_P_1738517631 = xsi_get_engine_memory("work_p_1738517631");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_3116869533 = xsi_get_engine_memory("work_p_3116869533");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
