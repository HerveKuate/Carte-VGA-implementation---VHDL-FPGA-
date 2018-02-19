library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity HVSynchronitionSignal is
PORT(
Clk : IN STD_LOGIC;
HPos : IN INTEGER range 0 to 800;
VPos : IN INTEGER range 0 to 525;
HS, VS : OUT STD_LOGIC
);
end HVSynchronitionSignal;

architecture Behavioral of HVSynchronitionSignal is
------------------------------------------------------------------------
--Horizotal constant data
constant Ts_HSClk : INTEGER:= 800; --Whole line
constant Tpw_HSClk : INTEGER:= 96; --Sync pulse
constant TBP_HSClk : INTEGER:= 48; --Back porch
constant TFP_HSClk : INTEGER:= 8; --Front porch 16 in prof tp
constant TDISP_HSClk : INTEGER:= 640; --Visible area
--Vertical constant data
constant Tpw_VSLines : INTEGER:= 2; --Sync pulse (no change)
constant Ts_VSLines : INTEGER:= 525; -- Whole frame (521 prof tp)
constant TBP_VSLines : INTEGER:= 33; -- Back porch --constant TBP_VSLines : INTEGER:= 29; -- Back porch
constant TDISP_VSLines : INTEGER:=480; --Visible area
constant TFP_VSLines : INTEGER:= 2; --Front Porch (2 in prof tp)
---------------------------------------------------------------------

begin

---------------------------------------------------------------
Synchronization : PROCESS(Clk)--dealing with the synchronization
BEGIN
if(Clk'EVENT AND Clk = '1')THEN	
	if((Hpos >= TDISP_HSClk + TFP_HSClk ) AND (Hpos < TDISP_HSClk + TFP_HSClk + Tpw_HSClk )) Then
		HS <= '1';
		else
		HS <='0';
	end if;
	if(Vpos > TDISP_VSLines + TFP_VSLines AND (Vpos < TDISP_VSLines + TFP_VSLines + Tpw_VSLines )) then
		VS <= '1';
		else
		VS <= '0';
	end if;
end if;
end process;
----------------------------------------------------------------
end Behavioral;

