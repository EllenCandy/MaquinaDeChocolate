-- Próximo Estado
library ieee;
use ieee.std_logic_1164.all;

entity mqpe is port(
    ea         : in  std_logic_vector(2 downto 0);  -- Estado atual
    m_50, m_25 : in  std_logic;                     -- Moedas (50 cent e 25 cent)
    pe         : out std_logic_vector(2 downto 0)   -- Próximo estado
    );
end entity;

architecture est of mqpe is

begin

    pe(2) <= (m_50 and m_25) or (not(ea(2)) and ea(0) and m_50) or (not(ea(2)) and ea(1) and ea(0) and m_25);

    pe(1) <= (not ea(1) and m_25) or (m_50 and m_25) or (not ea(2) and (ea(1) and (not m_25))) or (ea(2) and m_25);

    pe(0) <= (ea(1) and m_50) or (not(ea(0)) and m_50) or (not(ea(0)) and ea(1) and m_25) or (ea(0) and not(ea(1)) and m_25) or (not(ea(2)) and ea(0) and not(m_50) and m_25);

end;
