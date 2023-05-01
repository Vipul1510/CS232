-- -- Implementing FULL ADDER in vhdl using XOR, AND, OR gates :)
library IEEE;
use IEEE.std_logic_1164.all;

entity Fulladder is
port(a, b, c: in std_logic;
sum_adder: out std_logic;
cout_adder: out std_logic);
end entity;

architecture behaviour of Fulladder is

    signal tem1,tem2,tem3:std_logic;

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

    component XOR_Gate is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;

    begin
        X1: XOR_Gate
        port map(x1=>a,x2=>b,y=>tem1);
        X2: XOR_Gate
        port map(x1=>tem1,x2=>c,y=>sum_adder);
        A1: AND_Gate
        port map(x1=>tem1,x2=>c,y=>tem2);
        A2: AND_Gate
        port map(x1=>a,x2=>b,y=>tem3);
        O1: OR_Gate
        port map(x1=>tem2,x2=>tem3,y=>cout_adder);

end architecture;


