Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A40191F7B;
	Mon, 30 Sep 2024 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702178; cv=none; b=GXsR60jNEBs6PajeIr0BRT5GPsRp9H/KqFCl0sywUMAMbcf5H4ywahB/sqRnAJFrCDQplgLdHezC+NH8cxGMN8fj2WZivXa19ApGGRGyFqzSw71YbT4jYsP7KnMfSCuwYDkGqVMgkeNSEBfzd265gV3Wc/Zlc877ZQwnvtzjdUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702178; c=relaxed/simple;
	bh=5n90BbuqAiyj1JQ1jNFlwU0/LWHQ2NAQU+xytzaxpo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlTMlJgYFyraeu3iCKWv1iJqOp1O0zjbFf9XNh7NzvT0EGmNwUzTxF7lIJpgYNQTIygvv9b8f0rZw+OwjKy1QKHNGtoAw5Wjb2XPc1fz7R4lJK/VKXHTWfPAmbYHbtwOmoUQuccN1EwGgdBMgwfYZDSgFJKiui2pJNGM5AiPPww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zh5IqLBd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zh5IqLBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727702178; x=1759238178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5n90BbuqAiyj1JQ1jNFlwU0/LWHQ2NAQU+xytzaxpo8=;
  b=Zh5IqLBdvoytLJ2B7x62iZI31Jc0A6CvYNPTtxJops/38fboyYM0zfHL
   IrECL503n1WCB0AHsWOYsUQpXs2ORUJZ2mdyoa0ewi5BUwxUbNWO/W5fN
   SsGglmbBTwlgHuuxCUHSQLGSyz/5QDsg7njYpbUGB1K7cHPMbD1An7G7x
   7mybFybBDsoB+rDVOYomL6/NMd5XO/rrJ7C7qWBnemutCM3cMo/2Z6Rxt
   6+ANs1Tqg3HMm2eMZ0G3oy7oyem6QsiYytHrt6PWYl9RwaaW7LnnX33ay
   YJurYSGX8CH2+Ve6MwXZzZGMPY9VJI8VgLpdShX4edbtT/OATnDH8LVYS
   g==;
X-CSE-ConnectionGUID: vd/tNs6CS1CzPYlu3J/1HA==
X-CSE-MsgGUID: 2cUAEtT3SnCfwIEahbaOQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26742936"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26742936"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:16:16 -0700
X-CSE-ConnectionGUID: 84/lJRuuRY2eyGQdl2o9MQ==
X-CSE-MsgGUID: WB3U8HgoQyG+5Nr/Kd6+2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="72975563"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2024 06:16:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svGG3-000PTx-1U;
	Mon, 30 Sep 2024 13:16:11 +0000
Date: Mon, 30 Sep 2024 21:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [broonie-ci:arm64-gcs 28/40] arch/arm64/kernel/ptrace.c:1545:12:
 error: missing ',' between enumerators
Message-ID: <202409302134.JvsT590c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   da6c19766d3399121d0f97a5dcf38de9e315ec9b
commit: 874e32b873e572e8b6483417fd16814c0a29a796 [28/40] arm64: Add Kconfig for Guarded Control Stack (GCS)
config: arm64-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409302134.JvsT590c-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302134.JvsT590c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409302134.JvsT590c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/ptrace.c:11:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/arm64/kernel/ptrace.c:1472:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
    1472 | }
         | ^
>> arch/arm64/kernel/ptrace.c:1545:12: error: missing ',' between enumerators
    1545 |         REGSET_POE
         |                   ^
         |                   , 
   2 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +1545 arch/arm64/kernel/ptrace.c

17519819926211 Joey Gouly          2024-08-22  1514  
478fcb2cdb2351 Will Deacon         2012-03-05  1515  enum aarch64_regset {
478fcb2cdb2351 Will Deacon         2012-03-05  1516  	REGSET_GPR,
478fcb2cdb2351 Will Deacon         2012-03-05  1517  	REGSET_FPR,
478fcb2cdb2351 Will Deacon         2012-03-05  1518  	REGSET_TLS,
478fcb2cdb2351 Will Deacon         2012-03-05  1519  #ifdef CONFIG_HAVE_HW_BREAKPOINT
478fcb2cdb2351 Will Deacon         2012-03-05  1520  	REGSET_HW_BREAK,
478fcb2cdb2351 Will Deacon         2012-03-05  1521  	REGSET_HW_WATCH,
478fcb2cdb2351 Will Deacon         2012-03-05  1522  #endif
4035c22ef7d43a Mark Brown          2024-03-06  1523  	REGSET_FPMR,
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1524  	REGSET_SYSTEM_CALL,
43d4da2c45b2f5 Dave Martin         2017-10-31  1525  #ifdef CONFIG_ARM64_SVE
43d4da2c45b2f5 Dave Martin         2017-10-31  1526  	REGSET_SVE,
43d4da2c45b2f5 Dave Martin         2017-10-31  1527  #endif
eb9a85261e2972 Zenghui Yu          2022-12-14  1528  #ifdef CONFIG_ARM64_SME
e12310a0d30f26 Mark Brown          2022-04-19  1529  	REGSET_SSVE,
776b4a1cf36411 Mark Brown          2022-04-19  1530  	REGSET_ZA,
f90b529bcbe57c Mark Brown          2023-01-16  1531  	REGSET_ZT,
e12310a0d30f26 Mark Brown          2022-04-19  1532  #endif
ec6e822d1a22d0 Mark Rutland        2018-12-07  1533  #ifdef CONFIG_ARM64_PTR_AUTH
ec6e822d1a22d0 Mark Rutland        2018-12-07  1534  	REGSET_PAC_MASK,
201698626fbca1 Peter Collingbourne 2021-03-18  1535  	REGSET_PAC_ENABLED_KEYS,
d0a060be573bfb Kristina Martsenko  2019-01-30  1536  #ifdef CONFIG_CHECKPOINT_RESTORE
d0a060be573bfb Kristina Martsenko  2019-01-30  1537  	REGSET_PACA_KEYS,
d0a060be573bfb Kristina Martsenko  2019-01-30  1538  	REGSET_PACG_KEYS,
d0a060be573bfb Kristina Martsenko  2019-01-30  1539  #endif
ec6e822d1a22d0 Mark Rutland        2018-12-07  1540  #endif
2200aa7154cb7e Catalin Marinas     2020-07-03  1541  #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
2200aa7154cb7e Catalin Marinas     2020-07-03  1542  	REGSET_TAGGED_ADDR_CTRL,
2200aa7154cb7e Catalin Marinas     2020-07-03  1543  #endif
17519819926211 Joey Gouly          2024-08-22  1544  #ifdef CONFIG_ARM64_POE
17519819926211 Joey Gouly          2024-08-22 @1545  	REGSET_POE
17519819926211 Joey Gouly          2024-08-22  1546  #endif
ef0e2d1b9c3ffc Mark Brown          2023-06-30  1547  #ifdef CONFIG_ARM64_GCS
ef0e2d1b9c3ffc Mark Brown          2023-06-30  1548  	REGSET_GCS,
ef0e2d1b9c3ffc Mark Brown          2023-06-30  1549  #endif
478fcb2cdb2351 Will Deacon         2012-03-05  1550  };
478fcb2cdb2351 Will Deacon         2012-03-05  1551  

:::::: The code at line 1545 was first introduced by commit
:::::: 17519819926211e6b2834e00e4554bec0daf22ac arm64/ptrace: add support for FEAT_POE

:::::: TO: Joey Gouly <joey.gouly@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
