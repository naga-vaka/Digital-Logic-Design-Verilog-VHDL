library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux8 is
-- Testbench has no ports
end tb_mux8;

architecture Behavioral of tb_mux8 is
    signal I : STD_LOGIC_VECTOR(7 downto 0) := "10101010"; -- Test pattern
    signal s : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal y : STD_LOGIC;
begin
    -- Instantiate Unit Under Test (UUT)
    uut: entity work.mux8
        port map (
            I => I,
            s => s,
            y => y
        );

    -- Stimulus process
    stim_proc: process
    begin
        wait for 20 ns;
        s <= "000"; wait for 20 ns; -- y should be I(0) = '0'
        s <= "001"; wait for 20 ns; -- y should be I(1) = '1'
        s <= "010"; wait for 20 ns; -- y should be I(2) = '0'
        s <= "011"; wait for 20 ns; -- y should be I(3) = '1'
        wait;
    end process;
end Behavioral;