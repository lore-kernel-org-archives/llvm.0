Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9F7168
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642171151; x=1673707151;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xiK4FJ3vkfHVViVK2ZgdzT3voDbxRZ/4UfIlm6O2pyg=;
  b=McQz7srm343yQ4Q0bPUVzRaxhJMpif4sdIv2vNQhn9gRxxV5nl0/e8bG
   FqTVEBnS6Hp/g9u1Ygt+8gU7Bo7tDCxd+u1uUg2nrZJtMmMAefSvv3+23
   FLRKUk1ixf8UIWC3z7TtywpV5JuSvT/zZ/8yxYjtAjPCBZEo7qpMXbAoS
   8DLrnWCBk4y8JdToVWK2YqijHbOizHcNrVTIHt6D97Inmf7wq3G4r4RBZ
   A45Y0mBdIP/l8aFdGR12pa1uEQuePaMnVhdPEBWrNP5fBKhtD9FmoSq1b
   N2SbxyD1BImXaVOW1x1OubK0o0HGsM0HGCZeP01n2N+a8C+D3zTvfpNi3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244049970"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; 
   d="scan'208";a="244049970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 06:39:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; 
   d="scan'208";a="475796086"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Jan 2022 06:39:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8NjP-0008er-S2; Fri, 14 Jan 2022 14:39:07 +0000
Date: Fri, 14 Jan 2022 22:38:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 248/326] include/linux/mtd/cfi.h:62:2: warning:
 No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
Message-ID: <202201142208.iEdIk0Sc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx master
head:   6a698dbaaf0e6caa053476c2f661b36885a0ce30
commit: 9b62852ec04b7d48971ce8016b13c27403929908 [248/326] Merge tag 'v5.15' into master
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220114/202201142208.iEdIk0Sc-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9b62852ec04b7d48971ce8016b13c27403929908
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 9b62852ec04b7d48971ce8016b13c27403929908
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-zynqmp-gqspi.c:26:
   In file included from include/linux/mtd/spi-nor.h:10:
>> include/linux/mtd/cfi.h:62:2: warning: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-W#warnings]
   #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
    ^
   In file included from drivers/spi/spi-zynqmp-gqspi.c:13:
   include/linux/firmware/xlnx-zynqmp.h:1182:12: warning: unused function 'zynqmp_pm_sec_read_reg' [-Wunused-function]
   static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1187:12: warning: unused function 'zynqmp_pm_sec_mask_write_reg' [-Wunused-function]
   static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
              ^
   3 warnings generated.


vim +62 include/linux/mtd/cfi.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  60  
241651d04d672f David Woodhouse 2007-09-06  61  #ifndef cfi_interleave
241651d04d672f David Woodhouse 2007-09-06 @62  #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
241651d04d672f David Woodhouse 2007-09-06  63  static inline int cfi_interleave(void *cfi)
241651d04d672f David Woodhouse 2007-09-06  64  {
241651d04d672f David Woodhouse 2007-09-06  65  	BUG();
241651d04d672f David Woodhouse 2007-09-06  66  	return 0;
241651d04d672f David Woodhouse 2007-09-06  67  }
241651d04d672f David Woodhouse 2007-09-06  68  #endif
241651d04d672f David Woodhouse 2007-09-06  69  

:::::: The code at line 62 was first introduced by commit
:::::: 241651d04d672fb685b2874707016cbbf95931e5 [MTD] Fix CFI build error when no map width or interleave supported

:::::: TO: David Woodhouse <dwmw2@infradead.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
