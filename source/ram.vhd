library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram is 
    generic(
        n_words:        integer                             := 64;
        address_offset: integer                             := 3
    );
    port(
        input_data:     in std_logic_vector(7 downto 0)     := (others => '0');
        address:        in integer range 0 to n_words + address_offset - 1   := 0;
        read:           in std_logic                        := '0';
        write:          in std_logic                        := '0';

        output_data:    out std_logic_vector(7 downto 0)    := (others => '0')
    );
end;

architecture ram_arch of ram is

    type words_array is array (0 to n_words - 1) of std_logic_vector(7 downto 0);
    signal words: words_array;
begin
    process(read, address) is
    begin
        if ((read'event and read='1') or (address'event and read='1')) then
            output_data <= words(address-address_offset);
        end if;
    end process;

    process(write, address) is
    begin
        if((write'event and write='1') or (address'event and write='1')) then
            words(address-address_offset) <= input_data;
        end if;
    end process;

end ram_arch ; -- ram_arch