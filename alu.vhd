
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
 
entity ALU is
 
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  
    OP  : in  STD_LOGIC_VECTOR(2 downto 0); 
    Result   : out  STD_LOGIC_VECTOR(7 downto 0); 
    Carryout : out std_logic       
    );
end ALU; 
architecture Behavioral of ALU is

signal ALU_Result : std_logic_vector (7 downto 0);
signal tmp: std_logic_vector (8 downto 0);

begin
   process(A,B,op)
 begin
  case(op) is
  when "000" => -- Addition
   ALU_Result <= A + B ; 
  when "001" => -- Subtraction
   ALU_Result <= A - B ;
  when "010" => -- Multiplication
   ALU_Result <= std_logic_vector(	to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),8)) ;
  when "011" => -- Division
   ALU_Result <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),8)) ;
 
  when "100" => -- Logical and 
   ALU_Result <= A and B;
  when "101" => -- Logical or
   ALU_Result <= A or B;
 
  when "110" => -- Greater comparison
   if(A>B) then
    ALU_Result <= x"01" ;
   else
    ALU_Result <= x"00" ;
   end if; 
  when "111" => -- Equal comparison   
   if(A=B) then
    ALU_Result <= x"01" ;
   else
    ALU_Result <= x"00" ;
   end if;
  when others => ALU_Result <= A + B ; 
  end case;
 end process;
 Result <= ALU_Result; -- ALU out
 tmp <= ('0' & A) + ('0' & B);
 Carryout <= tmp(8); -- Carryout flag
end Behavioral;