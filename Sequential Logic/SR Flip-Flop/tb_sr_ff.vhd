library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sr_ff is
end tb_sr_ff;

architecture Behavioral of tb_sr_ff is
    component sr_ff
        Port ( Clk : in STD_LOGIC;
               Rst : in STD_LOGIC;
               S   : in STD_LOGIC;
               R   : in STD_LOGIC;
               Q   : out STD_LOGIC);
    end component;

    signal tb_Clk : STD_LOGIC := '0';
    signal tb_Rst : STD_LOGIC := '0';
    signal tb_S   : STD_LOGIC := '0';
    signal tb_R   : STD_LOGIC := '0';
    signal tb_Q   : STD_LOGIC;

begin
    uut: sr_ff Port Map (Clk => tb_Clk, Rst => tb_Rst, S => tb_S, R => tb_R, Q => tb_Q);

    clk_process : process
    begin
        tb_Clk <= '0'; wait for 5 ns;
        tb_Clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        tb_Rst <= '1'; wait for 10 ns;
        tb_Rst <= '0';

        tb_S <= '1'; tb_R <= '0'; wait for 10 ns; -- Set
        tb_S <= '0'; tb_R <= '0'; wait for 10 ns; -- Hold
        tb_S <= '0'; tb_R <= '1'; wait for 10 ns; -- Reset
        wait;
    end process;
end Behavioral;