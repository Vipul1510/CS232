-- Implementing 4x2 multiplexer using and, or, not gate
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x2 is
    port(D: in std_logic_vector(3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y: out std_logic);
end entity;

architecture behaviour of mux4x2 is
    signal out1,out2,s0_neg,s1_neg,temp11,temp01,temp10,temp00,temp1,temp2,temp3,temp4,temp5,temp6:std_logic;

    component mux2x1 is
        port(D0: in std_logic;
        D1: in std_logic;
        S: in std_logic;
        Y: out std_logic);
        end component;

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
        port map(x=>S(0),y=>s0_neg);
        N2: NOT_Gate
        port map(x=>S(1),y=>s1_neg);
        X11: AND_Gate
        port map(x1=>S(0),x2=>S(1),y=>temp11);
        X10: AND_Gate
        port map(x1=>s0_neg,x2=>S(1),y=>temp10);
        X01: AND_Gate
        port map(x1=>S(0),x2=>s1_neg,y=>temp01);
        X00: AND_Gate
        port map(x1=>s0_neg,x2=>s1_neg,y=>temp00);
        X4: AND_Gate
        port map(x1=>temp00,x2=>D(0),y=>temp1);
        X3: AND_Gate
        port map(x1=>temp01,x2=>D(1),y=>temp2);
        X2: AND_Gate
        port map(x1=>temp10,x2=>D(2),y=>temp3);
        X1: AND_Gate
        port map(x1=>temp11,x2=>D(3),y=>temp4);
        O1: OR_GAte
        port map(x1=>temp1,x2=>temp2,y=>temp5);
        O2: OR_GAte
        port map(x1=>temp3,x2=>temp4,y=>temp6);
        O3: OR_GAte
        port map(x1=>temp5,x2=>temp6,y=>Y);

end  architecture;
