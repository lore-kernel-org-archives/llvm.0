Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE82C80
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 05:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643607490; x=1675143490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M58shgQhcTBwTCiYViXPQLkvGMMvY+ZLh6/5CPb3ZVc=;
  b=WgtbZUqyoB2aZeq3GoFfiafAqnPVQ/xViF9jH/js10RjPJ0+gEXoeJyY
   LYfDNpBSDEVW2x8bKiqhCp285x+owwTfVNqAhsx3QcY9z4NDOQRzg4qyB
   vVxUvt/TJaZ9kS/0yDrXhs8jf+eurTq+cIccnC0wju52c96CMRE2f9kyV
   RlkUORs+IYNu09wI6gA/HR9gYgctfPosWnh6dswrlLyWD0e+FvC/n3cLW
   ARVzGD0TjucHzRIvAWgzfycfb1FuL/q7kw2rA7x8mhSe5eKK5SplDmtBD
   HC2BefG/IPRtSHsW5IFCCEJvnRhsFAbNquD227/MVQVepqyRRDiodxTWI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="227375714"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="227375714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 21:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="564872367"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Jan 2022 21:38:08 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEPOB-000RRt-Rd; Mon, 31 Jan 2022 05:38:07 +0000
Date: Mon, 31 Jan 2022 13:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 1/9] drivers/irqchip/irq-gic.c:405:3:
 error: implicit declaration of function 'seq_printf'
Message-ID: <202201311355.HUXeoGa5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/irq_chip_ro
head:   f63a5ded3ea0cd2c587db00f89d219789fbee683
commit: 6a55685f591b540217d642fc5e0799634ee29a91 [1/9] irqchip/gic: Switch to dynamic chip name output
config: arm64-randconfig-r024-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311355.HUXeoGa5-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=6a55685f591b540217d642fc5e0799634ee29a91
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout 6a55685f591b540217d642fc5e0799634ee29a91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic.c:405:3: error: implicit declaration of function 'seq_printf' [-Werror,-Wimplicit-function-declaration]
                   seq_printf(p, "%s", gic->chip.parent_device->of_node->name);
                   ^
   1 error generated.


vim +/seq_printf +405 drivers/irqchip/irq-gic.c

   399	
   400	static void gic_irq_print_chip(struct irq_data *d, struct seq_file *p)
   401	{
   402		struct gic_chip_data *gic = irq_data_get_irq_chip_data(d);
   403	
   404		if (gic->chip.parent_device)
 > 405			seq_printf(p, "%s", gic->chip.parent_device->of_node->name);
   406		else if (static_branch_likely(&supports_deactivate_key) &&
   407			 gic == &gic_data[0])
   408			seq_printf(p, "GICv2");
   409		else
   410			seq_printf(p, "GIC-%d", (int)(gic - &gic_data[0]));
   411	}
   412	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
