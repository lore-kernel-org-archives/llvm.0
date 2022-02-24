Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47616749D
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645729834; x=1677265834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OFXhX5BHPoiyCzftDXmBe7qGYMY+MXINhMiZIOvCd2k=;
  b=KuTF/dY4wMG4GUFKVpM/CnLSmVuoMb7a7u6oPLfSUiEvUK+w0MzIYFSl
   fdEzdL4x4y/7ZrdS287yj+FH3g1ZFkJWFd0BQMZiicBht9YsxoZjsEJsX
   bPLCYW2LCWCEuDnHebLUyBV5ziUVEVQTSgDMIswEgMR/4TuudncRBjmxO
   W/VxSShniWb1eSKyibPzAF6nrmyuvopUOtPjM3Yg/CqvvgF7JHEwjaFQC
   bRqkOXRC0hbe80Rm6eIDkPDn3i97gx4BjcQTRCVFG2eeljQfCIibev56B
   12Yv0YfL8eq4TnfNoFx065CqyHMW6f/ZLbkvHKfX8Ry1R8v4JfRjzgrn/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="232951374"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="232951374"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 11:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="684388990"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2022 11:10:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNJVX-0003Ob-ME; Thu, 24 Feb 2022 19:10:31 +0000
Date: Fri, 25 Feb 2022 03:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [csky-linux:riscv_compat_v6 17/20] arch/riscv/kernel/vdso.c:221:15:
 error: use of undeclared identifier 'compat_vdso_info'
Message-ID: <202202250133.pL6WVC3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/c-sky/csky-linux riscv_compat_v6
head:   4aafa1859382d5a159bdafe2956453feafd38845
commit: 77ed3d205a86f67815d8d074ff26e73ac1905772 [17/20] riscv: compat: vdso: Add setup additional pages implementation
config: riscv-buildonly-randconfig-r003-20220223 (https://download.01.org/0day-ci/archive/20220225/202202250133.pL6WVC3v-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/c-sky/csky-linux/commit/77ed3d205a86f67815d8d074ff26e73ac1905772
        git remote add csky-linux https://github.com/c-sky/csky-linux
        git fetch --no-tags csky-linux riscv_compat_v6
        git checkout 77ed3d205a86f67815d8d074ff26e73ac1905772
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso.c:221:15: error: use of undeclared identifier 'compat_vdso_info'
           __vdso_init(&compat_vdso_info);
                        ^
   1 error generated.


vim +/compat_vdso_info +221 arch/riscv/kernel/vdso.c

   217	
   218	static int __init vdso_init(void)
   219	{
   220		__vdso_init(&vdso_info);
 > 221		__vdso_init(&compat_vdso_info);
   222	
   223		return 0;
   224	}
   225	arch_initcall(vdso_init);
   226	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
