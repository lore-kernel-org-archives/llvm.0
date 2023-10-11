Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E008354F6;
	Wed, 11 Oct 2023 05:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W61BLZPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697002177; x=1728538177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YURrV1LVeg7mxWgyKkM0Gtr7fzsqSyejUBzuq1IOZCc=;
  b=W61BLZPA/kVKSLsDf73U9j8XdpyCnNtlAh/79hTLd156lb3aVJZqBHfN
   /YbDizhICkNfkQ2xpO8h+WF4AozPGF0MAmMVuIAI1m0AUD7jd5J1CuvKu
   RNbfAUcGZhBmtmk+1Nqy20vUaCQeYhK7OZmb0B7db0lRpxJ4qpjS+x/fj
   AtbD06zYKss9cEpPsfxKLAOwQQYvcvUkqpSD276m0NNsqTrZd95xAGHsZ
   NRvwDbC/GWpx6qkn8G6TcuagQmpWFvZiNi1l6S2E+WFznZiMLcEaZ+rI6
   OSWJc/W2+XmblDZtflmzNteb0BSeefjTdDZPVdeWeH2VJNWeJ2GXFs1AW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448784246"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="448784246"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877533295"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="877533295"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Oct 2023 22:29:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqRmm-0001mD-1Y;
	Wed, 11 Oct 2023 05:29:32 +0000
Date: Wed, 11 Oct 2023 13:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 26/38]
 drivers/misc/esp32-ipc.c:151:13: warning: cast to 'void *' from smaller
 integer type 'u32' (aka 'unsigned int')
Message-ID: <202310111342.MalKHKLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   c2191d1bd425905e3a6439c28449222848e9ecde
commit: 1e4275e30ad53c59e06fa088bc651a8a9cb682b0 [26/38] esp_wifi: add IPC transport
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231011/202310111342.MalKHKLx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111342.MalKHKLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111342.MalKHKLx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/esp32-ipc.c:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/misc/esp32-ipc.c:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/misc/esp32-ipc.c:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/misc/esp32-ipc.c:151:13: warning: cast to 'void *' from smaller integer type 'u32' (aka 'unsigned int') [-Wint-to-void-pointer-cast]
     151 |         hw->hw_q = (void *)readl(p);
         |                    ^~~~~~~~~~~~~~~~
>> drivers/misc/esp32-ipc.c:228:34: warning: unused variable 'esp32_ipc_match' [-Wunused-const-variable]
     228 | static const struct of_device_id esp32_ipc_match[] = {
         |                                  ^
   14 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=n]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +151 drivers/misc/esp32-ipc.c

8264985b44b56a Max Filippov 2023-08-11  143  
8264985b44b56a Max Filippov 2023-08-11  144  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
8264985b44b56a Max Filippov 2023-08-11  145  {
8264985b44b56a Max Filippov 2023-08-11  146  	void __iomem *p;
8264985b44b56a Max Filippov 2023-08-11  147  
8264985b44b56a Max Filippov 2023-08-11  148  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
8264985b44b56a Max Filippov 2023-08-11  149  	if (IS_ERR(p))
8264985b44b56a Max Filippov 2023-08-11  150  		return PTR_ERR(p);
8264985b44b56a Max Filippov 2023-08-11 @151  	hw->hw_q = (void *)readl(p);
8264985b44b56a Max Filippov 2023-08-11  152  	devm_iounmap(&pdev->dev, p);
8264985b44b56a Max Filippov 2023-08-11  153  
8264985b44b56a Max Filippov 2023-08-11  154  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
8264985b44b56a Max Filippov 2023-08-11  155  	if (IS_ERR(hw->regs))
8264985b44b56a Max Filippov 2023-08-11  156  		return PTR_ERR(hw->regs);
8264985b44b56a Max Filippov 2023-08-11  157  
8264985b44b56a Max Filippov 2023-08-11  158  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
8264985b44b56a Max Filippov 2023-08-11  159  		__func__, hw->regs, hw->hw_q);
8264985b44b56a Max Filippov 2023-08-11  160  	if (hw->hw_q) {
8264985b44b56a Max Filippov 2023-08-11  161  		u32 i;
8264985b44b56a Max Filippov 2023-08-11  162  
8264985b44b56a Max Filippov 2023-08-11  163  		for (i = 0; i < 2; ++i) {
8264985b44b56a Max Filippov 2023-08-11  164  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
8264985b44b56a Max Filippov 2023-08-11  165  				__func__, i,
8264985b44b56a Max Filippov 2023-08-11  166  				hw->hw_q[i].offset,
8264985b44b56a Max Filippov 2023-08-11  167  				hw->hw_q[i].mask);
8264985b44b56a Max Filippov 2023-08-11  168  		}
8264985b44b56a Max Filippov 2023-08-11  169  	} else {
8264985b44b56a Max Filippov 2023-08-11  170  		return -ENODEV;
8264985b44b56a Max Filippov 2023-08-11  171  	}
8264985b44b56a Max Filippov 2023-08-11  172  
8264985b44b56a Max Filippov 2023-08-11  173  	hw->irq = platform_get_irq(pdev, 0);
8264985b44b56a Max Filippov 2023-08-11  174  	if (hw->irq >= 0) {
8264985b44b56a Max Filippov 2023-08-11  175  		int ret;
8264985b44b56a Max Filippov 2023-08-11  176  
8264985b44b56a Max Filippov 2023-08-11  177  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
8264985b44b56a Max Filippov 2023-08-11  178  						esp32_ipc_irq_handler,
8264985b44b56a Max Filippov 2023-08-11  179  						esp32_ipc_thread_handler,
8264985b44b56a Max Filippov 2023-08-11  180  						IRQF_SHARED, pdev->name, hw);
8264985b44b56a Max Filippov 2023-08-11  181  		if (ret < 0) {
8264985b44b56a Max Filippov 2023-08-11  182  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
8264985b44b56a Max Filippov 2023-08-11  183  			return ret;
8264985b44b56a Max Filippov 2023-08-11  184  		}
8264985b44b56a Max Filippov 2023-08-11  185  	} else {
8264985b44b56a Max Filippov 2023-08-11  186  		dev_err(&pdev->dev, "missing IRQ property\n");
8264985b44b56a Max Filippov 2023-08-11  187  		return -ENODEV;
8264985b44b56a Max Filippov 2023-08-11  188  	}
8264985b44b56a Max Filippov 2023-08-11  189  
8264985b44b56a Max Filippov 2023-08-11  190  	return 0;
8264985b44b56a Max Filippov 2023-08-11  191  }
8264985b44b56a Max Filippov 2023-08-11  192  
8264985b44b56a Max Filippov 2023-08-11  193  static int esp32_ipc_probe(struct platform_device *pdev)
8264985b44b56a Max Filippov 2023-08-11  194  {
8264985b44b56a Max Filippov 2023-08-11  195  	struct esp32_ipc *hw =
8264985b44b56a Max Filippov 2023-08-11  196  		devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
8264985b44b56a Max Filippov 2023-08-11  197  	int ret;
8264985b44b56a Max Filippov 2023-08-11  198  
8264985b44b56a Max Filippov 2023-08-11  199  	if (!hw)
8264985b44b56a Max Filippov 2023-08-11  200  		return -ENOMEM;
8264985b44b56a Max Filippov 2023-08-11  201  	platform_set_drvdata(pdev, hw);
8264985b44b56a Max Filippov 2023-08-11  202  
8264985b44b56a Max Filippov 2023-08-11  203  	spin_lock_init(&hw->lock);
8264985b44b56a Max Filippov 2023-08-11  204  	ret = init_hw(pdev, hw);
8264985b44b56a Max Filippov 2023-08-11  205  	if (ret < 0)
8264985b44b56a Max Filippov 2023-08-11  206  		return ret;
8264985b44b56a Max Filippov 2023-08-11  207  
8264985b44b56a Max Filippov 2023-08-11  208  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].read = 0;
8264985b44b56a Max Filippov 2023-08-11  209  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].write = 0;
8264985b44b56a Max Filippov 2023-08-11  210  	wmb();
8264985b44b56a Max Filippov 2023-08-11  211  	writel(1, hw->regs + ESP32_IPC_IRQ_TO_FW_REG);
8264985b44b56a Max Filippov 2023-08-11  212  
8264985b44b56a Max Filippov 2023-08-11  213  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
8264985b44b56a Max Filippov 2023-08-11  214  	return ret;
8264985b44b56a Max Filippov 2023-08-11  215  }
8264985b44b56a Max Filippov 2023-08-11  216  
8264985b44b56a Max Filippov 2023-08-11  217  static int esp32_ipc_remove(struct platform_device *pdev)
8264985b44b56a Max Filippov 2023-08-11  218  {
8264985b44b56a Max Filippov 2023-08-11  219  	struct esp32_ipc *hw = platform_get_drvdata(pdev);
8264985b44b56a Max Filippov 2023-08-11  220  
8264985b44b56a Max Filippov 2023-08-11  221  	if (!hw)
8264985b44b56a Max Filippov 2023-08-11  222  		return 0;
8264985b44b56a Max Filippov 2023-08-11  223  
8264985b44b56a Max Filippov 2023-08-11  224  	disable_irq(hw->irq);
8264985b44b56a Max Filippov 2023-08-11  225  	return 0;
8264985b44b56a Max Filippov 2023-08-11  226  }
8264985b44b56a Max Filippov 2023-08-11  227  
8264985b44b56a Max Filippov 2023-08-11 @228  static const struct of_device_id esp32_ipc_match[] = {
8264985b44b56a Max Filippov 2023-08-11  229  	{
8264985b44b56a Max Filippov 2023-08-11  230  		.compatible = "esp,esp32-ipc",
8264985b44b56a Max Filippov 2023-08-11  231  	}, {},
8264985b44b56a Max Filippov 2023-08-11  232  };
8264985b44b56a Max Filippov 2023-08-11  233  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
8264985b44b56a Max Filippov 2023-08-11  234  

:::::: The code at line 151 was first introduced by commit
:::::: 8264985b44b56ae0e4bc756d11424b7297ae34e2 misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
