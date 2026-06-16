Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC704657F8;
	Tue, 16 Jun 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635628; cv=none; b=Vm0kna7kHxtXmHPfvxRiwS1UYS0BXGl5zFpTr5XHVaEKgS8FwQRvmg9TxmFJXv83wL8Lq9fuZCDZS03aO9q+qekYspPghLgialTmn5jRvg34HSkpWE6rt+2d9Q+TNq7nHXfPkzQtohhWh65fHgnkiwpADXJkiEJtJz7NKVP122g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635628; c=relaxed/simple;
	bh=mr3Kq9d9FjYtTu/5Cd6wYESgT5f9isuPTTMwpXMhido=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DYQI4gVYaGOgxLGsh1MdSKgpJ/6mnFRUVVa+NsBvRG7uThl+/X0SJ/IXSNWiJmZB0FnCjyeQvqO56ZIhoWysGgTYUfcs/5pafZdX9FyEc5pIUFg8kiwdyfVFJIVhid9hQhxqTX6huwQqBmrshuX/2ZbwmSF4CThQFoFFytXR33k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/ggUhgH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/ggUhgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781635626; x=1813171626;
  h=date:from:to:cc:subject:message-id;
  bh=mr3Kq9d9FjYtTu/5Cd6wYESgT5f9isuPTTMwpXMhido=;
  b=R/ggUhgHzkVVEgVSxt+ftSvCd0ivQJyb+CPQNo71iCNWP+yqH6jtF83l
   +coLjIKfXojxo1wMkp7kbEe5mMuB7ZqLMFqYSamJkbI6GfgTAhQG0xUdc
   AYuFv7091Zxyj0GKdDzXWJWi8O/TeiY/vSjD2zy/C7UQpBbTahSMVTLyu
   szrKuuIORjKd3Qq3wa71bXMxRF2agsFKlgFpi/NnKQjKlT18UGw1W1rwj
   6T97hclSw4yM+6nzXjwnj+P8MIQ+c8AZ35z+q9TiH0Ji/h8a7MLA2Tor3
   HTaPk60EatgR3ZZxI3efFKCjVJ604AHzrU3PR7UYz0uyb06ZSCdG3ncwj
   w==;
X-CSE-ConnectionGUID: xqtrhdKKThagjUZcbUUWJA==
X-CSE-MsgGUID: eu6hTEV1TlGYkAR0FDLnyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93794840"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93794840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 11:47:04 -0700
X-CSE-ConnectionGUID: xMrSXz5yRg6gwxMU0xRvmw==
X-CSE-MsgGUID: 3iJQt94mT3W17INJ5WtR/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247932842"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2026 11:47:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZYoN-000000005AV-3DVg;
	Tue, 16 Jun 2026 18:46:59 +0000
Date: Tue, 16 Jun 2026 20:46:50 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 322/326]
 sound/soc/soc-devres.c:16:2: error: call to undeclared function
 'snd_soc_unregister_component_by_driver'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606162037.3uZoCOYn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 05b5b2a6efd5a6e54abc6f45325da66dd0680510 [322/326] ASoC: soc-component: remove compatible definition
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260616/202606162037.3uZoCOYn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162037.3uZoCOYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606162037.3uZoCOYn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-devres.c:16:2: error: call to undeclared function 'snd_soc_unregister_component_by_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      16 |         snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
         |         ^
>> sound/soc/soc-devres.c:40:8: error: call to undeclared function 'snd_soc_register_component'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |         ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai, priv);
         |               ^
   sound/soc/soc-devres.c:40:8: note: did you mean 'snd_soc_dai_to_component'?
   include/sound/soc-dai.h:215:27: note: 'snd_soc_dai_to_component' declared here
     215 | struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_dai *dai);
         |                           ^
   2 errors generated.
--
>> drivers/soundwire/amd_manager.c:900:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
     900 |         .name = "soundwire",
         |         ~^~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/soundwire/intel.c:1010:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
    1010 |         .name                   = "soundwire",
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/soundwire/intel_ace2x.c:949:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
     949 |         .name                   = "soundwire",
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/codecs/rt5677.c:5191:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
    5191 |         .name                   = RT5677_DRV_NAME,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/codecs/rt5677-spi.c:398:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
     398 |         .name                   = DRV_NAME,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/codecs/ts3a227e.c:275:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
     275 |         .name = "ti,ts3a227e",
         |         ~^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/sof/pcm.c:847:6: error: no member named 'name' in 'struct snd_soc_component_driver'
     847 |         pd->name = "sof-audio-component";
         |         ~~  ^
   1 error generated.


vim +/snd_soc_unregister_component_by_driver +16 sound/soc/soc-devres.c

a0b03a616b08cf Mark Brown        2013-09-04  11  
a0b03a616b08cf Mark Brown        2013-09-04  12  static void devm_component_release(struct device *dev, void *res)
a0b03a616b08cf Mark Brown        2013-09-04  13  {
58f30150ffd6d9 Maxime Ripard     2020-07-07  14  	const struct snd_soc_component_driver **cmpnt_drv = res;
58f30150ffd6d9 Maxime Ripard     2020-07-07  15  
58f30150ffd6d9 Maxime Ripard     2020-07-07 @16  	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
a0b03a616b08cf Mark Brown        2013-09-04  17  }
a0b03a616b08cf Mark Brown        2013-09-04  18  
a0b03a616b08cf Mark Brown        2013-09-04  19  /**
5596780b93cb79 Kuninori Morimoto 2026-06-03  20   * devm_snd_soc_component_register - resource managed component registration
a0b03a616b08cf Mark Brown        2013-09-04  21   * @dev: Device used to manage component
a0b03a616b08cf Mark Brown        2013-09-04  22   * @cmpnt_drv: Component driver
a0b03a616b08cf Mark Brown        2013-09-04  23   * @dai_drv: DAI driver
a0b03a616b08cf Mark Brown        2013-09-04  24   * @num_dai: Number of DAIs to register
a0b03a616b08cf Mark Brown        2013-09-04  25   *
a0b03a616b08cf Mark Brown        2013-09-04  26   * Register a component with automatic unregistration when the device is
a0b03a616b08cf Mark Brown        2013-09-04  27   * unregistered.
a0b03a616b08cf Mark Brown        2013-09-04  28   */
5596780b93cb79 Kuninori Morimoto 2026-06-03  29  int devm_snd_soc_component_register5(struct device *dev,
a0b03a616b08cf Mark Brown        2013-09-04  30  			 const struct snd_soc_component_driver *cmpnt_drv,
eb78d61d1569f8 Kuninori Morimoto 2026-06-03  31  			 struct snd_soc_dai_driver *dai_drv, int num_dai, void *priv)
a0b03a616b08cf Mark Brown        2013-09-04  32  {
58f30150ffd6d9 Maxime Ripard     2020-07-07  33  	const struct snd_soc_component_driver **ptr;
a0b03a616b08cf Mark Brown        2013-09-04  34  	int ret;
a0b03a616b08cf Mark Brown        2013-09-04  35  
a0b03a616b08cf Mark Brown        2013-09-04  36  	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
a0b03a616b08cf Mark Brown        2013-09-04  37  	if (!ptr)
a0b03a616b08cf Mark Brown        2013-09-04  38  		return -ENOMEM;
a0b03a616b08cf Mark Brown        2013-09-04  39  
eb78d61d1569f8 Kuninori Morimoto 2026-06-03 @40  	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai, priv);
a0b03a616b08cf Mark Brown        2013-09-04  41  	if (ret == 0) {
58f30150ffd6d9 Maxime Ripard     2020-07-07  42  		*ptr = cmpnt_drv;
a0b03a616b08cf Mark Brown        2013-09-04  43  		devres_add(dev, ptr);
a0b03a616b08cf Mark Brown        2013-09-04  44  	} else {
a0b03a616b08cf Mark Brown        2013-09-04  45  		devres_free(ptr);
a0b03a616b08cf Mark Brown        2013-09-04  46  	}
a0b03a616b08cf Mark Brown        2013-09-04  47  
a0b03a616b08cf Mark Brown        2013-09-04  48  	return ret;
a0b03a616b08cf Mark Brown        2013-09-04  49  }
5596780b93cb79 Kuninori Morimoto 2026-06-03  50  EXPORT_SYMBOL_GPL(devm_snd_soc_component_register5);
eb78d61d1569f8 Kuninori Morimoto 2026-06-03  51  

:::::: The code at line 16 was first introduced by commit
:::::: 58f30150ffd6d95efa524ff05bbcee4e95bfa870 ASoC: core: Remove only the registered component in devm functions

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
