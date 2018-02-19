library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity DrawFlagFrance is
PORT(
Clk : IN STD_LOGIC;
HPos : IN INTEGER range 0 to 800;
VPos : IN INTEGER range 0 to 525;
R, G, B : OUT STD_LOGIC
);
end DrawFlagFrance;

architecture Behavioral of DrawFlagFrance is
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

FranceFlag : process (Clk)	--Drawing France flag and Color gestion
begin
if(Clk'EVENT AND Clk = '1')THEN
		if(
			(Hpos > 0)
			AND
			(Hpos < TDISP_HSClk/3)
			AND
			(Vpos > 0)
			AND
			(Vpos < TDISP_VSLines)
			)Then
				R <= '0';
				G <= '0';
				B <= '1';
		elsif(
			(Hpos > TDISP_HSClk/3)
			AND
			(Hpos < TDISP_HSClk*2/3)
			AND
			(Vpos > 0)
			AND
			(Vpos < TDISP_VSLines)
			)Then
				R <= '1';
				G <= '1';
				B <= '1';
		elsif(
			(Hpos > TDISP_HSClk*2/3)
			AND
			(Hpos < TDISP_HSClk)
			AND
			(Vpos > 0)
			AND
			(Vpos < TDISP_VSLines)
			)Then
				R <= '1';
				G <= '0';
				B <= '0';
		else
			R <= '0';
			G <= '0';
			B <= '0';
		end if;
end if;
end process;
end Behavioral;

