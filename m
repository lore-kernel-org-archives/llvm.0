Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218B79C8;
	Tue, 11 Feb 2025 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232945; cv=none; b=H0Wg+dHG3ZcXaI4PSdosy7E7K/a+nI8BrsY8mbv8Ms0qJ82wUScgDZU4eNk8jseU8NiiJnmaIPDfV2gh6Zn+N1DKID1Jt6+AvAklHD52Fw30H4aSXQN3EpnegBdJnDqA7Eyvfo5lVR7kNN5lvCkA0tuREFFtE6sF7pd/BQsqV3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232945; c=relaxed/simple;
	bh=jP2/DBnUGN3BOpehz5g1+zoYGsD68CHwfFOqF/YpI0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U36rf4KRY29haGtitIxR1cYDGkiu+g1ae7Ey04SgXLqkvN4XnATsMsfULCvgKn8rupaiXueJKXAxsZS0S1EGWl9vTJLFTHrxPWIn4eKuk6rOm/++mHqaHrMnaq5ZtLBu8px768heg3o5RFMvaBPXJo9qR8K1/ShgnT3TSWrouNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDDpf1bh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDDpf1bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739232943; x=1770768943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jP2/DBnUGN3BOpehz5g1+zoYGsD68CHwfFOqF/YpI0k=;
  b=MDDpf1bhQcbQDID+rPyEHDLEQBOrO40GmbCwfCcttsFXfjD0/2P5Spzq
   brsJPQS6koN2wr0n383ggKMVjEjOZP6mX+2Ts6YWfWDKm0+5WAN9b9WM8
   xRypWZbPwzFW6C3dYfDx8anzK4b4VkIXfTjsU1DcyoFQmKnqe51iUScud
   ycoBdMM2MVO9Ktf+4beNP0mmyMS6rcsDfnH0GEBL37SKyaP3pSS18OPwF
   49lztJvWgW19eBV1aXWxjE3w4O2s1A1YPoHiFAHNbY08ki6OklfxZnxjH
   Cwt8c2MG+3WW3VxcNaZBuP1uMc0a01lU9nRqpYSqTnOGCBmctklUQqYzp
   w==;
X-CSE-ConnectionGUID: eIbaZpFzRL2DGeZcswsqQA==
X-CSE-MsgGUID: IgrU06WFT2S++K9fjTY2VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="51230291"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="51230291"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:15:43 -0800
X-CSE-ConnectionGUID: dV0J4/6SSNK4MqSB+EczmA==
X-CSE-MsgGUID: emHhbxrrR46lcR3JjhJu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112280225"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2025 16:15:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thdwA-0013YZ-2r;
	Tue, 11 Feb 2025 00:15:38 +0000
Date: Tue, 11 Feb 2025 08:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] ACPI/MRRM: Create /sys/devices/system/memory/rangeX
 ABI
Message-ID: <202502110859.OJYEQrj1-lkp@intel.com>
References: <20250210211223.6139-3-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210211223.6139-3-tony.luck@intel.com>

Hi Tony,

kernel test robot noticed the following build errors:

[auto build test ERROR on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/ACPICA-Define-MRRM-ACPI-table/20250211-051427
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210211223.6139-3-tony.luck%40intel.com
patch subject: [PATCH 2/4] ACPI/MRRM: Create /sys/devices/system/memory/rangeX ABI
config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502110859.OJYEQrj1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110859.OJYEQrj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110859.OJYEQrj1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_ext.c:6:
>> include/linux/memory.h:196:55: error: use of undeclared identifier 'EONENT'
     196 | static inline int mrrm_max_mem_region(void) { return -EONENT; }
         |                                                       ^
   1 error generated.
--
   In file included from mm/slab_common.c:12:
>> include/linux/memory.h:196:55: error: use of undeclared identifier 'EONENT'
     196 | static inline int mrrm_max_mem_region(void) { return -EONENT; }
         |                                                       ^
   In file included from mm/slab_common.c:34:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   2 warnings and 1 error generated.
--
   In file included from mm/mm_init.c:13:
>> include/linux/memory.h:196:55: error: use of undeclared identifier 'EONENT'
     196 | static inline int mrrm_max_mem_region(void) { return -EONENT; }
         |                                                       ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/mm_init.c:16:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
--
   In file included from mm/migrate.c:22:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/migrate.c:43:
>> include/linux/memory.h:196:55: error: use of undeclared identifier 'EONENT'
     196 | static inline int mrrm_max_mem_region(void) { return -EONENT; }
         |                                                       ^
   2 warnings and 1 error generated.


vim +/EONENT +196 include/linux/memory.h

   191	
   192	#ifdef CONFIG_ACPI_MRRM
   193	int mrrm_max_mem_region(void);
   194	int memory_subsys_device_register(struct device *dev);
   195	#else
 > 196	static inline int mrrm_max_mem_region(void) { return -EONENT; }
   197	static inline int memory_subsys_device_register(struct device *dev) { return -EINVAL; }
   198	#define memory_subsys_device_register memory_subsys_device_register
   199	#endif
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
