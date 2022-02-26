Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7007A
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 01:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645838493; x=1677374493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbNqcU+BpnyhoKzvyKBXUejQmP3yMuItSLg9jmjkz1Y=;
  b=L5PVmdweoIf3MjwzvxdoJ44kpYH/vFAGvz70IcCNQ7YaVomAPRo/7hwA
   5Th1teWEdkcfVS8HQS3xcaZ3Usqu1EpEnacZOuLxl+aBngY2/hl5j2jRQ
   TAw79Vi2ZAlOAHaatgLyyO+22NLCW5X2Z4yFdOaDynDB9eIR6cf93LG+J
   uav4PgzjV2DcF6wMw3ObOhhU/m7Skp58uwK0rIYZdnKLVF56qzBIPDJ8q
   qvxdjEX9a+Ws59no6cBTk3GIyXOc3I+TBOTNrGJLTauoEDLqGGh9GhdhC
   lnOFcPpeLgKeLHqH+lAfCyVu2trc2sZS72or/72kYujJbXdEZfiz+ySCt
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313334551"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; 
   d="scan'208";a="313334551"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 17:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; 
   d="scan'208";a="794102690"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2022 17:21:31 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNlm6-0004tQ-KX; Sat, 26 Feb 2022 01:21:30 +0000
Date: Sat, 26 Feb 2022 09:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [soc:at91/soc 6/6] drivers/soc/microchip/mpfs-sys-controller.c:76:6:
 warning: no previous prototype for function 'mpfs_sys_controller_put'
Message-ID: <202202260947.F5T1YNao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git at91/soc
head:   d0054a470c33902f5ae88835ed8a8ecc3cf8faa4
commit: d0054a470c33902f5ae88835ed8a8ecc3cf8faa4 [6/6] soc: add microchip polarfire soc system controller
config: hexagon-randconfig-r005-20220226 (https://download.01.org/0day-ci/archive/20220226/202202260947.F5T1YNao-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=d0054a470c33902f5ae88835ed8a8ecc3cf8faa4
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc at91/soc
        git checkout d0054a470c33902f5ae88835ed8a8ecc3cf8faa4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/microchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soc/microchip/mpfs-sys-controller.c:76:6: warning: no previous prototype for function 'mpfs_sys_controller_put' [-Wmissing-prototypes]
   void mpfs_sys_controller_put(void *data)
        ^
   drivers/soc/microchip/mpfs-sys-controller.c:76:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mpfs_sys_controller_put(void *data)
   ^
   static 
   1 warning generated.


vim +/mpfs_sys_controller_put +76 drivers/soc/microchip/mpfs-sys-controller.c

    75	
  > 76	void mpfs_sys_controller_put(void *data)
    77	{
    78		struct mpfs_sys_controller *sys_controller = data;
    79	
    80		kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
    81	}
    82	EXPORT_SYMBOL(mpfs_sys_controller_put);
    83	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
