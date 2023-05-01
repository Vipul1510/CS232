-- Implementing XOR gate in vhdl using AND, OR and NOT gates :)

library IEEE;
use IEEE.std_logic_1164.all;

entity XOR_Gate is
    port(x1: in std_logic;
    x2: in std_logic;
    y: out std_logic);
end entity;

architecture behaviours of XOR_Gate is

    signal temp1,temp2,temp3,temp4:std_logic;

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
        N1: NOT_Gate
        port map(x=>x1,y=>temp1);
        N2: NOT_Gate
        port map(x=>x2,y=>temp2);
        A1: AND_Gate
        port map(x1=>x1,x2=>temp2,y=>temp3);
        A2: AND_Gate
        port map(x1=>x2,x2=>temp1,y=>temp4);
        O1: OR_Gate
        port map(x1=>temp3,x2=>temp4,y=>y);

end architecture;
