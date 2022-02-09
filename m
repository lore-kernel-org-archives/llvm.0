Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5FC2F23
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644427988; x=1675963988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Gfdo0xv2a4lRFgVbbXAW/akinPH1rrn1N5Gqm3G6ZU=;
  b=Yzw+OGBqFmHiwjlNoHj5AUcdGVYvhZoK3U3W3KKWlhpMDSt/XibEg0zv
   vtaHqH2mJBb5JpJ0KzMAUfBaOH3reLmoBBcHOv6RmSdIRCQgnH6U6en0Z
   1s8tsQJHG+OnBwfiiZsK64eIUJfWlJP1YmUaw8VgCSGezNAbJlBI6vMh5
   I4IAtzs7ypoH8YrzgPwJQRPcUClGziGNej+j66BgHzHfiOb3IvFntqRgt
   PBmEtO47pOJs3byDGy1eaESytRCZNCs6+6G8PeYtwZhcV51MEAT696TId
   dAI6twbyYgz2jDeyuRsnJx6kCZbPQyIcH7EB4TH5R8vrMxMrHdQzELcB7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248099151"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="248099151"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 09:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="482408744"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2022 09:33:01 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHqpx-00027P-12; Wed, 09 Feb 2022 17:33:01 +0000
Date: Thu, 10 Feb 2022 01:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 498/907]
 drivers/ptp/ptp_xilinx.c:107:44: warning: shift count is negative
Message-ID: <202202100131.xqR3xweN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   423a108a01e05e84b59a4c4885c16bf3cd8c90c7
commit: 98c6cc90c5d398e87b8602a47eb26f9702064a0d [498/907] ptp: Add Xilinx PTP timer driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220210/202202100131.xqR3xweN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/98c6cc90c5d398e87b8602a47eb26f9702064a0d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 98c6cc90c5d398e87b8602a47eb26f9702064a0d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/ drivers/ptp/ drivers/staging/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_xilinx.c:107:44: warning: shift count is negative [-Wshift-count-negative]
           ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
                                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:33: note: expanded from macro 'XPTPTIMER_MAX_SEC_MASK'
   #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ptp/ptp_xilinx.c:216:10: warning: shift count >= width of type [-Wshift-count-overflow]
                   sign = XPTPTIMER_TOD_OFFSET_NEG;
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:55:34: note: expanded from macro 'XPTPTIMER_TOD_OFFSET_NEG'
   #define XPTPTIMER_TOD_OFFSET_NEG        BIT(47)
                                           ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/ptp/ptp_xilinx.c:347:43: warning: shift count is negative [-Wshift-count-negative]
           ts.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
                                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:33: note: expanded from macro 'XPTPTIMER_MAX_SEC_MASK'
   #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:353:44: warning: shift count is negative [-Wshift-count-negative]
           tsp.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
                                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:33: note: expanded from macro 'XPTPTIMER_MAX_SEC_MASK'
   #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +107 drivers/ptp/ptp_xilinx.c

    89	
    90	/*
    91	 * Inline timer helpers
    92	 */
    93	static inline void xlnx_tod_read(struct xlnx_ptp_timer *timer,
    94					 struct timespec64 *ts)
    95	{
    96		u32 sech, secl, nsec;
    97	
    98		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SNAPSHOT_OFFSET,
    99			     XPTPTIMER_SNAPSHOT_MASK);
   100	
   101		/* use TX port here */
   102		nsec = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_NS_SNAP_OFFSET);
   103		secl = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_SEC_0_SNAP_OFFSET);
   104		sech = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_SEC_1_SNAP_OFFSET);
   105	
   106		ts->tv_nsec = nsec;
 > 107		ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
   108	}
   109	
   110	static inline void xlnx_tod_offset_write(struct xlnx_ptp_timer *timer,
   111						 const struct timespec64 *ts)
   112	{
   113		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SEC_SYS_OFST_1_OFFSET,
   114			     upper_32_bits(ts->tv_sec));
   115		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SEC_SYS_OFST_0_OFFSET,
   116			     lower_32_bits(ts->tv_sec));
   117		xlnx_ptp_iow(timer, XPTPTIMER_TOD_NS_SYS_OFST_OFFSET,
   118			     (u32)(ts->tv_nsec));
   119	
   120		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
   121			     XPTPTIMER_LOAD_OFFSET_MASK);
   122	}
   123	
   124	static inline void xlnx_tod_load_write(struct xlnx_ptp_timer *timer,
   125					       const struct timespec64 *ts)
   126	{
   127		struct timespec64 offset;
   128	
   129		offset.tv_sec = 0;
   130		offset.tv_nsec = 0;
   131	
   132		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_SEC_1_OFFSET,
   133			     upper_32_bits(ts->tv_sec));
   134		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_SEC_0_OFFSET,
   135			     lower_32_bits(ts->tv_sec));
   136		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_NS_OFFSET, ts->tv_nsec);
   137	
   138		/* Make sure offset registers are cleared */
   139		xlnx_tod_offset_write(timer, &offset);
   140		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
   141			     XPTPTIMER_LOAD_OFFSET_MASK);
   142	
   143		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
   144			     XPTPTIMER_LOAD_TOD_MASK);
   145		timer->timeoffset = 0;
   146	}
   147	
   148	static inline void xlnx_port_period_write(struct xlnx_ptp_timer *timer, u64 adj)
   149	{
   150		u32 adjhigh = upper_32_bits(adj);
   151	
   152		xlnx_ptp_iow(timer, XPTPTIMER_PORT_TX_PERIOD_0_OFFSET, (u32)(adj));
   153		xlnx_ptp_iow(timer, XPTPTIMER_PORT_RX_PERIOD_0_OFFSET, (u32)(adj));
   154		spin_lock(&timer->reg_lock);
   155		xlnx_ptp_iow(timer, XPTPTIMER_PORT_TX_PERIOD_1_OFFSET, adjhigh);
   156		xlnx_ptp_iow(timer, XPTPTIMER_PORT_RX_PERIOD_1_OFFSET, adjhigh);
   157	
   158		spin_unlock(&timer->reg_lock);
   159	}
   160	
   161	/*
   162	 * PTP clock operations
   163	 */
   164	/**
   165	 * xlnx_ptp_adjfine - Fine adjustment of the frequency on the hardware clock
   166	 * @ptp: ptp clock structure
   167	 * @scaled_ppm: signed scaled parts per million for frequency adjustment.
   168	 * Return: 0 on success
   169	 * TX and RX port periods are reloaded with the adjusted value.
   170	 *
   171	 */
   172	static int xlnx_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
   173	{
   174		struct xlnx_ptp_timer *timer = container_of(ptp, struct xlnx_ptp_timer,
   175						ptp_clock_info);
   176		bool neg_adj = false;
   177		u64 adj;
   178	
   179		if (scaled_ppm < 0) {
   180			neg_adj = true;
   181			scaled_ppm = -scaled_ppm;
   182		}
   183	
   184		adj = mul_u64_u32_div(timer->incr, scaled_ppm, USEC_PER_SEC);
   185		adj >>= PPM_FRACTION; /* remove fractions */
   186		adj = neg_adj ? (timer->incr - adj) : (timer->incr + adj);
   187	
   188		xlnx_port_period_write(timer, adj);
   189	
   190		return 0;
   191	}
   192	
   193	/**
   194	 * xlnx_ptp_adjtime - Adjust the current time on the hardware clock
   195	 * @ptp: ptp clock structure
   196	 * @delta: signed time in ns to be adjusted.
   197	 * Return: 0 on success
   198	 * System, TX and RX ports are reloaded with the adjusted time.
   199	 *
   200	 */
   201	static int xlnx_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
   202	{
   203		struct xlnx_ptp_timer *timer = container_of(ptp, struct xlnx_ptp_timer,
   204							ptp_clock_info);
   205		struct timespec64 offset;
   206		u64 sign = 0;
   207		s64 cumulative_delta = timer->timeoffset;
   208	
   209		spin_lock(&timer->reg_lock);
   210	
   211		/* Fixed offset between system and port timer */
   212		delta += timer->static_delay;
   213		cumulative_delta += delta;
   214		timer->timeoffset = cumulative_delta;
   215		if (cumulative_delta < 0) {
 > 216			sign = XPTPTIMER_TOD_OFFSET_NEG;
   217			cumulative_delta = -cumulative_delta;
   218		}
   219		offset = ns_to_timespec64(cumulative_delta);
   220		offset.tv_sec |= sign;
   221	
   222		xlnx_tod_offset_write(timer, (const struct timespec64 *)&offset);
   223	
   224		spin_unlock(&timer->reg_lock);
   225	
   226		return 0;
   227	}
   228	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
