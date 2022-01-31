Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE52C80
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 05:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643607495; x=1675143495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=slGVfj+eDRLHOSu7OXWwRXmATZU9PbhmXv2LwSOWNWo=;
  b=fszeJ8Zdgg899FuBrmtRGaMkOSKpAxJKUCN/Hv1l9M6SMI0Q+UhN1m1f
   fMzit1sXM3GNLib0Z/QZmMq9UVtPuwbSfwGcmM+mXHFLJWMs8Pm+3GSDZ
   qeKcu8cCPRXWol0Q6GpW0zhdmas7GbrT7FrT3coBKLg4lgkMtTtlR6bYI
   oboHQ+KweVRLJKGoAkGCVTDxy6Lw/VwxbLRkF7eTBDRyl4ZTaWm7AEa/F
   n2N/HE0xBtVj3Nxk2ZigGo94pjQfl03gtWOaqEuw9uPOWxI/XwUBiH1m+
   AzSprQYlxOc3+SzUG9mTmi+FtMAfXrDUmfb30crFrbT1UtgPBLEFB6ofn
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247357837"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="247357837"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 21:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="675635696"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2022 21:38:13 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEPOB-000RRw-S1; Mon, 31 Jan 2022 05:38:07 +0000
Date: Mon, 31 Jan 2022 13:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 4/9]
 drivers/irqchip/irq-ts4800.c:55:2: error: implicit declaration of function
 'seq_printf'
Message-ID: <202201311353.3t1CnmBZ-lkp@intel.com>
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
commit: 75f43f84cf6ef6e3a967aa84352173e37a83111d [4/9] irqchip/ts4800: Switch to dynamic chip name output
config: riscv-buildonly-randconfig-r005-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311353.3t1CnmBZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=75f43f84cf6ef6e3a967aa84352173e37a83111d
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout 75f43f84cf6ef6e3a967aa84352173e37a83111d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-ts4800.c:55:2: error: implicit declaration of function 'seq_printf' [-Werror,-Wimplicit-function-declaration]
           seq_printf(p, "%s", dev_name(&data->pdev->dev));
           ^
   1 error generated.


vim +/seq_printf +55 drivers/irqchip/irq-ts4800.c

    50	
    51	static void ts4800_irq_print_chip(struct irq_data *d, struct seq_file *p)
    52	{
    53		struct ts4800_irq_data *data = irq_data_get_irq_chip_data(d);
    54	
  > 55		seq_printf(p, "%s", dev_name(&data->pdev->dev));
    56	}
    57	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
