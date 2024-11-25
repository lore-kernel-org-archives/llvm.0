Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE59A2500CC;
	Mon, 25 Nov 2024 04:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732508805; cv=none; b=j1BKascdvHEZsNY0QOrFHIpwTUi/HiIFKB2vAwQn1OmYwcnC2EgXIdjBdYW3gby4lcrBzxHcDdUQmv/GoRodFSNAwHmt6X72zZm0sAcM0O8KsT2L/2Xx58UJblZJ0JasImAf2pC3ajE8Yos7J/Lvst/mA06thDs/5Y1mzjgaqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732508805; c=relaxed/simple;
	bh=GB7YURUt9O1B8nHeuYoFva97GHMNGRHvMHourBC9DqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTc6WmHhOdbBR/sH2I4dliH3R6dQe/y5+Qguuq9gaIeFwWMQCiU8a3TYYARVxtiwoBPPivA6hH0P0F13udHSi0/oJELXSD5me0VPb+b8EQZhg/oB04y8GMrWsqgluPUHDtkZkaeLQwKdXaZmtI3Ptr2MONBLRsbj+SyA/e/GYSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLKw8wi1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLKw8wi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732508802; x=1764044802;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GB7YURUt9O1B8nHeuYoFva97GHMNGRHvMHourBC9DqU=;
  b=HLKw8wi1B9BuojNhXriipHn7SkTU1VUqeAAwbZQzBi3OeDKCrWJLjXJ9
   QGQDCGq5NjkOz8G5YRQTZ6QESXUsT9ULHTigFJso+wh28ulZLg/+rbp1e
   Th85BmmrVP6xj05hhEcwVFbvcpRdZdjXlbshsmLgisLyQ7R5dPliM4kr+
   CY59OvxKtZOjvfFXAFkxEYfBwvPLumA/R671vbRXz1bU7eyLRkBjSXa+d
   lsvPgB40+X/VuNxH5//yzwE/RG1/dtadWmbUKUtAFx/7SRlJzm+0Mx5dG
   yv3uyx+1GtzPN1Ij/lkj0vuWhUROOu3m8dqLGcdufd+Nyas5Vo+5QaaCG
   Q==;
X-CSE-ConnectionGUID: ZfUecP0/RhG7uPiSt9prgg==
X-CSE-MsgGUID: 3kxgntqgSyqya++WxIF3Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32842202"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32842202"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 20:25:57 -0800
X-CSE-ConnectionGUID: F0RvgCv+SyOWOt0AMf6t0w==
X-CSE-MsgGUID: jIlz5kcFT5y7FJJ6ft7s4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="95233079"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2024 20:25:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFQfa-0005sP-0G;
	Mon, 25 Nov 2024 04:25:54 +0000
Date: Mon, 25 Nov 2024 12:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?unknown-8bit?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 7/115] sound/soc/codecs/tas2764.c:781:34:
 warning: unused variable 'tas2764_of_match'
Message-ID: <202411251255.ZFGm8ln5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   070347d4a0876921be5b0bbc11fff848c2ed3e59
commit: 242fdc910725b9fbb7be410e9bfab2480761085a [7/115] ASoC: tas2764: Extend driver to SN012776
config: i386-randconfig-003-20241124 (https://download.01.org/0day-ci/archive/20241125/202411251255.ZFGm8ln5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251255.ZFGm8ln5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251255.ZFGm8ln5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2764.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/tas2764.c:781:34: warning: unused variable 'tas2764_of_match' [-Wunused-const-variable]
     781 | static const struct of_device_id tas2764_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/tas2764_of_match +781 sound/soc/codecs/tas2764.c

827ed8a0fa50bd Dan Murphy     2020-10-07  780  
827ed8a0fa50bd Dan Murphy     2020-10-07 @781  static const struct of_device_id tas2764_of_match[] = {
242fdc910725b9 Martin Povišer 2022-03-11  782  	{ .compatible = "ti,tas2764",  },
242fdc910725b9 Martin Povišer 2022-03-11  783  	{ .compatible = "ti,sn012776", },
827ed8a0fa50bd Dan Murphy     2020-10-07  784  	{},
827ed8a0fa50bd Dan Murphy     2020-10-07  785  };
827ed8a0fa50bd Dan Murphy     2020-10-07  786  MODULE_DEVICE_TABLE(of, tas2764_of_match);
827ed8a0fa50bd Dan Murphy     2020-10-07  787  

:::::: The code at line 781 was first introduced by commit
:::::: 827ed8a0fa50bdd365c9f4c9f6ef561ca7032e49 ASoC: tas2764: Add the driver for the TAS2764

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
