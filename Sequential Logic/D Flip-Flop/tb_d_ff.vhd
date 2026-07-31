library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_ff is
end tb_d_ff;

architecture Behavioral of tb_d_ff is
    component d_ff
        Port ( Clk : in STD_LOGIC;
               Rst : in STD_LOGIC;
               D   : in STD_LOGIC;
               Q   : out STD_LOGIC);
    end component;

    signal tb_Clk : STD_LOGIC := '0';
    signal tb_Rst : STD_LOGIC := '0';
    signal tb_D   : STD_LOGIC := '0';
    signal tb_Q   : STD_LOGIC;

begin
    uut: d_ff Port Map (Clk => tb_Clk, Rst => tb_Rst, D => tb_D, Q => tb_Q);

    -- Clock process (10 ns period)
    clk_process : process
    begin
        tb_Clk <= '0'; wait for 5 ns;
        tb_Clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        tb_Rst <= '1'; wait for 10 ns;
        tb_Rst <= '0';
        
        tb_D <= '1'; wait for 10 ns;
        tb_D <= '0'; wait for 10 ns;
        tb_D <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;