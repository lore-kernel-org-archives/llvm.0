Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C54A46;
	Tue, 29 Aug 2023 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693275179; x=1724811179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKFCiVVPZOPqsN6iqmSmKmlrOThu5P5XXnUlWnT/0A4=;
  b=Mp2z+IPsfNFTZ7xWoCOdOIEfLp7x44sEKkYw9ZPOWiMBI3g9Xj195kxR
   YltjbPWrxwfHhp2OheDn6VRZ2pZFQD08GfkbpWqQZdfbUClqaE2dBHNh6
   DPkLBdFGZyr2DaDPk2Faa8wvEAYhtHkrLLC2mO9g9A42850HzPZJxX6wd
   QKCmtblC8sj+rv19rXg6mrDILj/WBsWKp1Hn9zL47UVTvCIN8XHfxNLXW
   kDg8huG+jWvmoerMDxdNb12fnYcv0zZ1ohSQL+4Ht1fXW9FObrRbQaxu5
   EuKgVneGUfVoNC/w8iDVJLg1Z7Ls9RGUhnk1H0ViH263De4l3ccFkyDXJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375221648"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="375221648"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 19:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="741637745"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="741637745"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2023 19:12:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaoDt-0008HF-0e;
	Tue, 29 Aug 2023 02:12:53 +0000
Date: Tue, 29 Aug 2023 10:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 24/34]
 drivers/misc/esp32-ipc.c:142: undefined reference to `devm_of_iomap'
Message-ID: <202308291003.7IYFUKpc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   edbe560c2ce9974f4b2e47ca13050e6a62d604b3
commit: 20b0bc011b5325431d41d666f8f949d0c6ede432 [24/34] esp_wifi: add IPC transport
config: um-randconfig-r022-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291003.7IYFUKpc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291003.7IYFUKpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291003.7IYFUKpc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
--
   /usr/bin/ld: init/main.o: warning: relocation in read-only section `.ref.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/misc/esp32-ipc.o: in function `esp32_ipc_probe':
>> drivers/misc/esp32-ipc.c:142: undefined reference to `devm_of_iomap'
>> /usr/bin/ld: drivers/misc/esp32-ipc.c:146: undefined reference to `devm_iounmap'
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=n]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +142 drivers/misc/esp32-ipc.c

4886a7e20027ff Max Filippov 2023-08-11  137  
4886a7e20027ff Max Filippov 2023-08-11  138  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
4886a7e20027ff Max Filippov 2023-08-11  139  {
4886a7e20027ff Max Filippov 2023-08-11  140  	void __user *p;
4886a7e20027ff Max Filippov 2023-08-11  141  
4886a7e20027ff Max Filippov 2023-08-11 @142  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
4886a7e20027ff Max Filippov 2023-08-11  143  	if (IS_ERR(p))
4886a7e20027ff Max Filippov 2023-08-11  144  		return PTR_ERR(p);
4886a7e20027ff Max Filippov 2023-08-11 @145  	hw->hw_q = (void *)readl(p);
4886a7e20027ff Max Filippov 2023-08-11 @146  	devm_iounmap(&pdev->dev, p);
4886a7e20027ff Max Filippov 2023-08-11  147  
4886a7e20027ff Max Filippov 2023-08-11  148  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
4886a7e20027ff Max Filippov 2023-08-11  149  	if (IS_ERR(hw->regs))
4886a7e20027ff Max Filippov 2023-08-11  150  		return PTR_ERR(hw->regs);
4886a7e20027ff Max Filippov 2023-08-11  151  
4886a7e20027ff Max Filippov 2023-08-11  152  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
4886a7e20027ff Max Filippov 2023-08-11  153  		__func__, hw->regs, hw->hw_q);
4886a7e20027ff Max Filippov 2023-08-11  154  	if (hw->hw_q) {
4886a7e20027ff Max Filippov 2023-08-11  155  		u32 i;
4886a7e20027ff Max Filippov 2023-08-11  156  
4886a7e20027ff Max Filippov 2023-08-11  157  		for (i = 0; i < 2; ++i) {
4886a7e20027ff Max Filippov 2023-08-11  158  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
4886a7e20027ff Max Filippov 2023-08-11  159  				__func__, i,
4886a7e20027ff Max Filippov 2023-08-11  160  				hw->hw_q[i].offset,
4886a7e20027ff Max Filippov 2023-08-11  161  				hw->hw_q[i].mask);
4886a7e20027ff Max Filippov 2023-08-11  162  		}
4886a7e20027ff Max Filippov 2023-08-11  163  	} else {
4886a7e20027ff Max Filippov 2023-08-11  164  		return -ENODEV;
4886a7e20027ff Max Filippov 2023-08-11  165  	}
4886a7e20027ff Max Filippov 2023-08-11  166  
4886a7e20027ff Max Filippov 2023-08-11  167  	hw->irq = platform_get_irq(pdev, 0);
4886a7e20027ff Max Filippov 2023-08-11  168  	if (hw->irq >= 0) {
4886a7e20027ff Max Filippov 2023-08-11  169  		int ret;
4886a7e20027ff Max Filippov 2023-08-11  170  
4886a7e20027ff Max Filippov 2023-08-11  171  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
4886a7e20027ff Max Filippov 2023-08-11  172  						esp32_ipc_irq_handler,
4886a7e20027ff Max Filippov 2023-08-11  173  						esp32_ipc_thread_handler,
4886a7e20027ff Max Filippov 2023-08-11  174  						IRQF_SHARED, pdev->name, hw);
4886a7e20027ff Max Filippov 2023-08-11  175  		if (ret < 0) {
4886a7e20027ff Max Filippov 2023-08-11  176  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
4886a7e20027ff Max Filippov 2023-08-11  177  			return ret;
4886a7e20027ff Max Filippov 2023-08-11  178  		}
4886a7e20027ff Max Filippov 2023-08-11  179  	} else {
4886a7e20027ff Max Filippov 2023-08-11  180  		dev_err(&pdev->dev, "missing IRQ property\n");
4886a7e20027ff Max Filippov 2023-08-11  181  		return -ENODEV;
4886a7e20027ff Max Filippov 2023-08-11  182  	}
4886a7e20027ff Max Filippov 2023-08-11  183  
4886a7e20027ff Max Filippov 2023-08-11  184  	return 0;
4886a7e20027ff Max Filippov 2023-08-11  185  }
4886a7e20027ff Max Filippov 2023-08-11  186  

:::::: The code at line 142 was first introduced by commit
:::::: 4886a7e20027ffdd9ec581eee4deb20d3d407ba5 misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
