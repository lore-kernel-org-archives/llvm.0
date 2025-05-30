Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1319B5B4;
	Fri, 30 May 2025 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748587603; cv=none; b=RcMjTwU01sbsZTYYSOyGuY1Gc5w0F4KOB03xUxpoP0UaMc8A5Ilr50gv3zGCIABwK2zbc9FKQxfHPQaWMEEipOtAnOxWV1hUYS1L8IvC0frD788Et3WvMhM1Yser+2nRqWbiO0VjL6DJ3saOtWzZSHXIcGMherk7H2reh+ueSvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748587603; c=relaxed/simple;
	bh=GUJR9nbyGJ8lYC5hJXcMMoDjs2R2zeY1mx2UdApjUEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uoYYI5onMi68CNpbmxRWsUM23EfW14+AkasGvN3mQJuxv/LHugda4gyf4T6iw7rezj/yOxA6kkSwCitqfTqYhwSdzno7cvUMso+d7xEie8BWaypEdsYah//u/7BbXRbm64DtfUhyGMRSJ5LQHtJTdGRjLQvlIFaR0Fg2HLya+wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPJ07Fmu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPJ07Fmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748587601; x=1780123601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GUJR9nbyGJ8lYC5hJXcMMoDjs2R2zeY1mx2UdApjUEw=;
  b=FPJ07FmuO/y3DROtSceTW2qG77E6j9vrUXA0WkqCJNzlYq+oTFJlf1ni
   XadP4tAGGMAEDWsFok6pzOnkOr8iKjCrUt8sV6YLaWO0Z5G2jzfOn0c4C
   9LcbdaU5oAzkPJEXZc3ak8C4srfZzPmZh1zW4Tuq3eX4upZHKZv1MhDzx
   3xxmdKCVYbvc4RLRvNIR2nXHb2Jqqr/fWyDJ2wIQIMHZjPhZ6ISnEBzEa
   cjgGwd9VxvahrdutHT9qU9F1/UoJQ+cQgNMMR5/hKkzupbzJD6ugpBPFo
   nrcmAAszMrmnBEq6BWEhvG1sMRiz76vFNiqVmQ68JJzDOuJJaYAn53pzO
   A==;
X-CSE-ConnectionGUID: xeVWiaF1SWGrmW0+dY0W5g==
X-CSE-MsgGUID: Dg0mOLlXRbqn/YC936VFjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54335410"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="54335410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 23:46:40 -0700
X-CSE-ConnectionGUID: wqB8Q+eDTVWVaXdpZwFCyQ==
X-CSE-MsgGUID: wD5teb9kTYOr5e9BVYUY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="144773649"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2025 23:46:39 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKtVl-0000qe-0H;
	Fri, 30 May 2025 06:46:37 +0000
Date: Fri, 30 May 2025 14:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/rt1318.c:1149:34: warning: unused variable
 'rt1318_of_match'
Message-ID: <202505301432.PXdO6rap-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66bc387efbee59978e076ce9bf123ac353b389c
commit: fe1ff61487ace69cd4e680e36169c90667eb9624 ASoC: rt1318: Add RT1318 audio amplifier driver
date:   12 months ago
config: x86_64-buildonly-randconfig-2003-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301432.PXdO6rap-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301432.PXdO6rap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301432.PXdO6rap-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/rt1318.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/rt1318.c:1149:34: warning: unused variable 'rt1318_of_match' [-Wunused-const-variable]
    1149 | static const struct of_device_id rt1318_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/rt1318_of_match +1149 sound/soc/codecs/rt1318.c

  1148	
> 1149	static const struct of_device_id rt1318_of_match[] = {
  1150		{ .compatible = "realtek,rt1318", },
  1151		{},
  1152	};
  1153	MODULE_DEVICE_TABLE(of, rt1318_of_match);
  1154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
