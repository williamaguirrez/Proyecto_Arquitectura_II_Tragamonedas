library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memoriaram is
port(
	clk, we : in std_logic;
	data_in : in std_logic_vector(25 downto 0);
	address: in integer range 0 to 127;
	data_out : out std_logic_vector(25 downto 0)
);
end entity;

architecture mem_arc of memoriaram is
type memoria is array(0 to 127) of std_logic_vector(25 downto 0);
signal my_ram : memoria;
attribute ram_style : string;
attribute ram_style of my_ram: signal is "M4K";
attribute ram_init_file : string;
attribute ram_init_file of my_ram: signal is "mem.mif";
begin
	process(clk) is
	begin
		if(rising_edge(clk)) then
			if (we='1') then
				my_ram(address) <= data_in;
			end if;
			data_out <= my_ram(address);
		end if;
	end process;
end architecture;