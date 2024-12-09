```vhdl
entity fixed_counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count : out  unsigned(3 downto 0));
end entity fixed_counter;

architecture behavioral of fixed_counter is
    signal internal_count : unsigned(3 downto 0) := (others => '0');
begin
    process (clk, rst)
    begin
        if rst = '1' then
            internal_count <= (others => '0');
        elsif rising_edge(clk) then
            if internal_count = 15 then
                -- Handle overflow (e.g., reset or maintain max value)
                internal_count <= 15; -- Or internal_count <= (others => '0');
            else
                internal_count <= internal_count + 1;
            end if;
        end if;
    end process;
    count <= internal_count;
end architecture behavioral;
```