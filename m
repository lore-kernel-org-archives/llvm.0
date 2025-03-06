Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A971F5FD;
	Thu,  6 Mar 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265716; cv=none; b=muXryZbxVMnDgTQcyHOo6kvM8TSS9VX30w0eu9XyFPwNG/ge6VkW9qmy1RpePkY8xKoNagFEHp0FIOuOfpjKRyi86iFI7UPNaggQPsuqVwchFxN/7Z3CwUf6z/Bb3dzN7bCYi5bB6RZ36ZUOXD5/svhTgkobsjzCxm4KTAv9E44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265716; c=relaxed/simple;
	bh=MfepG3z7PL/enpUAesx2r9I+gS2tTjoqhBLXs4tdE/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGvrpD+ige8ohPhUKXIVSOUK0RSqSs7b8yxqr6KRcDdymLleuzC6qSTjebveB/02XnbJ/edH3FFMXakFvIzI9njEeEsPtK8YZgYGClyHiulhu/SKrWDBit/Lx34Moq9QoNwqYHeezniCAd6gRS0No05Lfoz6yojjbn7NJXhQp4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqmzW7lV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqmzW7lV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741265714; x=1772801714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MfepG3z7PL/enpUAesx2r9I+gS2tTjoqhBLXs4tdE/Y=;
  b=FqmzW7lVgkoa7oXsAn7qTfyEGM6PyB4mOUaFAV6tKHOm3WtexWyc4aV3
   F0yGR1Dsa9soDRtXxkHIuOyOyUvN4iCJuBD5JCOzl7zZse5AmXamJdMIt
   SXHHsl3IJyGnSiIpxWCmvvUxpB/HHH6qIi85eHLmnsJAiGrlyIRne85DS
   2RAn7CaBlTKwPuRh5in9RIEkidXF0CDnesHXQi4YWpft6RDbk38ElafIO
   wiG2b+rvtLy6riqPn3Xm/OusR+qAy6jbIPWu5wT2PUgxnkg2VxRb/8/1d
   8hNRWgFuhHEkiXYPJT01Cg3lfatmo4HMydwWzRRWZBrA43SJCxOHPjNUu
   Q==;
X-CSE-ConnectionGUID: g9G8uRAJSPCxt4qJuVh+yQ==
X-CSE-MsgGUID: n+6aqHnYREqG+NtlCoCOTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42160665"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42160665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:55:13 -0800
X-CSE-ConnectionGUID: S+FzcU2cRkKmCxw5AX7NSg==
X-CSE-MsgGUID: GxZDo2uFTlOhqYOVjq387w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119208442"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 04:55:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqAko-000N4s-0d;
	Thu, 06 Mar 2025 12:55:10 +0000
Date: Thu, 6 Mar 2025 20:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 05/40] x86/cpu: Remove unnecessary headers and reorder
 the rest
Message-ID: <202503062003.flKq0dy6-lkp@intel.com>
References: <20250304085152.51092-6-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304085152.51092-6-darwi@linutronix.de>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7eb172143d5508b4da468ed59ee857c6e5e01da6]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-S-Darwish/x86-cacheinfo-Validate-cpuid-leaf-0x2-EDX-output/20250304-170332
base:   7eb172143d5508b4da468ed59ee857c6e5e01da6
patch link:    https://lore.kernel.org/r/20250304085152.51092-6-darwi%40linutronix.de
patch subject: [PATCH v1 05/40] x86/cpu: Remove unnecessary headers and reorder the rest
config: i386-buildonly-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250306/202503062003.flKq0dy6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062003.flKq0dy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503062003.flKq0dy6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/intel.c:452:3: error: use of undeclared identifier 'movsl_mask'
     452 |                 movsl_mask.mask = 7;
         |                 ^
   arch/x86/kernel/cpu/intel.c:455:3: error: use of undeclared identifier 'movsl_mask'
     455 |                 movsl_mask.mask = 7;
         |                 ^
   2 errors generated.


vim +/movsl_mask +452 arch/x86/kernel/cpu/intel.c

4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  400  
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  401  	/*
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  402  	 * SEP CPUID bug: Pentium Pro reports SEP but doesn't have it until
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  403  	 * model 3 mask 3
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  404  	 */
b399151cb48db3 arch/x86/kernel/cpu/intel.c  Jia Zhang        2018-01-01  405  	if ((c->x86<<8 | c->x86_model<<4 | c->x86_stepping) < 0x633)
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  406  		clear_cpu_cap(c, X86_FEATURE_SEP);
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  407  
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  408  	/*
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  409  	 * PAE CPUID issue: many Pentium M report no PAE but may have a
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  410  	 * functionally usable PAE implementation.
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  411  	 * Forcefully enable PAE if kernel parameter "forcepae" is present.
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  412  	 */
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  413  	if (forcepae) {
1b74dde7c47c19 arch/x86/kernel/cpu/intel.c  Chen Yucong      2016-02-02  414  		pr_warn("PAE forced!\n");
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  415  		set_cpu_cap(c, X86_FEATURE_PAE);
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  416  		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_NOW_UNRELIABLE);
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  417  	}
69f2366c9456d0 arch/x86/kernel/cpu/intel.c  Chris Bainbridge 2014-03-07  418  
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  419  	/*
f0133acc7d4835 arch/x86/kernel/cpu/intel.c  Borislav Petkov  2016-05-08  420  	 * P4 Xeon erratum 037 workaround.
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  421  	 * Hardware prefetcher may cause stale data to be loaded into the cache.
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  422  	 */
b399151cb48db3 arch/x86/kernel/cpu/intel.c  Jia Zhang        2018-01-01  423  	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_stepping == 1)) {
0b131be8d4125b arch/x86/kernel/cpu/intel.c  H. Peter Anvin   2014-03-13  424  		if (msr_set_bit(MSR_IA32_MISC_ENABLE,
f0133acc7d4835 arch/x86/kernel/cpu/intel.c  Borislav Petkov  2016-05-08  425  				MSR_IA32_MISC_ENABLE_PREFETCH_DISABLE_BIT) > 0) {
c0a639ad0bc6b1 arch/x86/kernel/cpu/intel.c  Borislav Petkov  2014-03-09  426  			pr_info("CPU: C0 stepping P4 Xeon detected.\n");
f0133acc7d4835 arch/x86/kernel/cpu/intel.c  Borislav Petkov  2016-05-08  427  			pr_info("CPU: Disabling hardware prefetching (Erratum 037)\n");
^1da177e4c3f41 arch/i386/kernel/cpu/intel.c Linus Torvalds   2005-04-16  428  		}
^1da177e4c3f41 arch/i386/kernel/cpu/intel.c Linus Torvalds   2005-04-16  429  	}
^1da177e4c3f41 arch/i386/kernel/cpu/intel.c Linus Torvalds   2005-04-16  430  
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  431  	/*
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  432  	 * See if we have a good local APIC by checking for buggy Pentia,
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  433  	 * i.e. all B steppings and the C2 stepping of P54C when using their
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  434  	 * integrated APIC (see 11AP erratum in "Pentium Processor
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  435  	 * Specification Update").
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  436  	 */
93984fbd4e33cc arch/x86/kernel/cpu/intel.c  Borislav Petkov  2016-04-04  437  	if (boot_cpu_has(X86_FEATURE_APIC) && (c->x86<<8 | c->x86_model<<4) == 0x520 &&
b399151cb48db3 arch/x86/kernel/cpu/intel.c  Jia Zhang        2018-01-01  438  	    (c->x86_stepping < 0x6 || c->x86_stepping == 0xb))
9b13a93df267af arch/x86/kernel/cpu/intel.c  Borislav Petkov  2014-06-18  439  		set_cpu_bug(c, X86_BUG_11AP);
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  440  
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  441  
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  442  #ifdef CONFIG_X86_INTEL_USERCOPY
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  443  	/*
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  444  	 * Set up the preferred alignment for movsl bulk memory moves
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  445  	 */
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  446  	switch (c->x86) {
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  447  	case 4:		/* 486: untested */
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  448  		break;
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  449  	case 5:		/* Old Pentia: untested */
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  450  		break;
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  451  	case 6:		/* PII/PIII only like movsl with 8-byte alignment */
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09 @452  		movsl_mask.mask = 7;
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  453  		break;
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  454  	case 15:	/* P4 is OK down to 8-byte alignment */
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  455  		movsl_mask.mask = 7;
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  456  		break;
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  457  	}
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  458  #endif
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  459  
1f442d70c84aa7 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2009-03-07  460  	intel_smp_check(c);
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  461  }
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  462  #else
148f9bb87745ed arch/x86/kernel/cpu/intel.c  Paul Gortmaker   2013-06-18  463  static void intel_workarounds(struct cpuinfo_x86 *c)
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  464  {
4052704d92c317 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  465  }
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  466  #endif
185f3b9da24c09 arch/x86/kernel/cpu/intel.c  Yinghai Lu       2008-09-09  467  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
