#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Wed Apr 13 16:42:33 EDT 2022
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 08c8b7ed81574c27b82efa88a42b1ebd --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot ElevCtrl_tb_behav xil_defaultlib.ElevCtrl_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto 08c8b7ed81574c27b82efa88a42b1ebd --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot ElevCtrl_tb_behav xil_defaultlib.ElevCtrl_tb xil_defaultlib.glbl -log elaborate.log

