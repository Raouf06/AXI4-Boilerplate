Library ieee;
Use ieee.std_logic_1164.all;

Entity slave is
	Port(
		S_ACLK	    : in std_logic;
		S_ARESETN	: in std_logic;
		S_TREADY	: out std_logic;
		S_TDATA		: in std_logic_vector(31 downto 0);
		S_TSTRB		: in std_logic_vector(3 downto 0);
		S_TKEEP	    : in std_logic_vector(3 downto 0);
		S_TLAST	  	: in std_logic;
		S_TVALID	: in std_logic);
End slave;

Architecture RTL of slave is
    signal tready : std_logic;
Begin
	-- Logic to assert the ready signal
	process(S_ACLK)
	begin
	  if S_ACLK'event and S_ACLK = '1' then
	    if S_ARESETN = '0' then
	      -- Reset logic
	    else
	      -- When will the system not be able to receive data
	    end if;
	  end if;
	end process;

	tready <= '0' when S_ARESETN = '0' else '1'; -- Add conditions when block is not ready
	S_TREADY <= tready;

	-- Treating the received block
	process(S_ACLK)
	begin
	  if S_ACLK'event and S_ACLK = '1' then
	    if S_ARESETN = '0' then
	      -- Reset system
	    else
	      if S_TVALID = '1' and tready = '1' then
			if S_TLAST = '1' then
				-- Last valid byte
			else
				-- Accept data logic
			end if;
	      end if;
	    end if;
	  end if;
	end process;
End RTL;