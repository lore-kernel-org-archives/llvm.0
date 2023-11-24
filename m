Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4182EAED;
	Fri, 24 Nov 2023 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuovfOMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840491; x=1732376491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPVhGnayyHRi1PfnXGPLZkAD68B6MJlaq0Mlde2TKnY=;
  b=QuovfOMkc5K3Q9OAiBoc0pZxWccPfy0NTIDpjn7JAw/9XEFd4N1Q3EJm
   NzM5lEdcNRUVZB3IET+155Oj9Z9PJUiObI+gyGZG4LokQyFm1sjpqlAgX
   FNqD9M4XzKa/i2HJR068W/ejL6A7yuD40DOoXmgiO4KwTcu8ltSYSSSy+
   7lmV18QmkpUYUZ3k6sB3bhBhqyTpzhOXZe0MczwMgFTnSJM+Nij+GgnTL
   GpOq8KBlsuFqfFs3Ra2ppKK4wepjadiYE7VET77YQm+fqvWZkcAQm1I1x
   9Ei0gZORMS0is0DMQVh/x/ARCBFuSb2LvhfE+p8paq+BbQX0EeaeIMpyn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423577112"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423577112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="833714367"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="833714367"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 07:41:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YIz-0002xv-0z;
	Fri, 24 Nov 2023 15:41:21 +0000
Date: Fri, 24 Nov 2023 23:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [linux-next:master 2799/2998] drivers/leds/leds-max5970.c:48:21:
 warning: variable 'num_leds' set but not used
Message-ID: <202311241836.JpSWGIRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: 8171710be2d04fdc263da49212d7b875d3688f58 [2799/2998] leds: max5970: Add support for max5970
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231124/202311241836.JpSWGIRK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241836.JpSWGIRK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241836.JpSWGIRK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-max5970.c:48:21: warning: variable 'num_leds' set but not used [-Wunused-but-set-variable]
           int ret = -ENODEV, num_leds = 0;
                              ^
   1 warning generated.


vim +/num_leds +48 drivers/leds/leds-max5970.c

    40	
    41	static int max5970_led_probe(struct platform_device *pdev)
    42	{
    43		struct device *dev = &pdev->dev;
    44		struct device_node *np = dev_of_node(dev->parent);
    45		struct regmap *regmap;
    46		struct device_node *led_node, *child;
    47		struct max5970_led *ddata;
  > 48		int ret = -ENODEV, num_leds = 0;
    49	
    50		regmap = dev_get_regmap(pdev->dev.parent, NULL);
    51		if (!regmap)
    52			return -ENODEV;
    53	
    54		led_node = of_get_child_by_name(np, "leds");
    55		if (!led_node)
    56			return -ENODEV;
    57	
    58		for_each_available_child_of_node(led_node, child) {
    59			u32 reg;
    60	
    61			if (of_property_read_u32(child, "reg", &reg))
    62				continue;
    63	
    64			if (reg >= MAX5970_NUM_LEDS) {
    65				dev_err(dev, "invalid LED (%u >= %d)\n", reg, MAX5970_NUM_LEDS);
    66				continue;
    67			}
    68	
    69			ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
    70			if (!ddata) {
    71				of_node_put(child);
    72				return -ENOMEM;
    73			}
    74	
    75			ddata->index = reg;
    76			ddata->regmap = regmap;
    77			ddata->dev = dev;
    78	
    79			if (of_property_read_string(child, "label", &ddata->cdev.name))
    80				ddata->cdev.name = child->name;
    81	
    82			ddata->cdev.max_brightness = 1;
    83			ddata->cdev.brightness_set_blocking = max5970_led_set_brightness;
    84			ddata->cdev.default_trigger = "none";
    85	
    86			ret = devm_led_classdev_register(dev, &ddata->cdev);
    87			if (ret < 0) {
    88				of_node_put(child);
    89				dev_err(dev, "Failed to initialize LED %u\n", reg);
    90				return ret;
    91			}
    92			num_leds++;
    93		}
    94	
    95		return ret;
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
