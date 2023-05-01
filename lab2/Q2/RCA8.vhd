-- -- Implementing 8 bit Ripple Carry adder in vhdl using component Full adder :)

library IEEE;
use IEEE.std_logic_1164.all;

entity RCA8 is
port(a, b: in std_logic_vector(7 downto 0);
sum: out std_logic_vector(7 downto 0);
cout: out std_logic);
end entity;

architecture behaviours of RCA8 is

    signal c1,c2,c3,c4,c5,c6,c7:std_logic;

    component Fulladder is
        port(a, b, c: in std_logic;
        sum_adder: out std_logic;
        cout_adder: out std_logic);
        end component;

    begin
        FA1: Fulladder
        port map(a=>a(0),b=>b(0),c=>'0',sum_adder=>sum(0),cout_adder=>c1);
        FA2: Fulladder
        port map(a=>a(1),b=>b(1),c=>c1,sum_adder=>sum(1),cout_adder=>c2);
        FA3: Fulladder
        port map(a=>a(2),b=>b(2),c=>c2,sum_adder=>sum(2),cout_adder=>c3);
        FA4: Fulladder
        port map(a=>a(3),b=>b(3),c=>c3,sum_adder=>sum(3),cout_adder=>c4);
        FA5: Fulladder
        port map(a=>a(4),b=>b(4),c=>c4,sum_adder=>sum(4),cout_adder=>c5);
        FA6: Fulladder
        port map(a=>a(5),b=>b(5),c=>c5,sum_adder=>sum(5),cout_adder=>c6);
        FA7: Fulladder
        port map(a=>a(6),b=>b(6),c=>c6,sum_adder=>sum(6),cout_adder=>c7);
        FA8: Fulladder
        port map(a=>a(7),b=>b(7),c=>c7,sum_adder=>sum(7),cout_adder=>cout);
        
end architecture;
