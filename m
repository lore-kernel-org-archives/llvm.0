Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C0B1DFCC;
	Thu,  2 Nov 2023 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY6TakfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698945476; x=1730481476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MWipMJE00I35wm9mvKmO5f27TXal4/HduGfx97+LPFY=;
  b=aY6TakfTIXuUkVJnGaI3TztyDqpRMkspqbv4laX/eIgYMNmUMgaac8ag
   yWu0MLoT0Mc4mdxtEtrWyjTywEvml7FADOkd+nC4AR89A+STGuLjTVN7Q
   5jqqeWLFLDdioaLtl4lWit0uhTUxYi+qXQl2niEnnqgj8cyiCsWJX4Lq2
   75zpzyzRo1QrgSNs56UrEC0CWRh8npjQzlsFz+Edy9rAApx2mt28KNXk0
   oyrYlKZK+nWs5BkE0qZC4kPJsrKYXbuTQzHMSgFU4JY0MGlA6jWFqArPt
   YEVaEkv3aHpuZeAPHywhzxIPFVuJB/5qtHT8ca7+Zk1aGI3bgBUzb9zNJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379160530"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="379160530"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="754863198"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="754863198"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2023 10:17:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qybKD-0001hk-1q;
	Thu, 02 Nov 2023 17:17:45 +0000
Date: Fri, 3 Nov 2023 01:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] mm/vmstat: rename pgdemote_* to pgdemote_dst_*
 and add pgdemote_src_*
Message-ID: <202311030137.Vu2ki6zm-lkp@intel.com>
References: <20231102025648.1285477-4-lizhijian@fujitsu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102025648.1285477-4-lizhijian@fujitsu.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.6 next-20231102]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhijian/mm-vmstat-Move-pgdemote_-to-per-node-stats/20231102-135849
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231102025648.1285477-4-lizhijian%40fujitsu.com
patch subject: [PATCH RFC 3/4] mm/vmstat: rename pgdemote_* to pgdemote_dst_* and add pgdemote_src_*
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231103/202311030137.Vu2ki6zm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030137.Vu2ki6zm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030137.Vu2ki6zm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:19:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/vmscan.c:19:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/vmscan.c:19:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/vmscan.c:1114:4: error: use of undeclared identifier 'PGDEMOTE_SRC_DIRECT'
    1114 |                         PGDEMOTE_SRC_DIRECT - PGDEMOTE_SRC_KSWAPD);
         |                         ^
>> mm/vmscan.c:1114:26: error: use of undeclared identifier 'PGDEMOTE_SRC_KSWAPD'
    1114 |                         PGDEMOTE_SRC_DIRECT - PGDEMOTE_SRC_KSWAPD);
         |                                               ^
>> mm/vmscan.c:1118:4: error: use of undeclared identifier 'PGDEMOTE_SRC_KHUGEPAGED'
    1118 |                         PGDEMOTE_SRC_KHUGEPAGED - PGDEMOTE_SRC_KSWAPD);
         |                         ^
   mm/vmscan.c:1118:30: error: use of undeclared identifier 'PGDEMOTE_SRC_KSWAPD'
    1118 |                         PGDEMOTE_SRC_KHUGEPAGED - PGDEMOTE_SRC_KSWAPD);
         |                                                   ^
   mm/vmscan.c:1121:15: error: use of undeclared identifier 'PGDEMOTE_SRC_DIRECT'
    1121 |         BUILD_BUG_ON(PGDEMOTE_SRC_DIRECT - PGDEMOTE_SRC_KSWAPD !=
         |                      ^
   mm/vmscan.c:1121:37: error: use of undeclared identifier 'PGDEMOTE_SRC_KSWAPD'
    1121 |         BUILD_BUG_ON(PGDEMOTE_SRC_DIRECT - PGDEMOTE_SRC_KSWAPD !=
         |                                            ^
>> mm/vmscan.c:1122:4: error: use of undeclared identifier 'PGDEMOTE_DST_DIRECT'
    1122 |                         PGDEMOTE_DST_DIRECT - PGDEMOTE_DST_KSWAPD);
         |                         ^
>> mm/vmscan.c:1122:26: error: use of undeclared identifier 'PGDEMOTE_DST_KSWAPD'
    1122 |                         PGDEMOTE_DST_DIRECT - PGDEMOTE_DST_KSWAPD);
         |                                               ^
   mm/vmscan.c:1123:15: error: use of undeclared identifier 'PGDEMOTE_SRC_KHUGEPAGED'
    1123 |         BUILD_BUG_ON(PGDEMOTE_SRC_KHUGEPAGED - PGDEMOTE_SRC_KSWAPD !=
         |                      ^
   mm/vmscan.c:1123:41: error: use of undeclared identifier 'PGDEMOTE_SRC_KSWAPD'
    1123 |         BUILD_BUG_ON(PGDEMOTE_SRC_KHUGEPAGED - PGDEMOTE_SRC_KSWAPD !=
         |                                                ^
>> mm/vmscan.c:1124:4: error: use of undeclared identifier 'PGDEMOTE_DST_KHUGEPAGED'
    1124 |                         PGDEMOTE_DST_KHUGEPAGED - PGDEMOTE_DST_KSWAPD);
         |                         ^
   mm/vmscan.c:1124:30: error: use of undeclared identifier 'PGDEMOTE_DST_KSWAPD'
    1124 |                         PGDEMOTE_DST_KHUGEPAGED - PGDEMOTE_DST_KSWAPD);
         |                                                   ^
   mm/vmscan.c:1687:7: error: use of undeclared identifier 'PGDEMOTE_SRC_KSWAPD'
    1687 |                     PGDEMOTE_SRC_KSWAPD + reclaimer_offset(), nr_succeeded);
         |                     ^
   mm/vmscan.c:1689:7: error: use of undeclared identifier 'PGDEMOTE_DST_KSWAPD'
    1689 |                     PGDEMOTE_DST_KSWAPD + reclaimer_offset(), nr_succeeded);
         |                     ^
   12 warnings and 14 errors generated.


vim +/PGDEMOTE_SRC_DIRECT +1114 mm/vmscan.c

  1110	
  1111	static int reclaimer_offset(void)
  1112	{
  1113		BUILD_BUG_ON(PGSTEAL_DIRECT - PGSTEAL_KSWAPD !=
> 1114				PGDEMOTE_SRC_DIRECT - PGDEMOTE_SRC_KSWAPD);
  1115		BUILD_BUG_ON(PGSTEAL_DIRECT - PGSTEAL_KSWAPD !=
  1116				PGSCAN_DIRECT - PGSCAN_KSWAPD);
  1117		BUILD_BUG_ON(PGSTEAL_KHUGEPAGED - PGSTEAL_KSWAPD !=
> 1118				PGDEMOTE_SRC_KHUGEPAGED - PGDEMOTE_SRC_KSWAPD);
  1119		BUILD_BUG_ON(PGSTEAL_KHUGEPAGED - PGSTEAL_KSWAPD !=
  1120				PGSCAN_KHUGEPAGED - PGSCAN_KSWAPD);
> 1121		BUILD_BUG_ON(PGDEMOTE_SRC_DIRECT - PGDEMOTE_SRC_KSWAPD !=
> 1122				PGDEMOTE_DST_DIRECT - PGDEMOTE_DST_KSWAPD);
  1123		BUILD_BUG_ON(PGDEMOTE_SRC_KHUGEPAGED - PGDEMOTE_SRC_KSWAPD !=
> 1124				PGDEMOTE_DST_KHUGEPAGED - PGDEMOTE_DST_KSWAPD);
  1125	
  1126	
  1127		if (current_is_kswapd())
  1128			return 0;
  1129		if (current_is_khugepaged())
  1130			return PGSTEAL_KHUGEPAGED - PGSTEAL_KSWAPD;
  1131		return PGSTEAL_DIRECT - PGSTEAL_KSWAPD;
  1132	}
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
