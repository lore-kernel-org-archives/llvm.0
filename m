Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD21B0408;
	Sat, 11 Jan 2025 19:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736624637; cv=none; b=gicZ/tnq6arRlqYTdSZiRPne5qTM6wpkxPyu8FPGv2Q8CXid1iWthWOHNnesDicqp0+xyh3u1VBHNZkcFjWhbO4D5p58G3i5menQOttVP0DE/7Fhmud3uJRLQZfp4lv1hxE0qU+CcMMF2pXB7TIitdhnH4aaNoD4no7sMjPyK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736624637; c=relaxed/simple;
	bh=m69hCrqSS+S6wiYebLv1SvtfvBiEjyvb5/DDdvbfXRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GU4YvUsPhdkBYoLMLvuJzVALVM4tEFY17WJ96Xyq/KNjoloPo+dQViwlCYw3LeYacyUFyhQCtmN4P+HiJeCA0kTRkAk+JDLQn7B4Vj6jZ0bIuRaOH8lJMKTNZ3w8sTcPvNZprC8NYjQfZc5jBSdKH/oWreeUwWTtf0GThCfJGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLWu1vON; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLWu1vON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736624635; x=1768160635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m69hCrqSS+S6wiYebLv1SvtfvBiEjyvb5/DDdvbfXRE=;
  b=LLWu1vON8GfphhMhZ2XOBzHg1wTYnucaX/C4JISyhuW2nhUnE1DKd+zz
   DyYXjYwXqAh97o+opfWrkKeSwkHPSr6YiFrTwJ0+l/p0sFMkKs7Qgx47V
   wbSwRQH+7uKJi6e0LOJZYfM0YEIFPZBkTuvtZLyu2Chenwrs3louuK6+L
   uoAVKuMvOYxcCVxMs9sdOBz2Mq42h5pWi7UPAKlk9chNK+AJL7uj56woE
   IUCmDbvPNovxJxJXsePWp+qyUbwj6FxsBvLoNdnwm/+Cyfuufehn+nYlN
   L3vK+5gdEMvBxoS+2GrO8KI5GCbx0votBLgl9Xh3loWGRyv/5ibPT5Ris
   g==;
X-CSE-ConnectionGUID: PdjzGp9oRZS0nI1JO8WO3Q==
X-CSE-MsgGUID: l5XxskhiSJOPzj4meszy+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47556308"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47556308"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 11:43:54 -0800
X-CSE-ConnectionGUID: 5D0kOVBWRoG+QbIiGBYDGg==
X-CSE-MsgGUID: F5MuEMLeTyyY3T9imt64iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134930840"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jan 2025 11:43:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWhOf-000L9P-2J;
	Sat, 11 Jan 2025 19:43:49 +0000
Date: Sun, 12 Jan 2025 03:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Suraj Gupta <suraj.gupta2@amd.com>
Subject: [xilinx-xlnx:lkp_test 294/504] drivers/ptp/ptp_xilinx.c:113:44:
 warning: shift count is negative
Message-ID: <202501120343.YSg4g8XF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 44cd48387aa8a71b503fc14aa01e282760fb4fd8 [294/504] ptp: Add Xilinx PTP timer driver with EXTTS support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250112/202501120343.YSg4g8XF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120343.YSg4g8XF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120343.YSg4g8XF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ptp/ptp_xilinx.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/ptp/ptp_xilinx.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/ptp/ptp_xilinx.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/ptp/ptp_xilinx.c:17:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/ptp/ptp_xilinx.c:113:44: warning: shift count is negative [-Wshift-count-negative]
     113 |         ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:33: note: expanded from macro 'XPTPTIMER_MAX_SEC_MASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ptp/ptp_xilinx.c:254:10: warning: shift count >= width of type [-Wshift-count-overflow]
     254 |                 sign = XPTPTIMER_TOD_OFFSET_NEG;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:64:34: note: expanded from macro 'XPTPTIMER_TOD_OFFSET_NEG'
      64 | #define XPTPTIMER_TOD_OFFSET_NEG        BIT(47)
         |                                         ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   drivers/ptp/ptp_xilinx.c:377:39: warning: shift count is negative [-Wshift-count-negative]
     377 |                         sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:33: note: expanded from macro 'XPTPTIMER_MAX_SEC_MASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:481:43: warning: shift count is negative [-Wshift-count-negative]
     481 |         ts.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:33: note: expanded from macro 'XPTPTIMER_MAX_SEC_MASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:487:44: warning: shift count is negative [-Wshift-count-negative]
     487 |         tsp.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c:62:33: note: expanded from macro 'XPTPTIMER_MAX_SEC_MASK'
      62 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings generated.


vim +113 drivers/ptp/ptp_xilinx.c

  > 17	#include <linux/ptp_clock_kernel.h>
    18	#include <linux/platform_device.h>
    19	#include <linux/of_irq.h>
    20	#include <linux/ptp/ptp_xilinx.h>
    21	
    22	/* Register offset definitions */
    23	#define XPTPTIMER_TOD_CONFIG_OFFSET	0x0000
    24	#define XPTPTIMER_TOD_SNAPSHOT_OFFSET	0x0004
    25	#define XPTPTIMER_IER_OFFSET		0x0008
    26	#define XPTPTIMER_ISR_OFFSET		0x000C
    27	#define XPTPTIMER_TOD_SW_SEC_0_OFFSET	0x0010
    28	#define XPTPTIMER_TOD_SW_SEC_1_OFFSET	0x0014
    29	#define XPTPTIMER_TOD_SW_NS_OFFSET	0x0018
    30	#define XPTPTIMER_TOD_SW_LOAD_OFFSET	0x001C
    31	#define XPTPTIMER_TOD_SEC_SYS_OFST_0_OFFSET	0x0028
    32	#define XPTPTIMER_TOD_SEC_SYS_OFST_1_OFFSET	0x002C
    33	#define XPTPTIMER_TOD_NS_SYS_OFST_OFFSET	0x0030
    34	#define TOD_LEGACY_SYS_PERIOD_0		0x0130
    35	#define TOD_LEGACY_SYS_PERIOD_1		0x0134
    36	#define TOD_SYS_PERIOD_0		0x0034
    37	#define TOD_SYS_PERIOD_1		0x0038
    38	
    39	#define XPTPTIMER_SYS_SEC_0_OFFSET	0x0100
    40	#define XPTPTIMER_SYS_SEC_1_OFFSET	0x0104
    41	#define XPTPTIMER_SYS_NS_OFFSET		0x0108
    42	
    43	#define XPTPTIMER_PORT_TX_PERIOD_0_OFFSET	0x0208
    44	#define XPTPTIMER_PORT_TX_PERIOD_1_OFFSET	0x020C
    45	#define XPTPTIMER_PORT_TX_NS_SNAP_OFFSET	0x0214
    46	#define XPTPTIMER_PORT_TX_SEC_0_SNAP_OFFSET	0x0218
    47	#define XPTPTIMER_PORT_TX_SEC_1_SNAP_OFFSET	0x021C
    48	#define XPTPTIMER_PORT_RX_PERIOD_0_OFFSET	0x0228
    49	#define XPTPTIMER_PORT_RX_PERIOD_1_OFFSET	0x022C
    50	#define XPTPTIMER_PORT_RX_NS_SNAP_OFFSET	0x0234
    51	#define XPTPTIMER_PORT_RX_SEC_0_SNAP_OFFSET	0x0238
    52	#define XPTPTIMER_PORT_RX_SEC_1_SNAP_OFFSET	0x023C
    53	#define PORT0_SEC_OFFSET_0                     0x0250
    54	#define PORT0_SEC_OFFSET_1                     0x0254
    55	#define PORT0_NS_OFFSET_0                      0x0258
    56	
    57	#define XPTPTIMER_CFG_MAIN_TOD_EN	BIT(0)
    58	#define XPTPTIMER_CFG_ENABLE_PORT0	BIT(16)
    59	#define XPTPTIMER_CFG_AUTO_REF	BIT(4)
    60	
    61	#define XPTPTIMER_MAX_SEC_SIZE		48
  > 62	#define XPTPTIMER_MAX_SEC_MASK		GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
    63	
    64	#define XPTPTIMER_TOD_OFFSET_NEG	BIT(47)
    65	
    66	#define XPTPTIMER_SNAPSHOT_MASK		BIT(0)
    67	#define XPTPTIMER_LOAD_TOD_MASK		BIT(0)
    68	#define XPTPTIMER_LOAD_OFFSET_MASK	BIT(1)
    69	#define XPTPTIMER_ENABLE_SNAPSHOT BIT(5)
    70	#define XPTPTIMER_EXTS_1PPS_INTR_MASK  BIT(16)
    71	
    72	/* TODO This should be derived from the system design */
    73	#define XPTPTIMER_CLOCK_PERIOD		4
    74	#define XPTPTIMER_PERIOD_SHIFT		48
    75	
    76	#define PPM_FRACTION	16
    77	
    78	/* I/O accessors */
    79	static inline u32 xlnx_ptp_ior(struct xlnx_ptp_timer *timer, off_t reg)
    80	{
    81		return ioread32(timer->baseaddr + reg);
    82	}
    83	
    84	static inline void xlnx_ptp_iow(struct xlnx_ptp_timer *timer, off_t reg,
    85					u32 value)
    86	{
    87		iowrite32(value, (timer->baseaddr + reg));
    88	}
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
   101		if (timer->use_sys_timer_only) {
   102			nsec = xlnx_ptp_ior(timer, XPTPTIMER_SYS_NS_OFFSET);
   103			sech = xlnx_ptp_ior(timer, XPTPTIMER_SYS_SEC_1_OFFSET);
   104			secl = xlnx_ptp_ior(timer, XPTPTIMER_SYS_SEC_0_OFFSET);
   105		} else {
   106			/* use TX port here */
   107			nsec = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_NS_SNAP_OFFSET);
   108			secl = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_SEC_0_SNAP_OFFSET);
   109			sech = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_SEC_1_SNAP_OFFSET);
   110		}
   111	
   112		ts->tv_nsec = nsec;
 > 113		ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
   114	}
   115	
   116	static inline void xlnx_port_offset_write(struct xlnx_ptp_timer *timer,
   117						  const struct timespec64 *ts)
   118	{
   119		int i;
   120	
   121		xlnx_ptp_iow(timer, PORT0_SEC_OFFSET_0,
   122			     lower_32_bits(ts->tv_sec));
   123		xlnx_ptp_iow(timer, PORT0_SEC_OFFSET_1,
   124			     upper_32_bits(ts->tv_sec));
   125		/*
   126		 * Two writes are done to PORT0_NS_OFFSET_0 due to IP behavior which
   127		 * uses the same as trigger to accept the whole offset value.
   128		 */
   129		for (i = 0; i < 2; i++) {
   130			xlnx_ptp_iow(timer, PORT0_NS_OFFSET_0,
   131				     (u32)(ts->tv_nsec));
   132		}
   133	}
   134	
   135	static inline void xlnx_tod_offset_write(struct xlnx_ptp_timer *timer,
   136						 const struct timespec64 *ts)
   137	{
   138		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SEC_SYS_OFST_1_OFFSET,
   139			     upper_32_bits(ts->tv_sec));
   140		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SEC_SYS_OFST_0_OFFSET,
   141			     lower_32_bits(ts->tv_sec));
   142		xlnx_ptp_iow(timer, XPTPTIMER_TOD_NS_SYS_OFST_OFFSET,
   143			     (u32)(ts->tv_nsec));
   144	
   145		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
   146			     XPTPTIMER_LOAD_OFFSET_MASK);
   147	}
   148	
   149	static inline void xlnx_tod_load_write(struct xlnx_ptp_timer *timer,
   150					       const struct timespec64 *ts)
   151	{
   152		struct timespec64 offset;
   153	
   154		offset.tv_sec = 0;
   155		offset.tv_nsec = 0;
   156	
   157		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_SEC_1_OFFSET,
   158			     upper_32_bits(ts->tv_sec));
   159		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_SEC_0_OFFSET,
   160			     lower_32_bits(ts->tv_sec));
   161		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_NS_OFFSET, ts->tv_nsec);
   162	
   163		/* Make sure offset registers are cleared */
   164		xlnx_tod_offset_write(timer, &offset);
   165		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
   166			     XPTPTIMER_LOAD_OFFSET_MASK);
   167	
   168		xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
   169			     XPTPTIMER_LOAD_TOD_MASK);
   170		xlnx_port_offset_write(timer, &offset);
   171		timer->timeoffset = 0;
   172	}
   173	
   174	static inline void xlnx_tod_period_write(struct xlnx_ptp_timer *timer, u64 adj)
   175	{
   176		u32 adjhigh = upper_32_bits(adj);
   177	
   178		xlnx_ptp_iow(timer, timer->period_0, (u32)(adj));
   179		xlnx_ptp_iow(timer, timer->period_1, adjhigh);
   180	}
   181	
   182	static inline void xlnx_port_period_write(struct xlnx_ptp_timer *timer, u64 adj)
   183	{
   184		u32 adjhigh = upper_32_bits(adj);
   185	
   186		xlnx_ptp_iow(timer, XPTPTIMER_PORT_TX_PERIOD_0_OFFSET, (u32)(adj));
   187		xlnx_ptp_iow(timer, XPTPTIMER_PORT_RX_PERIOD_0_OFFSET, (u32)(adj));
   188		spin_lock(&timer->reg_lock);
   189		xlnx_ptp_iow(timer, XPTPTIMER_PORT_TX_PERIOD_1_OFFSET, adjhigh);
   190		xlnx_ptp_iow(timer, XPTPTIMER_PORT_RX_PERIOD_1_OFFSET, adjhigh);
   191	
   192		spin_unlock(&timer->reg_lock);
   193	}
   194	
   195	/*
   196	 * PTP clock operations
   197	 */
   198	/**
   199	 * xlnx_ptp_adjfine - Fine adjustment of the frequency on the hardware clock
   200	 * @ptp: ptp clock structure
   201	 * @scaled_ppm: signed scaled parts per million for frequency adjustment.
   202	 * Return: 0 on success
   203	 * TX and RX port periods are reloaded with the adjusted value.
   204	 *
   205	 */
   206	static int xlnx_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
   207	{
   208		struct xlnx_ptp_timer *timer = container_of(ptp, struct xlnx_ptp_timer,
   209						ptp_clock_info);
   210		bool neg_adj = false;
   211		u64 adj;
   212	
   213		if (scaled_ppm < 0) {
   214			neg_adj = true;
   215			scaled_ppm = -scaled_ppm;
   216		}
   217	
   218		adj = mul_u64_u32_div(timer->incr, scaled_ppm, USEC_PER_SEC);
   219		adj >>= PPM_FRACTION; /* remove fractions */
   220		adj = neg_adj ? (timer->incr - adj) : (timer->incr + adj);
   221	
   222		if (timer->use_sys_timer_only)
   223			xlnx_tod_period_write(timer, adj);
   224		else
   225			xlnx_port_period_write(timer, adj);
   226	
   227		return 0;
   228	}
   229	
   230	/**
   231	 * xlnx_ptp_adjtime - Adjust the current time on the hardware clock
   232	 * @ptp: ptp clock structure
   233	 * @delta: signed time in ns to be adjusted.
   234	 * Return: 0 on success
   235	 * System, TX and RX ports are reloaded with the adjusted time.
   236	 *
   237	 */
   238	static int xlnx_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
   239	{
   240		struct xlnx_ptp_timer *timer = container_of(ptp, struct xlnx_ptp_timer,
   241							ptp_clock_info);
   242		struct timespec64 offset;
   243		u64 sign = 0;
   244		s64 cumulative_delta = timer->timeoffset;
   245	
   246		spin_lock(&timer->reg_lock);
   247	
   248		/* Fixed offset between system and port timer */
   249		if (!timer->use_sys_timer_only)
   250			delta += timer->static_delay;
   251		cumulative_delta += delta;
   252		timer->timeoffset = cumulative_delta;
   253		if (cumulative_delta < 0) {
 > 254			sign = XPTPTIMER_TOD_OFFSET_NEG;
   255			cumulative_delta = -cumulative_delta;
   256		}
   257		offset = ns_to_timespec64(cumulative_delta);
   258		offset.tv_sec |= sign;
   259	
   260		if (timer->use_sys_timer_only)
   261			xlnx_tod_offset_write(timer, (const struct timespec64 *)&offset);
   262		else
   263			xlnx_port_offset_write(timer, (const struct timespec64 *)&offset);
   264	
   265		spin_unlock(&timer->reg_lock);
   266	
   267		return 0;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
