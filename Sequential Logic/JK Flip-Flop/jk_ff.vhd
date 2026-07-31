library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           J   : in STD_LOGIC;
           K   : in STD_LOGIC;
           Q   : out STD_LOGIC);
end jk_ff;

architecture Behavioral of jk_ff is
    signal temp: STD_LOGIC := '0';
begin
process(Clk, Rst)
begin
    if (Rst = '1') then
        temp <= '0';
    elsif rising_edge(Clk) then
        if (J = '0' and K = '0') then
            temp <= temp;
        elsif (J = '0' and K = '1') then
            temp <= '0';
        elsif (J = '1' and K = '0') then
            temp <= '1';
        elsif (J = '1' and K = '1') then
            temp <= not temp;
        end if;
    end if;
end process;
Q <= temp;
end Behavioral;