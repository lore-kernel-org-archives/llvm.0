Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6CC2C9E
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639577706; x=1671113706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mXadMJ3tQn4OVJug2MpN2ZRQ2ZVutALlMQqE74ru3Mo=;
  b=ZgFYkI6YTt+sXvYPzodKJZeMoXWK016EyHNQg3I/7vm9yY3Ib52oNoVt
   1tInwwKtAYr7Ly69DrdDI9LdBrRnvvaW1IoQxm5V/XThFTdrI8D8GX3kE
   pPudrZ8/6ikojki27h4bB3zIaU67HljvwcIaKrEZVy0BEF5itGPtRT22A
   kldVjCosrO7tocHE8QdmdsPNKwGObNq+g043NVRDu679Th17PRYYyNTBo
   3mKe+ixWqfzrD9SDxktj1AOzN72AVqezrGF3KY4ttAmu8kJ0VhiHAY6A/
   LduaSWG7/5SSkkeGLf5h6D4ykWu7/H4jDwy3U4Ju+g7EIjeoAsxuqHd/n
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="236770690"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="236770690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 06:15:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="682509817"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2021 06:15:03 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxV3e-0001rz-Hp; Wed, 15 Dec 2021 14:15:02 +0000
Date: Wed, 15 Dec 2021 22:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 1449/1981]
 drivers/i2c/busses/i2c-xiic.c:1134:39: warning: unused variable 'xiic_2_00'
Message-ID: <202112152213.IDAtG7U6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: 7dec447a8d4279154a4f2342c5b453f2fa9e9671 [1449/1981] i2c: xiic: Switch to Xiic standard mode for i2c-read
config: x86_64-randconfig-r021-20211214 (https://download.01.org/0day-ci/archive/20211215/202112152213.IDAtG7U6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/7dec447a8d4279154a4f2342c5b453f2fa9e9671
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.10
        git checkout 7dec447a8d4279154a4f2342c5b453f2fa9e9671
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/i2c/busses/ drivers/infiniband/hw/hfi1/ kernel/gcov/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-xiic.c:1134:39: warning: unused variable 'xiic_2_00' [-Wunused-const-variable]
   static const struct xiic_version_data xiic_2_00 = {
                                         ^
   1 warning generated.


vim +/xiic_2_00 +1134 drivers/i2c/busses/i2c-xiic.c

  1133	
> 1134	static const struct xiic_version_data xiic_2_00 = {
  1135		.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
  1136	};
  1137	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
