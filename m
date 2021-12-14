Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9F168
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639497762; x=1671033762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KCHH/69oO7EB/S6UVLK7hHuKKueHa2TUH3blx2s3spI=;
  b=TKzhIxYt/4smvQnBsZu0nOGv9hmOH4jvCG9SBwbOM9f3OqEJKoIkZPqY
   F0/+g65jnSbqHYn8lXlzLbBWusNe6tqHEYcnQwVHchSU2ZpOzTwksC/zH
   xDNKh32ow1E5SvdyEu+0i856paLProf3VmEKZ0rgMAhy6EazrbAEqstpR
   g8IdaivOLBB5RDAk83sS2OYyx9slxE7DbVy+KQ0125xYrfijcIsLCSDBC
   yboxh2nvbx5k1L2uCSCYhCo1RZ3Rc8ccKiaTmEZxinpifYFtyYCLTsB0n
   bvmfboDKKMQdNIf4UQjwM8fV9/WlzVSnD7DkX+aOaNfBHMui2XzCiQ0MD
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302385535"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="302385535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 08:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="682106869"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2021 08:02:12 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxAFn-0000UA-H7; Tue, 14 Dec 2021 16:02:11 +0000
Date: Wed, 15 Dec 2021 00:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
	Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
	Colin Foster <colin.foster@in-advantage.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] pinctrl: Propagate firmware node from a parent
 device
Message-ID: <202112142358.CrwPNZbA-lkp@intel.com>
References: <20211214125855.33207-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214125855.33207-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on linusw-pinctrl/devel]
[cannot apply to geert-renesas-drivers/renesas-pinctrl v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/pinctrl-Get-rid-of-duplicate-of_node-assignment-in-the-drivers/20211214-210027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: x86_64-randconfig-a012-20211214 (https://download.01.org/0day-ci/archive/20211214/202112142358.CrwPNZbA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fb259425f395e043cd3ef074641937e28d0cffb9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/pinctrl-Get-rid-of-duplicate-of_node-assignment-in-the-drivers/20211214-210027
        git checkout fb259425f395e043cd3ef074641937e28d0cffb9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-max77620.c:649:64: error: array has incomplete element type 'const struct platform_device_id'
   static const struct platform_device_id max77620_pinctrl_devtype[] = {
                                                                  ^
   include/linux/platform_device.h:21:8: note: forward declaration of 'struct platform_device_id'
   struct platform_device_id;
          ^
   1 error generated.


vim +649 drivers/pinctrl/pinctrl-max77620.c

2df723d49cdafb6 Laxman Dewangan 2016-05-13  648  
2df723d49cdafb6 Laxman Dewangan 2016-05-13 @649  static const struct platform_device_id max77620_pinctrl_devtype[] = {
2df723d49cdafb6 Laxman Dewangan 2016-05-13  650  	{ .name = "max77620-pinctrl", },
2df723d49cdafb6 Laxman Dewangan 2016-05-13  651  	{ .name = "max20024-pinctrl", },
2df723d49cdafb6 Laxman Dewangan 2016-05-13  652  	{},
2df723d49cdafb6 Laxman Dewangan 2016-05-13  653  };
2df723d49cdafb6 Laxman Dewangan 2016-05-13  654  MODULE_DEVICE_TABLE(platform, max77620_pinctrl_devtype);
2df723d49cdafb6 Laxman Dewangan 2016-05-13  655  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
