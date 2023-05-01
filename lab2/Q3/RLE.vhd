-- The main idea of the code is as follows:
-- 1. Taking all inputs in an array at every positive transition of clock
-- 2. After taking all inputs giving input as "00000000" (a msg to stop taking inputs) which stops the process of giving inputs.
-- 3. After input as "00000000" output array is created based on constraints given in question in 1 clock time.
-- 4. After that at every positive transition of clock, output is given. 

-- Used same libraries as that of in RLE_test.vhd and only 'use ieee.numeric_std.all' is added extra which is used to convert decimal number to 8 bits binary number.

library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

entity RLE_Encoder is
    port(clk, rst: in std_logic;
    a: in std_logic_vector(7 downto 0);
    data_valid: out std_logic;
    z: out std_logic_vector(7 downto 0));
end entity;

architecture behaviour of RLE_Encoder is
    type buffers is array (0 to 200) of std_logic_vector(7 downto 0);
    CONSTANT ESC:std_logic_vector(7 downto 0) := "00011011" ;
    signal input_array : buffers;           -- It is an array and stores all inputs
    signal output_array : buffers;          -- It stores all outputs and gives them out one by one at the end
    signal output_process_bool : std_logic := '0';      -- It is a bool which keeps track of when to start giving output
    signal input_count :integer :=0;        -- It gives number of inputs in the input array at any given time 
    signal final_output_count: integer:=0;  -- It stores number of outputs printed in out.txt
begin
    process(clk)
    variable repetitions:integer :=1;       -- It stores number of times the current element repeated consecutively
    variable output_count: integer :=0;     -- It stores number of elements in output array at given time
    variable counter: integer :=1;          -- It is used traverse inside the input array
    begin
        if RISING_EDGE(clk) then
            -- Storing input in input array and increasing count of inputs taken
            if a /= "00000000" then
                input_array(input_count) <= a;
                input_count <= input_count +1;
                data_valid <='0';
            -- Processing input and adding outputs in output array according to their sequence
            elsif output_process_bool='0' then
                while  input_count > counter loop
                    if input_array(counter-1)=input_array(counter) then
                        repetitions := repetitions +1;
                        if repetitions=16 then
                            output_array(output_count)<= ESC;
                            output_array(output_count+1)<=std_logic_vector(to_unsigned(repetitions-1, 8));
                            output_array(output_count+2)<=input_array(counter-1);
                            output_count := output_count + 3;
                            repetitions :=1; 
                        end if;
                    else
                        -- Two cases : 1) If byte represents 'ESC'
                        --             2) If byte does not represents 'ESC'
                        if input_array(counter-1)=ESC then
                            output_array(output_count)<= ESC;
                            output_array(output_count+1)<=std_logic_vector(to_unsigned(repetitions, 8));
                            output_array(output_count+2)<=input_array(counter-1);
                            output_count := output_count + 3;
                        else
                            if repetitions =2 then
                                output_array(output_count)<=input_array(counter-1);
                                output_array(output_count+1)<=input_array(counter-1);
                                output_count := output_count +2;
                            elsif repetitions >2 then
                                output_array(output_count)<= ESC;
                                output_array(output_count+1)<=std_logic_vector(to_unsigned(repetitions, 8));
                                output_array(output_count+2)<=input_array(counter-1);
                                output_count := output_count + 3;
                            else 
                                output_array(output_count)<=input_array(counter-1);
                                output_count := output_count +1;
                            end if ;
                        end if;
                        repetitions := 1;
                    end if;   
                    counter := counter +1; 
                end loop;
                -- Dealing with last input :)
                -- Two cases : 1) If byte represents 'ESC'
                --             2) If byte does not represents 'ESC'
                if input_array(counter-1)=ESC then
                        output_array(output_count)<= ESC;
                        output_array(output_count+1)<=std_logic_vector(to_unsigned(repetitions, 8));
                        output_array(output_count+2)<=input_array(counter-1);
                        output_count := output_count + 3;
                else
                    if repetitions =2 then
                        output_array(output_count)<=input_array(counter-1);
                        output_array(output_count+1)<=input_array(counter-1);
                        output_count := output_count +2;
                    elsif repetitions >2 then
                        output_array(output_count)<= ESC;
                        output_array(output_count+1)<=std_logic_vector(to_unsigned(repetitions, 8));
                        output_array(output_count+2)<=input_array(counter-1);
                        output_count := output_count + 3;
                    else 
                        output_array(output_count)<=input_array(counter-1);
                        output_count := output_count +1;
                    end if ;
                end if;
                output_process_bool <= '1';
                data_valid <='0';
            -- Sending output one by one at every positive transition of clock after finishing output sending 00000000 as output to stop the process
            else
                if final_output_count < output_count then
                    z<= output_array(final_output_count);
                    final_output_count <= final_output_count +1;
                    data_valid <='1';
                else 
                    z<="00000000";
                end if;
            end if;
        end if;        
    end process;
end architecture;