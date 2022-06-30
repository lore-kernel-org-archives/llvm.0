Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ACDA20
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 02:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656556465; x=1688092465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=firwam5aiEJ1CPQVgZ11sO3iHWyWRe6pjv9cXpUOmh8=;
  b=iGe9hnlN1tprOZESE2kyAws3KNWJ2krmhdXNhCTiLD0HWX6W06ahgti3
   7Y1hCbSN3Atkynde8/XafixqU6H+cW1Yz9eu8CkpOeNcqIgxxHQyFYmg4
   3qb2QmEwh2rg3wD7Fi6KfrlRfAjzK3MAskyaKl9BPvnBHNoiuCAltJI4q
   JAQeg+ppgQ2g+nvTyAQIffEqltw86pEgHTFBkJ0zxxXbEVZJST7Ndo3to
   eBZBtCFzjOxmzSoKHLrreBDe8BjXLEzKXSRjJ/hcO9uzolkVdbcVE9iaA
   3IfNWQXtrHBHmjvmRklwqibo1LnY3LN6ufCluOYPXK0OoLjN1UQQLIfV5
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="280985212"
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="280985212"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 19:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="595502129"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2022 19:34:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6k0c-000C62-QP;
	Thu, 30 Jun 2022 02:34:22 +0000
Date: Thu, 30 Jun 2022 10:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 93/1199] ld.lld: error: undefined
 symbol: dma_buf_attach
Message-ID: <202206301022.A7Ne7Mcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nava,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   8684044b601946fceda13df7e84a2a8c68309e00
commit: 895021fc75c22703678f683052e95247269caf44 [93/1199] fpga: support loading from a pre-allocated buffer
config: arm-randconfig-r023-20220629 (https://download.01.org/0day-ci/archive/20220630/202206301022.A7Ne7Mcj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/895021fc75c22703678f683052e95247269caf44
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 895021fc75c22703678f683052e95247269caf44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
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
