--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:36:52 01/25/2017
-- Design Name:   
-- Module Name:   C:/Hervan/VGA_Project/testClkdiv.vhd
-- Project Name:  VGA_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DivClk
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testClkdiv IS
END testClkdiv;
 
ARCHITECTURE behavior OF testClkdiv IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DivClk
    PORT(
         clk50Mhz : IN  std_logic;
         clk25Mhz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk50Mhz : std_logic := '0';

 	--Outputs
   signal clk25Mhz : std_logic;

   -- Clock period definitions
   constant clk50Mhz_period : time := 10 ns;
   constant clk25Mhz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DivClk PORT MAP (
          clk50Mhz => clk50Mhz,
          clk25Mhz => clk25Mhz
        );

   -- Clock process definitions
   clk50Mhz_process :process
   begin
		clk50Mhz <= '0';
		wait for clk50Mhz_period/2;
		clk50Mhz <= '1';
		wait for clk50Mhz_period/2;
   end process;
 
   clk25Mhz_process :process
   begin
		clk25Mhz <= '0';
		wait for clk25Mhz_period/2;
		clk25Mhz <= '1';
		wait for clk25Mhz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk50Mhz_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
