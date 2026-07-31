library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipo_shift is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Pi  : in STD_LOGIC_VECTOR (3 downto 0);
           Po  : out STD_LOGIC_VECTOR (3 downto 0));
end pipo_shift;

architecture Behavioral of pipo_shift is
begin
process(Clk, Rst)
begin
    if (Rst = '1') then
        Po <= "0000";
    elsif rising_edge(Clk) then
        Po <= Pi;
    end if;
end process;
end Behavioral;