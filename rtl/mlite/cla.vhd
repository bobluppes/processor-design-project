library ieee;
use ieee.std_logic_1164.all;
 
entity cla is
    generic (
        WIDTH: integer
    );
    port (
        i_add1  : in std_logic_vector(WIDTH-1 downto 0);
        i_add2  : in std_logic_vector(WIDTH-1 downto 0);
        mode    : in std_logic;
        o_result   : out std_logic_vector(WIDTH downto 0)
    );
end cla;
 
 
architecture rtl of cla is
 
  component full_adder is
    port (
      i_bit1  : in  std_logic;
      i_bit2  : in  std_logic;
      i_carry : in  std_logic;
      o_sum   : out std_logic;
      o_carry : out std_logic);
  end component full_adder;
 
  signal w_G : std_logic_vector(WIDTH-1 downto 0); -- Generate
  signal w_P : std_logic_vector(WIDTH-1 downto 0); -- Propagate
  signal w_C : std_logic_vector(WIDTH downto 0);   -- Carry
 
  signal w_SUM  : std_logic_vector(WIDTH-1 downto 0);

  signal bb : std_logic_vector(WIDTH-1 downto 0);
 
begin

  bb <= i_add2 when mode = '1' else (not i_add2);
  w_C(0) <= '0' when mode = '1' else '1';
 
  -- Create the Full Adders
  GEN_FULL_ADDERS : for ii in 0 to WIDTH-1 generate
    FULL_ADDER_INST : full_adder
      port map (
        i_bit1  => i_add1(ii),
        i_bit2  => bb(ii),
        i_carry => w_C(ii),        
        o_sum   => w_SUM(ii),
        o_carry => open
        );
  end generate GEN_FULL_ADDERS;
 
  -- Create the Generate (G) Terms:  Gi=Ai*Bi
  -- Create the Propagate Terms: Pi=Ai+Bi
  -- Create the Carry Terms:  
  GEN_CLA : for jj in 0 to WIDTH-1 generate
    w_G(jj)   <= i_add1(jj) and bb(jj);
    w_P(jj)   <= i_add1(jj) or bb(jj);
    w_C(jj+1) <= w_G(jj) or (w_P(jj) and w_C(jj));
  end generate GEN_CLA;
 
  o_result(WIDTH) <= w_C(WIDTH) xnor mode;
  o_result(WIDTH-1 downto 0) <= w_SUM;
   
end rtl;