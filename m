Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AA2BCF5;
	Fri, 12 Dec 2025 01:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765503132; cv=none; b=Se72COl4Pl9A/P2INq3ZfiTGbWMSuJeow0qSIsXSfKIIPq1sJR3ywvypxmk7d6EaaGRsLKXtTCtV5quTJfscsW9SiXEOVrBCC4fVWkllmtuic2OFsGwBvZO80T7LJVA8Hi6W1HaFFNDrVc8fV10zy8B9hk7oxmPP+LfvnRkOtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765503132; c=relaxed/simple;
	bh=O5i6rHMiNEnc0lyxP94u2slv+RLXz12TplUYBALzdHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afBktchMYobKS1j+StBlh+edjrS3tGBj44dUK4Jrcsy9B0p0zmPO0Ew/nq5aHMgm5bA6KHT5n6xLIol9KAgtVN/0dzq6sTJYYsABx4dgOLtGtEQSfo6HZggw/09Nyss2FCZebzk2kyBqWQ6POQV1fb0QeYAFKVAjxyQZwld6sZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAnhqxyI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAnhqxyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765503131; x=1797039131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O5i6rHMiNEnc0lyxP94u2slv+RLXz12TplUYBALzdHs=;
  b=WAnhqxyIvFIugQ+5cs/J3YvnvDpc1/mAoiRGS+bssTYkpkAIGbSlN/9A
   2Q4QWGHCzy8X6PMiy3782m6NFG6fshRX5pfvm/WNBXbN2KJPz275XoH6S
   mDdQOiZAxXZlLrG6g2xcMp0Bvwh0muJ9TiXMh/ASVypeoUwZwMKqovymp
   G2UO0BxRT1W+7epw24shmsXa40YA4TCX2CUFTS3rtXEzNoUQDhfM9Rpzj
   eBoX4QKob9+QbVh1U10Ps9MyL5x4PTKfbLcJbp68VB4i8Qw/5L6/uUgSC
   AvklltbOfbw4U7HjMIH4JmO55p74XNPO93lsjjQJgBPU7sswEZ7g5EyM8
   A==;
X-CSE-ConnectionGUID: XfM4kpyOSYWSIj6hmOrbDw==
X-CSE-MsgGUID: CyZ42xEHTAaaDeCkoOoCoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="92972469"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="92972469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:32:10 -0800
X-CSE-ConnectionGUID: rQ5AV0BORlmb5ECZ0ySiag==
X-CSE-MsgGUID: cjyvTW7sTze+po6wOPQTtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201421993"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 17:32:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTs0s-000000005JR-1skv;
	Fri, 12 Dec 2025 01:32:06 +0000
Date: Fri, 12 Dec 2025 09:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
Message-ID: <202512120943.V0TRmEDs-lkp@intel.com>
References: <20251211110130.2925541-3-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211110130.2925541-3-oder_chiou@realtek.com>

Hi Oder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.18 next-20251211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oder-Chiou/ASoC-dt-bindings-realtek-rt5575-add-support-for-ALC5575/20251211-190355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251211110130.2925541-3-oder_chiou%40realtek.com
patch subject: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512120943.V0TRmEDs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120943.V0TRmEDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120943.V0TRmEDs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt5575.c:256:48: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     256 |                 dev_err(dev, "Get SPI device failure: %d\n", ret);
         |                                                              ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/codecs/rt5575.c:252:9: note: initialize the variable 'ret' to silence this warning
     252 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +256 sound/soc/codecs/rt5575.c

   246	
   247	static int rt5575_fw_load_by_spi(struct rt5575_priv *rt5575)
   248	{
   249		struct i2c_client *i2c = rt5575->i2c;
   250		struct spi_device *spi;
   251		struct device *dev = &i2c->dev;
   252		int ret;
   253	
   254		spi = rt5575_spi_find_device();
   255		if (!spi) {
 > 256			dev_err(dev, "Get SPI device failure: %d\n", ret);
   257			return -ENODEV;
   258		}
   259	
   260		regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
   261		regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
   262		regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
   263	
   264		ret = rt5575_spi_fw_load(spi);
   265		if (ret) {
   266			dev_err(dev, "Load firmware failure: %d\n", ret);
   267			return -ENODEV;
   268		}
   269	
   270		regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
   271		regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
   272	
   273		regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT, ret, !ret, 100000, 10000000);
   274		if (ret) {
   275			dev_err(dev, "Run firmware failure: %d\n", ret);
   276			return -ENODEV;
   277		}
   278	
   279		return 0;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
