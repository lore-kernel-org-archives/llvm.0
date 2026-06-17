Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4032330EF6C;
	Wed, 17 Jun 2026 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781724254; cv=none; b=eOcSBjEEuhVknE+zhnxRofdKzjVp+8ZgruLNh+wF1oqFnNpVVpshMeVp7Fsi8HdesWUIAu9aK2Xr2Q8jufDrzxaH8sgpkSElzJSrFOVqAUX4YZHOmzf++RkjXpefwnfMqBE8q/RKulXyzqKjxzZS1mSjdSOP1C0qNxKbRYAjc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781724254; c=relaxed/simple;
	bh=qFK2G9/Yl6Bi7bKYooGj0b3EilYUtFQhV33nLaZE26Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DP/06v0iFLeECHKDSDxoaUMuaYBaONsoqufSJeIsNLRYJ6yyWvD+PD77qOUZ9H4gQrebr1K7cRRBxO2LGNUp2G7J1HEOMwxPvIpuBPqqGfHmO986j/nF3zBuIQM2Pu1x1w//tURxnS2MRZZmrT0HQBKMlLVOTZNvKaTcQLKPyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7nmCUC7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7nmCUC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781724252; x=1813260252;
  h=date:from:to:cc:subject:message-id;
  bh=qFK2G9/Yl6Bi7bKYooGj0b3EilYUtFQhV33nLaZE26Y=;
  b=G7nmCUC7uI1Jlquy2RFDJO9rDlmPvBJKnvC25s/KGc9T1uwCu24gbhHE
   rOjxbvkMlZyVhit5Ae1AyeUAJvKU5qISznMBIn+t4OZhPu1JchJYecY2Q
   l9U+oPM13zLRiuaoem+s4RcZS68OFqsf9HglrMXKR4+w9jJGyT4WjQ32Z
   9d6O20LPuomB0pdLHD0vVwDXlpT0HfuVPh1gPkQMBd9CUperr+MJoCnZg
   IzglHaYIZSwkiH6/YHH/V4zBfE1zpwZheSHxujgmg6oE/drbFw2SUIRY6
   R4aoJ+anOUKC+papBH34y/hKFm/eyOrXeEOCTnoUFxoW2Gn2wZG/XjmIt
   Q==;
X-CSE-ConnectionGUID: sjBdT8GDR/aeOCUFLdwNkg==
X-CSE-MsgGUID: DBaxJHcsTh+8fdI9U2D8wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86382330"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="86382330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 12:24:11 -0700
X-CSE-ConnectionGUID: nTmzT0TbT9m/TVHaUuBpng==
X-CSE-MsgGUID: kcLd8BhHRQ2v8zHmqTx/sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="253120427"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2026 12:24:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZvrr-00000000UvG-1SD8;
	Wed, 17 Jun 2026 19:24:07 +0000
Date: Thu, 18 Jun 2026 03:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:cbqri-cache-alloc-dt 6/9]
 drivers/resctrl/cbqri_resctrl.c:760:25: warning: variable 'cbqri_cpuhp_state'
 set but not used
Message-ID: <202606180357.Sg4Ghszc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git cbqri-cache-alloc-dt
head:   0dcf47d709583f17b82dac6c73d3c8c98903438d
commit: 22e84e93d007cadb6ad0d51a830ab3a9cefabf65 [6/9] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260618/202606180357.Sg4Ghszc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180357.Sg4Ghszc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180357.Sg4Ghszc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/resctrl/cbqri_resctrl.c:760:25: warning: variable 'cbqri_cpuhp_state' set but not used [-Wunused-but-set-global]
     760 | static enum cpuhp_state cbqri_cpuhp_state;
         |                         ^
   1 warning generated.


vim +/cbqri_cpuhp_state +760 drivers/resctrl/cbqri_resctrl.c

   758	
   759	/* Saved cpuhp slot from cpuhp_setup_state() for symmetric removal. */
 > 760	static enum cpuhp_state cbqri_cpuhp_state;
   761	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
