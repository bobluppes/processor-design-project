
                                                                            
                                                                            
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;
 use IEEE.std_logic_unsigned.all;
                                                                            
 entity walltree_mul is
 	  port (
 	 	 a	:	in	std_logic_vector(2 downto 0 );  
 	 	 b	:	in	std_logic_vector(2 downto 0 );  
 	 	 ext1  :   in  std_logic;
 	 	 result_add1	:      out	std_logic_vector(6 downto 0 );   
 	 	 result_add2	:      out	std_logic_vector(6 downto 0 )   
 	       ); 
 end walltree_mul;
                                                                              
                                                                              
                                                                              
 architecture schematic of walltree_mul is
 	 component adder7 is
           port(A,B : in std_logic_vector(6 downto 0) ;
                Cin : in std_logic;
                  Y : out std_logic_vector(7 downto 0) );
           end component;
                                       
 	 signal pp0 : std_logic_vector(2 downto 0 );
 	 signal pp1 : std_logic_vector(2 downto 0 );
 	 signal pp2 : std_logic_vector(2 downto 0 );
                                                                           

 signal sig0_0 : std_logic_vector(6 downto 0):=(others=>'0');
 signal sig0_1 : std_logic_vector(6 downto 0):=(others=>'0');
 signal sig0_2 : std_logic_vector(6 downto 0):=(others=>'0');
 signal temp10 : std_logic_vector(6 downto 0):=(others=>'0'); 

 signal temp11 : std_logic_vector(6 downto 0):=(others=>'0');
 signal temp_11 : std_logic_vector(6 downto 0):=(others=>'0');
 signal temp_1_1 : std_logic_vector(6 downto 0):=(others=>'0');

 signal sig1_0 : std_logic_vector(6 downto 0):=(others=>'0');
 signal sig1_1 : std_logic_vector(6 downto 0):=(others=>'0'); 
 
 signal fa1z : std_logic:='0'; 

 begin                                                                       
                                                                             
  pp0(0) <= a(0) AND b(0);
  pp0(1) <= a(0) AND b(1);
  pp0(2) <= a(0) AND b(2);
  pp1(0) <= a(1) AND b(0);
  pp1(1) <= a(1) AND b(1);
  pp1(2) <= a(1) AND b(2);
  pp2(0) <= a(2) AND b(0);
  pp2(1) <= a(2) AND b(1);
  pp2(2) <= a(2) AND b(2);
                                                                             
 sig0_0(2 downto 0) <= pp0(2 downto 0);
 sig0_0(6) <= ext1 ;
 sig0_0(5) <= ext1 ;
 sig0_0(4) <= ext1 ;
 sig0_0(3) <= ext1 ;
 sig0_1(3 downto 1) <= pp1(2 downto 0);
 sig0_1(0) <= ext1 ;
 sig0_1(6) <= ext1 ;
 sig0_1(5) <= ext1 ;
 sig0_1(4) <= ext1 ;
 sig0_2(4 downto 2) <= pp2(2 downto 0);
 sig0_2(0) <= ext1 ;
 sig0_2(1) <= ext1 ;
 sig0_2(6) <= ext1 ;
 sig0_2(5) <= ext1 ;

 temp10(6) <= sig0_0(6) XOR sig0_1(6); 
 sig1_0(6) <= temp10(6) XOR sig0_2(6); 

 temp10(5) <= sig0_0(5) XOR sig0_1(5); 
 sig1_0(5) <= temp10(5) XOR sig0_2(5); 

 temp10(4) <= sig0_0(4) XOR sig0_1(4); 
 sig1_0(4) <= temp10(4) XOR sig0_2(4); 

 temp10(3) <= sig0_0(3) XOR sig0_1(3); 
 sig1_0(3) <= temp10(3) XOR sig0_2(3); 

 temp10(2) <= sig0_0(2) XOR sig0_1(2); 
 sig1_0(2) <= temp10(2) XOR sig0_2(2); 

 temp10(1) <= sig0_0(1) XOR sig0_1(1); 
 sig1_0(1) <= temp10(1) XOR sig0_2(1); 

 temp10(0) <= sig0_0(0) XOR sig0_1(0); 
 sig1_0(0) <= temp10(0) XOR sig0_2(0); 

 temp11(5) <= sig0_0(5) AND sig0_1(5);
 temp_11(5) <= sig0_0(5) XOR sig0_1(5);
 temp_1_1(5) <= sig0_2(5) AND temp_11(5);
 sig1_1(6) <= temp11(5) OR temp_1_1(5);

 temp11(4) <= sig0_0(4) AND sig0_1(4);
 temp_11(4) <= sig0_0(4) XOR sig0_1(4);
 temp_1_1(4) <= sig0_2(4) AND temp_11(4);
 sig1_1(5) <= temp11(4) OR temp_1_1(4);

 temp11(3) <= sig0_0(3) AND sig0_1(3);
 temp_11(3) <= sig0_0(3) XOR sig0_1(3);
 temp_1_1(3) <= sig0_2(3) AND temp_11(3);
 sig1_1(4) <= temp11(3) OR temp_1_1(3);

 temp11(2) <= sig0_0(2) AND sig0_1(2);
 temp_11(2) <= sig0_0(2) XOR sig0_1(2);
 temp_1_1(2) <= sig0_2(2) AND temp_11(2);
 sig1_1(3) <= temp11(2) OR temp_1_1(2);

 temp11(1) <= sig0_0(1) AND sig0_1(1);
 temp_11(1) <= sig0_0(1) XOR sig0_1(1);
 temp_1_1(1) <= sig0_2(1) AND temp_11(1);
 sig1_1(2) <= temp11(1) OR temp_1_1(1);

 temp11(0) <= sig0_0(0) AND sig0_1(0);
 temp_11(0) <= sig0_0(0) XOR sig0_1(0);
 temp_1_1(0) <= sig0_2(0) AND temp_11(0);
 sig1_1(1) <= temp11(0) OR temp_1_1(0);

 result_add1 <= sig1_0;
 result_add2 <= sig1_1;

 end;