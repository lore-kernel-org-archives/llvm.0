Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2236C
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 02:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652496251; x=1684032251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CecKbC9KT0mTel1/jpOCk/iWskQYfAj+/FF+BkysK9g=;
  b=UvAvgliLn+ZlKvvrHK84BxOodkkTbnId5usNH/7xhzzQJo0VafKZmfXk
   0SiYoX8IJw4maag5JJw/zeMjnWSwE+WczfiioG2OYK+YURGB9NFPmY/Jl
   /VhsV5kDetjpam0Gp4ZvpCT5fahajX66VlsOYvew2bMtZ2gjaOCwK4KfX
   yEi8eNHRpoHoFcq0QPCJ0VXGiRFNJCgvNG4QD5btQ6WFtWE1H8yHQaKUc
   6I1EV9uOp22RHo4gHv/RFtBuyvWqqWYqwR+FDD85Z69K8LybfuPI8Fv+w
   RipGb5khQEkwaltsFLsv2A5ZFgYjiNKz0hf08iFzgkM79szATQB2DqmdP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="250983271"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="250983271"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 19:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="659365132"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 May 2022 19:44:08 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nphlI-00003Z-8n;
	Sat, 14 May 2022 02:44:08 +0000
Date: Sat, 14 May 2022 10:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 404/1093] ld.lld:
 error: undefined symbol: dwc3_host_wakeup_register
Message-ID: <202205141053.QhyVchkb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: db6b55a74c709a27fdf6d175f890568dc8945424 [404/1093] usb: dwc3: Added remote wake-up in xilinx glue driver
config: arm64-randconfig-r031-20220512 (https://download.01.org/0day-ci/archive/20220514/202205141053.QhyVchkb-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_register
   >>> referenced by dwc3-xilinx.c
   >>>               usb/dwc3/dwc3-xilinx.o:(dwc3_xlnx_probe) in archive drivers/built-in.a
   >>> referenced by dwc3-xilinx.c
   >>>               usb/dwc3/dwc3-xilinx.o:(dwc3_xlnx_remove) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
