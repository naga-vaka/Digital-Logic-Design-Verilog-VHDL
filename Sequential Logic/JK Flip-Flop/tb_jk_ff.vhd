library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_jk_ff is
end tb_jk_ff;

architecture Behavioral of tb_jk_ff is
    component jk_ff
        Port ( Clk : in STD_LOGIC;
               Rst : in STD_LOGIC;
               J   : in STD_LOGIC;
               K   : in STD_LOGIC;
               Q   : out STD_LOGIC);
    end component;

    signal tb_Clk : STD_LOGIC := '0';
    signal tb_Rst : STD_LOGIC := '0';
    signal tb_J   : STD_LOGIC := '0';
    signal tb_K   : STD_LOGIC := '0';
    signal tb_Q   : STD_LOGIC;

begin
    uut: jk_ff Port Map (Clk => tb_Clk, Rst => tb_Rst, J => tb_J, K => tb_K, Q => tb_Q);

    clk_process : process
    begin
        tb_Clk <= '0'; wait for 5 ns;
        tb_Clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        tb_Rst <= '1'; wait for 10 ns;
        tb_Rst <= '0';

        -- No change (00)
        tb_J <= '0'; tb_K <= '0'; wait for 10 ns;
        -- Set (10)
        tb_J <= '1'; tb_K <= '0'; wait for 10 ns;
        -- Reset (01)
        tb_J <= '0'; tb_K <= '1'; wait for 10 ns;
        -- Toggle (11)
        tb_J <= '1'; tb_K <= '1'; wait for 20 ns;
        wait;
    end process;
end Behavioral;