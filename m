Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAD375;
	Sun, 27 Aug 2023 06:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693118340; x=1724654340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PkAZyLCGRzpzTEfJmZy9l3ijGDnCzHhh1wEcJS11Wsk=;
  b=Cam2lwbMtK9H9yxHTwE0jd7i7nd4ndUJx0vZ03r9oJefboxjSMHIZ56g
   6v9qfinONxooXQDladbi32VhQmas+fu2hwUhnuBXSshj1NXX7m+dBpAPx
   E+T9TQbIfdUiCkKH49uTfWqjZJ915aE/rr54Yu6K/6WSG9+ePdeWguTHr
   A1Wr4i2pGVkegSkpm2r/xzDCIT8hAwSxK2RJEwvvkJtavFd0SDQA5h2j2
   UvjT7U5GGPyR6GIO7glUAJer6f0jARqAz8cFNKKq6/Vbn6ohIHopbPRAI
   u62nAvbwkqyDFoa3/B6O8GxI/1PHnWMUFF2XYVoNgebyd3dphqBqwlWNM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="461286131"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="461286131"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 23:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="911696097"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="911696097"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Aug 2023 23:38:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa9QG-0005Tj-1i;
	Sun, 27 Aug 2023 06:38:56 +0000
Date: Sun, 27 Aug 2023 14:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 40/48]
 drivers/misc/esp32-ipc.c:145:13: warning: cast to 'void *' from smaller
 integer type 'u32' (aka 'unsigned int')
Message-ID: <202308271405.7AGIaAFP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

First bad commit (maybe != root cause):

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   37fd9d9c4f957906efc14a9849942100af4f99e2
commit: 422f7405a1d5afa30398c9b6a9b6bc1b50a83be1 [40/48] esp_wifi: shmem: use esp_ipc driver
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230827/202308271405.7AGIaAFP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271405.7AGIaAFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271405.7AGIaAFP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/esp32-ipc.c:7:
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
   In file included from drivers/misc/esp32-ipc.c:7:
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
   In file included from drivers/misc/esp32-ipc.c:7:
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
>> drivers/misc/esp32-ipc.c:145:13: warning: cast to 'void *' from smaller integer type 'u32' (aka 'unsigned int') [-Wint-to-void-pointer-cast]
     145 |         hw->hw_q = (void *)readl(p);
         |                    ^~~~~~~~~~~~~~~~
   drivers/misc/esp32-ipc.c:221:34: warning: unused variable 'esp32_ipc_match' [-Wunused-const-variable]
     221 | static const struct of_device_id esp32_ipc_match[] = {
         |                                  ^
   14 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=n]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +145 drivers/misc/esp32-ipc.c

8c1fb47acdb23c1 Max Filippov 2023-08-11  137  
8c1fb47acdb23c1 Max Filippov 2023-08-11  138  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
8c1fb47acdb23c1 Max Filippov 2023-08-11  139  {
8c1fb47acdb23c1 Max Filippov 2023-08-11  140  	void __user *p;
8c1fb47acdb23c1 Max Filippov 2023-08-11  141  
8c1fb47acdb23c1 Max Filippov 2023-08-11  142  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
8c1fb47acdb23c1 Max Filippov 2023-08-11  143  	if (IS_ERR(p))
8c1fb47acdb23c1 Max Filippov 2023-08-11  144  		return PTR_ERR(p);
8c1fb47acdb23c1 Max Filippov 2023-08-11 @145  	hw->hw_q = (void *)readl(p);
8c1fb47acdb23c1 Max Filippov 2023-08-11  146  	devm_iounmap(&pdev->dev, p);
8c1fb47acdb23c1 Max Filippov 2023-08-11  147  
8c1fb47acdb23c1 Max Filippov 2023-08-11  148  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
8c1fb47acdb23c1 Max Filippov 2023-08-11  149  	if (IS_ERR(hw->regs))
8c1fb47acdb23c1 Max Filippov 2023-08-11  150  		return PTR_ERR(hw->regs);
8c1fb47acdb23c1 Max Filippov 2023-08-11  151  
8c1fb47acdb23c1 Max Filippov 2023-08-11  152  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
8c1fb47acdb23c1 Max Filippov 2023-08-11  153  		__func__, hw->regs, hw->hw_q);
8c1fb47acdb23c1 Max Filippov 2023-08-11  154  	if (hw->hw_q) {
8c1fb47acdb23c1 Max Filippov 2023-08-11  155  		u32 i;
8c1fb47acdb23c1 Max Filippov 2023-08-11  156  
8c1fb47acdb23c1 Max Filippov 2023-08-11  157  		for (i = 0; i < 2; ++i) {
8c1fb47acdb23c1 Max Filippov 2023-08-11  158  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
8c1fb47acdb23c1 Max Filippov 2023-08-11  159  				__func__, i,
8c1fb47acdb23c1 Max Filippov 2023-08-11  160  				hw->hw_q[i].offset,
8c1fb47acdb23c1 Max Filippov 2023-08-11  161  				hw->hw_q[i].mask);
8c1fb47acdb23c1 Max Filippov 2023-08-11  162  		}
8c1fb47acdb23c1 Max Filippov 2023-08-11  163  	} else {
8c1fb47acdb23c1 Max Filippov 2023-08-11  164  		return -ENODEV;
8c1fb47acdb23c1 Max Filippov 2023-08-11  165  	}
8c1fb47acdb23c1 Max Filippov 2023-08-11  166  
8c1fb47acdb23c1 Max Filippov 2023-08-11  167  	hw->irq = platform_get_irq(pdev, 0);
8c1fb47acdb23c1 Max Filippov 2023-08-11  168  	if (hw->irq >= 0) {
8c1fb47acdb23c1 Max Filippov 2023-08-11  169  		int ret;
8c1fb47acdb23c1 Max Filippov 2023-08-11  170  
8c1fb47acdb23c1 Max Filippov 2023-08-11  171  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
8c1fb47acdb23c1 Max Filippov 2023-08-11  172  						esp32_ipc_irq_handler,
8c1fb47acdb23c1 Max Filippov 2023-08-11  173  						esp32_ipc_thread_handler,
8c1fb47acdb23c1 Max Filippov 2023-08-11  174  						IRQF_SHARED, pdev->name, hw);
8c1fb47acdb23c1 Max Filippov 2023-08-11  175  		if (ret < 0) {
8c1fb47acdb23c1 Max Filippov 2023-08-11  176  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
8c1fb47acdb23c1 Max Filippov 2023-08-11  177  			return ret;
8c1fb47acdb23c1 Max Filippov 2023-08-11  178  		}
8c1fb47acdb23c1 Max Filippov 2023-08-11  179  	} else {
8c1fb47acdb23c1 Max Filippov 2023-08-11  180  		dev_err(&pdev->dev, "missing IRQ property\n");
8c1fb47acdb23c1 Max Filippov 2023-08-11  181  		return -ENODEV;
8c1fb47acdb23c1 Max Filippov 2023-08-11  182  	}
8c1fb47acdb23c1 Max Filippov 2023-08-11  183  
8c1fb47acdb23c1 Max Filippov 2023-08-11  184  	return 0;
8c1fb47acdb23c1 Max Filippov 2023-08-11  185  }
8c1fb47acdb23c1 Max Filippov 2023-08-11  186  

:::::: The code at line 145 was first introduced by commit
:::::: 8c1fb47acdb23c156acdf7b6f286db404d2c508f misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
