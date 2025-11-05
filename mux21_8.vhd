library ieee;
use ieee.std_logic_1164.all;
 
entity mux21_8 is
PORT( d0:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		d1:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		sel : IN std_logic;
		data_out:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
      
end mux21_8;
 
architecture Behavior of mux21_8 is
 
BEGIN

 

data_out<= d0 when (sel = '0') else
           d1 when (sel = '1') ;
			 

end Behavior;
