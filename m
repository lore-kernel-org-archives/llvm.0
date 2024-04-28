Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108854904;
	Sun, 28 Apr 2024 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714293446; cv=none; b=bFlcOjY1+J4wFuiwuvy7wdGn9eQNFXzstCHNhxolpFmMah/e2wITkhZ7ZhjYfU821tA+UVzcQFPSpXscpvySd38RyecemE0q4CuDI9tVKElQD10UrRfHv7U3IbFg76EE0IN1GFPlmp3A5D3m1jlFS2tIM2q+hDTY/xVvJJLJm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714293446; c=relaxed/simple;
	bh=0Isp7en5eR1+cMdOFdNsRsnqxlIM6CU3z+S5NRzvfmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TpRy0bMnLMAA3AqIai3UYRnBNUlJTgfq8+OU6QFz6d6ZNbLi4Vhnycg9HKAFf13qWz6r+tlz48mxmO0bfnNZ36Z1hKlNE7UeooklotkMOTfSWfHTAWCEO/hIzuWqlfa4H9XtPnE2SPVMALIOIbRW3gxFvsMraQhJ+Wt52fWJeL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmPVMTZX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmPVMTZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714293445; x=1745829445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Isp7en5eR1+cMdOFdNsRsnqxlIM6CU3z+S5NRzvfmw=;
  b=RmPVMTZXMXbvMO3OfinK8wHMTC7XJTGDW14KW4D4mtdidn1hIejZyWMc
   XAJP0UqYaPBtNWMajSIdP5heM4v9W5OjZ2xYfmnX0BrhgBtAYZv+LvbqV
   KQ1/dTXRTplpGsjjLpWwXkCaC9ioQVOUGcCiCCCuGKV+ZTcsOwzsOjWSi
   s90FuIo61AOJ/WM29DpyXb8gR4B/iyVefNsN+Q/GIVp3Uz3wwPz7u31jk
   RppzqjTd9TIOSWAoDeaHDOk77ssFqWuxUfPJ2AbfyiPB7Hi/OeOiTT0UO
   8A9J8BwFtWT6ZwWoOIU8hujRLOk5x7Ck7OKzp2n9BPcAk8yb5c/7CiDq5
   g==;
X-CSE-ConnectionGUID: enSvYVm7TD63mYqOoCYigA==
X-CSE-MsgGUID: JKG3F2pwS46yl5NMWK3xeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13766134"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="13766134"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 01:37:23 -0700
X-CSE-ConnectionGUID: EwWavcfxQ2Cs9PWF1nzS4A==
X-CSE-MsgGUID: Y4OQdjy4SWWk1YJQwEYCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26463960"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2024 01:37:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s102A-00060w-2g;
	Sun, 28 Apr 2024 08:37:18 +0000
Date: Sun, 28 Apr 2024 16:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>
Subject: [drm-xe:drm-xe-next 12/13]
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:321:15: error: variable 'end' is
 uninitialized when used here
Message-ID: <202404281655.e9wgLPAR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   98ad158e543426561fa5df5c4387d4368601866f
commit: c4f18703629dd0112641d6974eb295a53c4a4615 [12/13] drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404281655.e9wgLPAR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281655.e9wgLPAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281655.e9wgLPAR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:12:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:15:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:15:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:15:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:321:15: error: variable 'end' is uninitialized when used here [-Werror,-Wuninitialized]
     321 |                 end = ALIGN(end, align);
         |                             ^~~
   include/linux/align.h:8:38: note: expanded from macro 'ALIGN'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                                 ^
   include/uapi/linux/const.h:31:51: note: expanded from macro '__ALIGN_KERNEL'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
         |                                                             ^
   include/uapi/linux/const.h:32:41: note: expanded from macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                            ^
   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:308:17: note: initialize the variable 'end' to silence this warning
     308 |                 u64 align, end;
         |                               ^
         |                                = 0
   18 errors generated.


vim +/end +321 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

   264	
   265	/**
   266	 * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
   267	 * address range
   268	 *
   269	 * @gt: graphics tile
   270	 * @fence: invalidation fence which will be signal on TLB invalidation
   271	 * completion, can be NULL
   272	 * @start: start address
   273	 * @end: end address
   274	 * @asid: address space id
   275	 *
   276	 * Issue a range based TLB invalidation if supported, if not fallback to a full
   277	 * TLB invalidation. Completion of TLB is asynchronous and caller can either use
   278	 * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
   279	 * completion.
   280	 *
   281	 * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
   282	 * negative error code on error.
   283	 */
   284	int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
   285					 struct xe_gt_tlb_invalidation_fence *fence,
   286					 u64 start, u64 end, u32 asid)
   287	{
   288		struct xe_device *xe = gt_to_xe(gt);
   289	#define MAX_TLB_INVALIDATION_LEN	7
   290		u32 action[MAX_TLB_INVALIDATION_LEN];
   291		int len = 0;
   292	
   293		/* Execlists not supported */
   294		if (gt_to_xe(gt)->info.force_execlist) {
   295			if (fence)
   296				__invalidation_fence_signal(fence);
   297	
   298			return 0;
   299		}
   300	
   301		action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
   302		action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
   303		if (!xe->info.has_range_tlb_invalidation) {
   304			action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
   305		} else {
   306			u64 orig_start = start;
   307			u64 length = end - start;
   308			u64 align, end;
   309	
   310			if (length < SZ_4K)
   311				length = SZ_4K;
   312	
   313			/*
   314			 * We need to invalidate a higher granularity if start address
   315			 * is not aligned to length. When start is not aligned with
   316			 * length we need to find the length large enough to create an
   317			 * address mask covering the required range.
   318			 */
   319			align = roundup_pow_of_two(length);
   320			start = ALIGN_DOWN(start, align);
 > 321			end = ALIGN(end, align);
   322			length = align;
   323			while (start + length < end) {
   324				length <<= 1;
   325				start = ALIGN_DOWN(orig_start, length);
   326			}
   327	
   328			/*
   329			 * Minimum invalidation size for a 2MB page that the hardware
   330			 * expects is 16MB
   331			 */
   332			if (length >= SZ_2M) {
   333				length = max_t(u64, SZ_16M, length);
   334				start = ALIGN_DOWN(orig_start, length);
   335			}
   336	
   337			xe_gt_assert(gt, length >= SZ_4K);
   338			xe_gt_assert(gt, is_power_of_2(length));
   339			xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
   340							    ilog2(SZ_2M) + 1)));
   341			xe_gt_assert(gt, IS_ALIGNED(start, length));
   342	
   343			action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
   344			action[len++] = asid;
   345			action[len++] = lower_32_bits(start);
   346			action[len++] = upper_32_bits(start);
   347			action[len++] = ilog2(length) - ilog2(SZ_4K);
   348		}
   349	
   350		xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
   351	
   352		return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
