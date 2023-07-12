Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C217EACA;
	Wed, 12 Jul 2023 00:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689120089; x=1720656089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+dYUOMDmVHMoxhJMJILgnA9v+qVLm0S+ieYw+xGWUQ=;
  b=AB0jr7K6UFHA9A9OynJj3al4CgDK+Kfo8alqF4cUincTRDu3D1gsg3p3
   TX15uRHn3QN/eaSF6oP7M8AO2QnX0ArTCe2ClyA7SuevS6+fgKn8QJ0dH
   6f8OJw0pOW6DeCI+TZnveeTztOJ38LPwQ/w/tfVV/TtTOEkTezlooM7SJ
   Z65j5dERkGVFGdF36Is89PUxy2bPixaDseR36MUR7ZASVOC3nXz0QBjcC
   QxvrAyTOcV2PGBWk8uXh6zRVgKbzmN+vr+7/shXejs2mi4+nTQtSEV++F
   7VT3uO20H6+xOZL6lupoisold1LyXWytiGa0YnYcFPc7vooDUATtvZOPf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367385066"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="367385066"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 17:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="756560321"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="756560321"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Jul 2023 17:01:26 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJNIM-0005CX-0p;
	Wed, 12 Jul 2023 00:01:26 +0000
Date: Wed, 12 Jul 2023 08:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 22/94] drivers/clk/clk-lochnagar.c:249:8:
 warning: incompatible integer to pointer conversion assigning to 'const
 struct of_device_id *' from 'int'
Message-ID: <202307120721.4t0XQ1eq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   a06a0a7290918c32601c858af488a504c5e39025
commit: f048df4b58626a11855e74453a9d4015ce4b3fa3 [22/94] clk: Explicitly include correct DT includes
config: arm-randconfig-r032-20230710 (https://download.01.org/0day-ci/archive/20230712/202307120721.4t0XQ1eq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120721.4t0XQ1eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120721.4t0XQ1eq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-lochnagar.c:249:10: error: implicit declaration of function 'of_match_device' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           of_id = of_match_device(lochnagar_of_match, dev);
                   ^
   drivers/clk/clk-lochnagar.c:249:10: note: did you mean 'of_match_node'?
   include/linux/of.h:371:35: note: 'of_match_node' declared here
   extern const struct of_device_id *of_match_node(
                                     ^
>> drivers/clk/clk-lochnagar.c:249:8: warning: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
           of_id = of_match_device(lochnagar_of_match, dev);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +249 drivers/clk/clk-lochnagar.c

055ca54777b72e Charles Keepax 2019-06-25  236  
055ca54777b72e Charles Keepax 2019-06-25  237  static int lochnagar_clk_probe(struct platform_device *pdev)
76c547830bd116 Charles Keepax 2019-03-19  238  {
76c547830bd116 Charles Keepax 2019-03-19  239  	struct clk_init_data clk_init = {
76c547830bd116 Charles Keepax 2019-03-19  240  		.ops = &lochnagar_clk_ops,
76c547830bd116 Charles Keepax 2019-03-19  241  	};
055ca54777b72e Charles Keepax 2019-06-25  242  	struct device *dev = &pdev->dev;
055ca54777b72e Charles Keepax 2019-06-25  243  	struct lochnagar_clk_priv *priv;
055ca54777b72e Charles Keepax 2019-06-25  244  	const struct of_device_id *of_id;
76c547830bd116 Charles Keepax 2019-03-19  245  	struct lochnagar_clk *lclk;
055ca54777b72e Charles Keepax 2019-06-25  246  	struct lochnagar_config *conf;
76c547830bd116 Charles Keepax 2019-03-19  247  	int ret, i;
76c547830bd116 Charles Keepax 2019-03-19  248  
055ca54777b72e Charles Keepax 2019-06-25 @249  	of_id = of_match_device(lochnagar_of_match, dev);
055ca54777b72e Charles Keepax 2019-06-25  250  	if (!of_id)
055ca54777b72e Charles Keepax 2019-06-25  251  		return -EINVAL;
055ca54777b72e Charles Keepax 2019-06-25  252  
055ca54777b72e Charles Keepax 2019-06-25  253  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
055ca54777b72e Charles Keepax 2019-06-25  254  	if (!priv)
055ca54777b72e Charles Keepax 2019-06-25  255  		return -ENOMEM;
055ca54777b72e Charles Keepax 2019-06-25  256  
055ca54777b72e Charles Keepax 2019-06-25  257  	priv->dev = dev;
055ca54777b72e Charles Keepax 2019-06-25  258  	priv->regmap = dev_get_regmap(dev->parent, NULL);
055ca54777b72e Charles Keepax 2019-06-25  259  	conf = (struct lochnagar_config *)of_id->data;
055ca54777b72e Charles Keepax 2019-06-25  260  
055ca54777b72e Charles Keepax 2019-06-25  261  	memcpy(priv->lclks, conf->clks, sizeof(priv->lclks));
055ca54777b72e Charles Keepax 2019-06-25  262  
055ca54777b72e Charles Keepax 2019-06-25  263  	clk_init.parent_data = conf->parents;
055ca54777b72e Charles Keepax 2019-06-25  264  	clk_init.num_parents = conf->nparents;
055ca54777b72e Charles Keepax 2019-06-25  265  
76c547830bd116 Charles Keepax 2019-03-19  266  	for (i = 0; i < ARRAY_SIZE(priv->lclks); i++) {
76c547830bd116 Charles Keepax 2019-03-19  267  		lclk = &priv->lclks[i];
76c547830bd116 Charles Keepax 2019-03-19  268  
76c547830bd116 Charles Keepax 2019-03-19  269  		if (!lclk->name)
76c547830bd116 Charles Keepax 2019-03-19  270  			continue;
76c547830bd116 Charles Keepax 2019-03-19  271  
76c547830bd116 Charles Keepax 2019-03-19  272  		clk_init.name = lclk->name;
76c547830bd116 Charles Keepax 2019-03-19  273  
76c547830bd116 Charles Keepax 2019-03-19  274  		lclk->priv = priv;
76c547830bd116 Charles Keepax 2019-03-19  275  		lclk->hw.init = &clk_init;
76c547830bd116 Charles Keepax 2019-03-19  276  
055ca54777b72e Charles Keepax 2019-06-25  277  		ret = devm_clk_hw_register(dev, &lclk->hw);
76c547830bd116 Charles Keepax 2019-03-19  278  		if (ret) {
055ca54777b72e Charles Keepax 2019-06-25  279  			dev_err(dev, "Failed to register %s: %d\n",
76c547830bd116 Charles Keepax 2019-03-19  280  				lclk->name, ret);
76c547830bd116 Charles Keepax 2019-03-19  281  			return ret;
76c547830bd116 Charles Keepax 2019-03-19  282  		}
76c547830bd116 Charles Keepax 2019-03-19  283  	}
76c547830bd116 Charles Keepax 2019-03-19  284  
055ca54777b72e Charles Keepax 2019-06-25  285  	ret = devm_of_clk_add_hw_provider(dev, lochnagar_of_clk_hw_get, priv);
76c547830bd116 Charles Keepax 2019-03-19  286  	if (ret < 0)
055ca54777b72e Charles Keepax 2019-06-25  287  		dev_err(dev, "Failed to register provider: %d\n", ret);
76c547830bd116 Charles Keepax 2019-03-19  288  
76c547830bd116 Charles Keepax 2019-03-19  289  	return ret;
76c547830bd116 Charles Keepax 2019-03-19  290  }
76c547830bd116 Charles Keepax 2019-03-19  291  

:::::: The code at line 249 was first introduced by commit
:::::: 055ca54777b72e4e3d1b1f4e76376b8428086c02 clk: lochnagar: Use new parent_data approach to register clock parents

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
