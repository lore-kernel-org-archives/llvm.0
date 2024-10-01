Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37741CBE8A;
	Tue,  1 Oct 2024 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802515; cv=none; b=UIKocsHBp96hTddvUkFabZ5MAwMXqsqBQkmlXhrxpD2JLUWlN25dwmYdVTR3jEpQ8nLf8sbiW95vccoKA68vq+18AXt+faZPqWtAdB6/Xp7a5GdKT2tDVWSf1z+cw3Rj1zjipkL/YGVEQiDKLaiXedNA0tGLiZDZsSUQ+GFT0fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802515; c=relaxed/simple;
	bh=LSIvE0bonvGOjFRYo2a2gp1X6FhuUVdwp67GJuC4WTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jbo+jYV6ri8/kP7cz3vYQQSx7iggzFb6y7sVnNlWYEhFGHOdvTyYbxBFXFtvPbq1zqb94ka8TvCF+ZAEgsaLSsCqmXtEw+7WLqVmm6iIvOqtT5eiWfmja9jVInkrsKQabWnWLSaN9Ow5fzt/1Bm/h2uw6AaqiG3aAFqN0XG/xZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9SvA3Co; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9SvA3Co"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727802513; x=1759338513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSIvE0bonvGOjFRYo2a2gp1X6FhuUVdwp67GJuC4WTI=;
  b=a9SvA3CobJkWDih9cMGeOuR/srojxAEb5mFqYAmszvKHvBQZyORSdheS
   r7NYsp5k3LkFi9yv9pL1xCLIXiuFZLZMYjGiwDrpORq6QifIbQWuXX1nU
   mDsETP1Cr2snrZnhvHEMynr4imsKjb6KFaN0BJS5jzHezRtZkn58gegkO
   gC5UHRpNleTrTI3QPzKWr43xTg5e1+0jMIipzl2Ke1hC37ictbHQrydZF
   TEbOdOkkB0dbD8ijdYq12j38LqJJjaQmW/ntshlrBbQW4Mem77RFPAs2v
   Jufi/lF1dqmG0kPHqza5Neq9ANQsHeL7pBPjlmyuiY35IEGXeNcsujU8s
   g==;
X-CSE-ConnectionGUID: eVnolRxiQAKYRntjTkqC7g==
X-CSE-MsgGUID: DG28LZGESni3PcLYjQu4WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27088634"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27088634"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 10:08:33 -0700
X-CSE-ConnectionGUID: 19STQk1aR3SN8r/7ioJp3A==
X-CSE-MsgGUID: LHWrMZtuTquzzbtfK4+OvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="73616875"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2024 10:08:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svgMO-000QzB-2D;
	Tue, 01 Oct 2024 17:08:28 +0000
Date: Wed, 2 Oct 2024 01:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 5/8]
 drivers/net/ethernet/pensando/ionic/ionic_txrx.c:203:30: warning: implicit
 conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes
 value from 65536 to 0
Message-ID: <202410020117.DiGJI30C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   c90f89d40fd21ce040b5cf1485ec6913d1b4ea5d
commit: 394ca992d5179367add42d631858f72a3bf4870d [5/8] arch: introduce set_direct_map_valid_noflush()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410020117.DiGJI30C-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020117.DiGJI30C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020117.DiGJI30C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/pensando/ionic/ionic_txrx.c:4:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/pensando/ionic/ionic_txrx.c:11:
   In file included from drivers/net/ethernet/pensando/ionic/ionic.h:10:
   In file included from drivers/net/ethernet/pensando/ionic/ionic_dev.h:11:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:9:
   In file included from include/linux/filter.h:19:
   include/linux/set_memory.h:38:1: error: expected identifier or '('
      38 | {
         | ^
>> drivers/net/ethernet/pensando/ionic/ionic_txrx.c:203:30: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     203 |                 frag_len = min_t(u16, len, IONIC_PAGE_SIZE);
         |                            ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/net/ethernet/pensando/ionic/ionic_dev.h:184:32: note: expanded from macro 'IONIC_PAGE_SIZE'
     184 | #define IONIC_PAGE_SIZE                         MIN(PAGE_SIZE, IONIC_MAX_BUF_LEN)
         |                                                     ^
   arch/powerpc/include/asm/page.h:25:34: note: expanded from macro 'PAGE_SIZE'
      25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
         |                                               ^
   include/linux/minmax.h:329:28: note: expanded from macro 'MIN'
     329 | #define MIN(a,b) __cmp(min,a,b)
         |                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:213:52: note: expanded from macro 'min_t'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/minmax.h:96:33: note: expanded from macro '__cmp_once'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:31: note: expanded from macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                ~~    ^
   drivers/net/ethernet/pensando/ionic/ionic_txrx.c:803:36: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     803 |                 first_frag_len = min_t(u16, len, IONIC_PAGE_SIZE);
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/net/ethernet/pensando/ionic/ionic_dev.h:184:32: note: expanded from macro 'IONIC_PAGE_SIZE'
     184 | #define IONIC_PAGE_SIZE                         MIN(PAGE_SIZE, IONIC_MAX_BUF_LEN)
         |                                                     ^
   arch/powerpc/include/asm/page.h:25:34: note: expanded from macro 'PAGE_SIZE'
      25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
         |                                               ^
   include/linux/minmax.h:329:28: note: expanded from macro 'MIN'
     329 | #define MIN(a,b) __cmp(min,a,b)
         |                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:213:52: note: expanded from macro 'min_t'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/minmax.h:96:33: note: expanded from macro '__cmp_once'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:31: note: expanded from macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                ~~    ^
   drivers/net/ethernet/pensando/ionic/ionic_txrx.c:838:38: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     838 |                         frag_len = min_t(u16, remain_len, IONIC_PAGE_SIZE);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/net/ethernet/pensando/ionic/ionic_dev.h:184:32: note: expanded from macro 'IONIC_PAGE_SIZE'
     184 | #define IONIC_PAGE_SIZE                         MIN(PAGE_SIZE, IONIC_MAX_BUF_LEN)
         |                                                     ^
   arch/powerpc/include/asm/page.h:25:34: note: expanded from macro 'PAGE_SIZE'
      25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
         |                                               ^
   include/linux/minmax.h:329:28: note: expanded from macro 'MIN'
     329 | #define MIN(a,b) __cmp(min,a,b)
         |                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:213:52: note: expanded from macro 'min_t'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/minmax.h:96:33: note: expanded from macro '__cmp_once'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:31: note: expanded from macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                ~~    ^
   7 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +203 drivers/net/ethernet/pensando/ionic/ionic_txrx.c

36a47c906b2324 Shannon Nelson 2024-03-06  174  
36a47c906b2324 Shannon Nelson 2024-03-06  175  static struct sk_buff *ionic_rx_build_skb(struct ionic_queue *q,
4dcd4575bfb17d Shannon Nelson 2024-03-06  176  					  struct ionic_rx_desc_info *desc_info,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  177  					  unsigned int headroom,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  178  					  unsigned int len,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  179  					  unsigned int num_sg_elems,
180e35cdf035d1 Shannon Nelson 2024-02-14  180  					  bool synced)
0f3154e6bcb354 Shannon Nelson 2019-09-03  181  {
4b0a7539a3728f Shannon Nelson 2021-03-10  182  	struct ionic_buf_info *buf_info;
08f2e4b2b2008c Shannon Nelson 2019-10-23  183  	struct sk_buff *skb;
08f2e4b2b2008c Shannon Nelson 2019-10-23  184  	unsigned int i;
08f2e4b2b2008c Shannon Nelson 2019-10-23  185  	u16 frag_len;
08f2e4b2b2008c Shannon Nelson 2019-10-23  186  
4b0a7539a3728f Shannon Nelson 2021-03-10  187  	buf_info = &desc_info->bufs[0];
e75ccac1d0644c Shannon Nelson 2021-07-27  188  	prefetchw(buf_info->page);
08f2e4b2b2008c Shannon Nelson 2019-10-23  189  
89e572e7369fd9 Shannon Nelson 2021-03-10  190  	skb = napi_get_frags(&q_to_qcq(q)->napi);
89e572e7369fd9 Shannon Nelson 2021-03-10  191  	if (unlikely(!skb)) {
89e572e7369fd9 Shannon Nelson 2021-03-10  192  		net_warn_ratelimited("%s: SKB alloc failed on %s!\n",
36a47c906b2324 Shannon Nelson 2024-03-06  193  				     dev_name(q->dev), q->name);
2854242d23a7b3 Shannon Nelson 2024-03-06  194  		q_to_rx_stats(q)->alloc_err++;
08f2e4b2b2008c Shannon Nelson 2019-10-23  195  		return NULL;
89e572e7369fd9 Shannon Nelson 2021-03-10  196  	}
ac8813c0ab7d28 Shannon Nelson 2024-09-06  197  	skb_mark_for_recycle(skb);
08f2e4b2b2008c Shannon Nelson 2019-10-23  198  
f81da39bf4c0a5 Shannon Nelson 2024-02-14  199  	if (headroom)
36a47c906b2324 Shannon Nelson 2024-03-06  200  		frag_len = min_t(u16, len,
36a47c906b2324 Shannon Nelson 2024-03-06  201  				 IONIC_XDP_MAX_LINEAR_MTU + VLAN_ETH_HLEN);
f81da39bf4c0a5 Shannon Nelson 2024-02-14  202  	else
ac8813c0ab7d28 Shannon Nelson 2024-09-06 @203  		frag_len = min_t(u16, len, IONIC_PAGE_SIZE);
f81da39bf4c0a5 Shannon Nelson 2024-02-14  204  
36a47c906b2324 Shannon Nelson 2024-03-06  205  	if (unlikely(!buf_info->page))
36a47c906b2324 Shannon Nelson 2024-03-06  206  		goto err_bad_buf_page;
36a47c906b2324 Shannon Nelson 2024-03-06  207  	ionic_rx_add_skb_frag(q, skb, buf_info, headroom, frag_len, synced);
36a47c906b2324 Shannon Nelson 2024-03-06  208  	len -= frag_len;
4b0a7539a3728f Shannon Nelson 2021-03-10  209  	buf_info++;
4b0a7539a3728f Shannon Nelson 2021-03-10  210  
36a47c906b2324 Shannon Nelson 2024-03-06  211  	for (i = 0; i < num_sg_elems; i++, buf_info++) {
36a47c906b2324 Shannon Nelson 2024-03-06  212  		if (unlikely(!buf_info->page))
36a47c906b2324 Shannon Nelson 2024-03-06  213  			goto err_bad_buf_page;
ac8813c0ab7d28 Shannon Nelson 2024-09-06  214  		frag_len = min_t(u16, len, buf_info->len);
36a47c906b2324 Shannon Nelson 2024-03-06  215  		ionic_rx_add_skb_frag(q, skb, buf_info, 0, frag_len, synced);
36a47c906b2324 Shannon Nelson 2024-03-06  216  		len -= frag_len;
36a47c906b2324 Shannon Nelson 2024-03-06  217  	}
08f2e4b2b2008c Shannon Nelson 2019-10-23  218  
08f2e4b2b2008c Shannon Nelson 2019-10-23  219  	return skb;
36a47c906b2324 Shannon Nelson 2024-03-06  220  
36a47c906b2324 Shannon Nelson 2024-03-06  221  err_bad_buf_page:
36a47c906b2324 Shannon Nelson 2024-03-06  222  	dev_kfree_skb(skb);
36a47c906b2324 Shannon Nelson 2024-03-06  223  	return NULL;
0f3154e6bcb354 Shannon Nelson 2019-09-03  224  }
0f3154e6bcb354 Shannon Nelson 2019-09-03  225  

:::::: The code at line 203 was first introduced by commit
:::::: ac8813c0ab7d2816946379bff2677a5f725e37bf ionic: convert Rx queue buffers to use page_pool

:::::: TO: Shannon Nelson <shannon.nelson@amd.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
