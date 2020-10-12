# RAM block

A ram block with changeable address offset and number of words.

## ram.vhd

```vhdl
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
```
