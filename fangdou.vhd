library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity fangdou is

  port (
    clk    : in std_logic;
    reset  : in std_logic;
    resetn : out std_logic
  );

end fangdou;

architecture behave of fangdou is signal clk_tmp : std_logic;
  signal cnt                                       : integer range 0 to 199999;
  signal tmp1, tmp2                                : std_logic;
begin
  process (clk)
  begin
    if (clk'event and clk = '1') then
      if cnt = 199999 then
        cnt     <= 0;
        clk_tmp <= not clk_tmp;
      else
        cnt <= cnt + 1;
      end if;
    end if;
  end process;

  process (clk_tmp)
  begin
    if (clk_tmp'event and clk_tmp = '0') then
      tmp2 <= tmp1;
      tmp1 <= key_in;

    end if;
  end process;
  key_out <= clk_tmp and tmp1 and (not tmp2);
end behave;