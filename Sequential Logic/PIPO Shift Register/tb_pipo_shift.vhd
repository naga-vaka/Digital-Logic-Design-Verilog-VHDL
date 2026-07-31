library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pipo_shift is
end tb_pipo_shift;

architecture Behavioral of tb_pipo_shift is
    component pipo_shift
        Port ( Clk : in STD_LOGIC;
               Rst : in STD_LOGIC;
               Pi  : in STD_LOGIC_VECTOR (3 downto 0);
               Po  : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal tb_Clk : STD_LOGIC := '0';
    signal tb_Rst : STD_LOGIC := '0';
    signal tb_Pi  : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal tb_Po  : STD_LOGIC_VECTOR (3 downto 0);

begin
    uut: pipo_shift Port Map (Clk => tb_Clk, Rst => tb_Rst, Pi => tb_Pi, Po => tb_Po);

    clk_process : process
    begin
        tb_Clk <= '0'; wait for 5 ns;
        tb_Clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        tb_Rst <= '1'; wait for 10 ns;
        tb_Rst <= '0';

        tb_Pi <= "1010"; wait for 10 ns;
        tb_Pi <= "1100"; wait for 10 ns;
        tb_Pi <= "0111"; wait for 10 ns;
        wait;
    end process;
end Behavioral;