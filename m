Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAF43146;
	Sat, 24 May 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748069851; cv=none; b=iYxicXWDHG/qMlu40+9+RJvPa3vB/CYYdEcTwOgJecRwZ4IpxKT3d+LUXXoiqlmq41jX1FISavNQMyWrlXczzeIalTHNttR91aCg+utHwQkFclNxo1lBtjBuxezFzR6p/KcSrG49M6hzQ3VSZRQZlmD5u8LrXtjloQzQzWcahR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748069851; c=relaxed/simple;
	bh=l0A5a8HXherzkDx/ksg6lzJUsTttfFnyl/ZM2Ly+DPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kue4eSUCGsCA82PwL0o96mlU8FTD5OPgcY2j2NvyGj8fJFlkXoWa4kLQif+Cq2aUwh8RIiPxnOtSdGlv86l46pVHac8LKmaj+pPJpifSMrFFXubEBZpqHJjbT5iqx1OFlxlRMEf6YBQVPJZRAGiLV8FHEqNmFDhrqQZphtX1kME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm3ptAQp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm3ptAQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748069849; x=1779605849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0A5a8HXherzkDx/ksg6lzJUsTttfFnyl/ZM2Ly+DPA=;
  b=Vm3ptAQpo4oq9gzF0B/fZIAXAWE8rNggaBNZuEd3qdL9Bl/MR/wbagOe
   BzyR7gSUVe8ZxkRxTShBlJ2QA6g3TJopkobTtTsxBOvyDWm+N0zzrnCla
   0fsJeUvsQAqAgC6+jKycbkpUka3eU6JogQu5Wgk46R5u0MX8PlIH/K4Jf
   gHstuQXtdnSoONn/fqBS0nGxJMcbzDhRwDcjVSDJFKc+hIZFo9+fCvq/q
   CReqGRosZBxFkd74mi+5yZtxLsQ+eVBQWk6Eo/i8SC7HR3pExxQDymc4P
   g+FgjCU38V8skQtDlBRWozJ+680u8l4ZmjxoOFI9chlX82bGdyyZKUz98
   w==;
X-CSE-ConnectionGUID: 8ZxTLFGqSxyDZpLN6YBBFw==
X-CSE-MsgGUID: +YuHaTLJRwKiFKGSEvb7qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50116986"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50116986"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:57:29 -0700
X-CSE-ConnectionGUID: FJlTl8yWTX6qQSdKY7N2Gg==
X-CSE-MsgGUID: ZOdLTrHBTwai/wTMCaggRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146648762"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 May 2025 23:57:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIiov-000R0G-0N;
	Sat, 24 May 2025 06:57:25 +0000
Date: Sat, 24 May 2025 14:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LUCI Bot <vijayendra.suman@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [jlayton:uek-localio 2024/2262] arch/x86/kernel/cpu/intel.c:568:34:
 warning: result of comparison of constant 1615 with expression of type
 '__u8' (aka 'unsigned char') is always false
Message-ID: <202505241420.0BIAggEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: ae99e2e456aca980ec40e20ac1ca7e079330f058 [2024/2262] x86/cpu/intel: enable X86_FEATURE_NT_GOOD on Intel Broadwellx
config: x86_64-buildonly-randconfig-006-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241420.0BIAggEz-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241420.0BIAggEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241420.0BIAggEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/intel.c:568:34: warning: result of comparison of constant 1615 with expression of type '__u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     568 |         if (c->x86 == 6 && c->x86_model == INTEL_BROADWELL_X)
         |                            ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +568 arch/x86/kernel/cpu/intel.c

   523	
   524	static void init_intel(struct cpuinfo_x86 *c)
   525	{
   526		early_init_intel(c);
   527	
   528		intel_workarounds(c);
   529	
   530		init_intel_cacheinfo(c);
   531	
   532		if (c->cpuid_level > 9) {
   533			unsigned eax = cpuid_eax(10);
   534			/* Check for version and the number of counters */
   535			if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
   536				set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
   537		}
   538	
   539		if (cpu_has(c, X86_FEATURE_XMM2))
   540			set_cpu_cap(c, X86_FEATURE_LFENCE_RDTSC);
   541	
   542		if (boot_cpu_has(X86_FEATURE_DS)) {
   543			unsigned int l1, l2;
   544	
   545			rdmsr(MSR_IA32_MISC_ENABLE, l1, l2);
   546			if (!(l1 & MSR_IA32_MISC_ENABLE_BTS_UNAVAIL))
   547				set_cpu_cap(c, X86_FEATURE_BTS);
   548			if (!(l1 & MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL))
   549				set_cpu_cap(c, X86_FEATURE_PEBS);
   550		}
   551	
   552		if (boot_cpu_has(X86_FEATURE_CLFLUSH) &&
   553		    (c->x86_vfm == INTEL_CORE2_DUNNINGTON ||
   554		     c->x86_vfm == INTEL_NEHALEM_EX ||
   555		     c->x86_vfm == INTEL_WESTMERE_EX))
   556			set_cpu_bug(c, X86_BUG_CLFLUSH_MONITOR);
   557	
   558		if (boot_cpu_has(X86_FEATURE_MWAIT) &&
   559		    (c->x86_vfm == INTEL_ATOM_GOLDMONT ||
   560		     c->x86_vfm == INTEL_LUNARLAKE_M))
   561			set_cpu_bug(c, X86_BUG_MONITOR);
   562	
   563	#ifdef CONFIG_X86_64
   564		if (c->x86 == 15)
   565			c->x86_cache_alignment = c->x86_clflush_size * 2;
   566		if (c->x86 == 6)
   567			set_cpu_cap(c, X86_FEATURE_REP_GOOD);
 > 568		if (c->x86 == 6 && c->x86_model == INTEL_BROADWELL_X)
   569			set_cpu_cap(c, X86_FEATURE_NT_GOOD);
   570	#else
   571		/*
   572		 * Names for the Pentium II/Celeron processors
   573		 * detectable only by also checking the cache size.
   574		 * Dixon is NOT a Celeron.
   575		 */
   576		if (c->x86 == 6) {
   577			unsigned int l2 = c->x86_cache_size;
   578			char *p = NULL;
   579	
   580			switch (c->x86_model) {
   581			case 5:
   582				if (l2 == 0)
   583					p = "Celeron (Covington)";
   584				else if (l2 == 256)
   585					p = "Mobile Pentium II (Dixon)";
   586				break;
   587	
   588			case 6:
   589				if (l2 == 128)
   590					p = "Celeron (Mendocino)";
   591				else if (c->x86_stepping == 0 || c->x86_stepping == 5)
   592					p = "Celeron-A";
   593				break;
   594	
   595			case 8:
   596				if (l2 == 128)
   597					p = "Celeron (Coppermine)";
   598				break;
   599			}
   600	
   601			if (p)
   602				strcpy(c->x86_model_id, p);
   603		}
   604	#endif
   605	
   606		/* Work around errata */
   607		srat_detect_node(c);
   608	
   609		init_ia32_feat_ctl(c);
   610	
   611		init_intel_misc_features(c);
   612	
   613		split_lock_init();
   614	
   615		intel_init_thermal(c);
   616	}
   617	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
