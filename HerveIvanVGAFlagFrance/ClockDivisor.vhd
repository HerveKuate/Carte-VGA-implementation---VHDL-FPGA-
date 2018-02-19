----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:50 12/13/2017
-- Design Name: 
-- Module Name:    DivClk - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DivClk is
	 Port ( 	
			clk50Mhz : in  STD_LOGIC;
			clk25Mhz : out  STD_LOGIC --frequency used by VGA is around 25Mhz
			);
end DivClk;

architecture Behavioral of DivClk is
--Constant
	constant MyvalCpt25Mhz : STD_LOGIC_VECTOR (1 downto 0):= "10";
	
-- Signaux de compteurs pour les divisions d'horloges
	signal MyCpt25Mhz : STD_LOGIC_VECTOR (1 downto 0) := "00";
	signal MyClk25Mhz : STD_LOGIC := '1';

begin
	
	MyClk25MhzProcess : process (clk50Mhz)
	begin
	if (clk50Mhz = '1' and clk50Mhz'EVENT) then
			MyClk25Mhz <= not (MyClk25Mhz);
	end if;
end process;

clk25Mhz <= MyClk25Mhz;

end Behavioral;

