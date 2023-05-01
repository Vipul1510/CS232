-- Implementing testcases for 8 bit ripple carry adder in vhdl :)

library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
end entity;

architecture tb of Testbench is

    signal x :std_logic_vector(7 downto 0);
    signal y :std_logic_vector(7 downto 0);
    signal sum_ans :std_logic_vector(7 downto 0);
    signal carry :std_logic;

    component RCA8 is
        port(a, b: in std_logic_vector(7 downto 0);
        sum: out std_logic_vector(7 downto 0);
        cout: out std_logic);
        end component;

begin
    dut_instance: RCA8
    port map(a=>x,b=>y,sum=>sum_ans,cout=>carry);

    process 
    begin
        -- Final output carry is zero in this case
        x <= "00010101";
        y <= "00010111";
        wait for 2 ns;

        -- Final output carry is non-zero(one) in this case
        x <= "11110101";
        y <= "11101110";
        wait for 2 ns;

        end process;

end architecture;
