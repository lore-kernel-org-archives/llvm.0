Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAB2F4A
	for <llvm@lists.linux.dev>; Sat, 11 Jun 2022 23:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654991031; x=1686527031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RT0p+2hDhajSJ1kH9e9JAI65ma613oxiWt/W9xAaIwU=;
  b=UD3SObk8xc0FpFispo6oAIuSwjhgsfFmoIjRpVSVXvg/SZ1dWn4U5/aK
   BDMHgsVYTH3Doc7wFEJweGEkiOUS5aDwLe4tOw6DiQAAUJq5M5Y2yKosV
   0mYr7bs8rcG7STXKwziH4z9QZtUWeE0dzpGBM5gRx+XnJoYeSekyLK+DW
   jBAHGyaArPVWXbkESwuRdaWbu/VANyNGXDyrjZlv/PGBvMqVRhWmLLRPB
   /73D04/ZlcTvVuGiZQT2xeZ3upUvVYegwzGJDpWdfQ7s0gJHGPjarA8Nv
   SlD0y/ko7e9HkIIA2iaQjUbH885BM+bX1pIhhverNUCXs3xpEpC97J1a+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10375"; a="303348568"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="303348568"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 16:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="685305514"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jun 2022 16:43:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0Alg-000JQH-7W;
	Sat, 11 Jun 2022 23:43:48 +0000
Date: Sun, 12 Jun 2022 07:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: drivers/dma/dw/rzn1-dmamux.c:105:34: warning: unused variable
 'rzn1_dmac_match'
Message-ID: <202206120706.vHMLJjkz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miquel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0678afa6055d14799c1dc1eee47c8025eba56cab
commit: 134d9c52fca26d2d199516e915da00f0cc6adc73 dmaengine: dw: dmamux: Introduce RZN1 DMA router support
date:   3 weeks ago
config: hexagon-randconfig-r035-20220611 (https://download.01.org/0day-ci/archive/20220612/202206120706.vHMLJjkz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=134d9c52fca26d2d199516e915da00f0cc6adc73
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 134d9c52fca26d2d199516e915da00f0cc6adc73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma/dw/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/dw/rzn1-dmamux.c:105:34: warning: unused variable 'rzn1_dmac_match' [-Wunused-const-variable]
   static const struct of_device_id rzn1_dmac_match[] = {
                                    ^
   1 warning generated.


vim +/rzn1_dmac_match +105 drivers/dma/dw/rzn1-dmamux.c

   104	
 > 105	static const struct of_device_id rzn1_dmac_match[] = {
   106		{ .compatible = "renesas,rzn1-dma" },
   107		{}
   108	};
   109	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
