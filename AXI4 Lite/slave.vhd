library ieee;
use ieee.std_logic_1164.all;

entity slave is
    port (
        -- Clock and Reset
        ACLK           : in std_logic;               -- Clock input
        ARESETn        : in std_logic;               -- Active-low reset input

        -- Write Address Bus Signals
        AWVALID        : in std_logic;               -- Write address valid
        AWREADY        : out std_logic;              -- Slave is ready to accept write address from master
        AWADDRESS      : in std_logic_vector(31 downto 0);  -- Write address
        AWPROT         : in std_logic_vector(2 downto 0);   -- Access protections. Optional

        -- Write Data Bus Signals
        WVALID         : in std_logic;               -- Write data valid
        WREADY         : out std_logic;              -- Slave is ready to accept write data from master
        WDATA          : in std_logic_vector(31 downto 0);  -- Write data
        WSTROBE        : in std_logic_vector(3 downto 0);   -- Write byte strobe

        -- Write Response Bus Signals
        BVALID         : out std_logic;              -- Write response valid from slave
        BREADY         : in std_logic;               -- Master is ready to accept response
        BRESP          : out std_logic_vector(1 downto 0);  -- Response information from slave

        -- Read Address Bus Signals
        ARVALID        : in std_logic;               -- Read address from master is valid
        ARREADY        : out std_logic;              -- Slave is ready to accept read address from master
        ARADDRESS      : in std_logic_vector(31 downto 0);  -- Read address
        ARPROT         : in std_logic_vector(2 downto 0);   -- Access protections. Optional

        -- Read Data Bus Signals
        RVALID         : out std_logic;              -- Read data from slave is valid
        RREADY         : in std_logic;               -- Master is ready to accept read data from slave
        RDATA          : out std_logic_vector(31 downto 0); -- Read data from slave
        RRESP          : out std_logic_vector(1 downto 0)  -- Read response from slave
    );
end entity slave;

architecture rtl of slave is
begin
    process (ACLK)
    begin
        if ACLK'event and ACLK = '1' then
            if ARESETn = '0' then
                -- Reset logic (initialize internal signals)
            else
                -- Main logic when not reset
            end if;
        end if;
    end process;

    -- Write Address Flow
    AWREADY <= '1'; -- Always ready to accept address

    -- Write Data Flow
    WREADY <= '1'; -- Always ready to accept data

    -- Write Response Flow
    BVALID <= '0'; -- Initially, response is not valid
    BRESP <= "00"; -- Default response is OKAY

    -- Read Address Flow
    ARREADY <= '1'; -- Always ready to accept read address

    -- Read Data Flow (Implement read data logic)
    RVALID <= '0'; -- Initially, read data is not valid
    RDATA <= (others => '0'); -- Default read data is all zeros
    RRESP <= "00"; -- Default response is OKAY

    process (ACLK)
    begin
        if ACLK'event and ACLK = '1' then
            if ARVALID = '1' then
                -- Accept read address and handling logic
                if RREADY = '1' then
                    RVALID <= '1';
                    -- Read data logic depending on the read address
                else
                    -- If master is not ready reset RValid
                    RVALID <= '0';
                end if;
            end if;
        end if;
    end process;
end architecture rtl;
