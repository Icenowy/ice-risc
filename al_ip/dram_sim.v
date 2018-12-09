// Verilog netlist created by TD v4.2.217
// Sun Dec  9 19:27:46 2018

`timescale 1ns / 1ps
module dram  // /home/icenowy/git-repos/ice-risc/al_ip/dram.v(14)
  (
  di,
  raddr,
  waddr,
  wclk,
  we,
  do
  );

  input [31:0] di;  // /home/icenowy/git-repos/ice-risc/al_ip/dram.v(23)
  input [5:0] raddr;  // /home/icenowy/git-repos/ice-risc/al_ip/dram.v(25)
  input [5:0] waddr;  // /home/icenowy/git-repos/ice-risc/al_ip/dram.v(24)
  input wclk;  // /home/icenowy/git-repos/ice-risc/al_ip/dram.v(26)
  input we;  // /home/icenowy/git-repos/ice-risc/al_ip/dram.v(26)
  output [31:0] do;  // /home/icenowy/git-repos/ice-risc/al_ip/dram.v(28)

  parameter ADDR_WIDTH_R = 6;
  parameter ADDR_WIDTH_W = 6;
  parameter DATA_DEPTH_R = 44;
  parameter DATA_DEPTH_W = 44;
  parameter DATA_WIDTH_R = 32;
  parameter DATA_WIDTH_W = 32;
  wire  \dram_do_mux_b0/B0_0 ;
  wire  \dram_do_mux_b0/B0_1 ;
  wire  \dram_do_mux_b1/B0_0 ;
  wire  \dram_do_mux_b1/B0_1 ;
  wire  \dram_do_mux_b10/B0_0 ;
  wire  \dram_do_mux_b10/B0_1 ;
  wire  \dram_do_mux_b11/B0_0 ;
  wire  \dram_do_mux_b11/B0_1 ;
  wire  \dram_do_mux_b12/B0_0 ;
  wire  \dram_do_mux_b12/B0_1 ;
  wire  \dram_do_mux_b13/B0_0 ;
  wire  \dram_do_mux_b13/B0_1 ;
  wire  \dram_do_mux_b14/B0_0 ;
  wire  \dram_do_mux_b14/B0_1 ;
  wire  \dram_do_mux_b15/B0_0 ;
  wire  \dram_do_mux_b15/B0_1 ;
  wire  \dram_do_mux_b16/B0_0 ;
  wire  \dram_do_mux_b16/B0_1 ;
  wire  \dram_do_mux_b17/B0_0 ;
  wire  \dram_do_mux_b17/B0_1 ;
  wire  \dram_do_mux_b18/B0_0 ;
  wire  \dram_do_mux_b18/B0_1 ;
  wire  \dram_do_mux_b19/B0_0 ;
  wire  \dram_do_mux_b19/B0_1 ;
  wire  \dram_do_mux_b2/B0_0 ;
  wire  \dram_do_mux_b2/B0_1 ;
  wire  \dram_do_mux_b20/B0_0 ;
  wire  \dram_do_mux_b20/B0_1 ;
  wire  \dram_do_mux_b21/B0_0 ;
  wire  \dram_do_mux_b21/B0_1 ;
  wire  \dram_do_mux_b22/B0_0 ;
  wire  \dram_do_mux_b22/B0_1 ;
  wire  \dram_do_mux_b23/B0_0 ;
  wire  \dram_do_mux_b23/B0_1 ;
  wire  \dram_do_mux_b24/B0_0 ;
  wire  \dram_do_mux_b24/B0_1 ;
  wire  \dram_do_mux_b25/B0_0 ;
  wire  \dram_do_mux_b25/B0_1 ;
  wire  \dram_do_mux_b26/B0_0 ;
  wire  \dram_do_mux_b26/B0_1 ;
  wire  \dram_do_mux_b27/B0_0 ;
  wire  \dram_do_mux_b27/B0_1 ;
  wire  \dram_do_mux_b28/B0_0 ;
  wire  \dram_do_mux_b28/B0_1 ;
  wire  \dram_do_mux_b29/B0_0 ;
  wire  \dram_do_mux_b29/B0_1 ;
  wire  \dram_do_mux_b3/B0_0 ;
  wire  \dram_do_mux_b3/B0_1 ;
  wire  \dram_do_mux_b30/B0_0 ;
  wire  \dram_do_mux_b30/B0_1 ;
  wire  \dram_do_mux_b31/B0_0 ;
  wire  \dram_do_mux_b31/B0_1 ;
  wire  \dram_do_mux_b4/B0_0 ;
  wire  \dram_do_mux_b4/B0_1 ;
  wire  \dram_do_mux_b5/B0_0 ;
  wire  \dram_do_mux_b5/B0_1 ;
  wire  \dram_do_mux_b6/B0_0 ;
  wire  \dram_do_mux_b6/B0_1 ;
  wire  \dram_do_mux_b7/B0_0 ;
  wire  \dram_do_mux_b7/B0_1 ;
  wire  \dram_do_mux_b8/B0_0 ;
  wire  \dram_do_mux_b8/B0_1 ;
  wire  \dram_do_mux_b9/B0_0 ;
  wire  \dram_do_mux_b9/B0_1 ;
  wire dram_do_i0_000;
  wire dram_do_i0_001;
  wire dram_do_i0_002;
  wire dram_do_i0_003;
  wire dram_do_i0_004;
  wire dram_do_i0_005;
  wire dram_do_i0_006;
  wire dram_do_i0_007;
  wire dram_do_i0_008;
  wire dram_do_i0_009;
  wire dram_do_i0_010;
  wire dram_do_i0_011;
  wire dram_do_i0_012;
  wire dram_do_i0_013;
  wire dram_do_i0_014;
  wire dram_do_i0_015;
  wire dram_do_i0_016;
  wire dram_do_i0_017;
  wire dram_do_i0_018;
  wire dram_do_i0_019;
  wire dram_do_i0_020;
  wire dram_do_i0_021;
  wire dram_do_i0_022;
  wire dram_do_i0_023;
  wire dram_do_i0_024;
  wire dram_do_i0_025;
  wire dram_do_i0_026;
  wire dram_do_i0_027;
  wire dram_do_i0_028;
  wire dram_do_i0_029;
  wire dram_do_i0_030;
  wire dram_do_i0_031;
  wire dram_do_i1_000;
  wire dram_do_i1_001;
  wire dram_do_i1_002;
  wire dram_do_i1_003;
  wire dram_do_i1_004;
  wire dram_do_i1_005;
  wire dram_do_i1_006;
  wire dram_do_i1_007;
  wire dram_do_i1_008;
  wire dram_do_i1_009;
  wire dram_do_i1_010;
  wire dram_do_i1_011;
  wire dram_do_i1_012;
  wire dram_do_i1_013;
  wire dram_do_i1_014;
  wire dram_do_i1_015;
  wire dram_do_i1_016;
  wire dram_do_i1_017;
  wire dram_do_i1_018;
  wire dram_do_i1_019;
  wire dram_do_i1_020;
  wire dram_do_i1_021;
  wire dram_do_i1_022;
  wire dram_do_i1_023;
  wire dram_do_i1_024;
  wire dram_do_i1_025;
  wire dram_do_i1_026;
  wire dram_do_i1_027;
  wire dram_do_i1_028;
  wire dram_do_i1_029;
  wire dram_do_i1_030;
  wire dram_do_i1_031;
  wire dram_do_i2_000;
  wire dram_do_i2_001;
  wire dram_do_i2_002;
  wire dram_do_i2_003;
  wire dram_do_i2_004;
  wire dram_do_i2_005;
  wire dram_do_i2_006;
  wire dram_do_i2_007;
  wire dram_do_i2_008;
  wire dram_do_i2_009;
  wire dram_do_i2_010;
  wire dram_do_i2_011;
  wire dram_do_i2_012;
  wire dram_do_i2_013;
  wire dram_do_i2_014;
  wire dram_do_i2_015;
  wire dram_do_i2_016;
  wire dram_do_i2_017;
  wire dram_do_i2_018;
  wire dram_do_i2_019;
  wire dram_do_i2_020;
  wire dram_do_i2_021;
  wire dram_do_i2_022;
  wire dram_do_i2_023;
  wire dram_do_i2_024;
  wire dram_do_i2_025;
  wire dram_do_i2_026;
  wire dram_do_i2_027;
  wire dram_do_i2_028;
  wire dram_do_i2_029;
  wire dram_do_i2_030;
  wire dram_do_i2_031;
  wire waddr$4$_neg;
  wire waddr$5$_neg;
  wire we_0;
  wire we_0_0;
  wire we_0_1;
  wire we_1;
  wire we_1_0;

  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  AL_MUX \dram_do_mux_b0/al_mux_b0_0_0  (
    .i0(dram_do_i0_000),
    .i1(dram_do_i1_000),
    .sel(raddr[4]),
    .o(\dram_do_mux_b0/B0_0 ));
  AL_MUX \dram_do_mux_b0/al_mux_b0_0_1  (
    .i0(dram_do_i2_000),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b0/B0_1 ));
  AL_MUX \dram_do_mux_b0/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b0/B0_0 ),
    .i1(\dram_do_mux_b0/B0_1 ),
    .sel(raddr[5]),
    .o(do[0]));
  AL_MUX \dram_do_mux_b1/al_mux_b0_0_0  (
    .i0(dram_do_i0_001),
    .i1(dram_do_i1_001),
    .sel(raddr[4]),
    .o(\dram_do_mux_b1/B0_0 ));
  AL_MUX \dram_do_mux_b1/al_mux_b0_0_1  (
    .i0(dram_do_i2_001),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b1/B0_1 ));
  AL_MUX \dram_do_mux_b1/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b1/B0_0 ),
    .i1(\dram_do_mux_b1/B0_1 ),
    .sel(raddr[5]),
    .o(do[1]));
  AL_MUX \dram_do_mux_b10/al_mux_b0_0_0  (
    .i0(dram_do_i0_010),
    .i1(dram_do_i1_010),
    .sel(raddr[4]),
    .o(\dram_do_mux_b10/B0_0 ));
  AL_MUX \dram_do_mux_b10/al_mux_b0_0_1  (
    .i0(dram_do_i2_010),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b10/B0_1 ));
  AL_MUX \dram_do_mux_b10/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b10/B0_0 ),
    .i1(\dram_do_mux_b10/B0_1 ),
    .sel(raddr[5]),
    .o(do[10]));
  AL_MUX \dram_do_mux_b11/al_mux_b0_0_0  (
    .i0(dram_do_i0_011),
    .i1(dram_do_i1_011),
    .sel(raddr[4]),
    .o(\dram_do_mux_b11/B0_0 ));
  AL_MUX \dram_do_mux_b11/al_mux_b0_0_1  (
    .i0(dram_do_i2_011),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b11/B0_1 ));
  AL_MUX \dram_do_mux_b11/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b11/B0_0 ),
    .i1(\dram_do_mux_b11/B0_1 ),
    .sel(raddr[5]),
    .o(do[11]));
  AL_MUX \dram_do_mux_b12/al_mux_b0_0_0  (
    .i0(dram_do_i0_012),
    .i1(dram_do_i1_012),
    .sel(raddr[4]),
    .o(\dram_do_mux_b12/B0_0 ));
  AL_MUX \dram_do_mux_b12/al_mux_b0_0_1  (
    .i0(dram_do_i2_012),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b12/B0_1 ));
  AL_MUX \dram_do_mux_b12/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b12/B0_0 ),
    .i1(\dram_do_mux_b12/B0_1 ),
    .sel(raddr[5]),
    .o(do[12]));
  AL_MUX \dram_do_mux_b13/al_mux_b0_0_0  (
    .i0(dram_do_i0_013),
    .i1(dram_do_i1_013),
    .sel(raddr[4]),
    .o(\dram_do_mux_b13/B0_0 ));
  AL_MUX \dram_do_mux_b13/al_mux_b0_0_1  (
    .i0(dram_do_i2_013),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b13/B0_1 ));
  AL_MUX \dram_do_mux_b13/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b13/B0_0 ),
    .i1(\dram_do_mux_b13/B0_1 ),
    .sel(raddr[5]),
    .o(do[13]));
  AL_MUX \dram_do_mux_b14/al_mux_b0_0_0  (
    .i0(dram_do_i0_014),
    .i1(dram_do_i1_014),
    .sel(raddr[4]),
    .o(\dram_do_mux_b14/B0_0 ));
  AL_MUX \dram_do_mux_b14/al_mux_b0_0_1  (
    .i0(dram_do_i2_014),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b14/B0_1 ));
  AL_MUX \dram_do_mux_b14/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b14/B0_0 ),
    .i1(\dram_do_mux_b14/B0_1 ),
    .sel(raddr[5]),
    .o(do[14]));
  AL_MUX \dram_do_mux_b15/al_mux_b0_0_0  (
    .i0(dram_do_i0_015),
    .i1(dram_do_i1_015),
    .sel(raddr[4]),
    .o(\dram_do_mux_b15/B0_0 ));
  AL_MUX \dram_do_mux_b15/al_mux_b0_0_1  (
    .i0(dram_do_i2_015),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b15/B0_1 ));
  AL_MUX \dram_do_mux_b15/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b15/B0_0 ),
    .i1(\dram_do_mux_b15/B0_1 ),
    .sel(raddr[5]),
    .o(do[15]));
  AL_MUX \dram_do_mux_b16/al_mux_b0_0_0  (
    .i0(dram_do_i0_016),
    .i1(dram_do_i1_016),
    .sel(raddr[4]),
    .o(\dram_do_mux_b16/B0_0 ));
  AL_MUX \dram_do_mux_b16/al_mux_b0_0_1  (
    .i0(dram_do_i2_016),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b16/B0_1 ));
  AL_MUX \dram_do_mux_b16/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b16/B0_0 ),
    .i1(\dram_do_mux_b16/B0_1 ),
    .sel(raddr[5]),
    .o(do[16]));
  AL_MUX \dram_do_mux_b17/al_mux_b0_0_0  (
    .i0(dram_do_i0_017),
    .i1(dram_do_i1_017),
    .sel(raddr[4]),
    .o(\dram_do_mux_b17/B0_0 ));
  AL_MUX \dram_do_mux_b17/al_mux_b0_0_1  (
    .i0(dram_do_i2_017),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b17/B0_1 ));
  AL_MUX \dram_do_mux_b17/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b17/B0_0 ),
    .i1(\dram_do_mux_b17/B0_1 ),
    .sel(raddr[5]),
    .o(do[17]));
  AL_MUX \dram_do_mux_b18/al_mux_b0_0_0  (
    .i0(dram_do_i0_018),
    .i1(dram_do_i1_018),
    .sel(raddr[4]),
    .o(\dram_do_mux_b18/B0_0 ));
  AL_MUX \dram_do_mux_b18/al_mux_b0_0_1  (
    .i0(dram_do_i2_018),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b18/B0_1 ));
  AL_MUX \dram_do_mux_b18/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b18/B0_0 ),
    .i1(\dram_do_mux_b18/B0_1 ),
    .sel(raddr[5]),
    .o(do[18]));
  AL_MUX \dram_do_mux_b19/al_mux_b0_0_0  (
    .i0(dram_do_i0_019),
    .i1(dram_do_i1_019),
    .sel(raddr[4]),
    .o(\dram_do_mux_b19/B0_0 ));
  AL_MUX \dram_do_mux_b19/al_mux_b0_0_1  (
    .i0(dram_do_i2_019),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b19/B0_1 ));
  AL_MUX \dram_do_mux_b19/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b19/B0_0 ),
    .i1(\dram_do_mux_b19/B0_1 ),
    .sel(raddr[5]),
    .o(do[19]));
  AL_MUX \dram_do_mux_b2/al_mux_b0_0_0  (
    .i0(dram_do_i0_002),
    .i1(dram_do_i1_002),
    .sel(raddr[4]),
    .o(\dram_do_mux_b2/B0_0 ));
  AL_MUX \dram_do_mux_b2/al_mux_b0_0_1  (
    .i0(dram_do_i2_002),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b2/B0_1 ));
  AL_MUX \dram_do_mux_b2/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b2/B0_0 ),
    .i1(\dram_do_mux_b2/B0_1 ),
    .sel(raddr[5]),
    .o(do[2]));
  AL_MUX \dram_do_mux_b20/al_mux_b0_0_0  (
    .i0(dram_do_i0_020),
    .i1(dram_do_i1_020),
    .sel(raddr[4]),
    .o(\dram_do_mux_b20/B0_0 ));
  AL_MUX \dram_do_mux_b20/al_mux_b0_0_1  (
    .i0(dram_do_i2_020),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b20/B0_1 ));
  AL_MUX \dram_do_mux_b20/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b20/B0_0 ),
    .i1(\dram_do_mux_b20/B0_1 ),
    .sel(raddr[5]),
    .o(do[20]));
  AL_MUX \dram_do_mux_b21/al_mux_b0_0_0  (
    .i0(dram_do_i0_021),
    .i1(dram_do_i1_021),
    .sel(raddr[4]),
    .o(\dram_do_mux_b21/B0_0 ));
  AL_MUX \dram_do_mux_b21/al_mux_b0_0_1  (
    .i0(dram_do_i2_021),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b21/B0_1 ));
  AL_MUX \dram_do_mux_b21/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b21/B0_0 ),
    .i1(\dram_do_mux_b21/B0_1 ),
    .sel(raddr[5]),
    .o(do[21]));
  AL_MUX \dram_do_mux_b22/al_mux_b0_0_0  (
    .i0(dram_do_i0_022),
    .i1(dram_do_i1_022),
    .sel(raddr[4]),
    .o(\dram_do_mux_b22/B0_0 ));
  AL_MUX \dram_do_mux_b22/al_mux_b0_0_1  (
    .i0(dram_do_i2_022),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b22/B0_1 ));
  AL_MUX \dram_do_mux_b22/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b22/B0_0 ),
    .i1(\dram_do_mux_b22/B0_1 ),
    .sel(raddr[5]),
    .o(do[22]));
  AL_MUX \dram_do_mux_b23/al_mux_b0_0_0  (
    .i0(dram_do_i0_023),
    .i1(dram_do_i1_023),
    .sel(raddr[4]),
    .o(\dram_do_mux_b23/B0_0 ));
  AL_MUX \dram_do_mux_b23/al_mux_b0_0_1  (
    .i0(dram_do_i2_023),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b23/B0_1 ));
  AL_MUX \dram_do_mux_b23/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b23/B0_0 ),
    .i1(\dram_do_mux_b23/B0_1 ),
    .sel(raddr[5]),
    .o(do[23]));
  AL_MUX \dram_do_mux_b24/al_mux_b0_0_0  (
    .i0(dram_do_i0_024),
    .i1(dram_do_i1_024),
    .sel(raddr[4]),
    .o(\dram_do_mux_b24/B0_0 ));
  AL_MUX \dram_do_mux_b24/al_mux_b0_0_1  (
    .i0(dram_do_i2_024),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b24/B0_1 ));
  AL_MUX \dram_do_mux_b24/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b24/B0_0 ),
    .i1(\dram_do_mux_b24/B0_1 ),
    .sel(raddr[5]),
    .o(do[24]));
  AL_MUX \dram_do_mux_b25/al_mux_b0_0_0  (
    .i0(dram_do_i0_025),
    .i1(dram_do_i1_025),
    .sel(raddr[4]),
    .o(\dram_do_mux_b25/B0_0 ));
  AL_MUX \dram_do_mux_b25/al_mux_b0_0_1  (
    .i0(dram_do_i2_025),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b25/B0_1 ));
  AL_MUX \dram_do_mux_b25/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b25/B0_0 ),
    .i1(\dram_do_mux_b25/B0_1 ),
    .sel(raddr[5]),
    .o(do[25]));
  AL_MUX \dram_do_mux_b26/al_mux_b0_0_0  (
    .i0(dram_do_i0_026),
    .i1(dram_do_i1_026),
    .sel(raddr[4]),
    .o(\dram_do_mux_b26/B0_0 ));
  AL_MUX \dram_do_mux_b26/al_mux_b0_0_1  (
    .i0(dram_do_i2_026),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b26/B0_1 ));
  AL_MUX \dram_do_mux_b26/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b26/B0_0 ),
    .i1(\dram_do_mux_b26/B0_1 ),
    .sel(raddr[5]),
    .o(do[26]));
  AL_MUX \dram_do_mux_b27/al_mux_b0_0_0  (
    .i0(dram_do_i0_027),
    .i1(dram_do_i1_027),
    .sel(raddr[4]),
    .o(\dram_do_mux_b27/B0_0 ));
  AL_MUX \dram_do_mux_b27/al_mux_b0_0_1  (
    .i0(dram_do_i2_027),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b27/B0_1 ));
  AL_MUX \dram_do_mux_b27/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b27/B0_0 ),
    .i1(\dram_do_mux_b27/B0_1 ),
    .sel(raddr[5]),
    .o(do[27]));
  AL_MUX \dram_do_mux_b28/al_mux_b0_0_0  (
    .i0(dram_do_i0_028),
    .i1(dram_do_i1_028),
    .sel(raddr[4]),
    .o(\dram_do_mux_b28/B0_0 ));
  AL_MUX \dram_do_mux_b28/al_mux_b0_0_1  (
    .i0(dram_do_i2_028),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b28/B0_1 ));
  AL_MUX \dram_do_mux_b28/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b28/B0_0 ),
    .i1(\dram_do_mux_b28/B0_1 ),
    .sel(raddr[5]),
    .o(do[28]));
  AL_MUX \dram_do_mux_b29/al_mux_b0_0_0  (
    .i0(dram_do_i0_029),
    .i1(dram_do_i1_029),
    .sel(raddr[4]),
    .o(\dram_do_mux_b29/B0_0 ));
  AL_MUX \dram_do_mux_b29/al_mux_b0_0_1  (
    .i0(dram_do_i2_029),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b29/B0_1 ));
  AL_MUX \dram_do_mux_b29/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b29/B0_0 ),
    .i1(\dram_do_mux_b29/B0_1 ),
    .sel(raddr[5]),
    .o(do[29]));
  AL_MUX \dram_do_mux_b3/al_mux_b0_0_0  (
    .i0(dram_do_i0_003),
    .i1(dram_do_i1_003),
    .sel(raddr[4]),
    .o(\dram_do_mux_b3/B0_0 ));
  AL_MUX \dram_do_mux_b3/al_mux_b0_0_1  (
    .i0(dram_do_i2_003),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b3/B0_1 ));
  AL_MUX \dram_do_mux_b3/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b3/B0_0 ),
    .i1(\dram_do_mux_b3/B0_1 ),
    .sel(raddr[5]),
    .o(do[3]));
  AL_MUX \dram_do_mux_b30/al_mux_b0_0_0  (
    .i0(dram_do_i0_030),
    .i1(dram_do_i1_030),
    .sel(raddr[4]),
    .o(\dram_do_mux_b30/B0_0 ));
  AL_MUX \dram_do_mux_b30/al_mux_b0_0_1  (
    .i0(dram_do_i2_030),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b30/B0_1 ));
  AL_MUX \dram_do_mux_b30/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b30/B0_0 ),
    .i1(\dram_do_mux_b30/B0_1 ),
    .sel(raddr[5]),
    .o(do[30]));
  AL_MUX \dram_do_mux_b31/al_mux_b0_0_0  (
    .i0(dram_do_i0_031),
    .i1(dram_do_i1_031),
    .sel(raddr[4]),
    .o(\dram_do_mux_b31/B0_0 ));
  AL_MUX \dram_do_mux_b31/al_mux_b0_0_1  (
    .i0(dram_do_i2_031),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b31/B0_1 ));
  AL_MUX \dram_do_mux_b31/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b31/B0_0 ),
    .i1(\dram_do_mux_b31/B0_1 ),
    .sel(raddr[5]),
    .o(do[31]));
  AL_MUX \dram_do_mux_b4/al_mux_b0_0_0  (
    .i0(dram_do_i0_004),
    .i1(dram_do_i1_004),
    .sel(raddr[4]),
    .o(\dram_do_mux_b4/B0_0 ));
  AL_MUX \dram_do_mux_b4/al_mux_b0_0_1  (
    .i0(dram_do_i2_004),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b4/B0_1 ));
  AL_MUX \dram_do_mux_b4/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b4/B0_0 ),
    .i1(\dram_do_mux_b4/B0_1 ),
    .sel(raddr[5]),
    .o(do[4]));
  AL_MUX \dram_do_mux_b5/al_mux_b0_0_0  (
    .i0(dram_do_i0_005),
    .i1(dram_do_i1_005),
    .sel(raddr[4]),
    .o(\dram_do_mux_b5/B0_0 ));
  AL_MUX \dram_do_mux_b5/al_mux_b0_0_1  (
    .i0(dram_do_i2_005),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b5/B0_1 ));
  AL_MUX \dram_do_mux_b5/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b5/B0_0 ),
    .i1(\dram_do_mux_b5/B0_1 ),
    .sel(raddr[5]),
    .o(do[5]));
  AL_MUX \dram_do_mux_b6/al_mux_b0_0_0  (
    .i0(dram_do_i0_006),
    .i1(dram_do_i1_006),
    .sel(raddr[4]),
    .o(\dram_do_mux_b6/B0_0 ));
  AL_MUX \dram_do_mux_b6/al_mux_b0_0_1  (
    .i0(dram_do_i2_006),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b6/B0_1 ));
  AL_MUX \dram_do_mux_b6/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b6/B0_0 ),
    .i1(\dram_do_mux_b6/B0_1 ),
    .sel(raddr[5]),
    .o(do[6]));
  AL_MUX \dram_do_mux_b7/al_mux_b0_0_0  (
    .i0(dram_do_i0_007),
    .i1(dram_do_i1_007),
    .sel(raddr[4]),
    .o(\dram_do_mux_b7/B0_0 ));
  AL_MUX \dram_do_mux_b7/al_mux_b0_0_1  (
    .i0(dram_do_i2_007),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b7/B0_1 ));
  AL_MUX \dram_do_mux_b7/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b7/B0_0 ),
    .i1(\dram_do_mux_b7/B0_1 ),
    .sel(raddr[5]),
    .o(do[7]));
  AL_MUX \dram_do_mux_b8/al_mux_b0_0_0  (
    .i0(dram_do_i0_008),
    .i1(dram_do_i1_008),
    .sel(raddr[4]),
    .o(\dram_do_mux_b8/B0_0 ));
  AL_MUX \dram_do_mux_b8/al_mux_b0_0_1  (
    .i0(dram_do_i2_008),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b8/B0_1 ));
  AL_MUX \dram_do_mux_b8/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b8/B0_0 ),
    .i1(\dram_do_mux_b8/B0_1 ),
    .sel(raddr[5]),
    .o(do[8]));
  AL_MUX \dram_do_mux_b9/al_mux_b0_0_0  (
    .i0(dram_do_i0_009),
    .i1(dram_do_i1_009),
    .sel(raddr[4]),
    .o(\dram_do_mux_b9/B0_0 ));
  AL_MUX \dram_do_mux_b9/al_mux_b0_0_1  (
    .i0(dram_do_i2_009),
    .i1(1'b0),
    .sel(raddr[4]),
    .o(\dram_do_mux_b9/B0_1 ));
  AL_MUX \dram_do_mux_b9/al_mux_b0_1_0  (
    .i0(\dram_do_mux_b9/B0_0 ),
    .i1(\dram_do_mux_b9/B0_1 ),
    .sel(raddr[5]),
    .o(do[9]));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b1111111111111111),
    .INIT_D1(16'b1111111111111111),
    .INIT_D2(16'b0000001000000010),
    .INIT_D3(16'b0000001000000010))
    dram_r0_c0 (
    .di(di[3:0]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_003,dram_do_i0_002,dram_do_i0_001,dram_do_i0_000}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0100100011001101),
    .INIT_D1(16'b1001001100110110),
    .INIT_D2(16'b0000001000000110),
    .INIT_D3(16'b0110110010000010))
    dram_r0_c1 (
    .di(di[7:4]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_007,dram_do_i0_006,dram_do_i0_005,dram_do_i0_004}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0110110000001001),
    .INIT_D1(16'b1111110100010000),
    .INIT_D2(16'b1111110101110000),
    .INIT_D3(16'b0000000000110000))
    dram_r0_c2 (
    .di(di[11:8]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_011,dram_do_i0_010,dram_do_i0_009,dram_do_i0_008}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b1011010100110000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0100100000000000))
    dram_r0_c3 (
    .di(di[15:12]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_015,dram_do_i0_014,dram_do_i0_013,dram_do_i0_012}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0100100001111000),
    .INIT_D1(16'b0100100000000000),
    .INIT_D2(16'b1111110100000000),
    .INIT_D3(16'b0000000000000000))
    dram_r0_c4 (
    .di(di[19:16]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_019,dram_do_i0_018,dram_do_i0_017,dram_do_i0_016}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b1101100000010100),
    .INIT_D1(16'b1001000000000000),
    .INIT_D2(16'b1011011000000000),
    .INIT_D3(16'b1011011000100010))
    dram_r0_c5 (
    .di(di[23:20]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_023,dram_do_i0_022,dram_do_i0_021,dram_do_i0_020}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000001000000000),
    .INIT_D1(16'b1011010101001001),
    .INIT_D2(16'b1011010100001000),
    .INIT_D3(16'b1011010100001001))
    dram_r0_c6 (
    .di(di[27:24]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_027,dram_do_i0_026,dram_do_i0_025,dram_do_i0_024}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b1011010100001000),
    .INIT_D1(16'b1011010100001000),
    .INIT_D2(16'b1011010100001000),
    .INIT_D3(16'b1011010100001000))
    dram_r0_c7 (
    .di(di[31:28]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_0),
    .do({dram_do_i0_031,dram_do_i0_030,dram_do_i0_029,dram_do_i0_028}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000001111111111),
    .INIT_D1(16'b0000001111111111),
    .INIT_D2(16'b0000001000000000),
    .INIT_D3(16'b0000001000000000))
    dram_r1_c0 (
    .di(di[3:0]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_003,dram_do_i1_002,dram_do_i1_001,dram_do_i1_000}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000011011010),
    .INIT_D1(16'b0000001100100100),
    .INIT_D2(16'b0000001000100100),
    .INIT_D3(16'b0000000011011110))
    dram_r1_c1 (
    .di(di[7:4]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_007,dram_do_i1_006,dram_do_i1_005,dram_do_i1_004}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000010010011),
    .INIT_D1(16'b0000000010010011),
    .INIT_D2(16'b0000000010110011),
    .INIT_D3(16'b0000000000000000))
    dram_r1_c2 (
    .di(di[11:8]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_011,dram_do_i1_010,dram_do_i1_009,dram_do_i1_008}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000001000100100),
    .INIT_D1(16'b0000001100000001),
    .INIT_D2(16'b0000001000100100),
    .INIT_D3(16'b0000001100101100))
    dram_r1_c3 (
    .di(di[15:12]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_015,dram_do_i1_014,dram_do_i1_013,dram_do_i1_012}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000001100100100),
    .INIT_D1(16'b0000001100100100),
    .INIT_D2(16'b0000001100100101),
    .INIT_D3(16'b0000001000000000))
    dram_r1_c4 (
    .di(di[19:16]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_019,dram_do_i1_018,dram_do_i1_017,dram_do_i1_016}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000001100111010),
    .INIT_D1(16'b0000000000010110),
    .INIT_D2(16'b0000001010010111),
    .INIT_D3(16'b0000001010000111))
    dram_r1_c5 (
    .di(di[23:20]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_023,dram_do_i1_022,dram_do_i1_021,dram_do_i1_020}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000001000000010),
    .INIT_D1(16'b0000001010000111),
    .INIT_D2(16'b0000000000000111),
    .INIT_D3(16'b0000001010000111))
    dram_r1_c6 (
    .di(di[27:24]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_027,dram_do_i1_026,dram_do_i1_025,dram_do_i1_024}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000001000000111),
    .INIT_D1(16'b0000001000000111),
    .INIT_D2(16'b0000001000000111),
    .INIT_D3(16'b0000001000000101))
    dram_r1_c7 (
    .di(di[31:28]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_0_1),
    .do({dram_do_i1_031,dram_do_i1_030,dram_do_i1_029,dram_do_i1_028}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c0 (
    .di(di[3:0]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_003,dram_do_i2_002,dram_do_i2_001,dram_do_i2_000}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c1 (
    .di(di[7:4]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_007,dram_do_i2_006,dram_do_i2_005,dram_do_i2_004}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c2 (
    .di(di[11:8]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_011,dram_do_i2_010,dram_do_i2_009,dram_do_i2_008}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c3 (
    .di(di[15:12]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_015,dram_do_i2_014,dram_do_i2_013,dram_do_i2_012}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c4 (
    .di(di[19:16]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_019,dram_do_i2_018,dram_do_i2_017,dram_do_i2_016}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c5 (
    .di(di[23:20]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_023,dram_do_i2_022,dram_do_i2_021,dram_do_i2_020}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c6 (
    .di(di[27:24]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_027,dram_do_i2_026,dram_do_i2_025,dram_do_i2_024}));
  EG_LOGIC_DRAM16X4 #(
    .INIT_D0(16'b0000000000000000),
    .INIT_D1(16'b0000000000000000),
    .INIT_D2(16'b0000000000000000),
    .INIT_D3(16'b0000000000000000))
    dram_r2_c7 (
    .di(di[31:28]),
    .raddr(raddr[3:0]),
    .waddr(waddr[3:0]),
    .wclk(wclk),
    .we(we_1_0),
    .do({dram_do_i2_031,dram_do_i2_030,dram_do_i2_029,dram_do_i2_028}));
  not \waddr[4]_inv  (waddr$4$_neg, waddr[4]);
  not \waddr[5]_inv  (waddr$5$_neg, waddr[5]);
  and we_0_0i (we_0_0, we_0, waddr$4$_neg);
  and we_0_1i (we_0_1, we_0, waddr[4]);
  and we_0i (we_0, we, waddr$5$_neg);
  and we_1_0i (we_1_0, we_1, waddr$4$_neg);
  and we_1i (we_1, we, waddr[5]);

endmodule 

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

