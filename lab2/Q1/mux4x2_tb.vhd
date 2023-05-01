-- 64 testcases for 4x2 mux :)

library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
end entity;

architecture tb of Testbench is
    signal a :std_logic_vector(3 downto 0);
    signal b :std_logic_vector(1 downto 0);
    signal c: std_logic;
    
    component mux4x2 is
        port(D: in std_logic_vector(3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic);
    end component;

begin
    dut_instance: mux4x2
    port map(D => a, S => b, Y =>c);

    process
    begin
        ---0000---
        a <= "0000";
        b <= "00";
        wait for 1 ns;

        a <= "0000";
        b <= "01";
        wait for 1 ns;

        a <= "0000";
        b <= "10";
        wait for 1 ns;

        a <= "0000";
        b <= "11";
        wait for 1 ns;

        ---0001---
        a <= "0001";
        b <= "00";
        wait for 1 ns;

        a <= "0001";
        b <= "01";
        wait for 1 ns;

        a <= "0001";
        b <= "10";
        wait for 1 ns;

        a <= "0001";
        b <= "11";
        wait for 1 ns;

        ---0010---
        a <= "0010";
        b <= "00";
        wait for 1 ns;

        a <= "0010";
        b <= "01";  
        wait for 1 ns;

        a <= "0010";
        b <= "10";
        wait for 1 ns;

        a <= "0010";
        b <= "11";       
        wait for 1 ns;

        ---0011---
        a <= "0011";
        b <= "00";     
        wait for 1 ns;

        a <= "0011";
        b <= "01";
        wait for 1 ns;

        a <= "0011";
        b <= "10";
        wait for 1 ns;

        a <= "0011";
        b <= "11";
        wait for 1 ns;

        ---0100---
        a <= "0100";
        b <= "00";
        wait for 1 ns;

        a <= "0100";
        b <= "01";   
        wait for 1 ns;

        a <= "0100";
        b <= "10";     
        wait for 1 ns;

        a <= "0100";
        b <= "11";    
        wait for 1 ns;

        ---0101---
        a <= "0101";
        b <= "00";
        wait for 1 ns;

        a <= "0101";
        b <= "01";
        wait for 1 ns;

        a <= "0101";
        b <= "10";
        wait for 1 ns;

        a <= "0101";
        b <= "11";
        wait for 1 ns;

        ---0110---
        a <= "0110";
        b <= "00";
        wait for 1 ns;

        a <= "0110";
        b <= "01";   
        wait for 1 ns;

        a <= "0110";
        b <= "10";     
        wait for 1 ns;

        a <= "0110";
        b <= "11";    
        wait for 1 ns;

        ---0111---
        a <= "0111";
        b <= "00";
        wait for 1 ns;

        a <= "0111";
        b <= "01";       
        wait for 1 ns;

        a <= "0111";
        b <= "10";       
        wait for 1 ns;

        a <= "0111";
        b <= "11";
        wait for 1 ns;
        
        ---1000---
        a <= "1000";
        b <= "00";       
        wait for 1 ns;

        a <= "1000";
        b <= "01";      
        wait for 1 ns;

        a <= "1000";
        b <= "10";        
        wait for 1 ns;

        a <= "1000";
        b <= "11";
        wait for 1 ns;

        ---1001---
        a <= "1001";
        b <= "00";     
        wait for 1 ns;

        a <= "1001";
        b <= "01";       
        wait for 1 ns;

        a <= "1001";
        b <= "10";        
        wait for 1 ns;

        a <= "1001";
        b <= "11";
        wait for 1 ns;

        ---1010---
        a <= "1010";
        b <= "00";      
        wait for 1 ns;

        a <= "1010";
        b <= "01";
        wait for 1 ns;

        a <= "1010";
        b <= "10";
        wait for 1 ns;

        a <= "1010";
        b <= "11";
        wait for 1 ns;

        ---1011---
        a <= "1011";
        b <= "00";     
        wait for 1 ns;

        a <= "1011";
        b <= "01";       
        wait for 1 ns;

        a <= "1011";
        b <= "10";       
        wait for 1 ns;

        a <= "1011";
        b <= "11";
        wait for 1 ns;

        ---1100---
        a <= "1100";
        b <= "00";       
        wait for 1 ns;

        a <= "1100";
        b <= "01";       
        wait for 1 ns;

        a <= "1100";
        b <= "10";       
        wait for 1 ns;

        a <= "1100";
        b <= "11";
        wait for 1 ns;

        ---1101--
        a <= "1101";
        b <= "00";
        wait for 1 ns;

        a <= "1101";
        b <= "01";
        wait for 1 ns;

        a <= "1101";
        b <= "10"; 
        wait for 1 ns;

        a <= "1101";
        b <= "11";
        wait for 1 ns;

        ---1110---
        a <= "1110";
        b <= "00";
        wait for 1 ns;

        a <= "1110";
        b <= "01";       
        wait for 1 ns;

        a <= "1110";
        b <= "10";       
        wait for 1 ns;

        a <= "1110";
        b <= "11";
        wait for 1 ns;

        ---1111---
        a <= "1111";
        b <= "00";
        wait for 1 ns;

        a <= "1111";
        b <= "01";
        wait for 1 ns;

        a <= "1111";
        b <= "10"; 
        wait for 1 ns;

        a <= "1111";
        b <= "11";
        wait for 1 ns;
        ---
        end process;

end architecture;