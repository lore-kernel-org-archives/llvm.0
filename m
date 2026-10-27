Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095795;
	b=YpLCBuCuS9FuoYFgJpA4z7yJH71M558LvB9PWMbgOh+RKyPkOgIxEvWAAkzwT0nkCl1+
	 4KPpL8gc9aG/Os2l09dYsXC9qvHW+xcmdTME+U4yP2IxE4Jl919TMAKtmACVw2DR+nMME
	 S2JheQlDGD0UaCioSxWNUuek5trR0KHGOw9HSjoNjAn/rVp8ITr9wBieTssa0DKtY//qv
	 rLGWaFrGA+f0T7JViB0JxGhUwCrSHsQqJ9Xpxd7lAUkxmwYgjQauUECJWWOJfW3c3KvD8
	 UdW/5MkcFK4XpNpLuAEdF1SCP0o66gPYXtzF/SByvVLYwmujPNo1DEnXcsjulAoYQ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095795;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=t4Wp2CERSkPQBs1N7oEfOmaN2478PDOfPQaW5G48NZQ=;
	b=IMHW2ga64c5s5Hw8v+0GSbC1Gm0IASkgNyFDDYnGCwVovnMF4TYYLysiwcXHgmG/rvwV
	 0NSJkIkTL4Gi9q38jGCrZVWm2DbgZAQ9YRiOVwndBydkQHXC2E3G3H+K4ZtST7F+H/DQX
	 Outc2JR9meqQ2/E0BAZBPmPFk+vDU6aanqWy+bKVjR7uKpWgaq53c60+h+JskQbT3/T11
	 CP5/Ev4GJxVtJoDNZpRBjoLRvWM5NRLJReqDmTYFTvzhj3FHRBJxGcuhO/mnz6mGZccNF
	 NWJGzzxo5+rXATNKOSY8Sp7TkGc7CCtJ8ChAUvZTpKRW16fIJLPURBv7ivCPA6xPgnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QzbOIchD;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06442606A320;
	Tue, 27 Oct 2026 10:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06442606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QzbOIchD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793095794; x=1824631794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UKqMYXXut2lTCf7jDkoq6hLEMqqdc/pViH8/r8Z+g3o=;
  b=QzbOIchDnsqG5xd9EM3SD8rE44ZrtYQIIkLZyv2zXzb6uEWsAlHEvPX/
   FUgxjF8G8aGcAfyYpIKr9R7vgEjOF6lhTX8O/73/h2GsBtI6WZOKI8Ryz
   6fzA7CiFKYQU2OAGaqXgv3VcqZznLchjHTSmULNdhr5yzzjp5a3D8/ER4
   q+6juUZt6VjiCycA5cWqIre41zKmM6fCrfXpPVE9X+PhTj2YArYkB6bHY
   r+t71pWloVQdhrK/PY9YNfJ5QbyGHX/vsmR6IlzvUD87vwiPOa3fxrp9+
   Z8yUTHnizfcre+tFqfZmN/4Hsmyz3B2Zuu5RYcyYET65A3eWJ86lrAK9d
   Q==;
X-CSE-ConnectionGUID: 3jy3og59SyOGDq4vM7EG3g==
X-CSE-MsgGUID: TYsab8gqT3K/9TKG4u+CDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1681722"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1681722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:09:53 -0700
X-CSE-ConnectionGUID: w5fNWj53TOS5CF+PkzH8Zw==
X-CSE-MsgGUID: Q3Xepr0XT/CcYXWypqkakQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4898248"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2026 03:09:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLe7n-00000000X6M-2UQP;
	Tue, 27 Oct 2026 10:09:47 +0000
Date: Tue, 27 Oct 2026 18:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 4/4] s390/maccess: Remove spinlock from
 __s390_kernel_write()
Message-ID: <202610271855.Il2BMBvq-lkp@intel.com>
References: <20261026120329.1792436-5-hca@linux.ibm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026120329.1792436-5-hca@linux.ibm.com>

Hi Heiko,

kernel test robot noticed the following build errors:

[auto build test ERROR on s390/features]
[also build test ERROR on trace/for-next bpf-next/master bpf/master linus/master v7.3 next-20261026]
[cannot apply to bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Carstens/s390-jump_label-Serialize-text-patching-with-text_mutex/20261026-130326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20261026120329.1792436-5-hca%40linux.ibm.com
patch subject: [PATCH 4/4] s390/maccess: Remove spinlock from __s390_kernel_write()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261027/202610271855.Il2BMBvq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271855.Il2BMBvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271855.Il2BMBvq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/mm/maccess.c:9:
>> include/linux/text-patching.h:10:9: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      10 |         return memcpy(dst, src, len);
         |                ^
   include/linux/text-patching.h:10:9: note: include the header <string.h> or explicitly provide a declaration for 'memcpy'
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:


vim +10 include/linux/text-patching.h

0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23   6) 
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23   7) #ifndef text_poke_copy
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23   8) static inline void *text_poke_copy(void *dst, const void *src, size_t len)
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23   9) {
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23 @10) 	return memcpy(dst, src, len);
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23  11) }
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23  12) #define text_poke_copy text_poke_copy
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23  13) #endif
0c3beacf681ec89 Mike Rapoport (Microsoft  2024-10-23  14) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
