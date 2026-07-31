library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           D   : in STD_LOGIC;
           Q   : out STD_LOGIC);
end d_ff;

architecture Behavioral of d_ff is
begin
process(Clk, Rst)
begin
    if (Rst = '1') then
        Q <= '0';
    elsif rising_edge(Clk) then
        Q <= D;
    end if;
end process;
end Behavioral;