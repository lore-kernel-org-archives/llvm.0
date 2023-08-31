Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89155846E;
	Thu, 31 Aug 2023 09:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693472690; x=1725008690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ok+jAum4JmAkNoGAGtMnPgw9SdL7j6pyPh03EKX+NQE=;
  b=CVFS/6+j27It00UtcXnQAyrLHDv79gh5Ul9oFUtByqiGcASpP96jClds
   +v/MwAkEVH4OScxPZRO9cOePWZkVR+kloEbVZdtlUL79BEwhbVRYbAOsA
   FQsIlU9E49PTEEy5Pd8l0lrf4NF32Y/Yi9YZnEKiQBZofUjue42w98C+B
   90uYclgB0iJUTWU+6NRmR/mQm0C9XoI7GtnxKtb5VWaFQu41EUhz+9Bqr
   yuCx4WhrFeXtnUmUBL0E79dYgevw7wwFsaWZetRBG1kgtmJwDXeUKDouY
   wDqoA3zGBlj3ifCgSg+zGIjSgsfeYvQBbBJtzM+Ny7RmfeYSFrNpvy/Z7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="366071169"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="366071169"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 02:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862952355"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="862952355"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 02:04:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbdbX-000BA6-0l;
	Thu, 31 Aug 2023 09:04:43 +0000
Date: Thu, 31 Aug 2023 17:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 6/7] sound/soc/samsung/smdk_wm8994.c:173:7:
 error: call to undeclared function 'of_match_device'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202308311611.UYSTGY7t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: f4013f411676ad6281f520bdc4ba108b089fc2b8 [6/7] ASoC: Clean-up DT includes
config: arm64-randconfig-r021-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311611.UYSTGY7t-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311611.UYSTGY7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311611.UYSTGY7t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/samsung/smdk_wm8994.c:173:7: error: call to undeclared function 'of_match_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
         |              ^
   sound/soc/samsung/smdk_wm8994.c:173:7: note: did you mean 'of_match_node'?
   include/linux/of.h:370:35: note: 'of_match_node' declared here
     370 | extern const struct of_device_id *of_match_node(
         |                                   ^
>> sound/soc/samsung/smdk_wm8994.c:173:5: error: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
     173 |         id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/of_match_device +173 sound/soc/samsung/smdk_wm8994.c

96657d33b9ba4e Jassi Brar           2010-12-20  143  
fdca21ad460320 Bill Pemberton       2012-12-07  144  static int smdk_audio_probe(struct platform_device *pdev)
96657d33b9ba4e Jassi Brar           2010-12-20  145  {
96657d33b9ba4e Jassi Brar           2010-12-20  146  	int ret;
28a480583361b8 Padmavathi Venna     2013-01-18  147  	struct device_node *np = pdev->dev.of_node;
9c9acc91561221 Sachin Kamat         2012-07-03  148  	struct snd_soc_card *card = &smdk;
d30c148bb1cab2 Mark Brown           2013-07-26  149  	struct smdk_wm8994_data *board;
d30c148bb1cab2 Mark Brown           2013-07-26  150  	const struct of_device_id *id;
96657d33b9ba4e Jassi Brar           2010-12-20  151  
9c9acc91561221 Sachin Kamat         2012-07-03  152  	card->dev = &pdev->dev;
28a480583361b8 Padmavathi Venna     2013-01-18  153  
d30c148bb1cab2 Mark Brown           2013-07-26  154  	board = devm_kzalloc(&pdev->dev, sizeof(*board), GFP_KERNEL);
d30c148bb1cab2 Mark Brown           2013-07-26  155  	if (!board)
d30c148bb1cab2 Mark Brown           2013-07-26  156  		return -ENOMEM;
d30c148bb1cab2 Mark Brown           2013-07-26  157  
28a480583361b8 Padmavathi Venna     2013-01-18  158  	if (np) {
2f8ea84e3a8c9d Kuninori Morimoto    2019-06-06  159  		smdk_dai[0].cpus->dai_name = NULL;
2f8ea84e3a8c9d Kuninori Morimoto    2019-06-06  160  		smdk_dai[0].cpus->of_node = of_parse_phandle(np,
28a480583361b8 Padmavathi Venna     2013-01-18  161  				"samsung,i2s-controller", 0);
2f8ea84e3a8c9d Kuninori Morimoto    2019-06-06  162  		if (!smdk_dai[0].cpus->of_node) {
28a480583361b8 Padmavathi Venna     2013-01-18  163  			dev_err(&pdev->dev,
28a480583361b8 Padmavathi Venna     2013-01-18  164  			   "Property 'samsung,i2s-controller' missing or invalid\n");
28a480583361b8 Padmavathi Venna     2013-01-18  165  			ret = -EINVAL;
fbb123e248c127 Pierre-Louis Bossart 2021-02-19  166  			return ret;
28a480583361b8 Padmavathi Venna     2013-01-18  167  		}
806bfc27ea84e7 Kuninori Morimoto    2019-06-28  168  
806bfc27ea84e7 Kuninori Morimoto    2019-06-28  169  		smdk_dai[0].platforms->name = NULL;
806bfc27ea84e7 Kuninori Morimoto    2019-06-28  170  		smdk_dai[0].platforms->of_node = smdk_dai[0].cpus->of_node;
28a480583361b8 Padmavathi Venna     2013-01-18  171  	}
28a480583361b8 Padmavathi Venna     2013-01-18  172  
0670c9a7239a47 Krzysztof Kozlowski  2020-11-25 @173  	id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
d30c148bb1cab2 Mark Brown           2013-07-26  174  	if (id)
d30c148bb1cab2 Mark Brown           2013-07-26  175  		*board = *((struct smdk_wm8994_data *)id->data);
d30c148bb1cab2 Mark Brown           2013-07-26  176  
d30c148bb1cab2 Mark Brown           2013-07-26  177  	platform_set_drvdata(pdev, board);
d30c148bb1cab2 Mark Brown           2013-07-26  178  
9a8e0322f0a8c7 Mark Brown           2013-09-16  179  	ret = devm_snd_soc_register_card(&pdev->dev, card);
96657d33b9ba4e Jassi Brar           2010-12-20  180  
27c6eaebcf75e4 Kuninori Morimoto    2021-12-14  181  	if (ret)
27c6eaebcf75e4 Kuninori Morimoto    2021-12-14  182  		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
96657d33b9ba4e Jassi Brar           2010-12-20  183  
96657d33b9ba4e Jassi Brar           2010-12-20  184  	return ret;
96657d33b9ba4e Jassi Brar           2010-12-20  185  }
96657d33b9ba4e Jassi Brar           2010-12-20  186  

:::::: The code at line 173 was first introduced by commit
:::::: 0670c9a7239a478ec9675fa82d7ee0a86ef22fe5 ASoC: samsung: smdk_wm8994: remove redundant of_match_ptr()

:::::: TO: Krzysztof Kozlowski <krzk@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
