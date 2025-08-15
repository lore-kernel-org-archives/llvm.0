Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF71244690;
	Fri, 15 Aug 2025 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755296541; cv=none; b=YbdrF4JHiLqBaRvmtj817pAXuA6MSbTNNIcPPssgPBj5LGl1tSCMo1jEikEXbHCodrpC2mj1hppbIgZ/ggtGh0kvPD5KIYP7te5+4XqG73cTJcnSSUpPixqE1e3rYAfJ5miuf6Tt+DnDCbGHH5lqBURF/n/1HlVGX9qm0xkNcmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755296541; c=relaxed/simple;
	bh=rlz1d9LsvcWlEPWkqwLZElvZjSmmYzmNQeal2OI916c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdpgXCd5Ogb1dyZtMASIDHQbi+s84dWd8H0Ek0AnNed1m7fRp3U2UzpcA6KIcKr0uzFvkbUEqW25zy0ZElhhwI6JGPNIWd1Ow5J5USQV/keC66OFps5NikNtbh3ypkZ02MnQ8f+OqGnDWwlfbGcqWSM4tmA63/7MFUQyM/Aiqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbQTByZG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbQTByZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755296539; x=1786832539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rlz1d9LsvcWlEPWkqwLZElvZjSmmYzmNQeal2OI916c=;
  b=NbQTByZGc39W+tv92uyyk79b/JEu+N2C8Onu4em+Yih6eMVPy57XI4hw
   QLnkJN6OUbxYQ52lBZt/DIj7/zYT+j0Lq3BZhzaaQ7uP+ucj+8h3HDwF2
   DJxab9tNYgAwz/U0Go+2UnnLQ1wD34CLlZvy/EolrJyo4acxQDha+8c63
   LJ+U70pOTzppUOJnuVaWGphBBLCO22aom2umn9R1QOiNBLo3XR4t/AvLN
   iB+vfflhU5s1zyWMUe7y5DbSAFGgzF/dnfIoYeydq9Vf/oFdLLtV+gP3V
   YYHQTHNIoIcuQPbKmvK2N0YPgyBp3N9kBnrDF3hSC5pdFp8zlMShncxvK
   w==;
X-CSE-ConnectionGUID: vge78UitR6uA2yblXUEOSw==
X-CSE-MsgGUID: q7kVDzXjSiObMUXYlDjaUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83047361"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="83047361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 15:22:17 -0700
X-CSE-ConnectionGUID: /l69yfstRseWhFNa3uTt8A==
X-CSE-MsgGUID: XmUroueYQK+jRUx640uyWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171552393"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2025 15:22:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un2oO-000COO-30;
	Fri, 15 Aug 2025 22:22:12 +0000
Date: Sat, 16 Aug 2025 06:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 18/18] arm64: mm: Batch kpkeys level switches
Message-ID: <202508160646.pIunjEB7-lkp@intel.com>
References: <20250815085512.2182322-19-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815085512.2182322-19-kevin.brodsky@arm.com>

Hi Kevin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/mm-Introduce-kpkeys/20250815-165820
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250815085512.2182322-19-kevin.brodsky%40arm.com
patch subject: [RFC PATCH v5 18/18] arm64: mm: Batch kpkeys level switches
config: arm64-randconfig-004-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160646.pIunjEB7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160646.pIunjEB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160646.pIunjEB7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:57:37: error: call to undeclared function 'kpkeys_set_level'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         current->thread.por_el1_lazy_mmu = kpkeys_set_level(KPKEYS_LVL_PGTABLES);
         |                                            ^
>> arch/arm64/include/asm/pgtable.h:75:3: error: call to undeclared function '__kpkeys_set_pkey_reg_nosync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      75 |                 __kpkeys_set_pkey_reg_nosync(saved_por_el1);
         |                 ^
>> arch/arm64/include/asm/pgtable.h:77:3: error: call to undeclared function 'arch_kpkeys_restore_pkey_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |                 arch_kpkeys_restore_pkey_reg(saved_por_el1);
         |                 ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:23:
   In file included from arch/arm64/include/asm/ftrace.h:41:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:23:
   In file included from arch/arm64/include/asm/ftrace.h:41:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:23:
   In file included from arch/arm64/include/asm/ftrace.h:41:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:23:
   In file included from arch/arm64/include/asm/ftrace.h:41:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:23:
   In file included from arch/arm64/include/asm/ftrace.h:41:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:23:
   In file included from arch/arm64/include/asm/ftrace.h:41:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   12 warnings and 3 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=2934569318
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=2934569318
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2934569318
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2934569318


vim +/kpkeys_set_level +57 arch/arm64/include/asm/pgtable.h

    51	
    52	static void kpkeys_lazy_mmu_enter(void)
    53	{
    54		if (!kpkeys_hardened_pgtables_enabled())
    55			return;
    56	
  > 57		current->thread.por_el1_lazy_mmu = kpkeys_set_level(KPKEYS_LVL_PGTABLES);
    58	}
    59	
    60	static void kpkeys_lazy_mmu_exit(void)
    61	{
    62		u64 saved_por_el1;
    63	
    64		if (!kpkeys_hardened_pgtables_enabled())
    65			return;
    66	
    67		saved_por_el1 = current->thread.por_el1_lazy_mmu;
    68	
    69		/*
    70		 * We skip any barrier if TIF_LAZY_MMU_PENDING is set:
    71		 * emit_pte_barriers() will issue an ISB just after this function
    72		 * returns.
    73		 */
    74		if (test_thread_flag(TIF_LAZY_MMU_PENDING))
  > 75			__kpkeys_set_pkey_reg_nosync(saved_por_el1);
    76		else
  > 77			arch_kpkeys_restore_pkey_reg(saved_por_el1);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
