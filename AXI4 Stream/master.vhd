Library ieee;
Use ieee.std_logic_1164.all;

Entity master is
    port (
        M_ACLK      : in std_logic;
        M_ARESETN   : in std_logic;
        M_TREADY    : in std_logic;  -- TREADY signal from slave
        M_TDATA     : out std_logic_vector(31 downto 0);
        M_TSTRB     : out std_logic_vector(3 downto 0);
        M_TKEEP     : out std_logic_vector(3 downto 0);
        M_TLAST     : out std_logic;
        M_TVALID    : out std_logic   -- TVALID signal to slave
    );
End master;

Architecture RTL of master is
Begin
    process (M_ACLK)
    begin
        if M_ACLK'event and M_ACLK = '1' then
            if M_ARESETN = '0' then
                -- Reset logic
                -- Set default values if needed
                -- M_TVALID <= '0';
                -- M_TDATA  <= (others => '0');
                -- M_TSTRB  <= (others => '0');
                -- M_TKEEP  <= (others => '0');
                -- M_TLAST  <= '0';
            else
            	-- Main logic
            end if;
        end if;
    end process;

    process (M_ACLK)
    begin
        if M_ACLK'event and M_ACLK = '1' then
            if M_ARESETN = '0' then
                -- Reset logic 
            else
                -- Generate data to be transmitted
                -- Manage valid, strobe, keep and last signals as needed
            end if;
        end if;
    end process;
End RTL;