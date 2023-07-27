Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B891FAA;
	Thu, 27 Jul 2023 05:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690434589; x=1721970589;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=twlFJ1pRgImSwV8iip5cYzV3O4vCJJV3TjVpVLfdOfc=;
  b=mCg2EsVecpgllj7/TogMMePVGoQhtFSDFreCsFp5QV8xDrFeR7tKYUwa
   2nciHCYVOjrpAHu/EyAc3P/8ueZ9WyjUzwV6Jjy28jQAOZSimnW27lSqN
   2M137ZfsouYAAp0Ii5WMYW9zucNbfoM0XKMdAgiUhDH8ICvOioBXaxlmT
   uROOv3now0/5aM54sZwAKB6/KeEJDc1OITFBPa8BI3GM+T8MzOYIVHuJO
   ir43s1ersxk3Vtk2tyhSZuj6Hbr4ABIOz2YrjwDyzSlnZqX0i49EswihJ
   zR8+k9OWxbkSEhuN9GVeyJ5L3FFO028gWHbOYQCnYnPlJ8HeDhBdvkYSf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368222567"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="368222567"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="730121401"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="730121401"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 22:09:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOtFw-0001x2-1l;
	Thu, 27 Jul 2023 05:09:44 +0000
Date: Thu, 27 Jul 2023 13:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 2/2] drivers/char/hw_random/ingenic-rng.c:98:18:
 warning: cast to smaller integer type 'enum ingenic_rng_version' from 'const
 void *'
Message-ID: <202307271321.6hzeB34d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   683789ff1e1c0a9373ca20daed4bbc700eccc22e
commit: 683789ff1e1c0a9373ca20daed4bbc700eccc22e [2/2] hw_random: Enable COMPILE_TEST for more drivers
config: arm64-randconfig-r026-20230726 (https://download.01.org/0day-ci/archive/20230727/202307271321.6hzeB34d-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271321.6hzeB34d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271321.6hzeB34d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/ingenic-rng.c:98:18: warning: cast to smaller integer type 'enum ingenic_rng_version' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           priv->version = (enum ingenic_rng_version)of_device_get_match_data(&pdev->dev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +98 drivers/char/hw_random/ingenic-rng.c

190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   82) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   83) static int ingenic_rng_probe(struct platform_device *pdev)
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   84) {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   85) 	struct ingenic_rng *priv;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   86) 	int ret;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   87) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   88) 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   89) 	if (!priv)
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   90) 		return -ENOMEM;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   91) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   92) 	priv->base = devm_platform_ioremap_resource(pdev, 0);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   93) 	if (IS_ERR(priv->base)) {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   94) 		pr_err("%s: Failed to map RNG registers\n", __func__);
11a954eebc4396 Wei Yongjun          2020-08-04   95  		return PTR_ERR(priv->base);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   96) 	}
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   97) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  @98) 	priv->version = (enum ingenic_rng_version)of_device_get_match_data(&pdev->dev);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   99) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  100) 	priv->rng.name = pdev->name;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  101) 	priv->rng.init = ingenic_rng_init;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  102) 	priv->rng.cleanup = ingenic_rng_cleanup;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  103) 	priv->rng.read = ingenic_rng_read;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  104) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  105) 	ret = hwrng_register(&priv->rng);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  106) 	if (ret) {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  107) 		dev_err(&pdev->dev, "Failed to register hwrng\n");
11a954eebc4396 Wei Yongjun          2020-08-04  108  		return ret;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  109) 	}
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  110) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  111) 	platform_set_drvdata(pdev, priv);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  112) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  113) 	dev_info(&pdev->dev, "Ingenic RNG driver registered\n");
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  114) 	return 0;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  115) }
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  116) 

:::::: The code at line 98 was first introduced by commit
:::::: 190873a0ea4500433ae818521cad20d37f9ee059 crypto: ingenic - Add hardware RNG for Ingenic JZ4780 and X1000

:::::: TO: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
