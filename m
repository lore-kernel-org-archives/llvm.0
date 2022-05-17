Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BA7F
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652776096; x=1684312096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ANWjwySSf+isMxc3c8zvUGy03EgHSjUil/uUhE9vZ3o=;
  b=M7nIOhD4LX3ECZgxLNYXXonzpJJyCmSsH3bhx84yRZu7EUxJmNao+LnQ
   XVn8u9iD708n0tV3yIqclNXDUB+gXzf+2GuWfIhEdn+B6t1DDDZ+lI3lC
   LlNC42gzoABHmAkK++KngxQel8gKqw0fYwM4KQh3YNwDshQwCdCh0ol4n
   IlCvOBI9k+XKHbT+aQk4lMp6i0zCJKYOtWJOLz0zx1R0Yx530V08pUW54
   LuJnRT1GMLgckHG8XEJJZtAKbCF6Q5bxJaBoQ9wIfi28QslR9LurPnrjP
   UxFh8WPNUr7hQRFQeePJN6KyuG1LF0pXggHSRhE+/QOEFaSfw7jfW+pWC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="269934549"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="269934549"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 01:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="544799154"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 May 2022 01:28:13 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqsYv-0000kv-4G;
	Tue, 17 May 2022 08:28:13 +0000
Date: Tue, 17 May 2022 16:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Drop unsued irqchip member in
 struct intel_pinctrl
Message-ID: <202205171604.SlOyezRn-lkp@intel.com>
References: <20220516185618.32448-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516185618.32448-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on v5.18-rc7 next-20220516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-intel-make-irq_chip-immutable/20220517-025735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: i386-randconfig-a001-20220516 (https://download.01.org/0day-ci/archive/20220517/202205171604.SlOyezRn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/396b7abcd486a384c9b8fd7a0ecb13aff05e2163
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/pinctrl-intel-make-irq_chip-immutable/20220517-025735
        git checkout 396b7abcd486a384c9b8fd7a0ecb13aff05e2163
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/intel/pinctrl-baytrail.c:1636:7: error: no member named 'irqchip' in 'struct intel_pinctrl'
                   vg->irqchip.name = "BYT-GPIO",
                   ~~  ^
   drivers/pinctrl/intel/pinctrl-baytrail.c:1637:7: error: no member named 'irqchip' in 'struct intel_pinctrl'
                   vg->irqchip.irq_ack = byt_irq_ack,
                   ~~  ^
   drivers/pinctrl/intel/pinctrl-baytrail.c:1638:7: error: no member named 'irqchip' in 'struct intel_pinctrl'
                   vg->irqchip.irq_mask = byt_irq_mask,
                   ~~  ^
   drivers/pinctrl/intel/pinctrl-baytrail.c:1639:7: error: no member named 'irqchip' in 'struct intel_pinctrl'
                   vg->irqchip.irq_unmask = byt_irq_unmask,
                   ~~  ^
   drivers/pinctrl/intel/pinctrl-baytrail.c:1640:7: error: no member named 'irqchip' in 'struct intel_pinctrl'
                   vg->irqchip.irq_set_type = byt_irq_type,
                   ~~  ^
   drivers/pinctrl/intel/pinctrl-baytrail.c:1641:7: error: no member named 'irqchip' in 'struct intel_pinctrl'
                   vg->irqchip.flags = IRQCHIP_SKIP_SET_WAKE | IRQCHIP_SET_TYPE_MASKED,
                   ~~  ^
   drivers/pinctrl/intel/pinctrl-baytrail.c:1644:21: error: no member named 'irqchip' in 'struct intel_pinctrl'
                   girq->chip = &vg->irqchip;
                                 ~~  ^
   7 errors generated.


vim +1636 drivers/pinctrl/intel/pinctrl-baytrail.c

e1ee5c578fb1fa drivers/pinctrl/pinctrl-baytrail.c       Mika Westerberg 2014-07-25  1630  
a5d811bbf1c6df drivers/pinctrl/pinctrl-baytrail.c       Mathias Nyman   2013-06-18  1631  	/* set up interrupts  */
f86a1bb536064a drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2020-04-14  1632  	irq = platform_get_irq_optional(pdev, 0);
f86a1bb536064a drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2020-04-14  1633  	if (irq > 0) {
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1634  		struct gpio_irq_chip *girq;
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1635  
539d8bde72c22d drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24 @1636  		vg->irqchip.name = "BYT-GPIO",
539d8bde72c22d drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24  1637  		vg->irqchip.irq_ack = byt_irq_ack,
539d8bde72c22d drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24  1638  		vg->irqchip.irq_mask = byt_irq_mask,
539d8bde72c22d drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24  1639  		vg->irqchip.irq_unmask = byt_irq_unmask,
539d8bde72c22d drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24  1640  		vg->irqchip.irq_set_type = byt_irq_type,
6b4542664c2d1f drivers/pinctrl/intel/pinctrl-baytrail.c Hans de Goede   2021-11-22  1641  		vg->irqchip.flags = IRQCHIP_SKIP_SET_WAKE | IRQCHIP_SET_TYPE_MASKED,
539d8bde72c22d drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24  1642  
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1643  		girq = &gc->irq;
539d8bde72c22d drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24  1644  		girq->chip = &vg->irqchip;
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1645  		girq->init_hw = byt_gpio_irq_init_hw;
ab68b220e81fd0 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-10-24  1646  		girq->init_valid_mask = byt_init_irq_valid_mask;
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1647  		girq->parent_handler = byt_gpio_irq_handler;
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1648  		girq->num_parents = 1;
990ec243cb77c6 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-25  1649  		girq->parents = devm_kcalloc(vg->dev, girq->num_parents,
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1650  					     sizeof(*girq->parents), GFP_KERNEL);
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1651  		if (!girq->parents)
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1652  			return -ENOMEM;
f86a1bb536064a drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2020-04-14  1653  		girq->parents[0] = irq;
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1654  		girq->default_type = IRQ_TYPE_NONE;
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1655  		girq->handler = handle_bad_irq;
605a7bca7cf39c drivers/pinctrl/pinctrl-baytrail.c       Jin Yao         2014-05-15  1656  	}
605a7bca7cf39c drivers/pinctrl/pinctrl-baytrail.c       Jin Yao         2014-05-15  1657  
990ec243cb77c6 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-25  1658  	ret = devm_gpiochip_add_data(vg->dev, gc, vg);
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1659  	if (ret) {
990ec243cb77c6 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-25  1660  		dev_err(vg->dev, "failed adding byt-gpio chip\n");
ca8a958e2acb41 drivers/pinctrl/intel/pinctrl-baytrail.c Andy Shevchenko 2019-11-05  1661  		return ret;
e1ee5c578fb1fa drivers/pinctrl/pinctrl-baytrail.c       Mika Westerberg 2014-07-25  1662  	}
e1ee5c578fb1fa drivers/pinctrl/pinctrl-baytrail.c       Mika Westerberg 2014-07-25  1663  
71e6ca61e82667 drivers/pinctrl/intel/pinctrl-baytrail.c Cristina Ciocan 2016-04-01  1664  	return ret;
71e6ca61e82667 drivers/pinctrl/intel/pinctrl-baytrail.c Cristina Ciocan 2016-04-01  1665  }
71e6ca61e82667 drivers/pinctrl/intel/pinctrl-baytrail.c Cristina Ciocan 2016-04-01  1666  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
