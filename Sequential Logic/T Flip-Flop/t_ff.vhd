library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           T   : in STD_LOGIC;
           Q   : out STD_LOGIC);
end t_ff;

architecture Behavioral of t_ff is
    signal temp: STD_LOGIC := '0';
begin
process(Clk, Rst)
begin
    if (Rst = '1') then
        temp <= '0';
    elsif rising_edge(Clk) then
        if (T = '1') then
            temp <= not temp;
        else
            temp <= temp;
        end if;
    end if;
end process;
Q <= temp;
end Behavioral;