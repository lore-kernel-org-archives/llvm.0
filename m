Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8B46A3
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656943948; x=1688479948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTfge1bjaB6ZO22Lq31dNi7X9YXPs5dQDbpaZVGHC9Q=;
  b=EjxqVoBikw9Vf4r8EzLP9YHRpQzF/eyvKu/tyKBT40waNkR8OJt0Yajv
   tGDiq5kXmUQ9V9CISgUmQ5+D6ZMuZRXwHf0vxcjA2tCSei6DPXR748EPE
   t97OArlzgnu6kjkAP0nGfj1FpgJQZa9xL5eOoA+u9Jua6E3R2XUJ4v95R
   7rLkXx1d5RxUvrRtP+nhM3bpQmJBttHWiSw6+ghtmMWXSg40dwPCKAXBr
   D5WiIBDHq7o3/riXzNLgRKcUkxdu/jlESS/ZdXlXOC1tqMmq0ICc/aF8s
   f/45gwD90Db+Ui8JT7Q/ln/lFwfYsFkWnykrn6qtS9MeurI+jeuIO0Woa
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="283868456"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="283868456"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 07:12:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="919376269"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jul 2022 07:12:19 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8MoF-000Hvj-2Q;
	Mon, 04 Jul 2022 14:12:19 +0000
Date: Mon, 4 Jul 2022 22:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [lee-mfd:for-mfd-next 25/34] drivers/mfd/axp20x.c:634:3: error:
 field designator 'get_irq_reg' does not refer to any field in type 'const
 struct regmap_irq_chip'
Message-ID: <202207042221.MARNUo8r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   e0d1c4b1c0a80d4ae9f9bfcc15d048629f096928
commit: 8c7d8aa029a3cac42a468cd458adde840d2c5a06 [25/34] mfd: axp20x: Add support for AXP192
config: hexagon-randconfig-r045-20220703 (https://download.01.org/0day-ci/archive/20220704/202207042221.MARNUo8r-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=8c7d8aa029a3cac42a468cd458adde840d2c5a06
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout 8c7d8aa029a3cac42a468cd458adde840d2c5a06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mfd/axp20x.c:634:3: error: field designator 'get_irq_reg' does not refer to any field in type 'const struct regmap_irq_chip'
           .get_irq_reg            = axp192_get_irq_reg,
            ^
   1 error generated.


vim +634 drivers/mfd/axp20x.c

   623	
   624	static const struct regmap_irq_chip axp192_regmap_irq_chip = {
   625		.name			= "axp192_irq_chip",
   626		.status_base		= AXP192_IRQ1_STATE,
   627		.ack_base		= AXP192_IRQ1_STATE,
   628		.mask_base		= AXP192_IRQ1_EN,
   629		.mask_invert		= true,
   630		.init_ack_masked	= true,
   631		.irqs			= axp192_regmap_irqs,
   632		.num_irqs		= ARRAY_SIZE(axp192_regmap_irqs),
   633		.num_regs		= 5,
 > 634		.get_irq_reg		= axp192_get_irq_reg,
   635	};
   636	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
