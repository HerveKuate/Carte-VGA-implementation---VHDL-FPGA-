--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:16:21 01/24/2017
-- Design Name:   
-- Module Name:   C:/Hervan/VGA_Project/synchroTest.vhd
-- Project Name:  VGA_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Synchronisor
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
 
ENTITY synchroTest IS
END synchroTest;
 
ARCHITECTURE behavior OF synchroTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Synchronisor
    PORT(
         Clk : IN  std_logic;
         R : OUT  std_logic;
         G : OUT  std_logic;
         B : OUT  std_logic;
         HS : OUT  std_logic;
         VS : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';

 	--Outputs
   signal R : std_logic;
   signal G : std_logic;
   signal B : std_logic;
   signal HS : std_logic;
   signal VS : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 80ns; --time*2
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Synchronisor PORT MAP (
          Clk => Clk,
          R => R,
          G => G,
          B => B,
          HS => HS,
          VS => VS
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
