Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B325A643;
	Fri, 17 Jan 2025 03:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737085060; cv=none; b=hwjHIJA4k+204b2fdfa04WmdjPC4lWCoA/n5+sIbvfL4Dj/E6uFaer31iwZfuAQoja11TAc88vlb8ts2nILVoOs1Zku8rV9HWgNb0FcJzV2iW8SevV5cxrVWx9Bhp5LXGWJt5/cZB/FBCwfOBV1EZIk+moWGkswODwS07xDFE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737085060; c=relaxed/simple;
	bh=HMUUDGxdOQTfRDHxaMnVQv2gVwyu1y0efKo/sfsIA6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbnrcMrGUyVwNz53oIq6B0/bgbIHiRe5y/pZel16Taf6AEOlL0pZUvZT5JprGaS+xhAxk0oORHylf6/EjBQsqYjHtPY9JhQe//GRHLFwErL1myW3N84oQHY8FrNAEomF23D65n1m1Mk5TUzM7JGR3yEbB20cLEhle3wzLwUEONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFLwkiLu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFLwkiLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737085059; x=1768621059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HMUUDGxdOQTfRDHxaMnVQv2gVwyu1y0efKo/sfsIA6c=;
  b=VFLwkiLuywngzPyKIu6XYd5EPCFDC8v2+Pw4/dvZtyvhJlLzIDagRCt2
   ZqVpre58+FsKJskXQ+7FWX7AYBRHyZk48O+P3/NqVNRpdAFCIl6/N0CBc
   xO8QIeNqpeptiQLoSwaSQplYgis4YJjTj14/x4EkDo4GIyAg6dI9Kw0p1
   umL98qA9LITKoNDSxGTpE4ClrH/cK1zTG+Q0tQexNYJm1kBoPELgKbvbX
   Kich/1UmtL2BEbeMBty2aKPfnEIunvKt6LXdb7C7cvvtIwkP5eWukMcZo
   YnLzDLrwwkcFQIzO5xis3YYRYB5Y8KSEDdg/n7yMCF6T0NbUnK5TLwScR
   g==;
X-CSE-ConnectionGUID: s4sJmJCsTjqW4/o956i2Eg==
X-CSE-MsgGUID: BX+bNfQmTVa+Va9gpUVgXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="47994674"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="47994674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 19:37:38 -0800
X-CSE-ConnectionGUID: F/uXfhJoRlGFp7QxPl5O9A==
X-CSE-MsgGUID: SIdSKJNZR7WXAK5LqKdzWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110321782"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jan 2025 19:37:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYdAs-000ShT-15;
	Fri, 17 Jan 2025 03:37:34 +0000
Date: Fri, 17 Jan 2025 11:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 05/12] x86/mm: add INVLPGB support code
Message-ID: <202501171121.nQcwVI41-lkp@intel.com>
References: <20250116023127.1531583-6-riel@surriel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116023127.1531583-6-riel@surriel.com>

Hi Rik,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on tip/master linus/master tip/x86/core v6.13-rc7]
[cannot apply to tip/auto-latest next-20250116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-mm-make-MMU_GATHER_RCU_TABLE_FREE-unconditional/20250116-103657
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/20250116023127.1531583-6-riel%40surriel.com
patch subject: [PATCH v5 05/12] x86/mm: add INVLPGB support code
config: i386-buildonly-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171121.nQcwVI41-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171121.nQcwVI41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171121.nQcwVI41-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:13:
>> arch/x86/include/asm/invlpgb.h:26:49: error: invalid input size for constraint 'a'
      26 |         asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
         |                                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3995685176
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=3995685176
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3995685176
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3995685176
   make: Target 'prepare' not remade because of errors.


vim +/a +26 arch/x86/include/asm/invlpgb.h

     7	
     8	/*
     9	 * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
    10	 *
    11	 * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
    12	 * be done in a parallel fashion.
    13	 *
    14	 * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
    15	 * this CPU have completed.
    16	 */
    17	static inline void __invlpgb(unsigned long asid, unsigned long pcid,
    18				     unsigned long addr, u16 extra_count,
    19				     bool pmd_stride, unsigned long flags)
    20	{
    21		u32 edx = (pcid << 16) | asid;
    22		u32 ecx = (pmd_stride << 31) | extra_count;
    23		u64 rax = addr | flags;
    24	
    25		/* INVLPGB; supported in binutils >= 2.36. */
  > 26		asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
