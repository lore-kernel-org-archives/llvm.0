Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983F2F28
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644237326; x=1675773326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3NKj1n84LPNzblkKv0SBI1v5Ra2UBc4AsePgYBd5ZAg=;
  b=PmFvHgOn2UYJuqIPe5ukiXMVE4u6JydKXop13Qydizx5MNyO6GQ3X9lB
   NGlnUNeC0t1bjp8UBy+ykIE3V0CC+knsBdx/bDBdP/G7ocPwROi1DABvG
   IB8K1vQ/ZE6MG3ljGIhZZ9lvmdFA0ft073ZEvKZ47K3GqDp2MkdkfJUZx
   4v+ptMJUzdl3kheN0clTRNqoRHvaZKinSdnKi90AzjmoSly/pJ7jNQOih
   iKFscX4L5JFnx347KIVY8G4wP2G7pua9W0Pio1OQPXe/0fX1ycTZ6XMqH
   YyGKLXZPAKjvNBTyrPb111UufAskKCOE776Ln/ziLNtakkXOq2x8b948r
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="229353868"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="229353868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="770621720"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2022 04:35:24 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nH3Ep-0000WX-Ih; Mon, 07 Feb 2022 12:35:23 +0000
Date: Mon, 7 Feb 2022 20:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Message-ID: <202202072020.toQ349pg-lkp@intel.com>
References: <20220207063338.6570-7-warp5tw@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-7-warp5tw@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tyrone,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tyrone-Ting/i2c-npcm-Bug-fixes-timeout-spurious-interrupts/20220207-144704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220207/202202072020.toQ349pg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/580220fb38f28f5ab9ad2c4d39d4738719f39a7a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tyrone-Ting/i2c-npcm-Bug-fixes-timeout-spurious-interrupts/20220207-144704
        git checkout 580220fb38f28f5ab9ad2c4d39d4738719f39a7a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-npcm7xx.c:2164:12: warning: comparison of distinct pointer types ('typeof (bus->adap.timeout) *' (aka 'int *') and 'typeof (usecs_to_jiffies(timeout_usec)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           timeout = max(bus->adap.timeout, usecs_to_jiffies(timeout_usec));
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +2164 drivers/i2c/busses/i2c-npcm7xx.c

56a1485b102ed1 Tali Perry 2020-05-27  2103  
56a1485b102ed1 Tali Perry 2020-05-27  2104  static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
56a1485b102ed1 Tali Perry 2020-05-27  2105  				int num)
56a1485b102ed1 Tali Perry 2020-05-27  2106  {
56a1485b102ed1 Tali Perry 2020-05-27  2107  	struct npcm_i2c *bus = container_of(adap, struct npcm_i2c, adap);
56a1485b102ed1 Tali Perry 2020-05-27  2108  	struct i2c_msg *msg0, *msg1;
56a1485b102ed1 Tali Perry 2020-05-27  2109  	unsigned long time_left, flags;
56a1485b102ed1 Tali Perry 2020-05-27  2110  	u16 nwrite, nread;
56a1485b102ed1 Tali Perry 2020-05-27  2111  	u8 *write_data, *read_data;
56a1485b102ed1 Tali Perry 2020-05-27  2112  	u8 slave_addr;
692c41a2a403a7 Tali Perry 2022-02-07  2113  	unsigned long timeout;
56a1485b102ed1 Tali Perry 2020-05-27  2114  	bool read_block = false;
56a1485b102ed1 Tali Perry 2020-05-27  2115  	bool read_PEC = false;
56a1485b102ed1 Tali Perry 2020-05-27  2116  	u8 bus_busy;
56a1485b102ed1 Tali Perry 2020-05-27  2117  	unsigned long timeout_usec;
56a1485b102ed1 Tali Perry 2020-05-27  2118  
56a1485b102ed1 Tali Perry 2020-05-27  2119  	if (bus->state == I2C_DISABLE) {
56a1485b102ed1 Tali Perry 2020-05-27  2120  		dev_err(bus->dev, "I2C%d module is disabled", bus->num);
56a1485b102ed1 Tali Perry 2020-05-27  2121  		return -EINVAL;
56a1485b102ed1 Tali Perry 2020-05-27  2122  	}
56a1485b102ed1 Tali Perry 2020-05-27  2123  
56a1485b102ed1 Tali Perry 2020-05-27  2124  	msg0 = &msgs[0];
56a1485b102ed1 Tali Perry 2020-05-27  2125  	slave_addr = msg0->addr;
56a1485b102ed1 Tali Perry 2020-05-27  2126  	if (msg0->flags & I2C_M_RD) { /* read */
56a1485b102ed1 Tali Perry 2020-05-27  2127  		nwrite = 0;
56a1485b102ed1 Tali Perry 2020-05-27  2128  		write_data = NULL;
56a1485b102ed1 Tali Perry 2020-05-27  2129  		read_data = msg0->buf;
56a1485b102ed1 Tali Perry 2020-05-27  2130  		if (msg0->flags & I2C_M_RECV_LEN) {
56a1485b102ed1 Tali Perry 2020-05-27  2131  			nread = 1;
56a1485b102ed1 Tali Perry 2020-05-27  2132  			read_block = true;
56a1485b102ed1 Tali Perry 2020-05-27  2133  			if (msg0->flags & I2C_CLIENT_PEC)
56a1485b102ed1 Tali Perry 2020-05-27  2134  				read_PEC = true;
56a1485b102ed1 Tali Perry 2020-05-27  2135  		} else {
56a1485b102ed1 Tali Perry 2020-05-27  2136  			nread = msg0->len;
56a1485b102ed1 Tali Perry 2020-05-27  2137  		}
56a1485b102ed1 Tali Perry 2020-05-27  2138  	} else { /* write */
56a1485b102ed1 Tali Perry 2020-05-27  2139  		nwrite = msg0->len;
56a1485b102ed1 Tali Perry 2020-05-27  2140  		write_data = msg0->buf;
56a1485b102ed1 Tali Perry 2020-05-27  2141  		nread = 0;
56a1485b102ed1 Tali Perry 2020-05-27  2142  		read_data = NULL;
56a1485b102ed1 Tali Perry 2020-05-27  2143  		if (num == 2) {
56a1485b102ed1 Tali Perry 2020-05-27  2144  			msg1 = &msgs[1];
56a1485b102ed1 Tali Perry 2020-05-27  2145  			read_data = msg1->buf;
56a1485b102ed1 Tali Perry 2020-05-27  2146  			if (msg1->flags & I2C_M_RECV_LEN) {
56a1485b102ed1 Tali Perry 2020-05-27  2147  				nread = 1;
56a1485b102ed1 Tali Perry 2020-05-27  2148  				read_block = true;
56a1485b102ed1 Tali Perry 2020-05-27  2149  				if (msg1->flags & I2C_CLIENT_PEC)
56a1485b102ed1 Tali Perry 2020-05-27  2150  					read_PEC = true;
56a1485b102ed1 Tali Perry 2020-05-27  2151  			} else {
56a1485b102ed1 Tali Perry 2020-05-27  2152  				nread = msg1->len;
56a1485b102ed1 Tali Perry 2020-05-27  2153  				read_block = false;
56a1485b102ed1 Tali Perry 2020-05-27  2154  			}
56a1485b102ed1 Tali Perry 2020-05-27  2155  		}
56a1485b102ed1 Tali Perry 2020-05-27  2156  	}
56a1485b102ed1 Tali Perry 2020-05-27  2157  
06be67266a0c9a Tali Perry 2020-08-31  2158  	/*
06be67266a0c9a Tali Perry 2020-08-31  2159  	 * Adaptive TimeOut: estimated time in usec + 100% margin:
06be67266a0c9a Tali Perry 2020-08-31  2160  	 * 2: double the timeout for clock stretching case
06be67266a0c9a Tali Perry 2020-08-31  2161  	 * 9: bits per transaction (including the ack/nack)
06be67266a0c9a Tali Perry 2020-08-31  2162  	 */
06be67266a0c9a Tali Perry 2020-08-31  2163  	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
692c41a2a403a7 Tali Perry 2022-02-07 @2164  	timeout = max(bus->adap.timeout, usecs_to_jiffies(timeout_usec));
56a1485b102ed1 Tali Perry 2020-05-27  2165  	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
56a1485b102ed1 Tali Perry 2020-05-27  2166  		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
56a1485b102ed1 Tali Perry 2020-05-27  2167  		return -EINVAL;
56a1485b102ed1 Tali Perry 2020-05-27  2168  	}
56a1485b102ed1 Tali Perry 2020-05-27  2169  
692c41a2a403a7 Tali Perry 2022-02-07  2170  	time_left = jiffies + timeout + 1;
56a1485b102ed1 Tali Perry 2020-05-27  2171  	do {
56a1485b102ed1 Tali Perry 2020-05-27  2172  		/*
56a1485b102ed1 Tali Perry 2020-05-27  2173  		 * we must clear slave address immediately when the bus is not
56a1485b102ed1 Tali Perry 2020-05-27  2174  		 * busy, so we spinlock it, but we don't keep the lock for the
56a1485b102ed1 Tali Perry 2020-05-27  2175  		 * entire while since it is too long.
56a1485b102ed1 Tali Perry 2020-05-27  2176  		 */
56a1485b102ed1 Tali Perry 2020-05-27  2177  		spin_lock_irqsave(&bus->lock, flags);
56a1485b102ed1 Tali Perry 2020-05-27  2178  		bus_busy = ioread8(bus->reg + NPCM_I2CCST) & NPCM_I2CCST_BB;
f54736925a4f83 Tali Perry 2020-05-27  2179  #if IS_ENABLED(CONFIG_I2C_SLAVE)
f54736925a4f83 Tali Perry 2020-05-27  2180  		if (!bus_busy && bus->slave)
f54736925a4f83 Tali Perry 2020-05-27  2181  			iowrite8((bus->slave->addr & 0x7F),
f54736925a4f83 Tali Perry 2020-05-27  2182  				 bus->reg + NPCM_I2CADDR1);
f54736925a4f83 Tali Perry 2020-05-27  2183  #endif
56a1485b102ed1 Tali Perry 2020-05-27  2184  		spin_unlock_irqrestore(&bus->lock, flags);
56a1485b102ed1 Tali Perry 2020-05-27  2185  
56a1485b102ed1 Tali Perry 2020-05-27  2186  	} while (time_is_after_jiffies(time_left) && bus_busy);
56a1485b102ed1 Tali Perry 2020-05-27  2187  
56a1485b102ed1 Tali Perry 2020-05-27  2188  	if (bus_busy) {
56a1485b102ed1 Tali Perry 2020-05-27  2189  		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
56a1485b102ed1 Tali Perry 2020-05-27  2190  		npcm_i2c_reset(bus);
56a1485b102ed1 Tali Perry 2020-05-27  2191  		i2c_recover_bus(adap);
56a1485b102ed1 Tali Perry 2020-05-27  2192  		return -EAGAIN;
56a1485b102ed1 Tali Perry 2020-05-27  2193  	}
56a1485b102ed1 Tali Perry 2020-05-27  2194  
56a1485b102ed1 Tali Perry 2020-05-27  2195  	npcm_i2c_init_params(bus);
692c41a2a403a7 Tali Perry 2022-02-07  2196  	bus->dest_addr = slave_addr << 1;
56a1485b102ed1 Tali Perry 2020-05-27  2197  	bus->msgs = msgs;
56a1485b102ed1 Tali Perry 2020-05-27  2198  	bus->msgs_num = num;
56a1485b102ed1 Tali Perry 2020-05-27  2199  	bus->cmd_err = 0;
56a1485b102ed1 Tali Perry 2020-05-27  2200  	bus->read_block_use = read_block;
56a1485b102ed1 Tali Perry 2020-05-27  2201  
56a1485b102ed1 Tali Perry 2020-05-27  2202  	reinit_completion(&bus->cmd_complete);
56a1485b102ed1 Tali Perry 2020-05-27  2203  
8b4b09a6da0b25 Tali Perry 2022-02-07  2204  	npcm_i2c_int_enable(bus, true);
8b4b09a6da0b25 Tali Perry 2022-02-07  2205  
8b4b09a6da0b25 Tali Perry 2022-02-07  2206  	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
8b4b09a6da0b25 Tali Perry 2022-02-07  2207  				       write_data, read_data, read_PEC,
8b4b09a6da0b25 Tali Perry 2022-02-07  2208  				       read_block)) {
56a1485b102ed1 Tali Perry 2020-05-27  2209  		time_left = wait_for_completion_timeout(&bus->cmd_complete,
56a1485b102ed1 Tali Perry 2020-05-27  2210  							timeout);
56a1485b102ed1 Tali Perry 2020-05-27  2211  
56a1485b102ed1 Tali Perry 2020-05-27  2212  		if (time_left == 0) {
56a1485b102ed1 Tali Perry 2020-05-27  2213  			if (bus->timeout_cnt < ULLONG_MAX)
56a1485b102ed1 Tali Perry 2020-05-27  2214  				bus->timeout_cnt++;
56a1485b102ed1 Tali Perry 2020-05-27  2215  			if (bus->master_or_slave == I2C_MASTER) {
56a1485b102ed1 Tali Perry 2020-05-27  2216  				i2c_recover_bus(adap);
56a1485b102ed1 Tali Perry 2020-05-27  2217  				bus->cmd_err = -EIO;
56a1485b102ed1 Tali Perry 2020-05-27  2218  				bus->state = I2C_IDLE;
56a1485b102ed1 Tali Perry 2020-05-27  2219  			}
56a1485b102ed1 Tali Perry 2020-05-27  2220  		}
56a1485b102ed1 Tali Perry 2020-05-27  2221  	}
56a1485b102ed1 Tali Perry 2020-05-27  2222  
56a1485b102ed1 Tali Perry 2020-05-27  2223  	/* if there was BER, check if need to recover the bus: */
56a1485b102ed1 Tali Perry 2020-05-27  2224  	if (bus->cmd_err == -EAGAIN)
8b4b09a6da0b25 Tali Perry 2022-02-07  2225  		bus->cmd_err = i2c_recover_bus(adap);
56a1485b102ed1 Tali Perry 2020-05-27  2226  
8947efc077168c Tali Perry 2020-09-20  2227  	/*
8947efc077168c Tali Perry 2020-09-20  2228  	 * After any type of error, check if LAST bit is still set,
8947efc077168c Tali Perry 2020-09-20  2229  	 * due to a HW issue.
8947efc077168c Tali Perry 2020-09-20  2230  	 * It cannot be cleared without resetting the module.
8947efc077168c Tali Perry 2020-09-20  2231  	 */
8b4b09a6da0b25 Tali Perry 2022-02-07  2232  	else if (bus->cmd_err &&
8947efc077168c Tali Perry 2020-09-20  2233  		 (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
8947efc077168c Tali Perry 2020-09-20  2234  		npcm_i2c_reset(bus);
8947efc077168c Tali Perry 2020-09-20  2235  
8b4b09a6da0b25 Tali Perry 2022-02-07  2236  	/* after any xfer, successful or not, stall and EOB must be disabled */
8b4b09a6da0b25 Tali Perry 2022-02-07  2237  	npcm_i2c_stall_after_start(bus, false);
8b4b09a6da0b25 Tali Perry 2022-02-07  2238  	npcm_i2c_eob_int(bus, false);
8b4b09a6da0b25 Tali Perry 2022-02-07  2239  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
