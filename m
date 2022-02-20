Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B026130
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645397759; x=1676933759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sE/ucxKyyIB7/HacY0Hqd8DR98TaJD6jjjsY1Llb3nk=;
  b=TwhOhBN2AZkQsNirEAourY8vr7OGD6FUAAOj3Q5TfF3uc496VZ8JLRi4
   /ABJYhwdGq1wIOLJO1XuJVP9NYqjV0Jw+s+jgbc1tE1uxTzkxGzNpDplX
   MirSKqY6+EuHEgYWkUNR1phIlcyNMCJiIAScjE4EYdZKCgd2c2IPzsczN
   WpVjCP1AOzCvuoWw2GaFuVv1pqfhPq97bYjrRe0NrADiGGN+drFlqfR3u
   fuEfvwiOzMixiPXY2khd0b8IZTp6az3Rsf7xn+vOeEg3nV51mAD5SNfCD
   z+LNO9t72uXBT48A9zbdnosWXqulKqCyQGG9LK7a7oEaszc0edax4JJWe
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="314671618"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="314671618"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 14:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="507426857"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Feb 2022 14:55:56 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLv7U-0000ym-3r; Sun, 20 Feb 2022 22:55:56 +0000
Date: Mon, 21 Feb 2022 06:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 156/556] drivers/usb/dwc3/dwc3-xilinx.c:509:6:
 warning: no previous prototype for function 'dwc3_xilinx_wakeup_capable'
Message-ID: <202202210653.27JMaMlu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx master
head:   0293811d1fb48202f60d63799ec58c3e44f83a55
commit: 6e383f53627b34b9aa1f149720de25f55b199d37 [156/556] usb: dwc3: Added remote wake-up in xilinx glue driver
config: arm64-randconfig-r031-20220220 (https://download.01.org/0day-ci/archive/20220221/202202210653.27JMaMlu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/6e383f53627b34b9aa1f149720de25f55b199d37
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 6e383f53627b34b9aa1f149720de25f55b199d37
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-xilinx.c:509:6: warning: no previous prototype for function 'dwc3_xilinx_wakeup_capable' [-Wmissing-prototypes]
   void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
        ^
   drivers/usb/dwc3/dwc3-xilinx.c:509:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
   ^
   static 
   1 warning generated.


vim +/dwc3_xilinx_wakeup_capable +509 drivers/usb/dwc3/dwc3-xilinx.c

   507	
   508	/* xilinx feature support functions */
 > 509	void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
   510	{
   511		struct device_node *node = of_node_get(dev->parent->of_node);
   512	
   513		/* check for valid parent node */
   514		while (node) {
   515			if (of_device_is_compatible(node, "xlnx,zynqmp-dwc3") ||
   516			    of_device_is_compatible(node, "xlnx,versal-dwc3"))
   517				break;
   518	
   519			/* get the next parent node */
   520			node = of_get_next_parent(node);
   521		}
   522	
   523		if (node) {
   524			struct platform_device *pdev_parent;
   525			struct dwc3_xlnx *priv_data;
   526	
   527			pdev_parent = of_find_device_by_node(node);
   528			priv_data = platform_get_drvdata(pdev_parent);
   529	
   530			/* Set wakeup capable as true or false */
   531			priv_data->wakeup_capable = wakeup;
   532	
   533			/* Allow D3 state if wakeup capable only */
   534			priv_data->enable_d3_suspend = wakeup;
   535		}
   536	}
   537	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
