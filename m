Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238902C80
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 17:42:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="217711427"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="217711427"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 09:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="513349784"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Dec 2021 09:42:18 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtCZd-000Hrx-1h; Fri, 03 Dec 2021 17:42:17 +0000
Date: Sat, 4 Dec 2021 01:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Qin Jian <qinjian@cqplus1.com>, robh+dt@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, mturquette@baylibre.com,
	sboyd@kernel.org, tglx@linutronix.de, maz@kernel.org,
	p.zabel@pengutronix.de, linux@armlinux.org.uk, broonie@kernel.org,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 08/10] irqchip: Add Sunplus SP7021 interrupt
 controller driver
Message-ID: <202112040151.Jbxozs9Q-lkp@intel.com>
References: <e88ea4cf28ba69a41f6d1b4dd4128b82a6095c29.1638515726.git.qinjian@cqplus1.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e88ea4cf28ba69a41f6d1b4dd4128b82a6095c29.1638515726.git.qinjian@cqplus1.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Qin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[cannot apply to pza/reset/next robh/for-next tip/irq/core linus/master v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qin-Jian/Add-Sunplus-SP7021-SoC-Support/20211203-154345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-randconfig-r006-20211203 (https://download.01.org/0day-ci/archive/20211204/202112040151.Jbxozs9Q-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fcadf07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/14961fb5913762db86b6816b325ef2e87cf4a319
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qin-Jian/Add-Sunplus-SP7021-SoC-Support/20211203-154345
        git checkout 14961fb5913762db86b6816b325ef2e87cf4a319
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/ drivers/clk/ drivers/crypto/ drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-sp7021-intc.c:223:6: warning: no previous prototype for function 'sp_intc_set_ext' [-Wmissing-prototypes]
   void sp_intc_set_ext(u32 hwirq, int ext_num)
        ^
   drivers/irqchip/irq-sp7021-intc.c:223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sp_intc_set_ext(u32 hwirq, int ext_num)
   ^
   static 
>> drivers/irqchip/irq-sp7021-intc.c:229:12: warning: no previous prototype for function 'sp_intc_init_dt' [-Wmissing-prototypes]
   int __init sp_intc_init_dt(struct device_node *node, struct device_node *parent)
              ^
   drivers/irqchip/irq-sp7021-intc.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init sp_intc_init_dt(struct device_node *node, struct device_node *parent)
   ^
   static 
   2 warnings generated.


vim +/sp_intc_set_ext +223 drivers/irqchip/irq-sp7021-intc.c

   222	
 > 223	void sp_intc_set_ext(u32 hwirq, int ext_num)
   224	{
   225		sp_intc_assign_bit(hwirq, REG_INTR_PRIORITY, !ext_num);
   226	}
   227	EXPORT_SYMBOL_GPL(sp_intc_set_ext);
   228	
 > 229	int __init sp_intc_init_dt(struct device_node *node, struct device_node *parent)
   230	{
   231		int i, ret;
   232	
   233		sp_intc.g0 = of_iomap(node, 0);
   234		if (!sp_intc.g0)
   235			return -ENXIO;
   236	
   237		sp_intc.g1 = of_iomap(node, 1);
   238		if (!sp_intc.g1) {
   239			ret = -ENXIO;
   240			goto out_unmap0;
   241		}
   242	
   243		ret = sp_intc_irq_map(node, 0); // EXT_INT0
   244		if (ret)
   245			goto out_unmap1;
   246	
   247		ret = sp_intc_irq_map(node, 1); // EXT_INT1
   248		if (ret)
   249			goto out_unmap1;
   250	
   251		/* initial regs */
   252		for (i = 0; i < SP_INTC_NR_GROUPS; i++) {
   253			/* all mask */
   254			writel_relaxed(0, REG_INTR_MASK + i * 4);
   255			/* all edge */
   256			writel_relaxed(~0, REG_INTR_TYPE + i * 4);
   257			/* all high-active */
   258			writel_relaxed(0, REG_INTR_POLARITY + i * 4);
   259			/* all EXT_INT0 */
   260			writel_relaxed(~0, REG_INTR_PRIORITY + i * 4);
   261			/* all clear */
   262			writel_relaxed(~0, REG_INTR_CLEAR + i * 4);
   263		}
   264	
   265		sp_intc.domain = irq_domain_add_linear(node, SP_INTC_NR_IRQS,
   266						       &sp_intc_dm_ops, &sp_intc);
   267		if (!sp_intc.domain) {
   268			ret = -ENOMEM;
   269			goto out_unmap1;
   270		}
   271	
   272		raw_spin_lock_init(&sp_intc.lock);
   273	
   274		return 0;
   275	
   276	out_unmap1:
   277		iounmap(sp_intc.g1);
   278	out_unmap0:
   279		iounmap(sp_intc.g0);
   280	
   281		return ret;
   282	}
   283	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
