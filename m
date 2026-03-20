Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923EB2571A0;
	Fri, 20 Mar 2026 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773986705; cv=none; b=EX4/rtEnTjP1l86xn6X9danCyh8Xc1O3nwcmKgq7tIi13oKWPYSi1Xi3Lxm3bPFvWwlNKSfZVjB+cXHpnH+h1lIlUleI0F6FnTf17Fz7ZQP0q94iQfKA2D2JQ+C3mfNgoIFHYbeyT9TCcDgw26yQ1IaYLr8Ba4G74CsreIBArPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773986705; c=relaxed/simple;
	bh=rpkXrLH8z/s+5uSJGgzutwsCDT30FSrI7wd+RGUKlME=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aIFJ5c8necHNIAAP+olZaEDdFBDVIrVuiw/x/UXnFE2s6m0W0gBrjaiHneghoWdvERDg73nOzdmtKCn/76JwvXS/uAAY7DYDYBLT90CEDzgnwVPWaAvEE6+ZUm85g7IHP2+ncUG4LPuabV3r5B0mmPQ0YdkHwLKgbDQTUasC1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es9uj6OC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es9uj6OC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773986703; x=1805522703;
  h=date:from:to:cc:subject:message-id;
  bh=rpkXrLH8z/s+5uSJGgzutwsCDT30FSrI7wd+RGUKlME=;
  b=Es9uj6OC83WZ3bjNJp0E5FtCuKajxwRka5LuzR8kp62W8fUJsak8Qe6Q
   cyXWf10hVue+lgvK26gieWa5xyrk0CopGDLkksWtnzAaWr01lpiFX5wOZ
   9bx4LhPaERkVCh/oVK3KvWo1j+sOGju6VfY73SMnPGhO9zP6Pgc69QBzH
   10j3297gDxNtwg1zDYMz9Ehb4dtj7pzb0RakLbM116C/wa9fattP+d69d
   LxA5RhyXEI4NoKH5hu+leNWkN3NPZu3nvNS8cqKJER2JBqsZT5pvMsR69
   TVWvH3R+9K5URnCAPWdxNx4ojlFsF9mM++HRIU4vFTheXK4y+jwC4KdYH
   Q==;
X-CSE-ConnectionGUID: COXP/63rRCKwMeXGyULjxQ==
X-CSE-MsgGUID: jK7v5gOXQCa8tsheGCL+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97684601"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="97684601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 23:05:03 -0700
X-CSE-ConnectionGUID: xNTxSEETS1qvJ5A6peaGwQ==
X-CSE-MsgGUID: UhMc72JCQ1S0tFEl1Ami0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246220576"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2026 23:05:01 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Sx7-0000000022n-3h89;
	Fri, 20 Mar 2026 06:03:36 +0000
Date: Fri, 20 Mar 2026 14:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 11/11]
 kernel/futex/core.c:1460:44: error: no member named 'cs_pop_size32' in
 'struct futex_unlock_cs_range'; did you mean 'pop_size32'?
Message-ID: <202603201426.5NP65QiV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0
commit: 5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0 [11/11] x86/vdso: Implement __vdso_futex_robust_try_unlock()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260320/202603201426.5NP65QiV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201426.5NP65QiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201426.5NP65QiV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/futex/core.c:1460:44: error: no member named 'cs_pop_size32' in 'struct futex_unlock_cs_range'; did you mean 'pop_size32'?
    1460 |         futex_robust_list_clear_pending(pop, csr->cs_pop_size32 ? FLAGS_ROBUST_LIST32 : 0);
         |                                                   ^~~~~~~~~~~~~
         |                                                   pop_size32
   include/linux/futex_types.h:42:22: note: 'pop_size32' declared here
      42 |         unsigned int           pop_size32;
         |                                ^
   1 error generated.


vim +1460 kernel/futex/core.c

091f92a56d090b Thomas Gleixner 2026-03-14  1451  
663a342874dcae Thomas Gleixner 2026-03-14  1452  #ifdef CONFIG_FUTEX_ROBUST_UNLOCK
663a342874dcae Thomas Gleixner 2026-03-14  1453  void __futex_fixup_robust_unlock(struct pt_regs *regs, struct futex_unlock_cs_range *csr)
663a342874dcae Thomas Gleixner 2026-03-14  1454  {
663a342874dcae Thomas Gleixner 2026-03-14  1455  	void __user *pop = arch_futex_robust_unlock_get_pop(regs);
663a342874dcae Thomas Gleixner 2026-03-14  1456  
663a342874dcae Thomas Gleixner 2026-03-14  1457  	if (!pop)
663a342874dcae Thomas Gleixner 2026-03-14  1458  		return;
663a342874dcae Thomas Gleixner 2026-03-14  1459  
663a342874dcae Thomas Gleixner 2026-03-14 @1460  	futex_robust_list_clear_pending(pop, csr->cs_pop_size32 ? FLAGS_ROBUST_LIST32 : 0);
663a342874dcae Thomas Gleixner 2026-03-14  1461  }
663a342874dcae Thomas Gleixner 2026-03-14  1462  #endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
663a342874dcae Thomas Gleixner 2026-03-14  1463  

:::::: The code at line 1460 was first introduced by commit
:::::: 663a342874dcaee9a1192cb7fd250d47749fd78f futex: Provide infrastructure to plug the non contended robust futex unlock race

:::::: TO: Thomas Gleixner <tglx@kernel.org>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
