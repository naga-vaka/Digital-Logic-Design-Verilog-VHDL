library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity encoder8x3 is
    Port ( En_l: in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end encoder8x3;
architecture Behavioral of encoder8x3 is
begin
process (En_l,I)
begin
if (En_l='1') then y<="000";
elsif (En_l='0' and I="00000001") then y<="000";
elsif (En_l='0' and I="00000010") then y<="001";
elsif (En_l='0' and I="00000100") then y<="010";
elsif (En_l='0' and I="00001000") then y<="011";
elsif (En_l='0' and I="00010000") then y<="100";
elsif (En_l='0' and I="00100000") then y<="101";
elsif (En_l='0' and I="01000000") then y<="110";
elsif (En_l='0' and I="10000000") then y<="111";
else Y<="000";
end if;
end process;
end Behavioral;
