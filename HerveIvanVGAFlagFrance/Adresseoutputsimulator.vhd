--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:39:32 12/22/2017
-- Design Name:   
-- Module Name:   X:/Herve/M1/FPGA VHDL/TP/TPVHDL_HerveJedeine/HerveIvanVGAFlagFrance/Adresseoutputsimulator.vhd
-- Project Name:  HerveJedeineVGAFlagFrance
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AdresseRamDataOutput
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
 
ENTITY Adresseoutputsimulator IS
END Adresseoutputsimulator;
 
ARCHITECTURE behavior OF Adresseoutputsimulator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AdresseRamDataOutput
    PORT(
         Clk : IN  std_logic;
         Draw : IN  std_logic;
         Adresse : OUT  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Draw : std_logic := '1';

 	--Outputs
   signal Adresse : std_logic_vector(13 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AdresseRamDataOutput PORT MAP (
          Clk => Clk,
          Draw => Draw,
          Adresse => Adresse
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
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for Clk_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;
