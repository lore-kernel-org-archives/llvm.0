Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4834173
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641392829; x=1672928829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gUMG8gv0OpBLG8SH33/IIW2LgOlMHbclPqCUBIKm3LU=;
  b=Sfl2tTIvDHscJLyUgnGlgIz5/7OjhC0jIFekfiIBArSAMOR6aIOJYxBb
   FtRkr1UzRtA+O+XMxnEAPducCWhmk83x6oBy8fpf1Nwa2jh9B4uGW4mZT
   TR3f7FHRdJIqW/kiKjpQmWhSOjur8nWaXs8UEo4T3QW5PBcjMAO7t4eCH
   VSB1nIRQnnxO8IMzRb86N/nj9//XlH5Exd+lG3SJ4hKK1xhFm2VlimxhS
   v/ueWFCN9/YlgbD27z+JT8BlBYxVOOIRDReEJFfIpDjdjWvwFSVd2YWrp
   mEAFSSMzczIQBHV4tBgptf/wpOD9S2V2ooWWteqkiw1FVD8S6Yhy2Z+Ua
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223134239"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="223134239"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 06:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="556538376"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jan 2022 06:06:42 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n56w6-000Gi1-AA; Wed, 05 Jan 2022 14:06:42 +0000
Date: Wed, 5 Jan 2022 22:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Haojun <jiangliuer01@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jon Mason <jdmason@kudzu.us>
Subject: [linux-next:master 10467/10864]
 drivers/ntb/hw/idt/ntb_hw_idt.c:2735:12: warning: stack frame size (1320)
 exceeds limit (1280) in 'idt_pci_probe'
Message-ID: <202201052106.oAp1xqJt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7a769a3922d81cfc74ab4d90a9cc69485f260976
commit: ab434f1b66e63e7946bf42b70306f7efd90fba9a [10467/10864] IDT: Fix Build warnings on some 32bit architectures.
config: s390-buildonly-randconfig-r001-20220105 (https://download.01.org/0day-ci/archive/20220105/202201052106.oAp1xqJt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ab434f1b66e63e7946bf42b70306f7efd90fba9a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ab434f1b66e63e7946bf42b70306f7efd90fba9a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/ntb/hw/idt/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/ntb/hw/idt/ntb_hw_idt.c:53:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/ntb/hw/idt/ntb_hw_idt.c:53:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/ntb/hw/idt/ntb_hw_idt.c:53:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   drivers/ntb/hw/idt/ntb_hw_idt.c:2409:28: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
                                   "\t%hhu-%hhu.\t", idx, idx + cnt - 1);
                                           ~~~~           ^~~~~~~~~~~~~
                                           %d
   drivers/ntb/hw/idt/ntb_hw_idt.c:2438:29: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
                                           "\t%hhu-%hhu.\t", idx, idx + cnt - 1);
                                                   ~~~~           ^~~~~~~~~~~~~
                                                   %d
   drivers/ntb/hw/idt/ntb_hw_idt.c:2484:15: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
                           idx, data, src, ndev->peers[src].port);
                                      ^~~
>> drivers/ntb/hw/idt/ntb_hw_idt.c:2735:12: warning: stack frame size (1320) exceeds limit (1280) in 'idt_pci_probe' [-Wframe-larger-than]
   static int idt_pci_probe(struct pci_dev *pdev,
              ^
   16 warnings generated.


vim +/idt_pci_probe +2735 drivers/ntb/hw/idt/ntb_hw_idt.c

bf2a952d31d2cd Serge Semin 2017-04-12  2722  
bf2a952d31d2cd Serge Semin 2017-04-12  2723  /*===========================================================================
bf2a952d31d2cd Serge Semin 2017-04-12  2724   *                       12. PCI bus callback functions
bf2a952d31d2cd Serge Semin 2017-04-12  2725   *===========================================================================
bf2a952d31d2cd Serge Semin 2017-04-12  2726   */
bf2a952d31d2cd Serge Semin 2017-04-12  2727  
bf2a952d31d2cd Serge Semin 2017-04-12  2728  /*
bf2a952d31d2cd Serge Semin 2017-04-12  2729   * idt_pci_probe() - PCI device probe callback
bf2a952d31d2cd Serge Semin 2017-04-12  2730   * @pdev:	Pointer to PCI device structure
bf2a952d31d2cd Serge Semin 2017-04-12  2731   * @id:		PCIe device custom descriptor
bf2a952d31d2cd Serge Semin 2017-04-12  2732   *
bf2a952d31d2cd Serge Semin 2017-04-12  2733   * Return: zero on success, otherwise negative error number
bf2a952d31d2cd Serge Semin 2017-04-12  2734   */
bf2a952d31d2cd Serge Semin 2017-04-12 @2735  static int idt_pci_probe(struct pci_dev *pdev,
bf2a952d31d2cd Serge Semin 2017-04-12  2736  			 const struct pci_device_id *id)
bf2a952d31d2cd Serge Semin 2017-04-12  2737  {
bf2a952d31d2cd Serge Semin 2017-04-12  2738  	struct idt_ntb_dev *ndev;
bf2a952d31d2cd Serge Semin 2017-04-12  2739  	int ret;
bf2a952d31d2cd Serge Semin 2017-04-12  2740  
bf2a952d31d2cd Serge Semin 2017-04-12  2741  	/* Check whether IDT PCIe-switch is properly pre-initialized */
bf2a952d31d2cd Serge Semin 2017-04-12  2742  	ret = idt_check_setup(pdev);
bf2a952d31d2cd Serge Semin 2017-04-12  2743  	if (ret != 0)
bf2a952d31d2cd Serge Semin 2017-04-12  2744  		return ret;
bf2a952d31d2cd Serge Semin 2017-04-12  2745  
bf2a952d31d2cd Serge Semin 2017-04-12  2746  	/* Allocate the memory for IDT NTB device data */
bf2a952d31d2cd Serge Semin 2017-04-12  2747  	ndev = idt_create_dev(pdev, id);
91b8246de8590b Wang Qing   2020-11-06  2748  	if (IS_ERR(ndev))
bf2a952d31d2cd Serge Semin 2017-04-12  2749  		return PTR_ERR(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2750  
bf2a952d31d2cd Serge Semin 2017-04-12  2751  	/* Initialize the basic PCI subsystem of the device */
bf2a952d31d2cd Serge Semin 2017-04-12  2752  	ret = idt_init_pci(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2753  	if (ret != 0)
bf2a952d31d2cd Serge Semin 2017-04-12  2754  		return ret;
bf2a952d31d2cd Serge Semin 2017-04-12  2755  
bf2a952d31d2cd Serge Semin 2017-04-12  2756  	/* Scan ports of the IDT PCIe-switch */
bf2a952d31d2cd Serge Semin 2017-04-12  2757  	(void)idt_scan_ports(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2758  
bf2a952d31d2cd Serge Semin 2017-04-12  2759  	/* Initialize NTB link events subsystem */
bf2a952d31d2cd Serge Semin 2017-04-12  2760  	idt_init_link(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2761  
bf2a952d31d2cd Serge Semin 2017-04-12  2762  	/* Initialize MWs subsystem */
bf2a952d31d2cd Serge Semin 2017-04-12  2763  	ret = idt_init_mws(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2764  	if (ret != 0)
bf2a952d31d2cd Serge Semin 2017-04-12  2765  		goto err_deinit_link;
bf2a952d31d2cd Serge Semin 2017-04-12  2766  
bf2a952d31d2cd Serge Semin 2017-04-12  2767  	/* Initialize Messaging subsystem */
bf2a952d31d2cd Serge Semin 2017-04-12  2768  	idt_init_msg(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2769  
aed1b7b31154bd Serge Semin 2018-07-17  2770  	/* Initialize hwmon interface */
aed1b7b31154bd Serge Semin 2018-07-17  2771  	idt_init_temp(ndev);
aed1b7b31154bd Serge Semin 2018-07-17  2772  
bf2a952d31d2cd Serge Semin 2017-04-12  2773  	/* Initialize IDT interrupts handler */
bf2a952d31d2cd Serge Semin 2017-04-12  2774  	ret = idt_init_isr(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2775  	if (ret != 0)
bf2a952d31d2cd Serge Semin 2017-04-12  2776  		goto err_deinit_link;
bf2a952d31d2cd Serge Semin 2017-04-12  2777  
bf2a952d31d2cd Serge Semin 2017-04-12  2778  	/* Register IDT NTB devices on the NTB bus */
bf2a952d31d2cd Serge Semin 2017-04-12  2779  	ret = idt_register_device(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2780  	if (ret != 0)
bf2a952d31d2cd Serge Semin 2017-04-12  2781  		goto err_deinit_isr;
bf2a952d31d2cd Serge Semin 2017-04-12  2782  
bf2a952d31d2cd Serge Semin 2017-04-12  2783  	/* Initialize DebugFS info node */
bf2a952d31d2cd Serge Semin 2017-04-12  2784  	(void)idt_init_dbgfs(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2785  
bf2a952d31d2cd Serge Semin 2017-04-12  2786  	/* IDT PCIe-switch NTB driver is finally initialized */
bf2a952d31d2cd Serge Semin 2017-04-12  2787  	dev_info(&pdev->dev, "IDT NTB device is ready");
bf2a952d31d2cd Serge Semin 2017-04-12  2788  
bf2a952d31d2cd Serge Semin 2017-04-12  2789  	/* May the force be with us... */
bf2a952d31d2cd Serge Semin 2017-04-12  2790  	return 0;
bf2a952d31d2cd Serge Semin 2017-04-12  2791  
bf2a952d31d2cd Serge Semin 2017-04-12  2792  err_deinit_isr:
bf2a952d31d2cd Serge Semin 2017-04-12  2793  	idt_deinit_isr(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2794  err_deinit_link:
bf2a952d31d2cd Serge Semin 2017-04-12  2795  	idt_deinit_link(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2796  	idt_deinit_pci(ndev);
bf2a952d31d2cd Serge Semin 2017-04-12  2797  
bf2a952d31d2cd Serge Semin 2017-04-12  2798  	return ret;
bf2a952d31d2cd Serge Semin 2017-04-12  2799  }
bf2a952d31d2cd Serge Semin 2017-04-12  2800  

:::::: The code at line 2735 was first introduced by commit
:::::: bf2a952d31d2cd28bb3454f15645a76fda70addd NTB: Add IDT 89HPESxNTx PCIe-switches support

:::::: TO: Serge Semin <fancer.lancer@gmail.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
