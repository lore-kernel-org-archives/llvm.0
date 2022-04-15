Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E133F4
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 22:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650063220; x=1681599220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFyW0/ZZDPgi0UTTVcHqFksjg80YxpQcFCjVLq9SG7o=;
  b=Izzfe7IY1FxXEz10/v/8VxtTfsJrLlGnBexZdvu6tIaB3UBf3205cWLy
   VME4bHIWyuXhRWx4UafUVwupEKXhWxV+dK4lFicS/F1Jx/3uuvjuPvJGM
   HHnPGwkg8rHROu3hefcpHRAVt0PGgYUmmOgdq3ASy0BWe0GTNbXKCn/Ow
   K8dxWQntGxvb08ovCM12vLK5DUj1Y6SY887GDWovgPRb/LmHRhAXExGPm
   6wVonsB1XgDKd9Vr7twYFdTiM6ao/Yssxp4r0Mz2rrBflb6GdJebKaZ/Q
   nXpVTbQBuDOHl5dAdF28CwfuVJV69YRZeU3L4AZ2Se++/iaQ2cEEJ7nXi
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="323684227"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="323684227"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 15:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="509097329"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Apr 2022 15:53:37 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfUor-0002VH-27;
	Fri, 15 Apr 2022 22:53:37 +0000
Date: Sat, 16 Apr 2022 06:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 93/1093] ld.lld: error: undefined
 symbol: dma_buf_attach
Message-ID: <202204160622.G1L7lg8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Nava,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   b1635a7683e2274f21d795783e4c9db7e518267a
commit: 895021fc75c22703678f683052e95247269caf44 [93/1093] fpga: support loading from a pre-allocated buffer
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20220416/202204160622.G1L7lg8J-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8e43cbab33765c476337571e5ed11b005199dd0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/895021fc75c22703678f683052e95247269caf44
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 895021fc75c22703678f683052e95247269caf44
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_buf_attach
   >>> referenced by fpga-mgr.c
   >>> fpga/fpga-mgr.o:(fpga_mgr_load) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: dma_buf_map_attachment
   >>> referenced by fpga-mgr.c
   >>> fpga/fpga-mgr.o:(fpga_mgr_load) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: dma_buf_unmap_attachment
   >>> referenced by fpga-mgr.c
   >>> fpga/fpga-mgr.o:(fpga_mgr_load) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: dma_buf_detach
   >>> referenced by fpga-mgr.c
   >>> fpga/fpga-mgr.o:(fpga_mgr_load) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: dma_buf_put
   >>> referenced by fpga-mgr.c
   >>> fpga/fpga-mgr.o:(fpga_mgr_load) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: dma_buf_get
   >>> referenced by fpga-mgr.c
   >>> fpga/fpga-mgr.o:(fpga_device_ioctl) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
