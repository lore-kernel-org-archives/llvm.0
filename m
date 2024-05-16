Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B52342A97;
	Thu, 16 May 2024 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715855637; cv=none; b=ddPaVn7eE28Et3OlhGhvZkUKU4ztSsThLN4t7Tt8YLoY0pHQuuw9aG/NygQANTLDxWpOFHDdBWrfauGSSkHU4F0XtBrqJUIfPlzP+iwRkAHw1Jd7fF3X+UFvz7pxJ/740u1hzaok5Pm+xnsExnWiU7MrqyAlPS9ij8531GANSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715855637; c=relaxed/simple;
	bh=WXBUGlXm0tAZwLnRHhAPbmlNzhV6+bELFh0GSGrNOtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPSW3STaV4rDzdbKu7YpjeDuvTbH+SelPw0pKpMdZVoDVGwpfSVAArZbKA3tylVUo0D7cRz3LlaskRhuQPbuqGRJ2ikfyMpHbjVeXmLeUVby+CgycCFboRzPSFNXtos6WGxKFHyC1HQFCG0BVQg5klY+LSPx1uAEmAIPk1bmu1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maZGbqC1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maZGbqC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715855635; x=1747391635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WXBUGlXm0tAZwLnRHhAPbmlNzhV6+bELFh0GSGrNOtw=;
  b=maZGbqC1CnZhcd7g4Gcl2LuCo5+HAFOVfAwwFtGpwGcTOrUyrTI5cg4x
   u53/TnNpBX52jAM9eiQbugMkGLkrfxbcBLya75RLFR0nUOvAdCS32toIX
   LNNY2lYpArwSjaVhLGskUwNyIQHTUOyMPkKRT7gkCFAG8z45t5R5m7s99
   dcO15Aav5Frs8dEgrz2F7Y02Wbrxn5aHWTpvq2zzv49r9TCTSAr1KN/uh
   AFpS9Wlx7geek7jRRD/zu8WEBENgukk64evrY50XwkwoJNAOa+nujH1IY
   csIbMcCoD8fCVzzISqEEIBuG19dvs+yyVa01EWWP2ZhCqS//EbPQj56IA
   Q==;
X-CSE-ConnectionGUID: UrvI0u2gShmbYWQA7luSGg==
X-CSE-MsgGUID: 9jTmV75gTsC/vmhGLCUdGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12068617"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="12068617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:33:54 -0700
X-CSE-ConnectionGUID: 70QJqXNfS5uUnMRnnRnsYA==
X-CSE-MsgGUID: nx4R9gmyTJiNO7wPVgLR3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31511326"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2024 03:33:52 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7YQo-000E99-1B;
	Thu, 16 May 2024 10:33:50 +0000
Date: Thu, 16 May 2024 18:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] block: introduce helper function to calculate
 bps budgt
Message-ID: <202405161846.6WR9ZYYH-lkp@intel.com>
References: <20240515012350.1166350-2-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515012350.1166350-2-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on v6.9]
[cannot apply to axboe-block/for-next linus/master next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/block-introduce-helper-function-to-calculate-bps-budgt/20240515-092646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240515012350.1166350-2-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH 1/2] block: introduce helper function to calculate bps budgt
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240516/202405161846.6WR9ZYYH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405161846.6WR9ZYYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161846.6WR9ZYYH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-throttle.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from block/blk-throttle.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from block/blk-throttle.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from block/blk-throttle.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> block/blk-throttle.c:2380:10: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    2380 |                 return U64_MAX;
         |                 ~~~~~~ ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   8 warnings generated.


vim +2380 block/blk-throttle.c

  2368	
  2369	unsigned long blk_throttle_budgt(struct block_device *bdev)
  2370	{
  2371		struct request_queue *q = bdev_get_queue(bdev);
  2372		struct blkcg *blkcg;
  2373		struct blkcg_gq *blkg;
  2374		struct throtl_grp *tg;
  2375		long long bytes_allowed = 0;
  2376		unsigned long jiffy_elapsed, jiffy_elapsed_rnd;
  2377		u64 bps_limit;
  2378	
  2379		if (!q)
> 2380			return U64_MAX;
  2381	
  2382		rcu_read_lock();
  2383		spin_lock_irq(&q->queue_lock);
  2384		blkcg =	css_to_blkcg(task_css(current, io_cgrp_id));
  2385		if (!blkcg)
  2386			goto out;
  2387	
  2388		blkg = blkg_lookup(blkcg, q);
  2389		if (!blkg || !blkg_tryget(blkg))
  2390			goto out;
  2391	
  2392		tg = blkg_to_tg(blkg);
  2393		bps_limit = tg_bps_limit(tg, READ);
  2394		if (bps_limit == U64_MAX)
  2395			goto out;
  2396	
  2397		jiffy_elapsed = jiffy_elapsed_rnd = jiffies - tg->slice_start[READ];
  2398		if (!jiffy_elapsed)
  2399			jiffy_elapsed_rnd = tg->td->throtl_slice;
  2400	
  2401		jiffy_elapsed_rnd = roundup(jiffy_elapsed_rnd, tg->td->throtl_slice);
  2402		bytes_allowed = calculate_bytes_allowed(bps_limit, jiffy_elapsed_rnd) +
  2403				tg->carryover_bytes[READ];
  2404		blkg_put(blkg);
  2405	out:
  2406		spin_unlock_irq(&q->queue_lock);
  2407		rcu_read_unlock();
  2408		return bytes_allowed;
  2409	}
  2410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
