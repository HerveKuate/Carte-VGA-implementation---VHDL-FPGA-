--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:32:32 12/21/2017
-- Design Name:   
-- Module Name:   X:/Herve/M1/FPGA VHDL/TP/TPVHDL_HerveJedeine/HerveIvanVGAFlagFrance/RAM2Test.vhd
-- Project Name:  HerveJedeineVGAFlagFrance
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ESIGETELWord2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RAM2Test IS
END RAM2Test;
 
ARCHITECTURE behavior OF RAM2Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ESIGETELWord2
    PORT(
         clka : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(13 downto 0);
         dina : IN  std_logic_vector(0 downto 0);
         douta : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal wea : std_logic_vector(0 downto 0) := (others => '0');
   signal addra : std_logic_vector(13 downto 0) := (others => '0');
   signal dina : std_logic_vector(0 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(0 downto 0);

   -- Clock period definitions
   constant clka_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ESIGETELWord2 PORT MAP (
          clka => clka,
          wea => wea,
          addra => addra,
          dina => dina,
          douta => douta
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
		
		addra <= std_logic_vector( unsigned(addra) + 1 );
   end process;
 

--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clka_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;
