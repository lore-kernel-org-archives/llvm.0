Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C817C8;
	Sun, 24 Mar 2024 03:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711250430; cv=none; b=k/wNu615KU+A8dLbKWfhpL2qPzFCazQQLHj5jKtIisMW8UWwS+w0sjTjdwO4Rp4cfd7zrJWAAssxHmR/nmUu5YGnJABIKr7ZLgWiGd1Ya1zj84/K/A3GCMOmEdWO0x+VWv3HRe3XGTjYcID0s2qEyUVaPi+HOf6tadJK3Tm8mPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711250430; c=relaxed/simple;
	bh=EhbRsGvqN0jROuWy97R+D3RnYNFRvQyqA2GmT1EXg1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MdwsA/Q960IwyAT+2mWmqn9DkzFD+hwQnKYaFhQ/I6F/kLVnlASKkvwAG1L1UEgq7Ar4dz4QpekdVjrlDPvj/PVhoBnZhZRv1QyUKSWtP2jlECCOYQ8GSQPUCLmgOfs6ab+oN0qMgoikc5R0pivGqJXB3kI3u37RMnsW2cVGWrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvrIiU3w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvrIiU3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711250428; x=1742786428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EhbRsGvqN0jROuWy97R+D3RnYNFRvQyqA2GmT1EXg1A=;
  b=FvrIiU3wTcdSzcrwSHmirKbZYetvpx9CiDZAvBJkkHfgmrMA2CcFrrdh
   fXAL4JlppUVk472Zt4ouMZIXj4fS3tIY8qtuyeEjTbEcubAKqcBgNhrbK
   WUq9CxdlXMDbI06UU6/IKo+tQJzCauWItew32tzHC6cU71/EJnWUyKvUy
   3qulp+TLE7ajsbWCcE4VwipjTKPZH8i/KUpgieXH5BTK7UpaTBRjOgkaE
   bkjcVA/NMaYBAg8urGdq9egUkt0moyGzmjGaRduCrzCTm2p9sAPi4KBTo
   NBhCx6Iyvv015lXHzw7m0jXMwz16ofstnCf7+QnurbkP6tTrraAHii+Zw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6129138"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6129138"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 20:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="46269540"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2024 20:20:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roEPG-000LdL-2f;
	Sun, 24 Mar 2024 03:20:22 +0000
Date: Sun, 24 Mar 2024 11:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: include/linux/framer/framer.h:184:16: warning: no previous prototype
 for function 'framer_get'
Message-ID: <202403241110.hfJqeJRu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70293240c5ce675a67bfc48f419b093023b862b3
commit: 54762918ca856028d33d1d56d017a4d7706c6196 net: wan: fsl_qmc_hdlc: Add framer support
date:   13 days ago
config: powerpc-randconfig-003-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241110.hfJqeJRu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241110.hfJqeJRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241110.hfJqeJRu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wan/fsl_qmc_hdlc.c:14:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/wan/fsl_qmc_hdlc.c:17:
>> include/linux/framer/framer.h:184:16: warning: no previous prototype for function 'framer_get' [-Wmissing-prototypes]
     184 | struct framer *framer_get(struct device *dev, const char *con_id)
         |                ^
   include/linux/framer/framer.h:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     184 | struct framer *framer_get(struct device *dev, const char *con_id)
         | ^
         | static 
>> include/linux/framer/framer.h:189:6: warning: no previous prototype for function 'framer_put' [-Wmissing-prototypes]
     189 | void framer_put(struct device *dev, struct framer *framer)
         |      ^
   include/linux/framer/framer.h:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     189 | void framer_put(struct device *dev, struct framer *framer)
         | ^
         | static 
   drivers/net/wan/fsl_qmc_hdlc.c:783:25: error: use of undeclared identifier 'qmc_hdlc_driver'; did you mean 'qmc_hdlc_probe'?
     783 | MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
         |                         ^~~~~~~~~~~~~~~
         |                         qmc_hdlc_probe
   include/linux/module.h:244:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^
   drivers/net/wan/fsl_qmc_hdlc.c:694:12: note: 'qmc_hdlc_probe' declared here
     694 | static int qmc_hdlc_probe(struct platform_device *pdev)
         |            ^
   3 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/framer_get +184 include/linux/framer/framer.h

82c944d05b1a24 Herve Codina 2023-11-28  183  
82c944d05b1a24 Herve Codina 2023-11-28 @184  struct framer *framer_get(struct device *dev, const char *con_id)
82c944d05b1a24 Herve Codina 2023-11-28  185  {
82c944d05b1a24 Herve Codina 2023-11-28  186  	return ERR_PTR(-ENOSYS);
82c944d05b1a24 Herve Codina 2023-11-28  187  }
82c944d05b1a24 Herve Codina 2023-11-28  188  
82c944d05b1a24 Herve Codina 2023-11-28 @189  void framer_put(struct device *dev, struct framer *framer)
82c944d05b1a24 Herve Codina 2023-11-28  190  {
82c944d05b1a24 Herve Codina 2023-11-28  191  }
82c944d05b1a24 Herve Codina 2023-11-28  192  

:::::: The code at line 184 was first introduced by commit
:::::: 82c944d05b1a24c76948ee9d6bb1d7de1ebb8b3a net: wan: Add framer framework support

:::::: TO: Herve Codina <herve.codina@bootlin.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
