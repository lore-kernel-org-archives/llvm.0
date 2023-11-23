Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8085E1FA2;
	Thu, 23 Nov 2023 01:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUVXiL4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704520; x=1732240520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ftBrnZe1VCAG/+lgrZnZM2kyM6tPGdYUKXIO0+taZTE=;
  b=XUVXiL4NIkmiy4qXyW3FGLulwVDX13RwT5aZc9QNKlrIOUjJzn8wLYNU
   aD3/lSbp2lRNORrbFpmGq5KX4xZHgLtckyChk0pSX7tyBxSJgWhNiY4Rr
   SMIE97aCHYrUpVGV4fxeEQUtiblcFuFaSoiPLhlxtKWi2EF3HMT/2surP
   o3aEhzCei7PIcFx/UPnSvM6h1KemvHt9VI/Gx79Tws7qQ0wpSpe5v+eku
   +UwkG+h9e4iSzmsOcDOcYl3bQqSjJoz0Zba1/kRDDtI83BEichBNLNoYZ
   hYj7qAhpwXWkSxm6io93Sa85UlZ4QqSVzoo6Y0OZwab9nDSqoENCtf80i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13737205"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13737205"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801909601"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801909601"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Nov 2023 17:55:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvz-00016Z-1y;
	Thu, 23 Nov 2023 01:55:15 +0000
Date: Thu, 23 Nov 2023 09:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lukas Funke <Lukas.Funke@weidmueller.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] extcon: usbc-tusb320: Set interrupt polarity based on
 device-tree
Message-ID: <202311230606.jY9zcxcB-lkp@intel.com>
References: <20231121124844.872238-1-lukas.funke-oss@weidmueller.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121124844.872238-1-lukas.funke-oss@weidmueller.com>

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on chanwoo-extcon/extcon-next]
[also build test ERROR on linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Funke/extcon-usbc-tusb320-Set-interrupt-polarity-based-on-device-tree/20231121-205141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
patch link:    https://lore.kernel.org/r/20231121124844.872238-1-lukas.funke-oss%40weidmueller.com
patch subject: [PATCH] extcon: usbc-tusb320: Set interrupt polarity based on device-tree
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231123/202311230606.jY9zcxcB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230606.jY9zcxcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230606.jY9zcxcB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/extcon/extcon-usbc-tusb320.c:573:10: error: call to undeclared function 'irq_get_irq_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           irq_d = irq_get_irq_data(client->irq);
                   ^
   drivers/extcon/extcon-usbc-tusb320.c:573:10: note: did you mean 'irq_set_irq_wake'?
   include/linux/interrupt.h:482:12: note: 'irq_set_irq_wake' declared here
   extern int irq_set_irq_wake(unsigned int irq, unsigned int on);
              ^
>> drivers/extcon/extcon-usbc-tusb320.c:573:8: error: incompatible integer to pointer conversion assigning to 'struct irq_data *' from 'int' [-Wint-conversion]
           irq_d = irq_get_irq_data(client->irq);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/extcon/extcon-usbc-tusb320.c:579:12: error: call to undeclared function 'irqd_get_trigger_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           irq_pol = irqd_get_trigger_type(irq_d);
                     ^
   3 errors generated.


vim +/irq_get_irq_data +573 drivers/extcon/extcon-usbc-tusb320.c

   511	
   512	static int tusb320_probe(struct i2c_client *client)
   513	{
   514		struct tusb320_priv *priv;
   515		const void *match_data;
   516		unsigned int revision;
   517		int ret;
   518		int irq_pol;
   519		struct irq_data *irq_d;
   520	
   521		priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
   522		if (!priv)
   523			return -ENOMEM;
   524	
   525		priv->dev = &client->dev;
   526		i2c_set_clientdata(client, priv);
   527	
   528		priv->regmap = devm_regmap_init_i2c(client, &tusb320_regmap_config);
   529		if (IS_ERR(priv->regmap))
   530			return PTR_ERR(priv->regmap);
   531	
   532		ret = tusb320_check_signature(priv);
   533		if (ret)
   534			return ret;
   535	
   536		match_data = device_get_match_data(&client->dev);
   537		if (!match_data)
   538			return -EINVAL;
   539	
   540		priv->ops = (struct tusb320_ops*)match_data;
   541	
   542		if (priv->ops->get_revision) {
   543			ret = priv->ops->get_revision(priv, &revision);
   544			if (ret)
   545				dev_warn(priv->dev,
   546					"failed to read revision register: %d\n", ret);
   547			else
   548				dev_info(priv->dev, "chip revision %d\n", revision);
   549		}
   550	
   551		ret = tusb320_extcon_probe(priv);
   552		if (ret)
   553			return ret;
   554	
   555		ret = tusb320_typec_probe(client, priv);
   556		if (ret)
   557			return ret;
   558	
   559		/* update initial state */
   560		tusb320_state_update_handler(priv, true);
   561	
   562		/* Reset chip to its default state */
   563		ret = tusb320_reset(priv);
   564		if (ret)
   565			dev_warn(priv->dev, "failed to reset chip: %d\n", ret);
   566		else
   567			/*
   568			 * State and polarity might change after a reset, so update
   569			 * them again and make sure the interrupt status bit is cleared.
   570			 */
   571			tusb320_state_update_handler(priv, true);
   572	
 > 573		irq_d = irq_get_irq_data(client->irq);
   574		if (!irq_d) {
   575			dev_err(&client->dev, "Invalid IRQ: %d\n", client->irq);
   576			return -ENODEV;
   577		}
   578	
 > 579		irq_pol = irqd_get_trigger_type(irq_d);
   580	
   581		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
   582						tusb320_irq_handler,
   583						IRQF_ONESHOT | irq_pol,
   584						client->name, priv);
   585		if (ret)
   586			tusb320_typec_remove(priv);
   587	
   588		return ret;
   589	}
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
