library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity siso_shift is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Si  : in STD_LOGIC;
           So  : out STD_LOGIC);
end siso_shift;

architecture Behavioral of siso_shift is
    signal shift_reg: STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
process(Clk, Rst)
begin
    if (Rst = '1') then
        shift_reg <= "0000";
    elsif rising_edge(Clk) then
        shift_reg <= shift_reg(2 downto 0) & Si;
    end if;
end process;
So <= shift_reg(3);
end Behavioral;