library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity HVPosSignal is
PORT(
Clk : IN STD_LOGIC;
HPos : OUT INTEGER range 0 to 800;
VPos : OUT INTEGER range 0 to 525;
VideoON, Draw, EndScreen : OUT STD_LOGIC
);
end HVPosSignal;

architecture Behavioral of HVPosSignal is
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
constant Square : INTEGER:= 150; --square length

--Signal
signal myHpos: INTEGER range 0 to Ts_HSClk :=0 ;
signal myVpos: INTEGER range 0 to Ts_VSLines :=0;
signal myVideoON : std_logic := '0';
signal myDraw : std_logic := '0';

begin

myVideoON <= '1' when (myHpos < TDISP_HSClk and myVpos < TDISP_VSLines) else '0';
myDraw <= '1' when (myHpos < TDISP_HSClk and myHpos > 0 and myVpos < TDISP_VSLines/3 + 20 and myVpos > TDISP_VSLines/3) else '0';

HVPosition : PROCESS(Clk)	--Position H & V
BEGIN
if(Clk'EVENT AND Clk = '1')THEN
	if(myHpos < Ts_HSClk) then
		myHpos <= myHpos+1;
	else
		myHpos <= 0;
		if(myVpos <  Ts_VSLines) then
		myVpos <= myVpos+1;
		else
		myVpos <= 0;
		end if;
	end if;
	
	if(myHpos < Ts_HSClk and myVpos < Ts_VSLines)then
		EndScreen <= '0';
	else
		EndScreen <= '1';
	end if;
end if;
end process;

Hpos <= myHpos ;
Vpos <= myVpos;
VideoON <= myVideoON;
Draw <= myDraw;

end Behavioral;

