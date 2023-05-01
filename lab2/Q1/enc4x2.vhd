-- Implementing 4x2 encoder in vhdl :)

library IEEE;
use IEEE.std_logic_1164.all;

entity encoder4x2 is
    port(I: in std_logic_vector (3 downto 0);
    Y: out std_logic_vector(1 downto 0));
    end entity;
    
architecture behaviour of encoder4x2 is

    component AND_Gate is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;

    component OR_Gate is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;

    component NOT_Gate is
        port(x: in std_logic;
        y: out std_logic);
    end component; 

    begin
        O1: OR_Gate
        port map(x1=>I(3),x2=>I(2),y=>Y(1));
        O2: OR_Gate
        port map(x1=>I(1),x2=>I(3),y=>Y(0));
        
end architecture;