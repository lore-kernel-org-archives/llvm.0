Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EF515AD7;
	Tue, 15 Aug 2023 22:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692137896; x=1723673896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N4vmi4W6zM1L9JVjv0dWGbmzpnKS4ljIAM+MtTFnAX0=;
  b=SpgbZSfHaecEZy7O/rrvqLGNCACKcItxwO81Ro5XG9OuoTj7l4TxtHX0
   deyQy7icT5slUU54XVMPB9WJpEQywLI8LVTXlqSUJwR0sbYyj37ZJGqQZ
   ND0JU2GiwvgoN+lZeiLXHzlSxFr1ahEJbDrD+xCHJKFydaz13AfqRKVVt
   nfGVXif7A4R/sCoZhSDoC6Mw54MCl6DC6y1mE4eFbJFJGdNTLt8JnM8jA
   sFrHZVlYULfuIzOotITqwRzIfxCjTNMLIRmUkyAcUu1wbtCX1ssO0P33m
   ch+yN/N40wP3NLAcjFTCXCHNNHmyzQ+Sp2jpC4pWLyzUXNJtd8ajQuJCd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438735293"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="438735293"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 15:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857584201"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="857584201"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Aug 2023 15:18:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW2Mf-0001GR-2X;
	Tue, 15 Aug 2023 22:18:13 +0000
Date: Wed, 16 Aug 2023 06:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 18/24] drivers/pci/ide.c:303:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202308160658.8ZwFBENH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   a43b30b80446a307847711c68ed284729a3e4cdb
commit: 9ed7e5038134210887003c32f743b6e66186186f [18/24] pci: ide: Add IDE operations for endpoint device
config: s390-randconfig-r015-20230816 (https://download.01.org/0day-ci/archive/20230816/202308160658.8ZwFBENH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160658.8ZwFBENH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160658.8ZwFBENH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/ide.c:4:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/pci/ide.c:4:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/pci/ide.c:4:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
>> drivers/pci/ide.c:303:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     303 |         default:        /* Do nothing, RP should be already set */
         |         ^
   drivers/pci/ide.c:303:2: note: insert 'break;' to avoid fall-through
     303 |         default:        /* Do nothing, RP should be already set */
         |         ^
         |         break; 
   13 warnings generated.


vim +303 drivers/pci/ide.c

   256	
   257	void pci_ide_init(struct pci_dev *pdev)
   258	{
   259		int link_num = 0, select_num = 0, pos;
   260		u32 cap;
   261		int rc;
   262	
   263		if (!pci_is_pcie(pdev))
   264			return;
   265	
   266		pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_IDE);
   267		if (!pos)
   268			return;
   269	
   270		pci_read_config_dword(pdev, pos + PCI_IDE_CAP, &cap);
   271		if (!(cap & (PCI_IDE_CAP_LNK | PCI_IDE_CAP_SEL)))
   272			return;
   273	
   274		if (cap & PCI_IDE_CAP_LNK)
   275			link_num = 1 + FIELD_GET(PCI_IDE_CAP_LNK_NUM, cap);
   276	
   277		if (cap & PCI_IDE_CAP_SEL)
   278			select_num = 1 + FIELD_GET(PCI_IDE_CAP_SEL_NUM, cap);
   279	
   280		pdev->ide_support = true;
   281		pdev->ide.link_num = link_num;
   282		pdev->ide.select_num = select_num;
   283		pdev->ide.stream_min = 0;
   284		pdev->ide.stream_max = link_num + select_num;
   285		ida_init(&pdev->ide.stream_pos_ids);
   286		ida_init(&pdev->ide.stream_ids);
   287	
   288		/* No CMA established, just exit */
   289		if (!test_bit(PCI_CMA_AUTHENTICATED, &pdev->priv_flags))
   290			return;
   291	
   292	
   293		switch (pci_pcie_type(pdev)) {
   294		case PCI_EXP_TYPE_DOWNSTREAM:
   295			pdev->ide.ops = &pcie_dsp_ide_ops;
   296			break;
   297		case PCI_EXP_TYPE_UPSTREAM:
   298			pdev->ide.ops = &pcie_usp_ide_ops;
   299			break;
   300		case PCI_EXP_TYPE_ENDPOINT:
   301		case PCI_EXP_TYPE_RC_END:
   302			pdev->ide.ops = &pcie_ep_ide_ops;
 > 303		default:	/* Do nothing, RP should be already set */
   304			break;
   305		}
   306	
   307		if (is_pci_endpoint(pdev)) {
   308			struct pci_dev *rp = pcie_find_root_port(pdev);
   309	
   310			rc = pcie_ide_stream_create(rp, pdev, pdev,
   311						    PCI_IDE_STREAM_TYPE_SELECTIVE);
   312			if (rc) {
   313				dev_dbg(&pdev->dev,
   314					"Failed to establish IDE stream.\n");
   315				return;
   316			}
   317		}
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
