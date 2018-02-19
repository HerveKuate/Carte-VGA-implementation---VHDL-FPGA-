--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:30:53 12/22/2017
-- Design Name:   
-- Module Name:   X:/Herve/M1/FPGA VHDL/TP/TPVHDL_HerveJedeine/HerveIvanVGAFlagFrance/TP2Simulator.vhd
-- Project Name:  HerveJedeineVGAFlagFrance
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TP2_VGA
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
 
ENTITY TP2Simulator IS
END TP2Simulator;
 
ARCHITECTURE behavior OF TP2Simulator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TP2_VGA
    PORT(
         mclk : IN  std_logic;
         btn : IN  std_logic_vector(3 downto 0);
         swt : IN  std_logic_vector(7 downto 0);
         led : OUT  std_logic_vector(7 downto 0);
         an : OUT  std_logic_vector(3 downto 0);
         ssg : OUT  std_logic_vector(7 downto 0);
         hs : OUT  std_logic;
         vs : OUT  std_logic;
         red : OUT  std_logic;
         grn : OUT  std_logic;
         blu : OUT  std_logic;
         kd : IN  std_logic;
         kc : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal mclk : std_logic := '0';
   signal btn : std_logic_vector(3 downto 0) := (others => '0');
   signal swt : std_logic_vector(7 downto 0) := (others => '0');
   signal kd : std_logic := '0';
   signal kc : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(7 downto 0);
   signal an : std_logic_vector(3 downto 0);
   signal ssg : std_logic_vector(7 downto 0);
   signal hs : std_logic;
   signal vs : std_logic;
   signal red : std_logic;
   signal grn : std_logic;
   signal blu : std_logic;

   -- Clock period definitions
   constant mclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TP2_VGA PORT MAP (
          mclk => mclk,
          btn => btn,
          swt => swt,
          led => led,
          an => an,
          ssg => ssg,
          hs => hs,
          vs => vs,
          red => red,
          grn => grn,
          blu => blu,
          kd => kd,
          kc => kc
        );

   -- Clock process definitions
   mclk_process :process
   begin
		mclk <= '0';
		wait for mclk_period/2;
		mclk <= '1';
		wait for mclk_period/2;
   end process;
 

--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for mclk_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;
