Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815E179
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646142190; x=1677678190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xQXC5Q6QovMBIcAZOvRgYjMGiuNQt1UM+vNXcUeEu7E=;
  b=GKrxdx00IfzxSL2X8XCljfQfTCTP4xQeepJ3rHgVQuU/M23UOv9D9Rn4
   QHeeDLwMN4uRnsn2eiNqjwYbNHg9KQemsNhZkUE3C63D/DvTuc2J55yM4
   Znx/0bI8C1iOq0Lhkqc68BQcmMWv+BV5I0KDjvTHnkBUV/6JTeXw4xvs3
   Fg7v1+KHLu+X1MTn5kCXY0k6yx4TfmxTUAF3Au1RKQ5LTrgV9SOIol25j
   Qj6izJpIKg008lzUaFBDAsTM/BgLEGNMMnvw2PJxWqLXl//Lix20G2kmE
   DGStdqp88Sugw9GB0/kljVyUEx641WZmRWEJJSmMySvbP8X3x91hUFZ7+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="233101842"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="233101842"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 05:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="507804617"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2022 05:43:08 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nP2mR-0000Vr-K8; Tue, 01 Mar 2022 13:43:07 +0000
Date: Tue, 1 Mar 2022 21:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [matthias-bgg:v5.17-next/soc 11/14]
 drivers/soc/mediatek/mtk-mmsys.c:64:3: error: field designator
 'sw0_rst_offset' does not refer to any field in type 'const struct
 mtk_mmsys_driver_data'
Message-ID: <202203012101.qgsgTBcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v5.17-next/soc
head:   eb1b02bef52ae545d5eb24116d5c099f738d39d5
commit: 831785f0e5b919c29e1bc5f9a74e9ebd38289e24 [11/14] soc: mediatek: mmsys: add mmsys reset control for MT8186
config: mips-randconfig-r004-20220301 (https://download.01.org/0day-ci/archive/20220301/202203012101.qgsgTBcz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?id=831785f0e5b919c29e1bc5f9a74e9ebd38289e24
        git remote add matthias-bgg https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
        git fetch --no-tags matthias-bgg v5.17-next/soc
        git checkout 831785f0e5b919c29e1bc5f9a74e9ebd38289e24
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/soc/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-mmsys.c:64:3: error: field designator 'sw0_rst_offset' does not refer to any field in type 'const struct mtk_mmsys_driver_data'
           .sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
            ^
   1 error generated.


vim +64 drivers/soc/mediatek/mtk-mmsys.c

    59	
    60	static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
    61		.clk_driver = "clk-mt8186-mm",
    62		.routes = mmsys_mt8186_routing_table,
    63		.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
  > 64		.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
    65	};
    66	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
