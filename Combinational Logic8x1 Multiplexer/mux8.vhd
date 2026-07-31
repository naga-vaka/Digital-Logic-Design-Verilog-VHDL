

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux8 is
    Port ( 
        I : in  STD_LOGIC_VECTOR (7 downto 0); -- 8-bit input array
        s : in  STD_LOGIC_VECTOR (2 downto 0); -- 3-bit select signal
        y : out STD_LOGIC
    );
end mux8;

architecture Behavioral of mux8 is
begin
process(s)
begin
if (s="000") then y<=I(0);
elsif (s="001") then y<=I(1);
elsif (s="010") then y<=I(2);
elsif (s="011") then y<=I(3);
elsif (s="100") then y<=I(4);
elsif (s="101") then y<=I(5);
elsif (s="110") then y<=I(6);
else y<=I(7);
end if;
end process;


end Behavioral;
