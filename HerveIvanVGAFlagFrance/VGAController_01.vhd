library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TP2_VGA is
PORT(
	mclk : in std_logic;
	btn : in std_logic_vector(3 downto 0);
	swt : in std_logic_vector(7 downto 0);
	led : out std_logic_vector(7 downto 0);
	an : out std_logic_vector(3 downto 0);
	ssg : out std_logic_vector(7 downto 0);
	hs : out std_logic;
	vs : out std_logic;
	red, grn, blu : out std_logic;
	kd, kc : in std_logic);
end TP2_VGA;

architecture Behavioral of TP2_VGA is

SIGNAL Clk25Mhz:STD_LOGIC;
Signal HPos : INTEGER range 0 to 800;
SIGNAL VPos : INTEGER range 0 to 525;
Signal VideoON, Draw, EndScreen : STD_LOGIC;
SIGNAL myWriteEnableRam1 :STD_LOGIC := '0';
SIGNAL myWriteEnableRam2 :STD_LOGIC := '0';
SIGNAL myWriteEnableRam3 :STD_LOGIC := '0';
Signal AdresseRam :std_logic_vector(13 DOWNTO 0); 
Signal myInputRam1 :std_logic_vector(0 DOWNTO 0);
Signal myInputRam2 :std_logic_vector(0 DOWNTO 0);
Signal myInputRam3 :std_logic_vector(0 DOWNTO 0);
signal wea : STD_LOGIC_VECTOR(0 DOWNTO 0):="0";
signal dina : STD_LOGIC_VECTOR(0 DOWNTO 0) :="0";
signal douta1 : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal douta2 : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal douta3 : STD_LOGIC_VECTOR(0 DOWNTO 0);
Signal RRam : STD_LOGIC ;
Signal GRam : STD_LOGIC ;
Signal BRam : STD_LOGIC ;
Signal RedFRFlag : STD_LOGIC;
Signal GreenFRFlag : STD_LOGIC;
Signal BlueFRFlag : STD_LOGIC;
---------------------------------------------------------------
component DrawFlagFrance is
PORT(
Clk : IN STD_LOGIC;
HPos : IN INTEGER range 0 to 800;
VPos : IN INTEGER range 0 to 525;
R, G, B : OUT STD_LOGIC
);
end component DrawFlagFrance;

component HVPosSignal is
PORT(
Clk : IN STD_LOGIC;
HPos : OUT INTEGER range 0 to 800;
VPos : OUT INTEGER range 0 to 525;
VideoON, Draw, EndScreen : OUT STD_LOGIC
);
end component HVPosSignal;

component HVSynchronitionSignal is
PORT(
Clk : IN STD_LOGIC;
HPos : IN INTEGER range 0 to 800;
VPos : IN INTEGER range 0 to 525;
HS, VS : OUT STD_LOGIC
);
end component HVSynchronitionSignal;

component AdresseRamDataOutput is
PORT(
Clk : IN STD_LOGIC;
Draw, EndScreen : IN STD_LOGIC;
HPos : IN INTEGER range 0 to 800;
VPos : IN INTEGER range 0 to 525;
Adresse : OUT STD_LOGIC_VECTOR (13 downto 0)
);
end component AdresseRamDataOutput;

component ESIGETELWord2 IS
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END component ESIGETELWord2;

component ESIGETELWord IS
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END component ESIGETELWord;

component ESIGETELWord3 IS
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END component ESIGETELWord3;

component DivClk is
	 Port ( 	
			clk50Mhz : in  STD_LOGIC;
			clk25Mhz : out  STD_LOGIC
			);
END COMPONENT DivClk;

COMPONENT FinalColorSignal IS
PORT(
Clk : IN STD_LOGIC;
RDraw, GDraw, BDraw: IN STD_LOGIC;
RedFRFlag, GreenFRFlag, BlueFRFlag: IN STD_LOGIC;
Draw,videoON: IN STD_LOGIC;
R, G, B : out std_logic:='0'
);
end COMPONENT FinalColorSignal;
--------------------------------------------------------------------------
begin

U1 : DrawFlagFrance PORT MAP (Clk25Mhz, HPos, Vpos, RedFRFlag,GreenFRFlag, BlueFRFlag);
RAM1 : ESIGETELWord PORT MAP(Clk25Mhz, wea, AdresseRam, dina, douta1);
RAM2 : ESIGETELWord2 PORT MAP(Clk25Mhz, wea, AdresseRam, dina, douta2);	 
RAM3 : ESIGETELWord3 PORT MAP(Clk25Mhz, wea, AdresseRam, dina, douta3); 
U2 : HVPosSignal PORT MAP (Clk25Mhz, HPos, VPos, VideoON, Draw, EndScreen); 
U3 : HVSynchronitionSignal PORT MAP (Clk25Mhz, HPos, VPos, hs, vs);
U4 : AdresseRamDataOutput PORT MAP (Clk25Mhz, Draw, EndScreen, Hpos, Vpos, AdresseRam);
U5: DivClk PORT MAP (mclk, Clk25Mhz);
U6 : FinalColorSignal PORT MAP(Clk25Mhz, RRam, GRam, BRam, RedFRFlag, GreenFRFlag, BlueFRFlag, Draw, VideoON, red, grn, blu);

	RRam <= douta1(0);
	GRam <= douta1(0);
	BRam <= douta1(0);
	ssg(5 downto 0) <= "100011";
	ssg(7) <= kd;
	ssg(6) <= kc;
	an (3 downto 0) <= btn (3 downto 0);
	led (7 downto 0) <= swt (7 downto 0);
end Behavioral;

