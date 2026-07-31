library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_encoder8x3 is
-- Testbench has no ports
end tb_encoder8x3;

architecture Behavioral of tb_encoder8x3 is

    -- Component Declaration for the Unit Under Test (UUT)
    component encoder8x3
        Port ( 
            En_l : in  STD_LOGIC;
            I    : in  STD_LOGIC_VECTOR (7 downto 0);
            Y    : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signal Declarations
    signal tb_En_l : STD_LOGIC := '1';
    signal tb_I    : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal tb_Y    : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: encoder8x3
        Port Map (
            En_l => tb_En_l,
            I    => tb_I,
            Y    => tb_Y
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -------------------------------------------------------------
        -- Test Case 1: Disabled state (En_l = '1')
        -------------------------------------------------------------
        tb_En_l <= '1';
        tb_I    <= "00000100"; -- Any input should produce "000" while disabled
        wait for 10 ns;

        -------------------------------------------------------------
        -- Test Case 2: Enabled state (En_l = '0') - One-Hot Inputs
        -------------------------------------------------------------
        tb_En_l <= '0';
        
        -- Loop through one-hot bit positions (2^0 to 2^7)
        for i in 0 to 7 loop
            tb_I <= std_logic_vector(to_unsigned(2**i, 8));
            wait for 10 ns;
        end loop;

        -------------------------------------------------------------
        -- Test Case 3: Invalid / Non-One-Hot Inputs (Fallback check)
        -------------------------------------------------------------
        tb_I <= "00000000"; -- No bit set
        wait for 10 ns;
        
        tb_I <= "00000011"; -- Multiple bits set
        wait for 10 ns;

        -- End simulation run
        wait;
    end process;

end Behavioral;