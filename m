Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFED1509A8;
	Fri,  3 May 2024 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714731570; cv=none; b=NHDAiPFEArjp0oJIi0h5XuPWW29iTwDRviH4Gykl1ha9ib8p5wclgSuscuwQVMc73Oo4OvZ5tekgGUwO/3+QhkBReygv9IgFk1FfTEVyu5BnYiEnV0g5u50W9IDLzCVRtEGZN0mdIRWRTD38+2smnPAeGVc9yrLE3X05BjL7d84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714731570; c=relaxed/simple;
	bh=LHEwmhzOeJ6+eCFrkr7iWcutwgw/cHqgE3PTPRQ2o08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SxxJX+2kHKlZkCxSEpHkB2RmZt7mt9sCftLxZKVxq0gKMoaKHF4g1yifa9p0rvE04+jzw76rB+9vKId+uzSkfZLOJTSXxJYQAmPfpH8c6qMLjdr1TN0s/+8ZY+wT0EcbMMUg3fObdPvG6Pklj8943bSukY5G4RSoWv4gmUcDfbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOdRf958; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOdRf958"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714731570; x=1746267570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHEwmhzOeJ6+eCFrkr7iWcutwgw/cHqgE3PTPRQ2o08=;
  b=AOdRf958n+4UJzaRlUaxBmtsd6pT0n+HSNI5LDXH0958EOk8ZA9T2UAb
   icTJds26WwfCRAPWLTQ7gc5lwGIUOlTnuWFQCIbrfrxIzlr4WM0yR/A01
   nVy8ssaWwTHpSUvbpQ+3G4x0uodPinrpSDZpVTQ2bJU8dO6DnzKfDk7ql
   NMfhPMK0Ww5RMn393HjO2bAP41qzGQYm044grL7TE/m7kGo1AuxWZFwN4
   obHB+qXBPY/w/CjDURKAt8EmOtkWynVbYA86qlFquSvSyS+A3MSL0MIWp
   RuxICh1h3m7BorCQF9gKTnze8T3z34hLlGty+OUtVp9FYjHAC/CLqpPe8
   g==;
X-CSE-ConnectionGUID: jPxRKPa6QNOaklXphaQWPQ==
X-CSE-MsgGUID: z8FQQNkLTIuPLEFTXvFoow==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10390947"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10390947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 03:19:29 -0700
X-CSE-ConnectionGUID: xiUrQXXkSZGJuTOONJespw==
X-CSE-MsgGUID: VfUKvDRJSs23QfbnppgdRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27464188"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2024 03:19:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2q0i-000Ba6-0i;
	Fri, 03 May 2024 10:19:24 +0000
Date: Fri, 3 May 2024 18:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alina Yu <alina_yu@richtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 9961/10967]
 drivers/regulator/rtq2208-regulator.c:223:35: warning: unused variable
 'rtq2208_regulator_ldo_ops'
Message-ID: <202405031834.7qPvHF00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: 38bcec0e7cbbd6566c12ae4f2b7a48bd50cd215c [9961/10967] regulator: rtq2208: Fix LDO discharge register and add vsel setting
config: i386-buildonly-randconfig-001-20240503 (https://download.01.org/0day-ci/archive/20240503/202405031834.7qPvHF00-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031834.7qPvHF00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031834.7qPvHF00-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/rtq2208-regulator.c:223:35: warning: unused variable 'rtq2208_regulator_ldo_ops' [-Wunused-const-variable]
     223 | static const struct regulator_ops rtq2208_regulator_ldo_ops = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/rtq2208_regulator_ldo_ops +223 drivers/regulator/rtq2208-regulator.c

85a11f55621a0c Alina Yu 2023-08-07  222  
85a11f55621a0c Alina Yu 2023-08-07 @223  static const struct regulator_ops rtq2208_regulator_ldo_ops = {
85a11f55621a0c Alina Yu 2023-08-07  224  	.enable = regulator_enable_regmap,
85a11f55621a0c Alina Yu 2023-08-07  225  	.disable = regulator_disable_regmap,
85a11f55621a0c Alina Yu 2023-08-07  226  	.is_enabled = regulator_is_enabled_regmap,
85a11f55621a0c Alina Yu 2023-08-07  227  	.set_active_discharge = regulator_set_active_discharge_regmap,
85a11f55621a0c Alina Yu 2023-08-07  228  	.set_suspend_enable = rtq2208_set_suspend_enable,
85a11f55621a0c Alina Yu 2023-08-07  229  	.set_suspend_disable = rtq2208_set_suspend_disable,
85a11f55621a0c Alina Yu 2023-08-07  230  };
85a11f55621a0c Alina Yu 2023-08-07  231  

:::::: The code at line 223 was first introduced by commit
:::::: 85a11f55621a0c18b22b43ab4219450ac1d19386 regulator: rtq2208: Add Richtek RTQ2208 SubPMIC driver

:::::: TO: Alina Yu <alina_yu@richtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
