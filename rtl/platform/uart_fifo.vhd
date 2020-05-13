-------------------------------------------------------------------------------
-- Generic uart_fifo with configurable width and depth
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.uart_pack.all;

entity uart_fifo is
    generic (
        FIFO_WIDTH : positive := 32;
        FIFO_DEPTH : positive := 1024
    );
    port (
        clock      : in  std_logic;
        nreset     : in  std_logic;
        wr_data    : in  std_logic_vector(FIFO_WIDTH-1 downto 0);   -- data to be written
        rd_data    : out std_logic_vector(FIFO_WIDTH-1 downto 0);   -- data to be read
        wr_en      : in  std_logic;                                 -- write enable
        rd_en      : in  std_logic;                                 -- read enable
        full       : out std_logic;                                 -- '1' - uart_fifo full
        empty      : out std_logic;                                 -- '1' - uart_fifo empty
        level      : out std_logic_vector(clogb2(FIFO_DEPTH)-1 downto 0)
    );
end entity;

architecture RTL of uart_fifo is
    ---------------------------------------------------------------------------
    -- Functions
    ---------------------------------------------------------------------------
    function get_fifo_level(
        write_pointer   : unsigned;
        read_pointer    : unsigned;
        depth           : positive
    ) return integer is
    begin
        if write_pointer > read_pointer then
            return to_integer(write_pointer - read_pointer);
        elsif write_pointer = read_pointer then
            return 0;
        else
            return (((depth) - to_integer(read_pointer)) + to_integer(write_pointer));
        end if;
    end function get_fifo_level;

    ---------------------------------------------------------------------------
    -- Types
    ---------------------------------------------------------------------------
    type memory is array (0 to FIFO_DEPTH-1) of std_logic_vector(FIFO_WIDTH-1 downto 0);

    ---------------------------------------------------------------------------
    -- Signals
    ---------------------------------------------------------------------------
    signal fifo_memory   : memory := (others => (others => '0'));
    signal read_pointer  : unsigned(clogb2(FIFO_DEPTH)-1 downto 0) := (others => '0');
    signal write_pointer : unsigned(clogb2(FIFO_DEPTH)-1 downto 0) := (others => '0');
    signal fifo_empty    : std_logic := '1';
    signal fifo_full     : std_logic := '0';

begin
    full    <= fifo_full;
    empty   <= fifo_empty;
    rd_data <= fifo_memory(to_integer(read_pointer));
    ---------------------------------------------------------------------------
    -- Detect if uart_fifo is full or empty
    ---------------------------------------------------------------------------
    FIFO_FLAGS : process(write_pointer, read_pointer) is
        variable level_value : integer range 0 to FIFO_DEPTH - 1;
    begin
        level_value := get_fifo_level(write_pointer, read_pointer, FIFO_DEPTH);
        level <= std_logic_vector(to_unsigned(level_value, level'length));
        if level_value = FIFO_DEPTH - 1 then
            fifo_full <= '1';
        else
            fifo_full <= '0';
        end if;
        if level_value = 0 then
            fifo_empty <= '1';
        else
            fifo_empty <= '0';
        end if;
    end process;
    ---------------------------------------------------------------------------
    -- uart_fifo read and write logic
    ---------------------------------------------------------------------------
    FIFO_LOGIC : process(clock) is
    begin
        if rising_edge(clock) then
            if nreset = '0' then
                write_pointer   <= (others => '0');
                read_pointer    <= (others => '0');
            else
                -- uart_fifo READ
                if rd_en = '1' and fifo_empty = '0' then
                    if read_pointer < FIFO_DEPTH - 1 then
                        read_pointer <= read_pointer + 1;
                    else
                        read_pointer <= (others => '0');
                    end if;
                end if;
                -- uart_fifo WRITE
                if wr_en = '1' and fifo_full = '0' then
                    fifo_memory(to_integer(write_pointer)) <= wr_data;
                    if write_pointer < FIFO_DEPTH - 1 then
                        write_pointer <= write_pointer + 1;
                    else
                        write_pointer <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process; 
    
end RTL;
