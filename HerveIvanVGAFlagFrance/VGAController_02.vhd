library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity FinalColorSignal is
PORT(
Clk : IN STD_LOGIC;
RDraw, GDraw, BDraw: IN STD_LOGIC;
RedFRFlag, GreenFRFlag, BlueFRFlag: IN STD_LOGIC;
Draw,videoON: IN STD_LOGIC;
R, G, B : out std_logic:='0'
);
end FinalColorSignal;

architecture Behavioral of FinalColorSignal is


begin

DrawChooser : process (Clk)
begin
if(Clk'EVENT AND Clk = '1')THEN
	if(videoON = '0') then
		R <= '0';
		G <= '0';
		B <= '0';
	elsif(Draw = '1') then
		R <= RDraw;
		G <= GDraw;
		B <= BDraw;
	else
		R <= RedFRFlag;
		G <= GreenFRFlag;
		B <= BlueFRFlag;
	end if;
	
end if;


end process;


----------------------------------------------------------------- 
end Behavioral;

