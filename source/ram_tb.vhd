library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity ram_tb is
end;

architecture behave of ram_tb is

    signal r_input_data:     std_logic_vector(7 downto 0)     := (others => '0');
    signal r_address:        integer range 0 to 64 - 1   := 0;
    signal r_read:           std_logic                        := '0';
    signal r_write:          std_logic                        := '0';

    signal w_output_data:    std_logic_vector(7 downto 0)    := (others => '0');

begin

    UUT: entity work.ram
        port map (
            input_data => r_input_data,
            address => r_address,
            read => r_read,
            write => r_write,
    
            output_data => w_output_data
        );

    process is
    begin
        r_input_data <= X"AA";
        r_write <= '1';
        r_address <= 0+3;
        wait for 25ns;

        r_input_data <= X"00";
        r_write <= '0';
        r_read <= '1';
        wait for 25ns;

        r_address <= 64+3-1;
        r_input_data <= X"FF";
        wait until (r_input_data = X"FF" and r_address = 64+3-1);
        r_write <= '1';
        r_read <= '0';
        wait for 25ns;

        r_input_data <= X"00";
        r_write <= '0';
        r_read <= '1';
        wait for 25ns;

        r_address <= 0+3;
        r_input_data <= X"00";
        r_write <= '0';
        r_read <= '1';
        wait for 25ns;
        finish;
    end process;

end behave ; -- behave