library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- write the Flipflops packege declaration
entity Register_file is
port (A1, A2, A3: in std_logic_vector(2 downto 0 );
D3:in std_logic_vector(15 downto 0);
PC:out std_logic_vector(15 downto 0):=(others=>'0');
clock,Write_Enable:in std_logic;
D1, D2:out std_logic_vector(15 downto 0));
end entity Register_file;

architecture struct of Register_File is
    type mem_word   is array (0 to 7) of std_logic_vector(15 downto 0);
    signal Data : mem_word :=("0000000000000001","0000000000000110","0000000000000110","0000000000000011",others=>(others=>'0'));

begin
---Instruction

-----------------------------------------ARRAY of Registers--------------------------------------
write_process : process(A3,D3,clock) 

  begin
  if (clock'event and (clock='1')) then
    if(Write_Enable='1') then  
      Data(To_integer(unsigned(A3)))<= D3;
	 end if;
  end if;
end process;
------------------------------------- Read A1 D1---------------------------
read_process : process(A1, A2)
	
begin
	PC(15 downto 0) <=Data(7);
  D1 <= Data(To_integer(unsigned(A1)));
  D2 <= Data(To_integer(unsigned(A2)));
  ----------------------------------------------------------------------
end process;
end struct;