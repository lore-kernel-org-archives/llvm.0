Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB26D7471;
	Thu, 19 Jan 2023 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674136736; x=1705672736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPiLLzevVfbLgfWMhtmt5XlEzRdYAMihiOrTcPc6HZg=;
  b=jCSvVbihd07Mw01Rr3zqG9+SF0XBapVsq8SqqrJ1jUszqh3wzzYfTCuh
   o2nd1il5JmjkaJwfENUS57gI4wjV6cYFwKdHLLBrDd7DjcTPJa/+DHGmd
   /+cfEnutQPsXMvzbnzkaDy+sbXDp9dHnKvOsODobliZCQvde33tsriooU
   1xxUY/F6HcbGVtbIZOe1Vvab4BecLi18jjq73o/Uw3sgPauJLZpwNbQc3
   bP8aRZAocE8LB77IwbLm84Gd5AnSuvi0FD9+ZVESAE5G8/YH4DMtL/NTO
   +LdWdFzJ8tWKtWcjMpkPT4myQR1+dWr3WpTAnS6MZWp09U629WqHDBcAt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327365045"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="327365045"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 05:58:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690633807"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="690633807"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 05:58:54 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIVRN-0001W8-33;
	Thu, 19 Jan 2023 13:58:53 +0000
Date: Thu, 19 Jan 2023 21:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Rossi <nathan.rossi@digi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: drivers/irqchip/irq-armada-370-xp.c:319:13: warning: unused function
 'armada_370_xp_msi_reenable_percpu'
Message-ID: <202301192128.mz4N8mso-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 8ca61cde32c1db778aa52631184484e051cbdf27 irqchip/armada-370-xp: Enable MSI affinity configuration
date:   9 months ago
config: arm-randconfig-r026-20230118 (https://download.01.org/0day-ci/archive/20230119/202301192128.mz4N8mso-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8ca61cde32c1db778aa52631184484e051cbdf27
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8ca61cde32c1db778aa52631184484e051cbdf27
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-armada-370-xp.c:319:13: warning: unused function 'armada_370_xp_msi_reenable_percpu' [-Wunused-function]
   static void armada_370_xp_msi_reenable_percpu(void) {}
               ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TEGRA20_APB_DMA
   Depends on [n]: DMADEVICES [=n] && (ARCH_TEGRA [=y] || COMPILE_TEST [=y])
   Selected by [y]:
   - SOC_TEGRA_FUSE [=y] && ARCH_TEGRA [=y] && ARCH_TEGRA_2x_SOC [=y]


vim +/armada_370_xp_msi_reenable_percpu +319 drivers/irqchip/irq-armada-370-xp.c

   292	
   293	static int armada_370_xp_msi_init(struct device_node *node,
   294					  phys_addr_t main_int_phys_base)
   295	{
   296		msi_doorbell_addr = main_int_phys_base +
   297			ARMADA_370_XP_SW_TRIG_INT_OFFS;
   298	
   299		armada_370_xp_msi_inner_domain =
   300			irq_domain_add_linear(NULL, PCI_MSI_DOORBELL_NR,
   301					      &armada_370_xp_msi_domain_ops, NULL);
   302		if (!armada_370_xp_msi_inner_domain)
   303			return -ENOMEM;
   304	
   305		armada_370_xp_msi_domain =
   306			pci_msi_create_irq_domain(of_node_to_fwnode(node),
   307						  &armada_370_xp_msi_domain_info,
   308						  armada_370_xp_msi_inner_domain);
   309		if (!armada_370_xp_msi_domain) {
   310			irq_domain_remove(armada_370_xp_msi_inner_domain);
   311			return -ENOMEM;
   312		}
   313	
   314		armada_370_xp_msi_reenable_percpu();
   315	
   316		return 0;
   317	}
   318	#else
 > 319	static void armada_370_xp_msi_reenable_percpu(void) {}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
