library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_siso_shift is
end tb_siso_shift;

architecture Behavioral of tb_siso_shift is
    component siso_shift
        Port ( Clk : in STD_LOGIC;
               Rst : in STD_LOGIC;
               Si  : in STD_LOGIC;
               So  : out STD_LOGIC);
    end component;

    signal tb_Clk : STD_LOGIC := '0';
    signal tb_Rst : STD_LOGIC := '0';
    signal tb_Si  : STD_LOGIC := '0';
    signal tb_So  : STD_LOGIC;

begin
    uut: siso_shift Port Map (Clk => tb_Clk, Rst => tb_Rst, Si => tb_Si, So => tb_So);

    clk_process : process
    begin
        tb_Clk <= '0'; wait for 5 ns;
        tb_Clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        tb_Rst <= '1'; wait for 10 ns;
        tb_Rst <= '0';

        -- Shift in bit pattern '1011'
        tb_Si <= '1'; wait for 10 ns;
        tb_Si <= '0'; wait for 10 ns;
        tb_Si <= '1'; wait for 10 ns;
        tb_Si <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;