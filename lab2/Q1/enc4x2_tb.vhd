-- Implementing testcases for 4x2 encoder :)

library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
    end entity;
    
architecture tb of Testbench is

    signal a :std_logic_vector(3 downto 0);
    signal b :std_logic_vector(1 downto 0);

    component encoder4x2 is
        port(I: in std_logic_vector (3 downto 0);
        Y: out std_logic_vector(1 downto 0));
    end component;
 
begin
    dut_instance: encoder4x2
    port map(I => a, Y => b);
    
    process
    begin

        a <= "0001";
        wait for 1 ns;

        a <= "0010";
        wait for 1 ns;
        
        a <= "0100";
        wait for 1 ns;
        
        a <= "1000";
        wait for 1 ns;
        
        end process;

end architecture;
        
        
        