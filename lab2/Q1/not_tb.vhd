-- Implementing testcases for NOT gate in vhdl
-- Covering 2 testcases :)

library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
end entity;

architecture tb of Testbench is

    signal a: std_logic;
    signal b: std_logic;

    component NOT_Gate is
        port(x: in std_logic;
        y: out std_logic);
        end component;   

begin

    dut_instance: NOT_Gate
    port map(x => a, y =>b);

    process
    begin
        a <= '0';
        wait for 1 ns;

        a <= '1';
        wait for 1 ns;
    end process;

end architecture;
