Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC712AE97;
	Sun, 25 Aug 2024 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724584359; cv=none; b=aahm4Mawuqqw3rGarp+quDyNskiOltqkegrdFFwyzaOJlrfrSDlqOmoOLQSQg0AvzYW7ZO5wqCzq6fyl/dkC4aOE1rRBXMWq2v3Ji7ybuNYWYUnc/RLiaY+S1YIrCI0wJa9MHe0gSS/Nb6Ts0CRiufqN0z3jlI2SJaMlcDuUCj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724584359; c=relaxed/simple;
	bh=MDfrm2soYbJvteBEewQPuraDjDNwFXKlkAebLJxJTwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VwN7cV6uWqadPatpBy+LZGi+WLixFqlt4thjKVyMoVJJMqiONzIye0x1nnRGZLpr/xuZkgNiNS+n5iKpdsoecIKMn7T3t2zbmG17uiaTxrhKBfvcAqk/UXd5xkHMkbdSJEZg3TY6GIhxRoKpQsRCRycS0Oj8q6SPHlz8Kf9hiiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGdmDhmv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGdmDhmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724584358; x=1756120358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDfrm2soYbJvteBEewQPuraDjDNwFXKlkAebLJxJTwI=;
  b=OGdmDhmvLkinKpzCRKzDQTPL2kAt5c9/w4Jtfx7fmjp3hw/j+nzzRphy
   tBqWMgc0Na537iga1/sfksbeDO9i2s1Nvs64b7JTfvf1onBmT5rV87WUU
   vDvXaJXPohfnaOVSfQ7FCBgd98Zg+lmAEi6TZHGOlPJtoWER9Z0OcFdXz
   WAsDvmynj1H1URx37rrvDlvPKDG9mAIDwwwcHRMiaWKYGfk2iJiCzoPns
   j+YUN/5dvOg6R8RwJRtmj87ndy7WZKZzIOW4VJFawfLUFnTO+7WJ+6gkU
   URMG74CoxvJVS+AUDAoRDC2Qrt8G5GqSBMHPn8hXATrOGfFqBJrYjN0ZX
   Q==;
X-CSE-ConnectionGUID: BknxEEGhQmyR+vEnfyziDQ==
X-CSE-MsgGUID: /Qfq3V05QqGh1eQqguCO/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="22819764"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="22819764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 04:12:38 -0700
X-CSE-ConnectionGUID: iDiylR0ZQzeaFIt4Bhv4Mg==
X-CSE-MsgGUID: USChdqzvTMua2yyyBzwoEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="62390499"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2024 04:12:36 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siBAf-000F8x-31;
	Sun, 25 Aug 2024 11:12:33 +0000
Date: Sun, 25 Aug 2024 19:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [krzk-mem-ctrl:mem-ctrl-next 25/25]
 drivers/memory/ti-aemif.c:382:40: error: use of undeclared identifier
 'child_np'
Message-ID: <202408251929.hkGEzzrd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git mem-ctrl-next
head:   5a5ac96f9bcaaa5f04a0ab70252ea708fb9eb8b4
commit: 5a5ac96f9bcaaa5f04a0ab70252ea708fb9eb8b4 [25/25] memory: ti-aemif: simplify with scoped for each OF child loop
config: i386-buildonly-randconfig-002-20240825 (https://download.01.org/0day-ci/archive/20240825/202408251929.hkGEzzrd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408251929.hkGEzzrd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408251929.hkGEzzrd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/memory/ti-aemif.c:382:40: error: use of undeclared identifier 'child_np'
     382 |                 for_each_available_child_of_node(np, child_np) {
         |                                                      ^
>> drivers/memory/ti-aemif.c:382:40: error: use of undeclared identifier 'child_np'
>> drivers/memory/ti-aemif.c:382:40: error: use of undeclared identifier 'child_np'
>> drivers/memory/ti-aemif.c:382:40: error: use of undeclared identifier 'child_np'
   drivers/memory/ti-aemif.c:383:31: error: use of undeclared identifier 'child_np'
     383 |                         ret = of_platform_populate(child_np, NULL, NULL, dev);
         |                                                    ^
   drivers/memory/ti-aemif.c:385:17: error: use of undeclared identifier 'child_np'
     385 |                                 of_node_put(child_np);
         |                                             ^
   6 errors generated.


vim +/child_np +382 drivers/memory/ti-aemif.c

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  325  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  326  static int aemif_probe(struct platform_device *pdev)
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  327  {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  328  	int i;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  329  	int ret = -ENODEV;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  330  	struct device *dev = &pdev->dev;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  331  	struct device_node *np = dev->of_node;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  332  	struct aemif_device *aemif;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  333  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  334  	aemif = devm_kzalloc(dev, sizeof(*aemif), GFP_KERNEL);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  335  	if (!aemif)
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  336  		return -ENOMEM;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  337  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  338  	platform_set_drvdata(pdev, aemif);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  339  
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  340  	aemif->clk = devm_clk_get_enabled(dev, NULL);
6d9eebfdfe2431 Krzysztof Kozlowski 2024-08-16  341  	if (IS_ERR(aemif->clk))
6d9eebfdfe2431 Krzysztof Kozlowski 2024-08-16  342  		return dev_err_probe(dev, PTR_ERR(aemif->clk),
6d9eebfdfe2431 Krzysztof Kozlowski 2024-08-16  343  				     "cannot get clock 'aemif'\n");
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  344  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  345  	aemif->clk_rate = clk_get_rate(aemif->clk) / MSEC_PER_SEC;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  346  
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  347  	if (np && of_device_is_compatible(np, "ti,da850-aemif"))
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  348  		aemif->cs_offset = 2;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  349  
083008defd83cb Krzysztof Kozlowski 2022-04-19  350  	aemif->base = devm_platform_ioremap_resource(pdev, 0);
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  351  	if (IS_ERR(aemif->base))
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  352  		return PTR_ERR(aemif->base);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  353  
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  354  	if (np) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  355  		/*
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  356  		 * For every controller device node, there is a cs device node
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  357  		 * that describe the bus configuration parameters. This
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  358  		 * functions iterate over these nodes and update the cs data
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  359  		 * array.
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  360  		 */
5a5ac96f9bcaaa Krzysztof Kozlowski 2024-08-16  361  		for_each_available_child_of_node_scoped(np, child_np) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  362  			ret = of_aemif_parse_abus_config(pdev, child_np);
5a5ac96f9bcaaa Krzysztof Kozlowski 2024-08-16  363  			if (ret < 0)
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  364  				return ret;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  365  		}
94e9dd43cf3273 Pan Bian            2021-01-21  366  	}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  367  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  368  	for (i = 0; i < aemif->num_cs; i++) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  369  		ret = aemif_config_abus(pdev, i);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  370  		if (ret < 0) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  371  			dev_err(dev, "Error configuring chip select %d\n",
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  372  				aemif->cs_data[i].cs);
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  373  			return ret;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  374  		}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  375  	}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  376  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  377  	/*
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  378  	 * Create a child devices explicitly from here to guarantee that the
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  379  	 * child will be probed after the AEMIF timing parameters are set.
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  380  	 */
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  381  	if (np) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24 @382  		for_each_available_child_of_node(np, child_np) {
8c38617722bdf5 Bartosz Golaszewski 2024-08-09  383  			ret = of_platform_populate(child_np, NULL, NULL, dev);
94e9dd43cf3273 Pan Bian            2021-01-21  384  			if (ret < 0) {
94e9dd43cf3273 Pan Bian            2021-01-21  385  				of_node_put(child_np);
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  386  				return ret;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  387  			}
94e9dd43cf3273 Pan Bian            2021-01-21  388  		}
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  389  	}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  390  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  391  	return 0;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  392  }
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  393  

:::::: The code at line 382 was first introduced by commit
:::::: 5a7c81547c1db7563afc005a509d1ac38d9e0884 memory: ti-aemif: introduce AEMIF driver

:::::: TO: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
