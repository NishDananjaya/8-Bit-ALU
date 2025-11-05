Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFF_8 is 
   port(
      D  :	in  std_logic_vector (7 downto 0) ;
      Clk:	in std_logic; 
      RST : in std_logic;
      Q  : 	out std_logic_vector(7 downto 0)  
         
   );
end DFF_8;

architecture Behavioral of DFF_8 is  
begin  
 process(Clk)
 begin 
	if RST='1' THEN
       Q<=(others=>'0');
    elsif(rising_edge(Clk)) then
   Q <= D; 
  
    end if;       
 end process;  
end Behavioral; 