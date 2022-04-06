// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Wed Apr  6 18:32:28 2022
// Host        : if4111linux-20 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /nfs/nfs7/home/zegraber/Documents/CPS-Digital-Design/Project8/Project8.sim/sim_1/synth/func/xsim/ElevCtrl_tb_func_synth.v
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ElevCtrl
   (an_OBUF,
    seg_OBUF,
    LED_OBUF,
    SR,
    out,
    btnD_IBUF,
    btnL_IBUF,
    btnU_IBUF,
    btnR_IBUF);
  output [3:0]an_OBUF;
  output [1:0]seg_OBUF;
  output [1:0]LED_OBUF;
  input [0:0]SR;
  input [0:0]out;
  input btnD_IBUF;
  input btnL_IBUF;
  input btnU_IBUF;
  input btnR_IBUF;

  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire \FSM_onehot_state_reg_n_0_[7] ;
  wire [1:0]LED_OBUF;
  wire [0:0]SR;
  wire [3:0]an_OBUF;
  wire btnD_IBUF;
  wire btnL_IBUF;
  wire btnR_IBUF;
  wire btnU_IBUF;
  wire [7:0]nextState;
  wire [0:0]out;
  wire [1:0]seg_OBUF;
  wire [6:1]state;
  wire [1:0]target;
  wire target1__2;
  wire \target_reg[0]_i_1_n_0 ;
  wire \target_reg[1]_i_1_n_0 ;
  wire \target_reg[1]_i_2_n_0 ;

  LUT4 #(
    .INIT(16'h0302)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(target[1]),
        .I2(target[0]),
        .I3(state[1]),
        .O(nextState[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(target[1]),
        .I2(target[0]),
        .I3(state[2]),
        .O(nextState[1]));
  LUT5 #(
    .INIT(32'hEEFFEECA)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(state[1]),
        .I2(target[0]),
        .I3(target[1]),
        .I4(state[4]),
        .O(nextState[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h3020)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(state[2]),
        .I1(target[1]),
        .I2(target[0]),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .O(nextState[3]));
  LUT5 #(
    .INIT(32'hEFFFEACA)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(state[2]),
        .I2(target[1]),
        .I3(target[0]),
        .I4(state[6]),
        .O(nextState[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h3020)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(state[4]),
        .I1(target[0]),
        .I2(target[1]),
        .I3(\FSM_onehot_state_reg_n_0_[5] ),
        .O(nextState[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \FSM_onehot_state[6]_i_1 
       (.I0(state[4]),
        .I1(target[0]),
        .I2(target[1]),
        .I3(\FSM_onehot_state_reg_n_0_[7] ),
        .O(nextState[6]));
  LUT4 #(
    .INIT(16'hC080)) 
    \FSM_onehot_state[7]_i_1 
       (.I0(state[6]),
        .I1(target[0]),
        .I2(target[1]),
        .I3(\FSM_onehot_state_reg_n_0_[7] ),
        .O(nextState[7]));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[0]),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(SR));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[1]),
        .Q(state[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[2]),
        .Q(state[2]),
        .R(SR));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[3]),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[4]),
        .Q(state[4]),
        .R(SR));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[5]),
        .Q(\FSM_onehot_state_reg_n_0_[5] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[6]),
        .Q(state[6]),
        .R(SR));
  (* FSM_ENCODED_STATES = "ONE:00000001,TWO:00001000,ONE_MOVE:00000010,THREE:00100000,FOUR_MOVE:01000000,TWO_MOVE:00000100,THREE_MOVE:00010000,FOUR:10000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(out),
        .CE(1'b1),
        .D(nextState[7]),
        .Q(\FSM_onehot_state_reg_n_0_[7] ),
        .R(SR));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \LED_OBUF[2]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(state[6]),
        .I2(state[2]),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .O(LED_OBUF[0]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \LED_OBUF[3]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(state[6]),
        .I2(state[4]),
        .I3(\FSM_onehot_state_reg_n_0_[5] ),
        .O(LED_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \LED_OBUF[4]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(\FSM_onehot_state_reg_n_0_[5] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .O(seg_OBUF[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \an_OBUF[0]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(state[2]),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(state[4]),
        .I4(state[6]),
        .I5(\FSM_onehot_state_reg_n_0_[7] ),
        .O(an_OBUF[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEEF)) 
    \an_OBUF[1]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(state[4]),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .I3(state[2]),
        .I4(state[6]),
        .I5(\FSM_onehot_state_reg_n_0_[7] ),
        .O(an_OBUF[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEEF)) 
    \an_OBUF[2]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(state[2]),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(state[4]),
        .I4(state[6]),
        .I5(\FSM_onehot_state_reg_n_0_[7] ),
        .O(an_OBUF[2]));
  LUT6 #(
    .INIT(64'h000000000000111F)) 
    \an_OBUF[3]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(state[2]),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(state[4]),
        .I4(state[6]),
        .I5(\FSM_onehot_state_reg_n_0_[7] ),
        .O(an_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \seg_OBUF[5]_inst_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(\FSM_onehot_state_reg_n_0_[7] ),
        .O(seg_OBUF[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \target_reg[0] 
       (.CLR(1'b0),
        .D(\target_reg[0]_i_1_n_0 ),
        .G(\target_reg[1]_i_2_n_0 ),
        .GE(1'b1),
        .Q(target[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00020200)) 
    \target_reg[0]_i_1 
       (.I0(target1__2),
        .I1(btnU_IBUF),
        .I2(btnR_IBUF),
        .I3(btnL_IBUF),
        .I4(btnD_IBUF),
        .O(\target_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \target_reg[1] 
       (.CLR(1'b0),
        .D(\target_reg[1]_i_1_n_0 ),
        .G(\target_reg[1]_i_2_n_0 ),
        .GE(1'b1),
        .Q(target[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00020200)) 
    \target_reg[1]_i_1 
       (.I0(target1__2),
        .I1(btnL_IBUF),
        .I2(btnU_IBUF),
        .I3(btnR_IBUF),
        .I4(btnD_IBUF),
        .O(\target_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \target_reg[1]_i_2 
       (.I0(btnD_IBUF),
        .I1(btnL_IBUF),
        .I2(btnU_IBUF),
        .I3(btnR_IBUF),
        .I4(target1__2),
        .I5(SR),
        .O(\target_reg[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \target_reg[1]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .I3(\FSM_onehot_state_reg_n_0_[5] ),
        .O(target1__2));
endmodule

module SlowClk
   (out,
    clk);
  output [0:0]out;
  input clk;

  wire clk;
  wire [0:0]out;
  wire \q[0]_i_2_n_0 ;
  wire \q_reg[0]_i_1_n_0 ;
  wire \q_reg[0]_i_1_n_1 ;
  wire \q_reg[0]_i_1_n_2 ;
  wire \q_reg[0]_i_1_n_3 ;
  wire \q_reg[0]_i_1_n_4 ;
  wire \q_reg[0]_i_1_n_5 ;
  wire \q_reg[0]_i_1_n_6 ;
  wire \q_reg[0]_i_1_n_7 ;
  wire \q_reg[12]_i_1_n_0 ;
  wire \q_reg[12]_i_1_n_1 ;
  wire \q_reg[12]_i_1_n_2 ;
  wire \q_reg[12]_i_1_n_3 ;
  wire \q_reg[12]_i_1_n_4 ;
  wire \q_reg[12]_i_1_n_5 ;
  wire \q_reg[12]_i_1_n_6 ;
  wire \q_reg[12]_i_1_n_7 ;
  wire \q_reg[16]_i_1_n_0 ;
  wire \q_reg[16]_i_1_n_1 ;
  wire \q_reg[16]_i_1_n_2 ;
  wire \q_reg[16]_i_1_n_3 ;
  wire \q_reg[16]_i_1_n_4 ;
  wire \q_reg[16]_i_1_n_5 ;
  wire \q_reg[16]_i_1_n_6 ;
  wire \q_reg[16]_i_1_n_7 ;
  wire \q_reg[20]_i_1_n_0 ;
  wire \q_reg[20]_i_1_n_1 ;
  wire \q_reg[20]_i_1_n_2 ;
  wire \q_reg[20]_i_1_n_3 ;
  wire \q_reg[20]_i_1_n_4 ;
  wire \q_reg[20]_i_1_n_5 ;
  wire \q_reg[20]_i_1_n_6 ;
  wire \q_reg[20]_i_1_n_7 ;
  wire \q_reg[24]_i_1_n_3 ;
  wire \q_reg[24]_i_1_n_6 ;
  wire \q_reg[24]_i_1_n_7 ;
  wire \q_reg[4]_i_1_n_0 ;
  wire \q_reg[4]_i_1_n_1 ;
  wire \q_reg[4]_i_1_n_2 ;
  wire \q_reg[4]_i_1_n_3 ;
  wire \q_reg[4]_i_1_n_4 ;
  wire \q_reg[4]_i_1_n_5 ;
  wire \q_reg[4]_i_1_n_6 ;
  wire \q_reg[4]_i_1_n_7 ;
  wire \q_reg[8]_i_1_n_0 ;
  wire \q_reg[8]_i_1_n_1 ;
  wire \q_reg[8]_i_1_n_2 ;
  wire \q_reg[8]_i_1_n_3 ;
  wire \q_reg[8]_i_1_n_4 ;
  wire \q_reg[8]_i_1_n_5 ;
  wire \q_reg[8]_i_1_n_6 ;
  wire \q_reg[8]_i_1_n_7 ;
  wire \q_reg_n_0_[0] ;
  wire \q_reg_n_0_[10] ;
  wire \q_reg_n_0_[11] ;
  wire \q_reg_n_0_[12] ;
  wire \q_reg_n_0_[13] ;
  wire \q_reg_n_0_[14] ;
  wire \q_reg_n_0_[15] ;
  wire \q_reg_n_0_[16] ;
  wire \q_reg_n_0_[17] ;
  wire \q_reg_n_0_[18] ;
  wire \q_reg_n_0_[19] ;
  wire \q_reg_n_0_[1] ;
  wire \q_reg_n_0_[20] ;
  wire \q_reg_n_0_[21] ;
  wire \q_reg_n_0_[22] ;
  wire \q_reg_n_0_[23] ;
  wire \q_reg_n_0_[24] ;
  wire \q_reg_n_0_[2] ;
  wire \q_reg_n_0_[3] ;
  wire \q_reg_n_0_[4] ;
  wire \q_reg_n_0_[5] ;
  wire \q_reg_n_0_[6] ;
  wire \q_reg_n_0_[7] ;
  wire \q_reg_n_0_[8] ;
  wire \q_reg_n_0_[9] ;
  wire [3:1]\NLW_q_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_q_reg[24]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \q[0]_i_2 
       (.I0(\q_reg_n_0_[0] ),
        .O(\q[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[0]_i_1_n_7 ),
        .Q(\q_reg_n_0_[0] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \q_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\q_reg[0]_i_1_n_0 ,\q_reg[0]_i_1_n_1 ,\q_reg[0]_i_1_n_2 ,\q_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\q_reg[0]_i_1_n_4 ,\q_reg[0]_i_1_n_5 ,\q_reg[0]_i_1_n_6 ,\q_reg[0]_i_1_n_7 }),
        .S({\q_reg_n_0_[3] ,\q_reg_n_0_[2] ,\q_reg_n_0_[1] ,\q[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[8]_i_1_n_5 ),
        .Q(\q_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[8]_i_1_n_4 ),
        .Q(\q_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[12]_i_1_n_7 ),
        .Q(\q_reg_n_0_[12] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \q_reg[12]_i_1 
       (.CI(\q_reg[8]_i_1_n_0 ),
        .CO({\q_reg[12]_i_1_n_0 ,\q_reg[12]_i_1_n_1 ,\q_reg[12]_i_1_n_2 ,\q_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\q_reg[12]_i_1_n_4 ,\q_reg[12]_i_1_n_5 ,\q_reg[12]_i_1_n_6 ,\q_reg[12]_i_1_n_7 }),
        .S({\q_reg_n_0_[15] ,\q_reg_n_0_[14] ,\q_reg_n_0_[13] ,\q_reg_n_0_[12] }));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[12]_i_1_n_6 ),
        .Q(\q_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[12]_i_1_n_5 ),
        .Q(\q_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[12]_i_1_n_4 ),
        .Q(\q_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[16]_i_1_n_7 ),
        .Q(\q_reg_n_0_[16] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \q_reg[16]_i_1 
       (.CI(\q_reg[12]_i_1_n_0 ),
        .CO({\q_reg[16]_i_1_n_0 ,\q_reg[16]_i_1_n_1 ,\q_reg[16]_i_1_n_2 ,\q_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\q_reg[16]_i_1_n_4 ,\q_reg[16]_i_1_n_5 ,\q_reg[16]_i_1_n_6 ,\q_reg[16]_i_1_n_7 }),
        .S({\q_reg_n_0_[19] ,\q_reg_n_0_[18] ,\q_reg_n_0_[17] ,\q_reg_n_0_[16] }));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[16]_i_1_n_6 ),
        .Q(\q_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[16]_i_1_n_5 ),
        .Q(\q_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[16]_i_1_n_4 ),
        .Q(\q_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[0]_i_1_n_6 ),
        .Q(\q_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[20]_i_1_n_7 ),
        .Q(\q_reg_n_0_[20] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \q_reg[20]_i_1 
       (.CI(\q_reg[16]_i_1_n_0 ),
        .CO({\q_reg[20]_i_1_n_0 ,\q_reg[20]_i_1_n_1 ,\q_reg[20]_i_1_n_2 ,\q_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\q_reg[20]_i_1_n_4 ,\q_reg[20]_i_1_n_5 ,\q_reg[20]_i_1_n_6 ,\q_reg[20]_i_1_n_7 }),
        .S({\q_reg_n_0_[23] ,\q_reg_n_0_[22] ,\q_reg_n_0_[21] ,\q_reg_n_0_[20] }));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[20]_i_1_n_6 ),
        .Q(\q_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[20]_i_1_n_5 ),
        .Q(\q_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[20]_i_1_n_4 ),
        .Q(\q_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[24]_i_1_n_7 ),
        .Q(\q_reg_n_0_[24] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \q_reg[24]_i_1 
       (.CI(\q_reg[20]_i_1_n_0 ),
        .CO({\NLW_q_reg[24]_i_1_CO_UNCONNECTED [3:1],\q_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_q_reg[24]_i_1_O_UNCONNECTED [3:2],\q_reg[24]_i_1_n_6 ,\q_reg[24]_i_1_n_7 }),
        .S({1'b0,1'b0,out,\q_reg_n_0_[24] }));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[24]_i_1_n_6 ),
        .Q(out),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[0]_i_1_n_5 ),
        .Q(\q_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[0]_i_1_n_4 ),
        .Q(\q_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[4]_i_1_n_7 ),
        .Q(\q_reg_n_0_[4] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \q_reg[4]_i_1 
       (.CI(\q_reg[0]_i_1_n_0 ),
        .CO({\q_reg[4]_i_1_n_0 ,\q_reg[4]_i_1_n_1 ,\q_reg[4]_i_1_n_2 ,\q_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\q_reg[4]_i_1_n_4 ,\q_reg[4]_i_1_n_5 ,\q_reg[4]_i_1_n_6 ,\q_reg[4]_i_1_n_7 }),
        .S({\q_reg_n_0_[7] ,\q_reg_n_0_[6] ,\q_reg_n_0_[5] ,\q_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[4]_i_1_n_6 ),
        .Q(\q_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[4]_i_1_n_5 ),
        .Q(\q_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[4]_i_1_n_4 ),
        .Q(\q_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[8]_i_1_n_7 ),
        .Q(\q_reg_n_0_[8] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \q_reg[8]_i_1 
       (.CI(\q_reg[4]_i_1_n_0 ),
        .CO({\q_reg[8]_i_1_n_0 ,\q_reg[8]_i_1_n_1 ,\q_reg[8]_i_1_n_2 ,\q_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\q_reg[8]_i_1_n_4 ,\q_reg[8]_i_1_n_5 ,\q_reg[8]_i_1_n_6 ,\q_reg[8]_i_1_n_7 }),
        .S({\q_reg_n_0_[11] ,\q_reg_n_0_[10] ,\q_reg_n_0_[9] ,\q_reg_n_0_[8] }));
  FDRE #(
    .INIT(1'b0)) 
    \q_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\q_reg[8]_i_1_n_6 ),
        .Q(\q_reg_n_0_[9] ),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module top
   (CLK100MHZ,
    btnC,
    btnL,
    btnR,
    btnU,
    btnD,
    LED,
    seg,
    an);
  input CLK100MHZ;
  input btnC;
  input btnL;
  input btnR;
  input btnU;
  input btnD;
  output [15:0]LED;
  output [6:0]seg;
  output [3:0]an;

  wire CLK100MHZ;
  wire CLK100MHZ_IBUF;
  wire CLK100MHZ_IBUF_BUFG;
  wire [15:0]LED;
  wire [3:0]LED_OBUF;
  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire btnC;
  wire btnD;
  wire btnD_IBUF;
  wire btnL;
  wire btnL_IBUF;
  wire btnR;
  wire btnR_IBUF;
  wire btnU;
  wire btnU_IBUF;
  wire [6:0]seg;
  wire [6:5]seg_OBUF;
  wire slowClk;

  BUFG CLK100MHZ_IBUF_BUFG_inst
       (.I(CLK100MHZ_IBUF),
        .O(CLK100MHZ_IBUF_BUFG));
  IBUF CLK100MHZ_IBUF_inst
       (.I(CLK100MHZ),
        .O(CLK100MHZ_IBUF));
  OBUF \LED_OBUF[0]_inst 
       (.I(LED_OBUF[0]),
        .O(LED[0]));
  OBUF \LED_OBUF[10]_inst 
       (.I(1'b0),
        .O(LED[10]));
  OBUF \LED_OBUF[11]_inst 
       (.I(1'b0),
        .O(LED[11]));
  OBUF \LED_OBUF[12]_inst 
       (.I(1'b0),
        .O(LED[12]));
  OBUF \LED_OBUF[13]_inst 
       (.I(1'b0),
        .O(LED[13]));
  OBUF \LED_OBUF[14]_inst 
       (.I(1'b0),
        .O(LED[14]));
  OBUF \LED_OBUF[15]_inst 
       (.I(1'b0),
        .O(LED[15]));
  OBUF \LED_OBUF[1]_inst 
       (.I(1'b0),
        .O(LED[1]));
  OBUF \LED_OBUF[2]_inst 
       (.I(LED_OBUF[2]),
        .O(LED[2]));
  OBUF \LED_OBUF[3]_inst 
       (.I(LED_OBUF[3]),
        .O(LED[3]));
  OBUF \LED_OBUF[4]_inst 
       (.I(seg_OBUF[6]),
        .O(LED[4]));
  OBUF \LED_OBUF[5]_inst 
       (.I(1'b0),
        .O(LED[5]));
  OBUF \LED_OBUF[6]_inst 
       (.I(1'b0),
        .O(LED[6]));
  OBUF \LED_OBUF[7]_inst 
       (.I(1'b0),
        .O(LED[7]));
  OBUF \LED_OBUF[8]_inst 
       (.I(1'b0),
        .O(LED[8]));
  OBUF \LED_OBUF[9]_inst 
       (.I(1'b0),
        .O(LED[9]));
  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]));
  IBUF btnC_IBUF_inst
       (.I(btnC),
        .O(LED_OBUF[0]));
  IBUF btnD_IBUF_inst
       (.I(btnD),
        .O(btnD_IBUF));
  IBUF btnL_IBUF_inst
       (.I(btnL),
        .O(btnL_IBUF));
  IBUF btnR_IBUF_inst
       (.I(btnR),
        .O(btnR_IBUF));
  IBUF btnU_IBUF_inst
       (.I(btnU),
        .O(btnU_IBUF));
  ElevCtrl ec0
       (.LED_OBUF(LED_OBUF[3:2]),
        .SR(LED_OBUF[0]),
        .an_OBUF(an_OBUF),
        .btnD_IBUF(btnD_IBUF),
        .btnL_IBUF(btnL_IBUF),
        .btnR_IBUF(btnR_IBUF),
        .btnU_IBUF(btnU_IBUF),
        .out(slowClk),
        .seg_OBUF(seg_OBUF));
  SlowClk sc0
       (.clk(CLK100MHZ_IBUF_BUFG),
        .out(slowClk));
  OBUF \seg_OBUF[0]_inst 
       (.I(1'b1),
        .O(seg[0]));
  OBUF \seg_OBUF[1]_inst 
       (.I(1'b1),
        .O(seg[1]));
  OBUF \seg_OBUF[2]_inst 
       (.I(1'b0),
        .O(seg[2]));
  OBUF \seg_OBUF[3]_inst 
       (.I(1'b0),
        .O(seg[3]));
  OBUF \seg_OBUF[4]_inst 
       (.I(1'b0),
        .O(seg[4]));
  OBUF \seg_OBUF[5]_inst 
       (.I(seg_OBUF[5]),
        .O(seg[5]));
  OBUF \seg_OBUF[6]_inst 
       (.I(seg_OBUF[6]),
        .O(seg[6]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
