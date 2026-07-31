library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_demux1x8 is
-- Testbench entities have no ports
end tb_demux1x8;

architecture Behavioral of tb_demux1x8 is

    -- Component Declaration for the Unit Under Test (UUT)
    component demux1x8
        Port ( 
            I : in  STD_LOGIC;
            S : in  STD_LOGIC_VECTOR (2 downto 0);
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Signal Declarations
    signal tb_I : STD_LOGIC := '0';
    signal tb_S : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal tb_Y : STD_LOGIC_VECTOR (7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: demux1x8 
        Port Map (
            I => tb_I,
            S => tb_S,
            Y => tb_Y
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Initial state
        tb_I <= '0';
        tb_S <= "000";
        wait for 10 ns;

        -------------------------------------------------------------
        -- Test Case 1: Drive Input '1' through all select channels
        -------------------------------------------------------------
        tb_I <= '1';
        
        for i in 0 to 7 loop
            tb_S <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;

        -------------------------------------------------------------
        -- Test Case 2: Drive Input '0' through all select channels
        -------------------------------------------------------------
        tb_I <= '0';
        
        for i in 0 to 7 loop
            tb_S <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;

        -- End simulation run
        wait;
    end process;

end Behavioral;