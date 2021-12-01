Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B771D2C9D
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 18:29:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236342433"
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="236342433"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 10:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="654875247"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2021 10:29:41 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msUMP-000FHP-2J; Wed, 01 Dec 2021 18:29:41 +0000
Date: Thu, 2 Dec 2021 02:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/3] drm/etnaviv: add pci device driver support
Message-ID: <202112020251.mDNRLVR1-lkp@intel.com>
References: <20211201113502.3168-2-15330273260@189.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201113502.3168-2-15330273260@189.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next drm-intel/for-linux-next drm-tip/drm-tip linus/master v5.16-rc3 next-20211201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/dt-bindings-ls2k1000-add-gpu-device-node/20211201-193705
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-randconfig-r013-20211201 (https://download.01.org/0day-ci/archive/20211202/202112020251.mDNRLVR1-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ad369e62739e40e48bb801a8d18ff3d9c6859b44
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/dt-bindings-ls2k1000-add-gpu-device-node/20211201-193705
        git checkout ad369e62739e40e48bb801a8d18ff3d9c6859b44
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/etnaviv/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/etnaviv/etnaviv_drv.c:741:1: warning: unused label 'unregister_platform_driver' [-Wunused-label]
   unregister_platform_driver:
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/unregister_platform_driver +741 drivers/gpu/drm/etnaviv/etnaviv_drv.c

ad369e62739e40 suijingfeng         2021-12-01  716  
246774d17fc05a Lucas Stach         2018-01-24  717  	/*
246774d17fc05a Lucas Stach         2018-01-24  718  	 * If the DT contains at least one available GPU device, instantiate
246774d17fc05a Lucas Stach         2018-01-24  719  	 * the DRM platform device.
246774d17fc05a Lucas Stach         2018-01-24  720  	 */
246774d17fc05a Lucas Stach         2018-01-24  721  	for_each_compatible_node(np, NULL, "vivante,gc") {
246774d17fc05a Lucas Stach         2018-01-24  722  		if (!of_device_is_available(np))
246774d17fc05a Lucas Stach         2018-01-24  723  			continue;
1a866306e0fbf3 Lucas Stach         2018-09-12  724  
ad369e62739e40 suijingfeng         2021-12-01  725  		ret = etnaviv_create_platform_device("etnaviv", np);
1a866306e0fbf3 Lucas Stach         2018-09-12  726  
45a0faaba9c8c5 Fabio Estevam       2018-06-27  727  		of_node_put(np);
1a866306e0fbf3 Lucas Stach         2018-09-12  728  
ad369e62739e40 suijingfeng         2021-12-01  729  		if (ret)
ad369e62739e40 suijingfeng         2021-12-01  730  			goto unregister_pci_driver;
ad369e62739e40 suijingfeng         2021-12-01  731  
246774d17fc05a Lucas Stach         2018-01-24  732  		break;
246774d17fc05a Lucas Stach         2018-01-24  733  	}
246774d17fc05a Lucas Stach         2018-01-24  734  
45a0faaba9c8c5 Fabio Estevam       2018-06-27  735  	return 0;
45a0faaba9c8c5 Fabio Estevam       2018-06-27  736  
ad369e62739e40 suijingfeng         2021-12-01  737  unregister_pci_driver:
ad369e62739e40 suijingfeng         2021-12-01  738  #ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
ad369e62739e40 suijingfeng         2021-12-01  739  	pci_unregister_driver(&etnaviv_pci_driver);
ad369e62739e40 suijingfeng         2021-12-01  740  #endif
45a0faaba9c8c5 Fabio Estevam       2018-06-27 @741  unregister_platform_driver:
45a0faaba9c8c5 Fabio Estevam       2018-06-27  742  	platform_driver_unregister(&etnaviv_platform_driver);
45a0faaba9c8c5 Fabio Estevam       2018-06-27  743  unregister_gpu_driver:
45a0faaba9c8c5 Fabio Estevam       2018-06-27  744  	platform_driver_unregister(&etnaviv_gpu_driver);
a8c21a5451d831 The etnaviv authors 2015-12-03  745  	return ret;
a8c21a5451d831 The etnaviv authors 2015-12-03  746  }
a8c21a5451d831 The etnaviv authors 2015-12-03  747  module_init(etnaviv_init);
a8c21a5451d831 The etnaviv authors 2015-12-03  748  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
