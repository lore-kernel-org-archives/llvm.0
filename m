Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267E19F425;
	Thu, 12 Sep 2024 23:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726185456; cv=none; b=RimlTERLvfEKnPIu2V5jkkwNAbTVnoe7dVfXTsbnz8Idy2ChWS51z7W3bivCZ+P+dtxyQgbElbAyu2uhuFW0HmvHx/SqYiHwd7t2rSsNq/kZ4HZc3wJQ8T73bmB+HAhWC5pJP9ahQmwNQ3TK+Q5Ry64yXTXZRBVwd0OS3J0ae1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726185456; c=relaxed/simple;
	bh=GkGYXDvAWdh6YyZkFKmQZSh37pG/jN3F2vOmSYubEbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvgiUYz0dbls6dbjctppl0Isz5oUW8WEoXyNKY/C5sYyM0GdTKb6MfOEu4UEi/P+0iaxe/RHbFFTBgtO6/h0N/bu/XvZyitJWhJuZhoJprH22GPWniicO4Vf90joQxy+e7IGnZ240fY8RW8kQqhhOxWCSxccwOZT4VLy4vg5bEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWmOZ6eC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWmOZ6eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726185454; x=1757721454;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GkGYXDvAWdh6YyZkFKmQZSh37pG/jN3F2vOmSYubEbw=;
  b=BWmOZ6eCRlza9imf3VCs4w0YI85QG454y7w0Wfheen0g0cax64QKRaQ2
   td1DA0m0Az/Z32/JHtPFf2CpulLFrUd7BtppyKpIFdwB7ZPw9bhuhLBlU
   9eXdSFVjzbqpVbDOXvqb1lFwZlqZEbpTecze6EdqT88IEcwZWSm00ePme
   WcL7i3EPs98Nu0aMGAQcaTiGj6LMbYNAVMKntUBck/Nvq/uM30K9uqAB5
   xxk46S14+ZjB/SKCGAct+4ZCAluJQYh3RzrngqxJL9FGicabvRezgUpEr
   5LGianZuoNwjutjUdb6WtBg92MczzTZIq1Np4aZYAMNeTeqJNyz73FhTE
   g==;
X-CSE-ConnectionGUID: 8S5PfnqqRBqJR9YtgbOESg==
X-CSE-MsgGUID: 1Zlkqg7JTVqhjhqFIUNDBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36421582"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="36421582"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 16:57:28 -0700
X-CSE-ConnectionGUID: BWoHmJeIRM6UufEwIYjAqg==
X-CSE-MsgGUID: zCYzz7PxQbqKniCUXFI9pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="105348637"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Sep 2024 16:57:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sotgi-0005pW-0g;
	Thu, 12 Sep 2024 23:57:24 +0000
Date: Fri, 13 Sep 2024 07:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 11/120] sound/soc/codecs/tas2764.c:811:1:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202409130720.UbqysLMg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   8bb0ee8e8fd75aa60a4bb4efe074711f2c35ca5c
commit: 4505843a945e1d46e759f01c0822a855eec41cea [11/120] ASoC: apple: Add macaudio machine driver
config: arm64-randconfig-004-20240913 (https://download.01.org/0day-ci/archive/20240913/202409130720.UbqysLMg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130720.UbqysLMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130720.UbqysLMg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2764.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   sound/soc/codecs/tas2764.c:758:20: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     758 |                 tas2764->devid = (enum tas2764_devid) of_id->data;
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2764.c:811:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     811 | module_i2c_driver(tas2764_i2c_driver);
         | ^
         | int
>> sound/soc/codecs/tas2764.c:811:19: error: a parameter list without types is only allowed in a function definition
     811 | module_i2c_driver(tas2764_i2c_driver);
         |                   ^
   2 warnings and 2 errors generated.
--
   In file included from sound/soc/codecs/cs42l83-i2c.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/cs42l83-i2c.c:235:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     235 | module_i2c_driver(cs42l83_i2c_driver);
         | ^
         | int
>> sound/soc/codecs/cs42l83-i2c.c:235:19: error: a parameter list without types is only allowed in a function definition
     235 | module_i2c_driver(cs42l83_i2c_driver);
         |                   ^
   1 warning and 2 errors generated.
--
   In file included from sound/soc/codecs/tas2770.c:16:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/tas2770.c:726:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     726 | module_i2c_driver(tas2770_i2c_driver);
         | ^
         | int
>> sound/soc/codecs/tas2770.c:726:19: error: a parameter list without types is only allowed in a function definition
     726 | module_i2c_driver(tas2770_i2c_driver);
         |                   ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=m] && I2C [=n]
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=y] && SND [=y] && SND_SOC [=m] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=m] && I2C [=n]
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=y] && SND [=y] && SND_SOC [=m] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=m] && I2C [=n]
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=y] && SND [=y] && SND_SOC [=m] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])


vim +/int +811 sound/soc/codecs/tas2764.c

827ed8a0fa50bd Dan Murphy       2020-10-07  802  
827ed8a0fa50bd Dan Murphy       2020-10-07  803  static struct i2c_driver tas2764_i2c_driver = {
827ed8a0fa50bd Dan Murphy       2020-10-07  804  	.driver = {
827ed8a0fa50bd Dan Murphy       2020-10-07  805  		.name   = "tas2764",
827ed8a0fa50bd Dan Murphy       2020-10-07  806  		.of_match_table = of_match_ptr(tas2764_of_match),
827ed8a0fa50bd Dan Murphy       2020-10-07  807  	},
9abcd24002bf79 Uwe Kleine-König 2023-04-25  808  	.probe      = tas2764_i2c_probe,
827ed8a0fa50bd Dan Murphy       2020-10-07  809  	.id_table   = tas2764_i2c_id,
827ed8a0fa50bd Dan Murphy       2020-10-07  810  };
827ed8a0fa50bd Dan Murphy       2020-10-07 @811  module_i2c_driver(tas2764_i2c_driver);
827ed8a0fa50bd Dan Murphy       2020-10-07  812  

:::::: The code at line 811 was first introduced by commit
:::::: 827ed8a0fa50bdd365c9f4c9f6ef561ca7032e49 ASoC: tas2764: Add the driver for the TAS2764

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
