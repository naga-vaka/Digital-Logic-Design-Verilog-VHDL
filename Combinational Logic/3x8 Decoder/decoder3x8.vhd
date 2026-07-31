library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity decoder3x8 is
    Port ( G1 : in STD_LOGIC;
           G2A_L : in STD_LOGIC;
           G2B_L : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end decoder3x8;
architecture Behavioral of decoder3x8 is
begin
process(G1,G2A_L,G2B_L,I)
begin
if (G1='0') then Y<="00000000";
elsif(G2A_L='1') then Y<="00000000";
elsif(G2B_L='1') then Y<="00000000";
elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="000") then Y<="00000001";
  elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="001") then Y<="00000010";
  elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="010") then Y<="00000100";
elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="011") then Y<="00001000";
elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="100") then Y<="00010000";
elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="101") then Y<="00100000";
elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="110") then Y<="01000000";
elsif(G1='1' and G2A_L='0' and G2B_L='0' and I="111") then Y<="10000000";
else Y<="00000000";
end if;
end process;
end Behavioral;
