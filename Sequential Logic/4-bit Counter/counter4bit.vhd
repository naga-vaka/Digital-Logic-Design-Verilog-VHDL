library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter4bit is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Q   : out STD_LOGIC_VECTOR (3 downto 0));
end counter4bit;

architecture Behavioral of counter4bit is
    signal count: STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
process(Clk, Rst)
begin
    if (Rst = '1') then
        count <= "0000";
    elsif rising_edge(Clk) then
        count <= count + "0001";
    end if;
end process;
Q <= count;
end Behavioral;