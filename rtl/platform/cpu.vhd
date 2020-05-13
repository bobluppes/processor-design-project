library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.mlite_pack.all;
use work.cpu_pack.all;

entity cpu is
    generic(
        -- mlite params
        shifter_type         : string  := default_shifter_type;              -- "DEFAULT" or "AREA_OPTIMIZED"
        alu_type             : string  := default_alu_type;                  -- "DEFAULT" or "AREA_OPTIMIZED"
        mult_type            : string  := default_mult_type;                 -- "DEFAULT" or "AREA_OPTIMIZED"
        -- cache params
        cache_enable         : string  := default_cache_enable;              -- 'True' - cache enabled; 'False' - no cache
        cache_way_width      : integer := default_cache_way_width;           -- # blocks per cache line; associativity = 2^cache_way_width
        cache_index_width    : integer := default_cache_index_width;         -- # of cache lines = 2^cache_index_width
        cache_offset_width   : integer := default_cache_offset_width;        -- # of bytes per block = 2^cache_offset_width
        cache_address_width  : integer := default_cache_address_width;       -- address width for cacheable range
        cache_replace_policy : string  := default_cache_replace_policy       -- replacement policy when cache miss: "RR"
    );                  
    port(
        aclk                 : in std_logic;
        aresetn              : in std_logic;
        -- master AXI4-full write
        axi_awid             : out std_logic_vector( 0 downto 0);
        axi_awaddr           : out std_logic_vector(31 downto 0);
        axi_awlen            : out std_logic_vector( 7 downto 0);
        axi_awsize           : out std_logic_vector( 2 downto 0);
        axi_awburst          : out std_logic_vector( 1 downto 0);
        axi_awlock           : out std_logic;
        axi_awcache          : out std_logic_vector( 3 downto 0);
        axi_awprot           : out std_logic_vector( 2 downto 0);
        axi_awqos            : out std_logic_vector( 3 downto 0);
        axi_awregion         : out std_logic_vector( 3 downto 0);
        axi_awvalid          : out std_logic;
        axi_awready          : in  std_logic;
        axi_wdata            : out std_logic_vector(31 downto 0);
        axi_wstrb            : out std_logic_vector( 3 downto 0);
        axi_wlast            : out std_logic;
        axi_wvalid           : out std_logic;
        axi_wready           : in  std_logic;
        axi_bid              : in  std_logic_vector( 0 downto 0);
        axi_bresp            : in  std_logic_vector( 1 downto 0);
        axi_bvalid           : in  std_logic;
        axi_bready           : out std_logic;
        -- master AXI4-full read 
        axi_arid             : out std_logic_vector( 0 downto 0);
        axi_araddr           : out std_logic_vector(31 downto 0);
        axi_arlen            : out std_logic_vector( 7 downto 0);
        axi_arsize           : out std_logic_vector( 2 downto 0);
        axi_arburst          : out std_logic_vector( 1 downto 0);
        axi_arlock           : out std_logic;
        axi_arcache          : out std_logic_vector( 3 downto 0);
        axi_arprot           : out std_logic_vector( 2 downto 0);
        axi_arqos            : out std_logic_vector( 3 downto 0);
        axi_arregion         : out std_logic_vector( 3 downto 0);
        axi_arvalid          : out std_logic;
        axi_arready          : in  std_logic;
        axi_rid              : in  std_logic_vector( 0 downto 0);
        axi_rdata            : in  std_logic_vector(31 downto 0);
        axi_rresp            : in  std_logic_vector( 1 downto 0);
        axi_rlast            : in  std_logic;
        axi_rvalid           : in  std_logic;
        axi_rready           : out std_logic;
        -- mlite
        uart_tx_cpu_pause    : in std_logic            -- interrupt cpu when UART is writing
    );
end cpu;

architecture Behavioral of cpu is
    -- Components declarations
    component cache_cntrl is
        generic (
            -- cpu params
            cpu_addr_width       : integer := 32;
            cpu_data_width       : integer := 32;
            -- cache params       
            cache_way_width      : integer := 1;            -- # blocks per cache line; associativity = 2^cache_way_width
            cache_index_width    : integer := 4;            -- # of cache lines = 2^cache_index_width
            cache_offset_width   : integer := 5;            -- # of bytes per block = 2^cache_offset_width
            cache_address_width  : integer := 16;           -- address width for cacheable range
            cache_replace_policy : string := "RR"           -- replacement policy when cache miss: "RR"
        ); 
        port ( 
            aclk             : in  std_logic;
            aresetn          : in  std_logic;
            cpu_next_address : in  std_logic_vector(cpu_addr_width-1 downto 0);
            cpu_wr_data      : in  std_logic_vector(cpu_data_width-1 downto 0);
            cpu_wr_byte_en   : in  std_logic_vector(cpu_data_width/8-1 downto 0);
            cpu_rd_data      : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
            cpu_pause        : out std_logic;
            mem_wr_en        : out std_logic;
            mem_wr_addr      : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
            mem_wr_data      : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
            mem_wr_byte_en   : out std_logic_vector(cpu_data_width/8-1 downto 0) := (others=>'0');
            mem_wr_ready     : in  std_logic;
            mem_wr_valid     : out std_logic;
            mem_rd_en        : out std_logic;
            mem_rd_addr      : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
            mem_rd_data      : in  std_logic_vector(cpu_data_width-1 downto 0);
            mem_rd_ready     : out std_logic;
            mem_rd_valid     : in  std_logic;
            mem_cache_line   : out std_logic
        ); 
    end component;

    component mem_cntrl is
        generic (
            cpu_addr_width : integer := 32;
            cpu_data_width : integer := 32
        );
        port (
            aclk              : in  std_logic;
            aresetn           : in  std_logic;
            cpu_address       : in  std_logic_vector(cpu_addr_width-1 downto 0);
            cpu_in_data       : in  std_logic_vector(cpu_data_width-1 downto 0);
            cpu_out_data      : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
            cpu_strobe        : in  std_logic_vector(cpu_data_width/8-1 downto 0);
            cpu_pause         : out std_logic;
            mem_cache_line    : out std_logic;
            mem_in_en         : out std_logic;
            mem_in_addr       : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
            mem_in_data       : in  std_logic_vector(cpu_data_width-1 downto 0);
            mem_in_ready      : out std_logic;
            mem_in_valid      : in  std_logic;
            mem_out_en        : out std_logic := '0';
            mem_out_addr      : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
            mem_out_data      : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
            mem_out_strobe    : out std_logic_vector(cpu_data_width/8-1 downto 0) := (others=>'0');
            mem_out_ready     : in  std_logic;
            mem_out_valid     : out std_logic
        );
    end component;

    component cpu_axi_rd_cntrl is
        generic (
            cpu_addr_width     : integer := 32;
            cpu_data_width     : integer := 32;
            cache_offset_width : integer := 4
        );
        port(
            aclk               : in  std_logic;
            aresetn            : in  std_logic;
            mem_rd_en          : in  std_logic;
            mem_rd_addr        : in  std_logic_vector(cpu_addr_width-1 downto 0);
            mem_rd_data        : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
            mem_rd_ready       : in  std_logic;
            mem_rd_valid       : out std_logic;
            mem_cache_line     : in  std_logic;
            axi_arid           : out std_logic_vector(-1 downto 0);
            axi_araddr         : out std_logic_vector(cpu_addr_width-1 downto 0);
            axi_arlen          : out std_logic_vector(7 downto 0);
            axi_arsize         : out std_logic_vector(2 downto 0);
            axi_arburst        : out std_logic_vector(1 downto 0);
            axi_arlock         : out std_logic;
            axi_arcache        : out std_logic_vector(3 downto 0);
            axi_arprot         : out std_logic_vector(2 downto 0);
            axi_arqos          : out std_logic_vector(3 downto 0);
            axi_arregion       : out std_logic_vector(3 downto 0);
            axi_aruser         : out std_logic_vector(0 downto 0);
            axi_arvalid        : out std_logic;
            axi_arready        : in  std_logic;
            axi_rid            : in  std_logic_vector(-1 downto 0);
            axi_rdata          : in  std_logic_vector(cpu_data_width-1 downto 0);
            axi_rresp          : in  std_logic_vector(1 downto 0);
            axi_rlast          : in  std_logic;
            axi_ruser          : in  std_logic_vector(0 downto 0);
            axi_rvalid         : in  std_logic;
            axi_rready         : out std_logic
        );
    end component;

    component cpu_axi_wr_cntrl is
        generic(
            cpu_addr_width     : integer := 32;
            cpu_data_width     : integer := 32;
            cache_offset_width : integer := 4
        );
        port(
            aclk               : in  std_logic;
            aresetn            : in  std_logic;
            mem_wr_en          : in  std_logic;
            mem_wr_addr        : in  std_logic_vector(cpu_addr_width-1 downto 0);
            mem_wr_data        : in  std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
            mem_wr_strobe      : in  std_logic_vector(cpu_data_width/8-1 downto 0);
            mem_wr_ready       : out std_logic;
            mem_wr_valid       : in  std_logic;
            mem_cache_line     : in  std_logic;
            axi_awid           : out std_logic_vector(-1 downto 0);
            axi_awaddr         : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
            axi_awlen          : out std_logic_vector(7 downto 0);
            axi_awsize         : out std_logic_vector(2 downto 0);
            axi_awburst        : out std_logic_vector(1 downto 0);
            axi_awlock         : out std_logic;
            axi_awcache        : out std_logic_vector(3 downto 0);
            axi_awprot         : out std_logic_vector(2 downto 0);
            axi_awqos          : out std_logic_vector(3 downto 0);
            axi_awregion       : out std_logic_vector(3 downto 0);
            axi_awuser         : out std_logic_vector(0 downto 0);
            axi_awvalid        : out std_logic;
            axi_awready        : in  std_logic;
            axi_wdata          : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
            axi_wstrb          : out std_logic_vector(cpu_data_width/8-1 downto 0) := (others=>'0');
            axi_wlast          : out std_logic := '0';
            axi_wuser          : out std_logic_vector(0 downto 0);
            axi_wvalid         : out std_logic;
            axi_wready         : in  std_logic;
            axi_bid            : in  std_logic_vector(-1 downto 0);
            axi_bresp          : in  std_logic_vector(1 downto 0);
            axi_buser          : in  std_logic_vector(0 downto 0);
            axi_bvalid         : in  std_logic;
            axi_bready         : out std_logic
        );
    end component;

    -- cpu signals
    constant cpu_width             : integer := 32;
    constant cpu_memory_type       : string  := "DUAL_PORT_";
    constant cpu_pipeline_stages   : natural := 3;
    signal cpu_write_data          : std_logic_vector(cpu_width-1 downto 0);
    signal cpu_read_data           : std_logic_vector(cpu_width-1 downto 0);
    signal cpu_address_next        : std_logic_vector(cpu_width-1 downto 0);
    signal cpu_strobe_next         : std_logic_vector(cpu_width/8-1 downto 0);
    signal cpu_pause               : std_logic;
    signal mlite_cpu_pause         : std_logic;
    signal cpu_address             : std_logic_vector(cpu_width-1 downto 0);
    signal read_data_mem           : std_logic_vector(cpu_width-1 downto 0);
    signal irq_status              : std_logic_vector(3 downto 0);
    signal cpu_strobe              : std_logic_vector(cpu_width/8-1 downto 0);  
    signal counter_reg             : std_logic_vector(39 downto  0);
    signal counter_hi_reg          : std_logic_vector(39 downto 32);
    signal opcode_debug            : std_logic_vector(31 downto 0);
    attribute keep                 : boolean;
    attribute keep of opcode_debug : signal is true;

    -- cache signals
    signal mem_cache_line          : std_logic;

    -- memory signals
    signal mem_in_address          : std_logic_vector(cpu_width-1 downto 0);
    signal mem_in_data             : std_logic_vector(cpu_width-1 downto 0);
    signal mem_in_enable           : std_logic;
    signal mem_in_valid            : std_logic;
    signal mem_in_ready            : std_logic;
    signal mem_out_address         : std_logic_vector(cpu_width-1 downto 0);
    signal mem_out_data            : std_logic_vector(cpu_width-1 downto 0);
    signal mem_out_strobe          : std_logic_vector(cpu_width/8-1 downto 0);
    signal mem_out_enable          : std_logic;
    signal mem_out_valid           : std_logic;
    signal mem_out_ready           : std_logic;
    signal axi_awid_UNCONNECTED    : std_logic_vector(-1 downto 0);
    signal axi_bid_UNCONNECTED     : std_logic_vector(-1 downto 0);
    signal axi_arid_UNCONNECTED    : std_logic_vector(-1 downto 0);
    signal axi_rid_UNCONNECTED     : std_logic_vector(-1 downto 0);
begin
    cpu_address_next(1 downto 0) <= "00";
    cpu_address(1 downto 0)      <= "00";

    mlite_cpu_pause <= cpu_pause OR uart_tx_cpu_pause;

    irq_status(3 downto 0) <= "00" & not uart_tx_cpu_pause & '0';

    cpu_read_data <= ZERO(31 downto 4) & irq_status             when cpu_address = X"20000020" else
                     counter_reg(31 downto  0)                  when cpu_address = X"20000068" else
                     X"000000" & counter_hi_reg(39 downto 32)   when cpu_address = X"20000060" else
                     read_data_mem;

    -- Counting the cpu execution cycles
    counters_proc: process(aclk, aresetn, cpu_address)
        variable  save_cnt_hi : boolean;
    begin
        save_cnt_hi := false;

        if (cpu_address = X"20000068") then                    
            save_cnt_hi := true;
        end if;

        if (aresetn = '0') then
            counter_reg    <= (others => '0');
            counter_hi_reg <= (others => '0');
        elsif rising_edge(aclk) then
            counter_reg <= bv_inc(counter_reg);
            if (save_cnt_hi = true ) then 
                counter_hi_reg <= counter_reg(39 downto 32);
            end if;
        end if;
    end process;

    -- instantiate mlite core
    mlite_cpu_inst: mlite_cpu 
        generic map (
            memory_type     => cpu_memory_type,
            mult_type       => mult_type,
            shifter_type    => shifter_type,
            alu_type        => alu_type,
            pipeline_stages => cpu_pipeline_stages
        )
        port map (
            clk             => aclk,
            reset_in        => "not" (aresetn),
            intr_in         => '0',
            address_next    => cpu_address_next(cpu_width-1 downto 2),
            byte_we_next    => cpu_strobe_next,
            address         => cpu_address(cpu_width-1 downto 2),
            byte_we         => cpu_strobe,
            data_w          => cpu_write_data,
            data_r          => cpu_read_data,
            mem_pause       => mlite_cpu_pause,
            opcode_debug    => opcode_debug
        );

    -- if cache is enabled, instantiate cache controller
    gen_cache :
    if cache_enable="True" generate
        cache_cntrl_inst : cache_cntrl 
            generic map (
                cpu_addr_width       => cpu_width,
                cpu_data_width       => cpu_width,
                cache_way_width      => cache_way_width,
                cache_index_width    => cache_index_width,
                cache_offset_width   => cache_offset_width,
                cache_address_width  => cache_address_width,
                cache_replace_policy => cache_replace_policy
            ) 
            port map ( 
                aclk                 => aclk,
                aresetn              => aresetn,
                cpu_next_address     => cpu_address_next,
                cpu_wr_data          => cpu_write_data,
                cpu_wr_byte_en       => cpu_strobe_next,
                cpu_rd_data          => read_data_mem,
                cpu_pause            => cpu_pause,
                mem_wr_en            => mem_out_enable,
                mem_wr_addr          => mem_out_address,
                mem_wr_data          => mem_out_data,
                mem_wr_byte_en       => mem_out_strobe,
                mem_wr_ready         => mem_out_ready,
                mem_wr_valid         => mem_out_valid,
                mem_rd_en            => mem_in_enable,
                mem_rd_addr          => mem_in_address,
                mem_rd_data          => mem_in_data,
                mem_rd_ready         => mem_in_ready,
                mem_rd_valid         => mem_in_valid,
                mem_cache_line       => mem_cache_line
            ); 
    end generate;

    -- if cache is disabled, instantiate memory controller
    gen_no_cache :
    if cache_enable="False" generate
        mem_cntrl_inst : mem_cntrl 
            generic map (
                cpu_addr_width => cpu_width,
                cpu_data_width => cpu_width
            )
            port map (
                aclk           => aclk,
                aresetn        => aresetn,
                cpu_address    => cpu_address_next,
                cpu_in_data    => cpu_write_data,
                cpu_out_data   => read_data_mem,
                cpu_strobe     => cpu_strobe_next,
                cpu_pause      => cpu_pause,
                mem_cache_line => mem_cache_line,
                mem_in_en      => mem_in_enable,
                mem_in_addr    => mem_in_address,
                mem_in_data    => mem_in_data,
                mem_in_ready   => mem_in_ready,
                mem_in_valid   => mem_in_valid,
                mem_out_en     => mem_out_enable,
                mem_out_addr   => mem_out_address,
                mem_out_data   => mem_out_data,
                mem_out_strobe => mem_out_strobe,
                mem_out_ready  => mem_out_ready,
                mem_out_valid  => mem_out_valid
            );
    end generate;

    -- instantiate cpu axi write controller
    cpu_axi_wr_cntrl_inst : cpu_axi_wr_cntrl 
        generic map (
            cpu_addr_width     => cpu_width,
            cpu_data_width     => cpu_width,
            cache_offset_width => cache_offset_width
        )
        port map (
            aclk               => aclk,
            aresetn            => aresetn,
            mem_wr_en          => mem_out_enable,
            mem_wr_addr        => mem_out_address,
            mem_wr_data        => mem_out_data,
            mem_wr_strobe      => mem_out_strobe,
            mem_wr_ready       => mem_out_ready,
            mem_wr_valid       => mem_out_valid,
            mem_cache_line     => mem_cache_line,
            axi_awid           => axi_awid_UNCONNECTED,
            axi_awaddr         => axi_awaddr,
            axi_awlen          => axi_awlen,
            axi_awsize         => axi_awsize,
            axi_awburst        => axi_awburst,
            axi_awlock         => axi_awlock,
            axi_awcache        => axi_awcache,
            axi_awprot         => axi_awprot,
            axi_awqos          => axi_awqos,
            axi_awregion       => axi_awregion,
            axi_awuser         => open,
            axi_awvalid        => axi_awvalid,
            axi_awready        => axi_awready,
            axi_wdata          => axi_wdata,
            axi_wstrb          => axi_wstrb,
            axi_wlast          => axi_wlast,
            axi_wuser          => open,
            axi_wvalid         => axi_wvalid,
            axi_wready         => axi_wready,
            axi_bid            => axi_bid_UNCONNECTED,
            axi_bresp          => axi_bresp,
            axi_buser          => (others => '0'),
            axi_bvalid         => axi_bvalid,
            axi_bready         => axi_bready
        );

    -- instantiate cpu axi read controller
    cpu_axi_rd_cntrl_inst : cpu_axi_rd_cntrl 
        generic map (
            cpu_addr_width     => cpu_width,
            cpu_data_width     => cpu_width,
            cache_offset_width => cache_offset_width)
        port map (
            aclk               => aclk,
            aresetn            => aresetn,
            mem_rd_en          => mem_in_enable,
            mem_rd_addr        => mem_in_address,
            mem_rd_data        => mem_in_data,
            mem_rd_ready       => mem_in_ready,
            mem_rd_valid       => mem_in_valid,
            mem_cache_line     => mem_cache_line,
            axi_arid           => axi_arid_UNCONNECTED,
            axi_araddr         => axi_araddr,
            axi_arlen          => axi_arlen,
            axi_arsize         => axi_arsize,
            axi_arburst        => axi_arburst,
            axi_arlock         => axi_arlock,
            axi_arcache        => axi_arcache,
            axi_arprot         => axi_arprot,
            axi_arqos          => axi_arqos,
            axi_arregion       => axi_arregion,
            axi_aruser         => open,
            axi_arvalid        => axi_arvalid,
            axi_arready        => axi_arready,
            axi_rid            => axi_rid_UNCONNECTED,
            axi_rdata          => axi_rdata,
            axi_rresp          => axi_rresp,
            axi_rlast          => axi_rlast,
            axi_ruser          => (others => '0'),
            axi_rvalid         => axi_rvalid,
            axi_rready         => axi_rready
        );
end Behavioral;
