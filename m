Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A822F2B;
	Thu, 27 Apr 2023 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682604965; x=1714140965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eCwAykhxfez5wbK3yQdYOYy7KHTQG9/cq1djBX12nws=;
  b=kLHMlU19NypahvBmP9TcM1wA2o8eUOvF3saGHPaTwnOQHXMsSa04PeHX
   ispoMnL2kReO7ARDTBwV3MMwtYswDzzC8lJ2Mtl2XCpvdU6fxgyyAoiMY
   D+vBAvm+7eDFgNGFSxlVXMAyO858WptBJSkTy8VgPEh72WCrFd+RBmDCI
   b55Q/lF4fcvT4SfdOfVZSGcQJ8SxrqS+Gr+nkBju5jb8oefnAzk5+LPuc
   YL/7y2jNE1MyB/S2h28UKD31RCBLd53LzGQ7LhLr2eW1p588YFiv1S8DR
   t4uTshcv1zFGTi/3ReN0D/qI7Dio5uNXs4nHtNpVrVGnByAQ68dQ55eV3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336416849"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="336416849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 06:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694393565"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="694393565"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Apr 2023 06:55:23 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps25i-0000Fh-1P;
	Thu, 27 Apr 2023 13:55:22 +0000
Date: Thu, 27 Apr 2023 21:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
	mathias.nyman@intel.com, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH v2 1/2] USB: Extend pci resume function to handle PM
 events
Message-ID: <202304272147.qSiPDNIh-lkp@intel.com>
References: <20230427104805.3560591-2-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427104805.3560591-2-Basavaraj.Natikar@amd.com>

Hi Basavaraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.3 next-20230426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Basavaraj-Natikar/USB-Extend-pci-resume-function-to-handle-PM-events/20230427-185141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230427104805.3560591-2-Basavaraj.Natikar%40amd.com
patch subject: [PATCH v2 1/2] USB: Extend pci resume function to handle PM events
config: hexagon-randconfig-r045-20230427 (https://download.01.org/0day-ci/archive/20230427/202304272147.qSiPDNIh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c56600f81d90e04002ac435d27ccd0358b560d88
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Basavaraj-Natikar/USB-Extend-pci-resume-function-to-handle-PM-events/20230427-185141
        git checkout c56600f81d90e04002ac435d27ccd0358b560d88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304272147.qSiPDNIh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci-histb.c:11:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/usb/host/xhci-histb.c:11:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/usb/host/xhci-histb.c:11:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/usb/host/xhci-histb.c:370:27: error: passing 'int' to parameter of incompatible type 'pm_message_t' (aka 'struct pm_message')
           return xhci_resume(xhci, 0);
                                    ^
   drivers/usb/host/xhci.h:2143:53: note: passing argument to parameter 'msg' here
   int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);
                                                       ^
   6 warnings and 1 error generated.


vim +370 drivers/usb/host/xhci-histb.c

c508f41da07882 Jianguo Sun 2018-05-21  360  
c508f41da07882 Jianguo Sun 2018-05-21  361  static int __maybe_unused xhci_histb_resume(struct device *dev)
c508f41da07882 Jianguo Sun 2018-05-21  362  {
c508f41da07882 Jianguo Sun 2018-05-21  363  	struct xhci_hcd_histb *histb = dev_get_drvdata(dev);
c508f41da07882 Jianguo Sun 2018-05-21  364  	struct usb_hcd *hcd = histb->hcd;
c508f41da07882 Jianguo Sun 2018-05-21  365  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
c508f41da07882 Jianguo Sun 2018-05-21  366  
c508f41da07882 Jianguo Sun 2018-05-21  367  	if (!device_may_wakeup(dev))
c508f41da07882 Jianguo Sun 2018-05-21  368  		xhci_histb_host_enable(histb);
c508f41da07882 Jianguo Sun 2018-05-21  369  
c508f41da07882 Jianguo Sun 2018-05-21 @370  	return xhci_resume(xhci, 0);
c508f41da07882 Jianguo Sun 2018-05-21  371  }
c508f41da07882 Jianguo Sun 2018-05-21  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
