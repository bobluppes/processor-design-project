vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_6
vlib modelsim_lib/msim/processing_system7_vip_v1_0_8
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/axi_bram_ctrl_v4_1_2
vlib modelsim_lib/msim/xlconstant_v1_1_6
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_20
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_22
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_19
vlib modelsim_lib/msim/axi_crossbar_v2_1_21
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_20

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_6 modelsim_lib/msim/axi_vip_v1_1_6
vmap processing_system7_vip_v1_0_8 modelsim_lib/msim/processing_system7_vip_v1_0_8
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap axi_bram_ctrl_v4_1_2 modelsim_lib/msim/axi_bram_ctrl_v4_1_2
vmap xlconstant_v1_1_6 modelsim_lib/msim/xlconstant_v1_1_6
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_20 modelsim_lib/msim/axi_register_slice_v2_1_20
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_22 modelsim_lib/msim/axi_gpio_v2_0_22
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 modelsim_lib/msim/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 modelsim_lib/msim/axi_crossbar_v2_1_21
vmap axi_protocol_converter_v2_1_20 modelsim_lib/msim/axi_protocol_converter_v2_1_20

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_6 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_8 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_processing_system7_0_0/sim/design_2_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_proc_sys_reset_0_0/sim/design_2_proc_sys_reset_0_0.vhd" \
"../../../bd/design_2/ip/design_2_crossbar_wrap_0_0/sim/design_2_crossbar_wrap_0_0.vhd" \
"../../../bd/design_2/ip/design_2_bram_0_0/sim/design_2_bram_0_0.vhd" \

vcom -work axi_bram_ctrl_v4_1_2 -64 -93 \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/a002/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_axi_bram_ctrl_0_0/sim/design_2_axi_bram_ctrl_0_0.vhd" \
"../../../bd/design_2/ip/design_2_axi_full2lite_conver_0_0/sim/design_2_axi_full2lite_conver_0_0.vhd" \
"../../../bd/design_2/ip/design_2_uart_0_0/sim/design_2_uart_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/sim/bd_ebcc.v" \

vlog -work xlconstant_v1_1_6 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_0/sim/bd_ebcc_one_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_1/sim/bd_ebcc_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2508/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_2/sim/bd_ebcc_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_3/sim/bd_ebcc_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/9d43/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_4/sim/bd_ebcc_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_5/sim/bd_ebcc_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_6/sim/bd_ebcc_sarn_0.sv" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_7/sim/bd_ebcc_srn_0.sv" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_8/sim/bd_ebcc_sawn_0.sv" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_9/sim/bd_ebcc_swn_0.sv" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_10/sim/bd_ebcc_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_11/sim/bd_ebcc_m00s2a_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/901a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_12/sim/bd_ebcc_m00e_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work axi_register_slice_v2_1_20 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_axi_smc_0/sim/design_2_axi_smc_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_22 -64 -93 \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/f71e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_axi_gpio_0_0/sim/design_2_axi_gpio_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_xbar_0/sim/design_2_xbar_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_conv_funs_pkg.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_proc_common_pkg.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_ipif_pkg.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_family_support.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_family.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_soft_reset.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_pselect_f.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_address_decoder.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_slave_attachment.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_interrupt_control.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_axi_lite_ipif.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/design_2_xadc_wiz_0_0_xadc_core_drp.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/design_2_xadc_wiz_0_0_axi_xadc.vhd" \
"../../../bd/design_2/ip/design_2_xadc_wiz_0_0/design_2_xadc_wiz_0_0.vhd" \
"../../../bd/design_2/sim/design_2.vhd" \

vlog -work axi_protocol_converter_v2_1_20 -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_fpga.srcs/sources_1/bd/design_2/ip/design_2_processing_system7_0_0" "+incdir+/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/design_2/ip/design_2_auto_pc_0/sim/design_2_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

