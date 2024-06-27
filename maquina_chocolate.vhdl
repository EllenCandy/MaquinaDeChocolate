library ieee;
use ieee.std_logic_1164.all;

entity me is
    port(
        rst, clk             : in  std_logic;
        m_50, m_25           : in  std_logic;
        disp, cof, blok, dev : out std_logic
    );
end entity;

architecture doit of me is

    -- Proximo Estado
    component mqpe is
        port(
            ea         : in  std_logic_vector(2 downto 0);  -- Estado atual
            m_50, m_25 : in  std_logic;                     -- Moedas (50 cent e 25 cent)
            pe         : out std_logic_vector(2 downto 0)   -- Próximo estado
        );
    end component;

    -- Reg
    component regCarga3bit is
        port(
            din : in std_logic_vector(2 downto 0);
            cl, clk : in std_logic;
            dout : out std_logic_vector(2 downto 0)
        );
    end component;

    -- saida do estado atual
    component mqea is
        port(
            ea                   : in  std_logic_vector(2 downto 0);  -- Estado
            disp, cof, blok, dev : out std_logic                      -- dispenser, cofre, bloqueia, devolucao
        );
    end component;

    -- Sinais internos
        signal spe_reg, sreg_ea: std_logic_vector(2 downto 0);

begin

    -- f(ea)
    u_fpe : mqpe port map(sreg_ea, m_50, m_25, spe_reg);

    -- registradores
    u_reg : regCarga3bit port map(spe_reg, rst, clk, sreg_ea);

    -- s(ea)
    u_sea : mqea port map (sreg_ea, disp, cof, blok, dev);

end architecture;
