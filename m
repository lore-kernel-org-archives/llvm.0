Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A426256E
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 23:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652486249; x=1684022249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHb+Z3gXa3pZmXHcXfu/0b/a5HtzS/8HbYUNrVPuelU=;
  b=cWsAnC48rYxA0ogODbsUxvvcUYX1anxvxs5iU68rZuj2iMasMmvxsJud
   y1l8A6RfCE3rD/uBENswPPYmcndPkMncW+a1ASsb8A+MoBN7UBdfd20fg
   fjCaw+lY0VNGrHZGYdH3C2zhXdxqdTmbZVV7lCOEJSnzekwbt9R9MOUxT
   6ez0Ai83dRLlv/cI6ivHNBdsBpHdNIblxgpGCsqvJ4dUS3NW2NWLAjl42
   PkVkoJtNQKcdc/KZ1xEmcW/9di5IlqPrOESZOPjyHTFmgSpBo7bkOoDa5
   naDomweWucUW9sgjQlOct1SO0zHsF4zPG8DoTSyJIWzzVEpVwx5NtnTxf
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270373586"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="270373586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 16:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="521624917"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 May 2022 16:57:25 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npf9w-000MEK-E5;
	Fri, 13 May 2022 23:57:24 +0000
Date: Sat, 14 May 2022 07:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 404/1093]
 drivers/usb/dwc3/dwc3-xilinx.c:508:6: warning: no previous prototype for
 function 'dwc3_xilinx_wakeup_capable'
Message-ID: <202205140742.L4RaDuSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piyush,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: db6b55a74c709a27fdf6d175f890568dc8945424 [404/1093] usb: dwc3: Added remote wake-up in xilinx glue driver
config: arm64-randconfig-r031-20220512 (https://download.01.org/0day-ci/archive/20220514/202205140742.L4RaDuSY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/db6b55a74c709a27fdf6d175f890568dc8945424
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout db6b55a74c709a27fdf6d175f890568dc8945424
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-xilinx.c:508:6: warning: no previous prototype for function 'dwc3_xilinx_wakeup_capable' [-Wmissing-prototypes]
   void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
        ^
   drivers/usb/dwc3/dwc3-xilinx.c:508:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
   ^
   static 
   1 warning generated.


vim +/dwc3_xilinx_wakeup_capable +508 drivers/usb/dwc3/dwc3-xilinx.c

   506	
   507	/* xilinx feature support functions */
 > 508	void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
   509	{
   510		struct device_node *node = of_node_get(dev->parent->of_node);
   511	
   512		/* check for valid parent node */
   513		while (node) {
   514			if (of_device_is_compatible(node, "xlnx,zynqmp-dwc3") ||
   515			    of_device_is_compatible(node, "xlnx,versal-dwc3"))
   516				break;
   517	
   518			/* get the next parent node */
   519			node = of_get_next_parent(node);
   520		}
   521	
   522		if (node) {
   523			struct platform_device *pdev_parent;
   524			struct dwc3_xlnx *priv_data;
   525	
   526			pdev_parent = of_find_device_by_node(node);
   527			priv_data = platform_get_drvdata(pdev_parent);
   528	
   529			/* Set wakeup capable as true or false */
   530			priv_data->wakeup_capable = wakeup;
   531	
   532			/* Allow D3 state if wakeup capable only */
   533			priv_data->enable_d3_suspend = wakeup;
   534		}
   535	}
   536	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
