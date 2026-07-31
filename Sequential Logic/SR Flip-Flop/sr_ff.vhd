library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_ff is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           S   : in STD_LOGIC;
           R   : in STD_LOGIC;
           Q   : out STD_LOGIC);
end sr_ff;

architecture Behavioral of sr_ff is
    signal temp: STD_LOGIC := '0';
begin
process(Clk, Rst)
begin
    if (Rst = '1') then
        temp <= '0';
    elsif rising_edge(Clk) then
        if (S = '0' and R = '0') then
            temp <= temp;
        elsif (S = '0' and R = '1') then
            temp <= '0';
        elsif (S = '1' and R = '0') then
            temp <= '1';
        else
            temp <= 'X'; -- Invalid condition
        end if;
    end if;
end process;
Q <= temp;
end Behavioral;