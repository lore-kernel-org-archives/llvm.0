Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47EF17C4;
	Wed, 19 Jul 2023 02:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689735483; x=1721271483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UTS8tic412yj99yRyRdk89J0/bqjF94lmcgbbzGc4a0=;
  b=aziO6SDcgt8ZUs1CNz887OmGq7eTnHIqnMRPN4/WB0G8Hy8pC9Lxxc5/
   UxJwxANuyNr8a6Pqvagp4R7NWgmFgQk+4HTuDMkhzK2Ab48utMEd/zRYI
   byvxfex0QKU1z0Dy09st90Wo8Mko3aNGgJ0PXKRQg9EG3F0S4ilwmo6wm
   +W4yzcgnX7zHkN0r1JcGycCUDY3YvsTJ4xkW/dwOw5/O95N6NqVrOzKJ8
   qqkMMHFkNDf5NmzbR7vVm1XN5/c7vM6JhubpRq88gZEY/ZX5ifCEGMcWV
   CkeETl9pQ9tryipyOUeWUqBGD76/0pkgJAmcZ4iteNLTA+jI9ubmNXbYC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345948695"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="345948695"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="723843232"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="723843232"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 18 Jul 2023 19:58:00 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLxO3-00045p-2A;
	Wed, 19 Jul 2023 02:57:59 +0000
Date: Wed, 19 Jul 2023 10:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Ming <machel@vivo.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] reset: hisilicon: Use dev_err_probe instead of dev_err
Message-ID: <202307191040.jWQyBc5s-lkp@intel.com>
References: <20230718030511.16065-1-machel@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718030511.16065-1-machel@vivo.com>

Hi Wang,

kernel test robot noticed the following build errors:

[auto build test ERROR on pza/reset/next]
[also build test ERROR on linus/master v6.5-rc2 next-20230718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wang-Ming/reset-hisilicon-Use-dev_err_probe-instead-of-dev_err/20230718-203055
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20230718030511.16065-1-machel%40vivo.com
patch subject: [PATCH v1] reset: hisilicon: Use dev_err_probe instead of dev_err
config: arm-randconfig-r003-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191040.jWQyBc5s-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191040.jWQyBc5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191040.jWQyBc5s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/reset/hisilicon/reset-hi3660.c:93:60: error: too few arguments to function call, expected at least 3, have 2
      93 |                 dev_err_probe(dev, "failed to get hisilicon,rst-syscon\n");
         |                 ~~~~~~~~~~~~~                                            ^
   include/linux/device.h:1091:20: note: 'dev_err_probe' declared here
    1091 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^
   1 error generated.


vim +93 drivers/reset/hisilicon/reset-hi3660.c

    75	
    76	static int hi3660_reset_probe(struct platform_device *pdev)
    77	{
    78		struct hi3660_reset_controller *rc;
    79		struct device_node *np = pdev->dev.of_node;
    80		struct device *dev = &pdev->dev;
    81	
    82		rc = devm_kzalloc(dev, sizeof(*rc), GFP_KERNEL);
    83		if (!rc)
    84			return -ENOMEM;
    85	
    86		rc->map = syscon_regmap_lookup_by_phandle(np, "hisilicon,rst-syscon");
    87		if (rc->map == ERR_PTR(-ENODEV)) {
    88			/* fall back to the deprecated compatible */
    89			rc->map = syscon_regmap_lookup_by_phandle(np,
    90								  "hisi,rst-syscon");
    91		}
    92		if (IS_ERR(rc->map)) {
  > 93			dev_err_probe(dev, "failed to get hisilicon,rst-syscon\n");
    94			return PTR_ERR(rc->map);
    95		}
    96	
    97		rc->rst.ops = &hi3660_reset_ops,
    98		rc->rst.of_node = np;
    99		rc->rst.of_reset_n_cells = 2;
   100		rc->rst.of_xlate = hi3660_reset_xlate;
   101	
   102		return reset_controller_register(&rc->rst);
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
