Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14B4372
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 09:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646730568; x=1678266568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gAh58GZx1hR/2ylbcvnEySyFmI7RTda6XlOZnDxet6A=;
  b=AIWbzaxWqnkXZetkFTOnnRSBOlwOfPWFv+/xhOZFRvJjsVewt9DfgHAe
   32APQr8c5qUDM8W3t1Jut+l1s3UZxCwETDs+r0OnzDOnpSGsv+Ueh9UFc
   BepOe+okYiXtWqNleylLZHOuQE1zyzAor8k2ujMmW4Zd9WIGkXnSHIkuV
   vGOB5Ts/+ap2r59E5fULOWOFedbwCS2/RL3D+hdq4D58/wo2t8kx2jgnz
   WLo7pbwvvO+vYc8cd1KGouiK2nxtBPZIyAE+oLEMok1O6WNEeC9fkDMHz
   dn7tfG5X3sXTDWv8sgSPIf8Y2EjoNlHdJr0mgV/xrMNkNCdsP7vdWCLCL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234589653"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="234589653"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 01:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="513035332"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Mar 2022 01:09:17 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRVqH-0001BL-16; Tue, 08 Mar 2022 09:09:17 +0000
Date: Tue, 8 Mar 2022 17:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [ammarfaizi2-block:palmer/linux/riscv-d1 8/12]
 arch/riscv/kernel/cpufeature.c:185:6: warning: variable 'cpu_apply_feature'
 set but not used
Message-ID: <202203081742.97KWCv3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/riscv-d1
head:   b3cda759adb0111b5b3efd3a0b986864b647a94a
commit: 012cee7ecac542dd3206bee731da0868353eef21 [8/12] riscv: add cpufeature handling via alternatives
config: riscv-randconfig-r005-20220308 (https://download.01.org/0day-ci/archive/20220308/202203081742.97KWCv3h-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/012cee7ecac542dd3206bee731da0868353eef21
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/riscv-d1
        git checkout 012cee7ecac542dd3206bee731da0868353eef21
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:185:6: warning: variable 'cpu_apply_feature' set but not used [-Wunused-but-set-variable]
           u32 cpu_apply_feature = 0;
               ^
   1 warning generated.


vim +/cpu_apply_feature +185 arch/riscv/kernel/cpufeature.c

   180	
   181	void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
   182					 unsigned int stage)
   183	{
   184		u32 cpu_req_feature = cpufeature_probe(stage);
 > 185		u32 cpu_apply_feature = 0;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
