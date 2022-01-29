Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE86B2C80
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643459288; x=1674995288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJiuqMcft6l+9tf9FydiEn7hip3mvmh5JerpMzB/YQ8=;
  b=XFCupMRKix4OWtDll5WH9Dkw5Sh/s5Dm9Ne55UEwtrHlF/Bw9Ry0+Jur
   dX3RaVviwPL5l6Y0OhzZ1IfxQvG3TuTlrQmK+4O5mzdQIM+6RJ9xars2b
   ebNh9Y7k+Ng0wo7gFwXb2t2i2x4nbMfKNzkIttJtCq6oaRf9ZJcOd3tdw
   +D7CRMd3n4Pm9caL12K0/14o4cazLvmNmgeOG8uWi21dnTg+H976sfbCO
   twf04rPddgKFprDjc800VrtIiEoHv5LYmeDhLF5mEsxwcu9TQR21AszmK
   Z5iWd+ROfReATWZKZb34VWAs8fqeLWD1zuXf6i6IF0PFYKAMxf4wjwuWz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="234654458"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; 
   d="scan'208";a="234654458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 04:28:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; 
   d="scan'208";a="481059509"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Jan 2022 04:28:06 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDmpp-000PCL-VG; Sat, 29 Jan 2022 12:28:05 +0000
Date: Sat, 29 Jan 2022 20:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ixp4xx-cleanup-v5.17-rc1 21/22]
 drivers/irqchip/irq-ixp4xx.c:210:38: warning: unused variable
 'ixp4xx_irq_chunks'
Message-ID: <202201292056.2xCamI4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ixp4xx-cleanup-v5.17-rc1
head:   c9bbd09b3066286f881709c58d82c55724840bbb
commit: b4a844677bb1d7ace4c7a4a8adb1da9e279d8424 [21/22] irq/gpio: ixp4xx: Drop boardfile probe path
config: arm-buildonly-randconfig-r001-20220127 (https://download.01.org/0day-ci/archive/20220129/202201292056.2xCamI4I-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=b4a844677bb1d7ace4c7a4a8adb1da9e279d8424
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ixp4xx-cleanup-v5.17-rc1
        git checkout b4a844677bb1d7ace4c7a4a8adb1da9e279d8424
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-ixp4xx.c:108:39: warning: no previous prototype for function 'ixp4xx_handle_irq' [-Wmissing-prototypes]
   asmlinkage void __exception_irq_entry ixp4xx_handle_irq(struct pt_regs *regs)
                                         ^
   drivers/irqchip/irq-ixp4xx.c:108:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void __exception_irq_entry ixp4xx_handle_irq(struct pt_regs *regs)
              ^
              static 
   drivers/irqchip/irq-ixp4xx.c:287:12: warning: no previous prototype for function 'ixp4xx_of_init_irq' [-Wmissing-prototypes]
   int __init ixp4xx_of_init_irq(struct device_node *np,
              ^
   drivers/irqchip/irq-ixp4xx.c:287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init ixp4xx_of_init_irq(struct device_node *np,
   ^
   static 
>> drivers/irqchip/irq-ixp4xx.c:210:38: warning: unused variable 'ixp4xx_irq_chunks' [-Wunused-const-variable]
   static const struct ixp4xx_irq_chunk ixp4xx_irq_chunks[] = {
                                        ^
   3 warnings generated.


vim +/ixp4xx_irq_chunks +210 drivers/irqchip/irq-ixp4xx.c

5b978c10665973 Linus Walleij 2019-01-25  209  
5b978c10665973 Linus Walleij 2019-01-25 @210  static const struct ixp4xx_irq_chunk ixp4xx_irq_chunks[] = {
5b978c10665973 Linus Walleij 2019-01-25  211  	{
5b978c10665973 Linus Walleij 2019-01-25  212  		.irq = 16,
5b978c10665973 Linus Walleij 2019-01-25  213  		.hwirq = 0,
5b978c10665973 Linus Walleij 2019-01-25  214  		.nr_irqs = 6,
5b978c10665973 Linus Walleij 2019-01-25  215  	},
5b978c10665973 Linus Walleij 2019-01-25  216  	{
5b978c10665973 Linus Walleij 2019-01-25  217  		.irq = 24,
5b978c10665973 Linus Walleij 2019-01-25  218  		.hwirq = 8,
5b978c10665973 Linus Walleij 2019-01-25  219  		.nr_irqs = 11,
5b978c10665973 Linus Walleij 2019-01-25  220  	},
5b978c10665973 Linus Walleij 2019-01-25  221  	{
5b978c10665973 Linus Walleij 2019-01-25  222  		.irq = 46,
5b978c10665973 Linus Walleij 2019-01-25  223  		.hwirq = 30,
5b978c10665973 Linus Walleij 2019-01-25  224  		.nr_irqs = 2,
5b978c10665973 Linus Walleij 2019-01-25  225  	},
5b978c10665973 Linus Walleij 2019-01-25  226  	/* Only on the 436 variants */
5b978c10665973 Linus Walleij 2019-01-25  227  	{
5b978c10665973 Linus Walleij 2019-01-25  228  		.irq = 48,
5b978c10665973 Linus Walleij 2019-01-25  229  		.hwirq = 32,
5b978c10665973 Linus Walleij 2019-01-25  230  		.nr_irqs = 10,
5b978c10665973 Linus Walleij 2019-01-25  231  	},
5b978c10665973 Linus Walleij 2019-01-25  232  };
5b978c10665973 Linus Walleij 2019-01-25  233  
5b978c10665973 Linus Walleij 2019-01-25  234  /**
5b978c10665973 Linus Walleij 2019-01-25  235   * ixp4x_irq_setup() - Common setup code for the IXP4xx interrupt controller
5b978c10665973 Linus Walleij 2019-01-25  236   * @ixi: State container
5b978c10665973 Linus Walleij 2019-01-25  237   * @irqbase: Virtual memory base for the interrupt controller
5b978c10665973 Linus Walleij 2019-01-25  238   * @fwnode: Corresponding fwnode abstraction for this controller
5b978c10665973 Linus Walleij 2019-01-25  239   * @is_356: if this is an IXP43x, IXP45x or IXP46x SoC variant
5b978c10665973 Linus Walleij 2019-01-25  240   */
4ea10150ea00ec Arnd Bergmann 2019-06-17  241  static int __init ixp4xx_irq_setup(struct ixp4xx_irq *ixi,
5b978c10665973 Linus Walleij 2019-01-25  242  				   void __iomem *irqbase,
5b978c10665973 Linus Walleij 2019-01-25  243  				   struct fwnode_handle *fwnode,
5b978c10665973 Linus Walleij 2019-01-25  244  				   bool is_356)
5b978c10665973 Linus Walleij 2019-01-25  245  {
5b978c10665973 Linus Walleij 2019-01-25  246  	int nr_irqs;
5b978c10665973 Linus Walleij 2019-01-25  247  
5b978c10665973 Linus Walleij 2019-01-25  248  	ixi->irqbase = irqbase;
5b978c10665973 Linus Walleij 2019-01-25  249  	ixi->is_356 = is_356;
5b978c10665973 Linus Walleij 2019-01-25  250  
5b978c10665973 Linus Walleij 2019-01-25  251  	/* Route all sources to IRQ instead of FIQ */
5b978c10665973 Linus Walleij 2019-01-25  252  	__raw_writel(0x0, ixi->irqbase + IXP4XX_ICLR);
5b978c10665973 Linus Walleij 2019-01-25  253  
5b978c10665973 Linus Walleij 2019-01-25  254  	/* Disable all interrupts */
5b978c10665973 Linus Walleij 2019-01-25  255  	__raw_writel(0x0, ixi->irqbase + IXP4XX_ICMR);
5b978c10665973 Linus Walleij 2019-01-25  256  
5b978c10665973 Linus Walleij 2019-01-25  257  	if (is_356) {
5b978c10665973 Linus Walleij 2019-01-25  258  		/* Route upper 32 sources to IRQ instead of FIQ */
5b978c10665973 Linus Walleij 2019-01-25  259  		__raw_writel(0x0, ixi->irqbase + IXP4XX_ICLR2);
5b978c10665973 Linus Walleij 2019-01-25  260  
5b978c10665973 Linus Walleij 2019-01-25  261  		/* Disable upper 32 interrupts */
5b978c10665973 Linus Walleij 2019-01-25  262  		__raw_writel(0x0, ixi->irqbase + IXP4XX_ICMR2);
5b978c10665973 Linus Walleij 2019-01-25  263  
5b978c10665973 Linus Walleij 2019-01-25  264  		nr_irqs = 64;
5b978c10665973 Linus Walleij 2019-01-25  265  	} else {
5b978c10665973 Linus Walleij 2019-01-25  266  		nr_irqs = 32;
5b978c10665973 Linus Walleij 2019-01-25  267  	}
5b978c10665973 Linus Walleij 2019-01-25  268  
5b978c10665973 Linus Walleij 2019-01-25  269  	ixi->irqchip.name = "IXP4xx";
5b978c10665973 Linus Walleij 2019-01-25  270  	ixi->irqchip.irq_mask = ixp4xx_irq_mask;
5b978c10665973 Linus Walleij 2019-01-25  271  	ixi->irqchip.irq_unmask	= ixp4xx_irq_unmask;
5b978c10665973 Linus Walleij 2019-01-25  272  	ixi->irqchip.irq_set_type = ixp4xx_set_irq_type;
5b978c10665973 Linus Walleij 2019-01-25  273  
5b978c10665973 Linus Walleij 2019-01-25  274  	ixi->domain = irq_domain_create_linear(fwnode, nr_irqs,
5b978c10665973 Linus Walleij 2019-01-25  275  					       &ixp4xx_irqdomain_ops,
5b978c10665973 Linus Walleij 2019-01-25  276  					       ixi);
5b978c10665973 Linus Walleij 2019-01-25  277  	if (!ixi->domain) {
5b978c10665973 Linus Walleij 2019-01-25  278  		pr_crit("IXP4XX: can not add primary irqdomain\n");
5b978c10665973 Linus Walleij 2019-01-25  279  		return -ENODEV;
5b978c10665973 Linus Walleij 2019-01-25  280  	}
5b978c10665973 Linus Walleij 2019-01-25  281  
5b978c10665973 Linus Walleij 2019-01-25  282  	set_handle_irq(ixp4xx_handle_irq);
5b978c10665973 Linus Walleij 2019-01-25  283  
5b978c10665973 Linus Walleij 2019-01-25  284  	return 0;
5b978c10665973 Linus Walleij 2019-01-25  285  }
5b978c10665973 Linus Walleij 2019-01-25  286  
f1497f3d06ad30 Linus Walleij 2019-01-27 @287  int __init ixp4xx_of_init_irq(struct device_node *np,

:::::: The code at line 210 was first introduced by commit
:::::: 5b978c10665973d8ee7050b03ef6e97013066b03 irqchip: Add driver for IXP4xx

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
