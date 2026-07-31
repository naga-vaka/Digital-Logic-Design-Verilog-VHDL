library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_decoder3x8 is
-- Testbench entities have no ports
end tb_decoder3x8;

architecture Behavioral of tb_decoder3x8 is

    -- Component Declaration for Unit Under Test (UUT)
    component decoder3x8
        Port ( 
            G1    : in  STD_LOGIC;
            G2A_L : in  STD_LOGIC;
            G2B_L : in  STD_LOGIC;
            I     : in  STD_LOGIC_VECTOR (2 downto 0);
            Y     : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Signal Declarations
    signal tb_G1    : STD_LOGIC := '0';
    signal tb_G2A_L : STD_LOGIC := '1';
    signal tb_G2B_L : STD_LOGIC := '1';
    signal tb_I     : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal tb_Y     : STD_LOGIC_VECTOR (7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: decoder3x8 
        Port Map (
            G1    => tb_G1,
            G2A_L => tb_G2A_L,
            G2B_L => tb_G2B_L,
            I     => tb_I,
            Y     => tb_Y
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -------------------------------------------------------------
        -- Test Case 1: Disabled States (Check enable gating)
        -------------------------------------------------------------
        -- G1 = '0' (Disabled)
        tb_G1 <= '0'; tb_G2A_L <= '0'; tb_G2B_L <= '0'; tb_I <= "011";
        wait for 10 ns;

        -- G2A_L = '1' (Disabled)
        tb_G1 <= '1'; tb_G2A_L <= '1'; tb_G2B_L <= '0'; tb_I <= "011";
        wait for 10 ns;

        -- G2B_L = '1' (Disabled)
        tb_G1 <= '1'; tb_G2A_L <= '0'; tb_G2B_L <= '1'; tb_I <= "011";
        wait for 10 ns;

        -------------------------------------------------------------
        -- Test Case 2: Enabled State (G1='1', G2A_L='0', G2B_L='0')
        -- Loop through all input combinations 000 to 111
        -------------------------------------------------------------
        tb_G1    <= '1';
        tb_G2A_L <= '0';
        tb_G2B_L <= '0';

        for i in 0 to 7 loop
            tb_I <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;

        -- End simulation run
        wait;
    end process;

end Behavioral;