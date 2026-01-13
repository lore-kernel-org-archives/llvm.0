Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48A17B505;
	Tue, 13 Jan 2026 18:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329100; cv=none; b=MC8wXJ6+4OpILCe4QPBdlG4U/OnBeCOqCYmGm8GssSkoSJG4DicKVlQ740uOO9sMaAi1ege2Hq9OH/ARvywkd91E9UjDSXtd8sfdFGz1AzONwMI2dFdrjPEbSAZhgZ4z/w09e3hVpcraEIhyUTjiAfh37mCTqfNwqx4KmkVn7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329100; c=relaxed/simple;
	bh=3AWZAJ32y/BInKU15Siv1AEUwH+rprNm7o35xEBnh+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I5ozBZQzR31ESPtqH9hj8PfDRf+gGqo3PK6QL3jXxd5oj7KUYC6XimiBFwAEm8MFRKOuksxFmgC4ksXT+ia+K20p7dgHnEaBDSMNOzGCd4YiUD3LhwsEsToap1kMwmRWLhs6qa4vUwSjpkB1cIZCYGvGL7lXCMyVg2kcv+/YRuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1xx2Vc1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1xx2Vc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768329099; x=1799865099;
  h=date:from:to:cc:subject:message-id;
  bh=3AWZAJ32y/BInKU15Siv1AEUwH+rprNm7o35xEBnh+s=;
  b=c1xx2Vc1KM8NNpJB0w8z6ujnulfjc3O6s9AmCHdndWka6JB4nnoUHeQf
   AjN051gYACueru+8CzlEGZRbPvcMdSYw3X2Udxu2oYKOYKzHkBYi8jHJR
   YOh4h3RpIKsdfya6FY8EscyM9qiSdQK8T3LIIwbfj2TTdgjO6hjJICPUI
   QwfIIDBnhunvkXt8ctGu1kquWzxz49xIUhO5xRL0DiHjGkewL+JFJS7D9
   TVQLxD33x7cC3V3dKp4uzv8n/Yt+sx6fJ9H/47fWGRwTokf2epBERuknx
   NFPLCLscMRQHECT0Eju4r+dzIpHyV12xTe969kmXIqgaYlLGmOzvcDVJI
   g==;
X-CSE-ConnectionGUID: A4j9SVzxRlmXh2sf3umRGQ==
X-CSE-MsgGUID: 5OpRv/85Tse50DgDmjgowg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68628484"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68628484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:31:38 -0800
X-CSE-ConnectionGUID: pM7Rj2fXT0CwbqVRRcanog==
X-CSE-MsgGUID: pQAbL+twTe+MAcuCm/0EpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235179086"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 10:31:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfjB0-00000000FES-1M4Q;
	Tue, 13 Jan 2026 18:31:34 +0000
Date: Wed, 14 Jan 2026 02:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 11/14]
 include/linux/kernel_stat.h:164:2: error: call to undeclared function
 'kcpustat_fetch_default'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601140209.AiluAvrk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   8c562e5c98799c4f2ed88dfc1c3266a4d4e2e7a8
commit: 3f8381521f4337e859f0e9379a4b527d8bd54c64 [11/14] tick/sched: Consolidate fetching idle time
config: arm-randconfig-001-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140209.AiluAvrk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140209.AiluAvrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140209.AiluAvrk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
>> include/linux/kernel_stat.h:164:2: error: call to undeclared function 'kcpustat_fetch_default'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |         kcpustat_fetch_default(dst, cpu);
         |         ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1 shuffle=2057609588
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=2057609588
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2057609588
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2057609588
   make: Target 'prepare' not remade because of errors.


vim +/kcpustat_fetch_default +164 include/linux/kernel_stat.h

   161	
   162	static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   163	{
 > 164		kcpustat_fetch_default(dst, cpu);
   165	}
   166	#endif /* !CONFIG_VIRT_CPU_ACCOUNTING_GEN */
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
