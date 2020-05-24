@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sun May 24 12:40:01 +0200 2020
REM SW Build 2729669 on Thu Dec  5 04:49:17 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim tb_select_adder_behav -key {Behavioral:sim_1:Functional:tb_select_adder} -tclbatch tb_select_adder.tcl -log simulate.log"
call xsim  tb_select_adder_behav -key {Behavioral:sim_1:Functional:tb_select_adder} -tclbatch tb_select_adder.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
