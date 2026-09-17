Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC714A0F14;
	Thu, 17 Sep 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660641; cv=none; b=Cxf4eZJPvm6PzzrYXTUfjmV7Os7+ByoPkgub3OBWrL6mJTHnU7r6KhxjB8VVqGPxCv66cfwd3lmOuYtHFfWCiKrkzMtAGbrlCS/zvcRzGtj+mn4dFFoxg5GMcX71jpo8lCMMxwKAezpnysLgdkmfaDXublU0NwOrza7o4TKc1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660641; c=relaxed/simple;
	bh=LPr+S5E9e/qlJZVwy9/yFtDfaVU/Syp4H9nUPeGH/UM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mpBVLJW198NO99BFNbplvqnFT+dTz2MB+DEyoH4Jj+BZK/8TAQeYi+FmjU3YQ5FZWkfaZoeR7PVkX50M9nLUinWgNVMXaQnVBGTsTpuTn67eDl021Bj3YbVdtvdrdasIQcuhXIbPr85yVrOXfaEt+bulF9l19bpRqgxNnazEvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J10X1sRl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J10X1sRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789660639; x=1821196639;
  h=date:from:to:cc:subject:message-id;
  bh=LPr+S5E9e/qlJZVwy9/yFtDfaVU/Syp4H9nUPeGH/UM=;
  b=J10X1sRlvHaU2vHNcEIbiqjjdExO68UWRlEBrt8enQ25C/ej2v/B/kP2
   uc4V/S/3TI9k9srZWTPJQGS+BVvxQh/nqt+AQLMc/sBFleXfRNekd1ab/
   fml87aMNrG4t/aAExghfO8LVBglWHdOmVj9JYLN5ekTInvWtIRnFk+pj3
   JLJazHvW7ZzwVsts4AiFiy//dykS6h4NZWDp9wgrzj8V2RT7GHvF0AUVe
   EH+vdR2F2Lb4O1rFFirZ4jvZgTz81TicfTWvFNvDnHH+yEW5fKzl7Yily
   EKI2GpJB/u3N4jujnSXN23KVf18GHPArqdkTE/v/1ivXaT5zvLXGPNoLw
   g==;
X-CSE-ConnectionGUID: FRRuo1k3RqCIrZXfPeBpiQ==
X-CSE-MsgGUID: SZrgDuN9QD6OVBYc7JuAMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89234451"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89234451"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:57:18 -0700
X-CSE-ConnectionGUID: h422lOm8TxmLIYnSXfifww==
X-CSE-MsgGUID: 9spLevcmQcGy5N4qy21EaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="298957390"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Sep 2026 08:57:14 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7EU3-0000000086r-3Hqq;
	Thu, 17 Sep 2026 15:57:11 +0000
Date: Thu, 17 Sep 2026 23:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:for-7.4 5/19] sound/soc/codecs/es9356.c:1125:3:
 warning: add explicit braces to avoid dangling else
Message-ID: <202609172335.MVp6jjO5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git for-7.4
head:   50a0a41c67978e9d89646038eb08c587635cb9be
commit: 31a7178425356d459bf7397941a3fbeff1782122 [5/19] ASoC: es9356: Publish IRQ readiness after cache replay
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260917/202609172335.MVp6jjO5-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609172335.MVp6jjO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609172335.MVp6jjO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es9356.c:1125:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
    1125 |                 scoped_guard(mutex, &es9356->disable_irq_lock)
         |                 ^
   include/linux/cleanup.h:451:2: note: expanded from macro 'scoped_guard'
     451 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:448:5: note: expanded from macro '__scoped_guard'
     448 |                 } else
         |                   ^
   1 warning generated.


vim +1125 sound/soc/codecs/es9356.c

  1103	
  1104	static int es9356_sdca_dev_resume(struct device *dev)
  1105	{
  1106		struct sdw_slave *slave = dev_to_sdw_dev(dev);
  1107		struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
  1108		int ret;
  1109	
  1110		ret = sdw_slave_wait_for_init(slave, es9356_PROBE_TIMEOUT);
  1111		if (ret) {
  1112			sdw_show_ping_status(slave->bus, true);
  1113			return ret;
  1114		}
  1115	
  1116		regcache_cache_only(es9356->regmap, false);
  1117		ret = regcache_sync(es9356->regmap);
  1118		if (ret) {
  1119			regcache_cache_only(es9356->regmap, true);
  1120			regcache_mark_dirty(es9356->regmap);
  1121			return ret;
  1122		}
  1123	
  1124		if (!slave->unattach_request)
> 1125			scoped_guard(mutex, &es9356->disable_irq_lock)
  1126				es9356->disable_irq = false;
  1127		return 0;
  1128	}
  1129	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
