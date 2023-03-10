Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E3523B1;
	Fri, 10 Mar 2023 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678441815; x=1709977815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWRnORqiPg1OLVLVRjE19cU8jGAOSqmvT+G/yVS1LKI=;
  b=LjPXAjb0M9mL5ZNzXBzZEkzU0wh+XS0FNjPoZhQCJAEGy9333BybP9gC
   jZPc40Txft3C8W299IR/0cn24PJg35AlkZpkr4q+toZrVq3vSUvQWI9ZE
   77jeByXop7SEcu04LA+EhHf5t3gngqIOt9LYbuD3jxd+NA9uQmDPdCbgN
   NvuX1bkdIpkGTAk1EX7LMAlpg1KVTaej6oiPH14W24AI7fay0AUmK/t9k
   9b4RWqn8aLFxiezKi15wAXk3EBaBAy/1BBvsN6EQAhpN5P0XN3XvA5Gyi
   ZhG9826fS1biLsaR+8bUkh1BpOT+cY0EkqVPtFfHeMv337zyvMPdx6EZ4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="320545393"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="320545393"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="671031395"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="671031395"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Mar 2023 01:50:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paZO8-0003j3-15;
	Fri, 10 Mar 2023 09:50:12 +0000
Date: Fri, 10 Mar 2023 17:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1656/2655] drivers/spi/spi-mpc512x-psc.c:512:8:
 error: use of undeclared label 'free_ipg_clock'
Message-ID: <202303101701.lWfSMg4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   24469a0e5052ba01a35a15f104717a82b7a4798b
commit: 9e21720a49589304aef9e37e8b6c6a4196daf156 [1656/2655] spi: mpc5xxx-psc: use devm_clk_get_enabled() for core clock
config: powerpc-mpc512x_defconfig (https://download.01.org/0day-ci/archive/20230310/202303101701.lWfSMg4P-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9e21720a49589304aef9e37e8b6c6a4196daf156
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9e21720a49589304aef9e37e8b6c6a4196daf156
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101701.lWfSMg4P-lkp@intel.com/

All errors (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:577:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc512x-psc.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:186:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:578:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc512x-psc.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:188:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:579:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc512x-psc.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:190:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:580:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc512x-psc.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:192:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:581:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc512x-psc.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:194:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:582:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/spi/spi-mpc512x-psc.c:512:8: error: use of undeclared label 'free_ipg_clock'
                   goto free_ipg_clock;
                        ^
   6 warnings and 1 error generated.


vim +/free_ipg_clock +512 drivers/spi/spi-mpc512x-psc.c

6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  456  
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  457  static int mpc512x_psc_spi_of_probe(struct platform_device *pdev)
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  458  {
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  459  	struct device *dev = &pdev->dev;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  460  	struct mpc512x_psc_spi *mps;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  461  	struct spi_master *master;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  462  	int ret;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  463  	void *tempp;
a81a5094a32871 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-08-06  464  	struct clk *clk;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  465  
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  466  	master = devm_spi_alloc_master(dev, sizeof(*mps));
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  467  	if (master == NULL)
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  468  		return -ENOMEM;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  469  
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  470  	dev_set_drvdata(dev, master);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  471  	mps = spi_master_get_devdata(master);
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  472  	mps->type = (int)device_get_match_data(dev);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  473  
c88dd349b5a83c drivers/spi/spi-mpc512x-psc.c Anatolij Gustschin 2013-01-14  474  	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  475  	master->setup = mpc512x_psc_spi_setup;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  476  	master->prepare_transfer_hardware = mpc512x_psc_spi_prep_xfer_hw;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  477  	master->transfer_one_message = mpc512x_psc_spi_msg_xfer;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  478  	master->unprepare_transfer_hardware = mpc512x_psc_spi_unprep_xfer_hw;
2818824ced4be5 drivers/spi/spi-mpc512x-psc.c Linus Walleij      2022-01-20  479  	master->use_gpio_descriptors = true;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  480  	master->cleanup = mpc512x_psc_spi_cleanup;
12b15e83289bc7 drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-07-27  481  	master->dev.of_node = dev->of_node;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  482  
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  483  	tempp = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
ee493fa5d91dec drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  484  	if (IS_ERR(tempp))
ee493fa5d91dec drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  485  		return dev_err_probe(dev, PTR_ERR(tempp), "could not ioremap I/O port range\n");
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  486  	mps->psc = tempp;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  487  	mps->fifo =
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  488  		(struct mpc512x_psc_fifo *)(tempp + sizeof(struct mpc52xx_psc));
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  489  
60a6c8257f4144 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  490  	mps->irq = platform_get_irq(pdev, 0);
208ee586f86237 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  491  	if (mps->irq < 0)
208ee586f86237 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  492  		return mps->irq;
208ee586f86237 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  493  
e1d0cd473be4c8 drivers/spi/spi-mpc512x-psc.c Jingoo Han         2013-12-18  494  	ret = devm_request_irq(dev, mps->irq, mpc512x_psc_spi_isr, IRQF_SHARED,
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  495  				"mpc512x-psc-spi", mps);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  496  	if (ret)
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  497  		return ret;
85085898ab0fef drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-06-03  498  	init_completion(&mps->txisrdone);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  499  
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  500  	clk = devm_clk_get_enabled(dev, "mclk");
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  501  	if (IS_ERR(clk))
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  502  		return PTR_ERR(clk);
01602336524e17 drivers/spi/spi-mpc512x-psc.c Rob Herring        2023-02-17  503  
a81a5094a32871 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-08-06  504  	mps->mclk_rate = clk_get_rate(clk);
a81a5094a32871 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-08-06  505  
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  506  	clk = devm_clk_get_enabled(dev, "ipg");
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  507  	if (IS_ERR(clk))
9e21720a495893 drivers/spi/spi-mpc512x-psc.c Andy Shevchenko    2023-03-06  508  		return PTR_ERR(clk);
dff148ad7b6940 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-11-30  509  
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  510  	ret = mpc512x_psc_spi_port_config(master, mps);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  511  	if (ret < 0)
dff148ad7b6940 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-11-30 @512  		goto free_ipg_clock;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  513  
eaa24297846bcd drivers/spi/spi-mpc512x-psc.c Jingoo Han         2013-09-24  514  	ret = devm_spi_register_master(dev, master);
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  515  	if (ret < 0)
dff148ad7b6940 drivers/spi/spi-mpc512x-psc.c Gerhard Sittig     2013-11-30  516  		goto free_ipg_clock;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  517  
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  518  	return ret;
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  519  }
6e27388f1bd60b drivers/spi/mpc512x_psc_spi.c Anatolij Gustschin 2010-04-30  520  

:::::: The code at line 512 was first introduced by commit
:::::: dff148ad7b69409181e12641cca6962e5f02cffe spi: mpc512x: adjust to OF based clock lookup

:::::: TO: Gerhard Sittig <gsi@denx.de>
:::::: CC: Anatolij Gustschin <agust@denx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
