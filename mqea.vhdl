-- saida do estado atual

library ieee;
use ieee.std_logic_1164.all;

entity mqea is 
    port(
        ea                   : in  std_logic_vector(2 downto 0);  -- Estado
        disp, cof, blok, dev : out std_logic                      -- dispenser, cofre, bloqueia, devolucao
    );
end entity;

architecture est of mqea is

begin

    disp <= ea(2) and not ea(1);

    cof  <= ea(2) and not ea(1);

    dev  <= ea(2) and ea(1);
    
    blok <= ea(2) or (ea(1) and ea(0));

end architecture;
