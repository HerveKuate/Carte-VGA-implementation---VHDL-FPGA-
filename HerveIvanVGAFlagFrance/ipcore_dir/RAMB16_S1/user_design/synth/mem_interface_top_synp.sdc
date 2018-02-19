define_global_attribute         syn_global_buffers {2}
define_attribute          {v:work.RAMB16_S1_parameters_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_cal_ctl} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_cal_top} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_clk_dcm} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_controller_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_controller_iobs_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_data_path_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_data_path_iobs_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_data_read_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_data_read_controller_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_data_write_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_dqs_delay_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_fifo_0_wr_en_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_fifo_1_wr_en_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_infrastructure} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_infrastructure_iobs_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_infrastructure_top} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_iobs_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_ram8d_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_rd_gray_cntr} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_s3_dm_iob} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_s3_dq_iob} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_s3_dqs_iob} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_tap_dly} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_top_0} syn_hier {hard}
define_attribute          {v:work.RAMB16_S1_wr_gray_cntr} syn_hier {hard}

#clock constraints

define_clock -disable -name {clk_dcm0}  -period 10 -clockgroup default_clkgroup_2
define_clock          -name {infrastructure_top0.lvds_clk_input} -period 10 -clockgroup default_clkgroup_3
define_clock -disable -name {DCM_INST1}  -period 10 -clockgroup default_clkgroup_4


