#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Wed Apr 27 19:32:06 EDT 2022
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim spi_tb_behav -key {Behavioral:sim_spi:Functional:spi_tb} -tclbatch spi_tb.tcl -log simulate.log"
xsim spi_tb_behav -key {Behavioral:sim_spi:Functional:spi_tb} -tclbatch spi_tb.tcl -log simulate.log

