Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116A38238C;
	Thu, 15 Oct 2026 05:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041557; cv=none; b=d2eG/dWe3PTx/ng9gy6M2FnFTxwLj9JY3pJ3QHBYdcmKDVsgnasqSjZqavwG3yjNX+BysImuQ2A1NcoT8JirZErTfLLT+SgjAQl2udWS3LqqkkiZ5Q+kO2+jppT+BvRdzyR98WW1Oyk9l+iyRO8GIN3jUmkZPxw04Nwpib2c3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041557; c=relaxed/simple;
	bh=FoeawiQPoWwDwsqwIARaIt2YgnZv7MYMcEPPmiNLyRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M6grIeC7LeNPPHtpB/+ivg1FTC54crpXL7s4o4+o85gc5ck7wDPjwLPYmiEa0AKSWAkD0vipmJ/VkhJ9B2VTrHxm4snfOb3N5x2tueH3wiKqFLFRT7+hDncZxawtTp/qqZp08biA4/tSIzRH4vh9IvhNRWV14rgntFERS3Od4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhXYbtiG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhXYbtiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792041557; x=1823577557;
  h=date:from:to:cc:subject:message-id;
  bh=FoeawiQPoWwDwsqwIARaIt2YgnZv7MYMcEPPmiNLyRo=;
  b=fhXYbtiGk5ejlnHCSXy5aIBqixGHmjkjewqNPK5QKdzHrlQ+TvTZzZuS
   HPILu9GeDeCubbUlHTu7WedM/ex7Ij2Wm4fUkc9eqbLHcihsTjik5bN7E
   K9uEY3vflNCHOXH2dplrOtpXw4jECbEb10qF7StBCKcUdE6EXBpbWM6+J
   wwKP8OTaNyospHABZ8dQoRMUB+wHCJybGG8BhMoT5Wfc7Q4lytxQJAkGc
   ULcK4ZLwstYQdUq+/4U1dsFY3jAOVngmOZi8QPkIuKCoVRi4eUMkZfpSi
   ABjSSRJMfsk6daV8W+x/T+8pbqu73zEBMXfHqXNGNDfaKIk3lgjgD6rf1
   g==;
X-CSE-ConnectionGUID: CWKQ4cqPQ8SxRKK3MgXEJg==
X-CSE-MsgGUID: vlu5QQuZR+anrFAjoawjMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="803072"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="803072"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:19:13 -0700
X-CSE-ConnectionGUID: l4ASfIbiQM+qQy4uWzxu9Q==
X-CSE-MsgGUID: AgcJu14ARHehCEP70EaoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1704473"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2026 22:19:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHDrx-00000000Bd9-1xzG;
	Thu, 15 Oct 2026 05:19:09 +0000
Date: Thu, 15 Oct 2026 07:18:54 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs-store-gcscre0 6/6]
 arch/arm64/kernel/signal.c:753:22: error: no member named 'gcs_el0_mode' in
 'struct thread_struct'; did you mean 'gcs_el0_locked'?
Message-ID: <202610150747.IICDPmuf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs-store-gcscre0
head:   7f99cf9ccec2ef02e83b4cef2449ee2a931448cd
commit: 7f99cf9ccec2ef02e83b4cef2449ee2a931448cd [6/6] arm64/gcs: Store GCSCRE0_EL1 values instead of userspace mode
config: arm64-randconfig-2001-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150747.IICDPmuf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150747.IICDPmuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150747.IICDPmuf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/signal.c:753:22: error: no member named 'gcs_el0_mode' in 'struct thread_struct'; did you mean 'gcs_el0_locked'?
     753 |         if (current->thread.gcs_el0_mode != enabled)
         |                             ^~~~~~~~~~~~
         |                             gcs_el0_locked
   arch/arm64/include/asm/processor.h:200:16: note: 'gcs_el0_locked' declared here
     200 |         unsigned int            gcs_el0_locked;
         |                                 ^
   1 error generated.


vim +753 arch/arm64/kernel/signal.c

16f47bb9ac8afe0 Mark Brown 2024-10-01  735  
16f47bb9ac8afe0 Mark Brown 2024-10-01  736  static int restore_gcs_context(struct user_ctxs *user)
16f47bb9ac8afe0 Mark Brown 2024-10-01  737  {
16f47bb9ac8afe0 Mark Brown 2024-10-01  738  	u64 gcspr, enabled;
16f47bb9ac8afe0 Mark Brown 2024-10-01  739  	int err = 0;
16f47bb9ac8afe0 Mark Brown 2024-10-01  740  
16f47bb9ac8afe0 Mark Brown 2024-10-01  741  	if (user->gcs_size != sizeof(*user->gcs))
16f47bb9ac8afe0 Mark Brown 2024-10-01  742  		return -EINVAL;
16f47bb9ac8afe0 Mark Brown 2024-10-01  743  
16f47bb9ac8afe0 Mark Brown 2024-10-01  744  	__get_user_error(gcspr, &user->gcs->gcspr, err);
16f47bb9ac8afe0 Mark Brown 2024-10-01  745  	__get_user_error(enabled, &user->gcs->features_enabled, err);
16f47bb9ac8afe0 Mark Brown 2024-10-01  746  	if (err)
16f47bb9ac8afe0 Mark Brown 2024-10-01  747  		return err;
16f47bb9ac8afe0 Mark Brown 2024-10-01  748  
eab95b122151dce Mark Brown 2026-10-14  749  	/*
eab95b122151dce Mark Brown 2026-10-14  750  	 * Don't allow any mode changes, the signal handler should use
eab95b122151dce Mark Brown 2026-10-14  751  	 * pcrtl() to disable if it wants to do that.
eab95b122151dce Mark Brown 2026-10-14  752  	 */
eab95b122151dce Mark Brown 2026-10-14 @753  	if (current->thread.gcs_el0_mode != enabled)
16f47bb9ac8afe0 Mark Brown 2024-10-01  754  		return -EINVAL;
16f47bb9ac8afe0 Mark Brown 2024-10-01  755  
16f47bb9ac8afe0 Mark Brown 2024-10-01  756  	/*
16f47bb9ac8afe0 Mark Brown 2024-10-01  757  	 * We let userspace set GCSPR_EL0 to anything here, we will
16f47bb9ac8afe0 Mark Brown 2024-10-01  758  	 * validate later in gcs_restore_signal().
16f47bb9ac8afe0 Mark Brown 2024-10-01  759  	 */
16f47bb9ac8afe0 Mark Brown 2024-10-01  760  	write_sysreg_s(gcspr, SYS_GCSPR_EL0);
16f47bb9ac8afe0 Mark Brown 2024-10-01  761  
16f47bb9ac8afe0 Mark Brown 2024-10-01  762  	return 0;
16f47bb9ac8afe0 Mark Brown 2024-10-01  763  }
16f47bb9ac8afe0 Mark Brown 2024-10-01  764  

:::::: The code at line 753 was first introduced by commit
:::::: eab95b122151dce193998db2f05cab3a4b79ceed arm64/gcs: Don't allow any GCS mode changes in signal return

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
