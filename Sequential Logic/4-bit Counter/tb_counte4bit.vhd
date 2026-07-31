library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_counter4bit is
end tb_counter4bit;

architecture Behavioral of tb_counter4bit is
    component counter4bit
        Port ( Clk : in STD_LOGIC;
               Rst : in STD_LOGIC;
               Q   : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal tb_Clk : STD_LOGIC := '0';
    signal tb_Rst : STD_LOGIC := '0';
    signal tb_Q   : STD_LOGIC_VECTOR (3 downto 0);

begin
    uut: counter4bit Port Map (Clk => tb_Clk, Rst => tb_Rst, Q => tb_Q);

    clk_process : process
    begin
        tb_Clk <= '0'; wait for 5 ns;
        tb_Clk <= '1'; wait for 5 ns;
    end process;

    stim_proc: process
    begin
        tb_Rst <= '1'; wait for 10 ns;
        tb_Rst <= '0'; wait for 160 ns; -- Let it count 0 to 15
        wait;
    end process;
end Behavioral;