-- ghdl -a *.vhdl ;
-- ghdl -e me_tb ;
-- ghdl -r me_tb --vcd=tb.vcd --stop-time=400ns ;
-- gtkwave tb.vcd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity me_tb is
end entity;

architecture search4coffe of me_tb is
    constant CLK_PERIOD : time := 20 ns;

    component me is
    port(
        rst, clk              : in std_logic;
        m_50, m_25            : in std_logic;
        disp, cof, blok, dev  : out std_logic
    );
    end component;

    -- sinais controle
    signal srst : std_logic := '1';
    signal sclk : std_logic := '0';

    -- sinal de observacao
    signal m_50, m_25            : std_logic := '0';
    signal disp, cof, blok, dev  : std_logic := '0';

    -- Estimulo
    -- signal sstring : std_logic_vector(2 downto 0):="000";

begin
    sclk <= not(sclk) after CLK_PERIOD / 2;

    -- A Maquina de Estado:
    u_me : me port map(srst, sclk, m_50, m_25, disp, cof, blok, dev);

    tb : process
    begin
        -- reset inicial
        srst <= '0';
        wait for CLK_PERIOD;
        srst <= '1';

        -- 100 (25 + 50 + 25)
        m_25 <= '1';
        m_50 <= '0';
        wait for CLK_PERIOD;
        m_25 <= '0';
        m_50 <= '1';
        wait for CLK_PERIOD;
        m_25 <= '1';
        m_50 <= '0';
        wait for CLK_PERIOD;
        m_25 <= '0';
        wait for CLK_PERIOD;

        -- 100 (50 + 50)
        m_25 <= '0';
        m_50 <= '1';
        wait for CLK_PERIOD;
        m_25 <= '0';
        m_50 <= '1';
        wait for CLK_PERIOD;
        m_50 <= '0';
        wait for CLK_PERIOD;

        -- 150 (25 + 25 + 50 + 50)
        m_25 <= '1';
        m_50 <= '0';
        wait for CLK_PERIOD;
        m_25 <= '1';
        m_50 <= '0';
        wait for CLK_PERIOD;
        m_25 <= '0';
        m_50 <= '1'; 
        wait for CLK_PERIOD;
        m_25 <= '0';
        m_50 <= '1';
        wait for CLK_PERIOD;
        m_50 <= '0';
        wait for CLK_PERIOD;

        wait; 
    end process;
end architecture;
