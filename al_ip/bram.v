/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	/home/icenowy/git-repos/ice-risc/al_ip/bram.v
 ** Date	:	2018 12 11
 ** TD version	:	4.2.217
\************************************************************/

`timescale 1ns / 1ps

module bram ( 
	dia, addra, clka, rsta, wea, 
	dob, addrb, clkb, rstb
);

	output [31:0] dob;


	input  [31:0] dia;
	input  [5:0] addra;
	input  [5:0] addrb;
	input  [3:0] wea;
	input  clka;
	input  clkb;
	input  rsta;
	input  rstb;




	EG_LOGIC_BRAM #( .DATA_WIDTH_A(32),
				.DATA_WIDTH_B(32),
				.ADDR_WIDTH_A(6),
				.ADDR_WIDTH_B(6),
				.DATA_DEPTH_A(44),
				.DATA_DEPTH_B(44),
				.BYTE_ENABLE(8),
				.BYTE_A(4),
				.BYTE_B(4),
				.MODE("PDPW"),
				.REGMODE_A("NOREG"),
				.REGMODE_B("NOREG"),
				.WRITEMODE_A("NORMAL"),
				.WRITEMODE_B("NORMAL"),
				.RESETMODE("SYNC"),
				.IMPLEMENT("9K"),
				.INIT_FILE("../rom.mif"),
				.FILL_ALL("NONE"))
			inst(
				.dia(dia),
				.dib({32{1'b0}}),
				.addra(addra),
				.addrb(addrb),
				.cea(1'b1),
				.ceb(1'b1),
				.ocea(1'b0),
				.oceb(1'b0),
				.clka(clka),
				.clkb(clkb),
				.wea(1'b0),
				.bea(wea),
				.rsta(rsta),
				.rstb(rstb),
				.doa(),
				.dob(dob));


endmodule