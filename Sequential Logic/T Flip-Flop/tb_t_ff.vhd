library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_t_ff is
end tb_t_ff;

architecture Behavioral of tb_t_ff is
    component t_ff
        Port ( Clk : in STD_LOGIC;
               Rst : in STD_LOGIC;
               T   : in STD_LOGIC;
               Q   : out STD_LOGIC);
    end component;

    signal tb_Clk : STD_LOGIC := '0';
    signal tb_Rst : STD_LOGIC := '0';
    signal tb_T   : STD_LOGIC := '0';
    signal tb_Q   : STD_LOGIC;

begin
    uut: t_ff Port Map (Clk => tb_Clk, Rst => tb_Rst, T => tb_T, Q => tb_Q);

    clk_process : process
    begin
        tb_Clk <= '0'; wait for 5 ns;
        tb_Clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        tb_Rst <= '1'; wait for 10 ns;
        tb_Rst <= '0';

        tb_T <= '1'; wait for 30 ns; -- Toggle repeatedly
        tb_T <= '0'; wait for 20 ns; -- Hold
        wait;
    end process;
end Behavioral;