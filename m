Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0632F24
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 18:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647974971; x=1679510971;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=36UMbHEB++aPsu+bDTu3CxUmcPkaAe83iXrD2Y/TY+c=;
  b=CTTpF9+yhRip2dNgvETL5sAJCuG7cUzFjaJugxa4h/oY1HfSLzecILOs
   0ySdmL/sDTVE643Hb1LN5kI/10mb2ry9tywo7E9eUtxLGQCct/6T4fJ8f
   Y3sdTlZiRZ4JUZt/R0VKhRNiIxtJ92b+iiRu3d0eUOdQIaJpJGm3hWOeu
   CYkI5FW2Yxbc5kPF80grEErorayZNddCtfxKuNvIg1VzP3/ZwYaf/lm2t
   9cqzcJ6N+RnRUBAHbpaf3KgxhjFmscslnkgxEklzPawXlXG1uJZkbdwZ/
   jgeFj1g2p6ylwb9lvu1Zs1VNX2oXVyWZOshEou7zK4RVW1KBj7l/rUgMq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="318627736"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="318627736"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 11:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="649121935"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2022 11:49:29 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWjZQ-000JBX-Rd; Tue, 22 Mar 2022 18:49:28 +0000
Date: Wed, 23 Mar 2022 02:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 64/99]
 drivers/gpu/drm/tiny/panel-mipi-dbi.c:391:12: error: incompatible function
 pointer types initializing 'void (*)(struct spi_device *)' with an
 expression of type 'int (struct spi_device *)'
Message-ID: <202203230213.cy4sjibp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   6a5d6020e6854b38797ea17807457dcdc858aa29
commit: a3b63172d757ac1a27e1f179585052f38e0ddd8c [64/99] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: hexagon-randconfig-r045-20220322 (https://download.01.org/0day-ci/archive/20220323/202203230213.cy4sjibp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=a3b63172d757ac1a27e1f179585052f38e0ddd8c
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers master
        git checkout a3b63172d757ac1a27e1f179585052f38e0ddd8c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/tiny/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/panel-mipi-dbi.c:391:12: error: incompatible function pointer types initializing 'void (*)(struct spi_device *)' with an expression of type 'int (struct spi_device *)' [-Werror,-Wincompatible-function-pointer-types]
           .remove = panel_mipi_dbi_spi_remove,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +391 drivers/gpu/drm/tiny/panel-mipi-dbi.c

0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  381  
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  382  static struct spi_driver panel_mipi_dbi_spi_driver = {
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  383  	.driver = {
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  384  		.name = "panel-mipi-dbi-spi",
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  385  		.owner = THIS_MODULE,
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  386  		.of_match_table = panel_mipi_dbi_spi_of_match,
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  387  		.pm = &panel_mipi_dbi_pm_ops,
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  388  	},
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  389  	.id_table = panel_mipi_dbi_spi_id,
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  390  	.probe = panel_mipi_dbi_spi_probe,
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27 @391  	.remove = panel_mipi_dbi_spi_remove,
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  392  	.shutdown = panel_mipi_dbi_spi_shutdown,
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  393  };
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  394  module_spi_driver(panel_mipi_dbi_spi_driver);
0e65e2e6abb09d8 Noralf Trønnes 2022-02-27  395  

:::::: The code at line 391 was first introduced by commit
:::::: 0e65e2e6abb09d84a75c51999e3a6cf80f30c929 drm/tiny: Add MIPI DBI compatible SPI driver

:::::: TO: Noralf Trønnes <noralf@tronnes.org>
:::::: CC: Maxime Ripard <maxime@cerno.tech>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
