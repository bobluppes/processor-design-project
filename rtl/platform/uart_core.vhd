library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.uart_pack.all;

entity uart_core is
    generic (
        baud                : positive := 115200;
        clock_frequency     : positive := 50000000
    );
    port (  
        clock               : in  std_logic;
        nreset              : in  std_logic;
        data_byte_in        : in  std_logic_vector(7 downto 0); -- the byte to send on TX
        data_byte_in_strobe : in  std_logic;                    -- strobe to validate the byte to send
        data_byte_in_ack    : out std_logic;                    -- TX has begun sending the byte
        tx                  : out std_logic;                    -- TX serial bits (8N1)
        uart_tx_cpu_pause   : out std_logic                     -- interrupt for cpu
    );
end uart_core;

architecture rtl of uart_core is
    ---------------------------------------------------------------------------
    -- Baud generation 
    ---------------------------------------------------------------------------
    constant c_tx_div       : integer := clock_frequency / baud;
    constant c_tx_div_width : integer := clogb2(c_tx_div)+1;
    
    signal tx_baud_counter  : unsigned(c_tx_div_width - 1 downto 0) := (others => '0');
    signal tx_baud_tick     : std_logic := '0';
    ---------------------------------------------------------------------------
    -- Transmitter signals
    ---------------------------------------------------------------------------
    type uart_tx_states is ( tx_send_start_bit, tx_send_data, tx_send_stop_bit);             
    signal uart_tx_state       : uart_tx_states := tx_send_start_bit;
    signal uart_tx_data_vec    : std_logic_vector(7 downto 0) := (others => '0');
    signal uart_tx_data        : std_logic := '1';
    signal uart_tx_count       : unsigned(2 downto 0) := (others => '0');
    signal uart_rx_data_in_ack : std_logic := '0';

begin
    data_byte_in_ack  <= uart_rx_data_in_ack;
    tx                  <= uart_tx_data;
    
    ---------------------------------------------------------------------------
    -- TX_CLOCK_DIVIDER
    -- Generate baud ticks at the required rate based on the input clock
    -- frequency and baud rate
    ---------------------------------------------------------------------------
    tx_clock_divider : process (clock)
    begin
        if rising_edge (clock) then
            if nreset = '0' then
                tx_baud_counter <= (others => '0');
                tx_baud_tick <= '0';    
            else
                if tx_baud_counter = c_tx_div then
                    tx_baud_counter <= (others => '0');
                    tx_baud_tick <= '1';
                else
                    tx_baud_counter <= tx_baud_counter + 1;
                    tx_baud_tick <= '0';
                end if;
            end if;
        end if;
    end process tx_clock_divider;
    ---------------------------------------------------------------------------
    -- UART_SEND_DATA 
    -- Get data from data_byte_in and send it one bit at a time upon each 
    -- baud tick. Send data lsb first.
    -- wait 1 tick, send start bit (0), send data 0-7, send stop bit (1)
    ---------------------------------------------------------------------------
    uart_send_data : process(clock)
    begin
        if rising_edge(clock) then
            if nreset = '0' then
                uart_tx_data <= '1';
                uart_tx_data_vec <= (others => '0');
                uart_tx_count <= (others => '0');
                uart_tx_state <= tx_send_start_bit;
                uart_rx_data_in_ack <= '0';
                uart_tx_cpu_pause <= '0';
            else
                uart_rx_data_in_ack <= '0';
                case uart_tx_state is
                    when tx_send_start_bit =>
                        if tx_baud_tick = '1' and data_byte_in_strobe = '1' then
                            uart_tx_data  <= '0';
                            uart_tx_cpu_pause <= '1';
                            uart_tx_state <= tx_send_data;
                            uart_tx_count <= (others => '0');
                            uart_rx_data_in_ack <= '1';
                            uart_tx_data_vec <= data_byte_in;                           
                        end if;
                    when tx_send_data =>
                        if tx_baud_tick = '1' then
                            uart_tx_cpu_pause <= '1';
                            uart_tx_data <= uart_tx_data_vec(0);
                            uart_tx_data_vec(uart_tx_data_vec'high-1 downto 0) <= uart_tx_data_vec(uart_tx_data_vec'high downto 1);
                            if uart_tx_count < 7 then
                                uart_tx_count <= uart_tx_count + 1;
                            else
                                uart_tx_count <= (others => '0');
                                uart_tx_state <= tx_send_stop_bit;
                            end if;
                        end if;
                    when tx_send_stop_bit =>
                        if tx_baud_tick = '1' then
                            uart_tx_cpu_pause <= '0';
                            uart_tx_data <= '1';
                            uart_tx_state <= tx_send_start_bit;
                        end if;
                    when others =>
                        uart_tx_cpu_pause <= '0';
                        uart_tx_data <= '1';
                        uart_tx_state <= tx_send_start_bit;
                end case;
            end if;
        end if;
    end process uart_send_data;    
end rtl;