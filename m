Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2694330E83D;
	Thu, 20 Nov 2025 23:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763682702; cv=none; b=i2AQ2MUDcrN2PL6/P9UK629TKsMyl4nB3ZseyHVUlH3kw6awLUIYn2afbTEaBYkR9xHtGp71xrUKjlglNy5YabsttvuJciNbxSnNHMit/IbyfZg4Wlr2/2JmO1Vm9+3Ap5oiwWVr2iKV25+0f2pLTykv2W6HgWZCWS9arbosQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763682702; c=relaxed/simple;
	bh=tfY9iskeCWBEPoDuh3STSI+ptArsUMIrmkwQetAgPYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TP/SQyl6qbHfdsxAmj0qILOuC0xglIofLlPqzDV+vzq0051bfTQuohkfGhHvxIDAkLM3hLNUeip0jk9eZEN5DvC0yHF3xlZwvDXLL6aps0MLBvrDC10k8DyjMMVqWtbrlPQN6honwnhNRv6QQfodwIN79zmTnSORmlGvRwcSji0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbJ9ftP1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbJ9ftP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763682700; x=1795218700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tfY9iskeCWBEPoDuh3STSI+ptArsUMIrmkwQetAgPYc=;
  b=VbJ9ftP1XLXDBNToTj3DJr6nkJBxXUUJhqEAYOt9mGa5/MRZHcXpOq38
   l/dMKpHcoRi0bGm/+qUB814Ew2w28njQTea38LoIVxOqvXexc7OSuJ+hF
   OOgRyKKJ+9BcwiyZ6scAvgdOjDi1CbajfC6ikViuI2vSPFe738GolZms+
   XahcYEewCk9REF8Fm5jX9wfXNMwxG2CdjcamGd8xaGu8ewlIKivgVFREn
   NRl0qXz4wbPFVF21K5RXO4pelyhxHnbHU0ulr/P9lFsEnU30Z3B35tn2V
   33Yx/msTkw3PEJADgcqaO1VdrUKdLnbhR+ijiE/P/J+dt9489GXIYQYN+
   Q==;
X-CSE-ConnectionGUID: E8Ki4YFCTV2orxqdbtGAVg==
X-CSE-MsgGUID: LfLOMTtxQcS0zo3nM2UpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53342210"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="53342210"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 15:51:39 -0800
X-CSE-ConnectionGUID: Q21C/DXmSxq7XtVz+zHzJA==
X-CSE-MsgGUID: vZa6fhBESJ2C2RPoucBVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="195998889"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2025 15:51:38 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMER5-0004jL-2f;
	Thu, 20 Nov 2025 23:51:35 +0000
Date: Fri, 21 Nov 2025 07:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 04/16] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <202511210742.8iW087m6-lkp@intel.com>
References: <20251120214616.14386-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120214616.14386-5-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build errors:

[auto build test ERROR on e5d330e13f67d574f683c052c9a342814fd8fa39]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20251121-055548
base:   e5d330e13f67d574f683c052c9a342814fd8fa39
patch link:    https://lore.kernel.org/r/20251120214616.14386-5-lyude%40redhat.com
patch subject: [PATCH v14 04/16] irq & spin_lock: Add counted interrupt disabling/enabling
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251121/202511210742.8iW087m6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210742.8iW087m6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210742.8iW087m6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:13:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:16:
>> arch/arm/include/asm/smp.h:15:3: error: "<asm/smp.h> included in non-SMP build"
      15 | # error "<asm/smp.h> included in non-SMP build"
         |   ^
   In file included from arch/arm/kernel/asm-offsets.c:13:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:64:
   In file included from include/linux/lockdep.h:14:
>> include/linux/smp.h:198:9: warning: 'raw_smp_processor_id' macro redefined [-Wmacro-redefined]
     198 | #define raw_smp_processor_id()                  0
         |         ^
   arch/arm/include/asm/smp.h:18:9: note: previous definition is here
      18 | #define raw_smp_processor_id() (current_thread_info()->cpu)
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \


vim +15 arch/arm/include/asm/smp.h

^1da177e4c3f41 include/asm-arm/smp.h      Linus Torvalds 2005-04-16  13  
^1da177e4c3f41 include/asm-arm/smp.h      Linus Torvalds 2005-04-16  14  #ifndef CONFIG_SMP
4baa9922430662 arch/arm/include/asm/smp.h Russell King   2008-08-02 @15  # error "<asm/smp.h> included in non-SMP build"
^1da177e4c3f41 include/asm-arm/smp.h      Linus Torvalds 2005-04-16  16  #endif
^1da177e4c3f41 include/asm-arm/smp.h      Linus Torvalds 2005-04-16  17  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
