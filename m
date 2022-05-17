Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3C47A
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652816218; x=1684352218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZbfleiuUplXcc58+ikzyhgH2RKqdGfPT7H71jNi0yJM=;
  b=hiSALE4O6wXRwvAcXbirZRLtssyDU+wPKP+t87ZQiii2dKeSlGwoo6dm
   fFLGO+raHmtKt2Mf1mFqJQ4Z9wlc5zBBtxuyaiPU+5ksSZ23ecPPDLS4X
   X/Gwmvg0WjzblD8HPhx4sDlqRAjRNkDBLQoknhPWUDUjWGUB8qdXmU7Pe
   Qb8nmuol2eocq1trEKzY+9wjv3UcFSufedt9U+GdJ3Vw1MzM/AWTffjXR
   eHMBj80JXa+6EwVP2HErSVZilZJ2eY1/sUg3eHAtvoj49PMT6Jubl0xfM
   7axWzjrBluSz0aovDBTSA611LxPtZGOHC8NPm4kyc2KfyxUGT6ygCeAwo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="268886004"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="268886004"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 12:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="555931619"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 May 2022 12:36:55 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nr302-0001Jh-DP;
	Tue, 17 May 2022 19:36:54 +0000
Date: Wed, 18 May 2022 03:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 498/1093]
 drivers/ptp/ptp_xilinx.c:107:44: warning: shift count is negative
Message-ID: <202205180314.pGWI7Kcs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Harini,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: 98c6cc90c5d398e87b8602a47eb26f9702064a0d [498/1093] ptp: Add Xilinx PTP timer driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220518/202205180314.pGWI7Kcs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/98c6cc90c5d398e87b8602a47eb26f9702064a0d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 98c6cc90c5d398e87b8602a47eb26f9702064a0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/xlnx/ drivers/media/i2c/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/ drivers/ptp/ drivers/staging/

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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
