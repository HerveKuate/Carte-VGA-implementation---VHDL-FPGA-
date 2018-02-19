----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:33:05 01/23/2017 
-- Design Name: 
-- Module Name:    Synchronisor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AdresseRamDataOutput is
PORT(
Clk : IN STD_LOGIC;
Draw, EndScreen : IN STD_LOGIC;
HPos : IN INTEGER range 0 to 800;
VPos : IN INTEGER range 0 to 525;
Adresse : OUT STD_LOGIC_VECTOR (13 downto 0)
);
end AdresseRamDataOutput;

architecture Behavioral of AdresseRamDataOutput is

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

constant Square : INTEGER:= 150; --square length

--Signal
signal myAdress : INTEGER range 0 to 16383;
begin

AdresseOutput : process (Clk)	--Drawing France flag and Color gestion
begin
if(Clk'EVENT AND Clk = '1')THEN
	--myDraw <= '1' when (myHpos < TDISP_HSClk and myHpos > 0 and myVpos < TDISP_VSLines/3 + 20 and myVpos > TDISP_VSLines/3) else '0';
	myAdress <= (TDISP_HSClk * (Vpos - TDISP_VSLines/3) + Hpos); 
	if(myAdress >= 16383)then	
	myAdress <= 0; 
end if;
end if;
end process AdresseOutput;

Adresse <= CONV_STD_LOGIC_VECTOR(myAdress,14);

end Behavioral;

