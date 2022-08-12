Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413936C
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 01:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660266258; x=1691802258;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9Wjh13aRsKaFZc80S2ieNBoHJsM5YoXKeRcpgZ9cxUA=;
  b=MGburpfS3YdLQHE1JshAHf3uWFcORkS5VyUT0jGTeUI0AhBccwkcK/Il
   l/dJlxkZWM5rtVlo6jB66c4DxGWiiSfhVBaCg+sf3SilL4VQ2zCauRcQv
   wFncAfB+fcJOJ/yFJmcyjj4KneYtlv4oKZb7vMZwQB3aoiMpzG3w6sl0x
   YQRfu4XE8p/2HEY1dft04ZTbmnq2niN78bnaGJHzbge2P6GHRlHa8W2Ie
   42Jmb5guKIM4QPQQp1Hi3+bLwI6ur4PVAzloY40kR8lKD3sHBJDPoCJ7h
   DhtRd+zRiaKneERCkjNoBfDrrYCivzIsMjb1Vhm1YNvfD8Q/I6UMuc7mh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="353237383"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="353237383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 18:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="748029062"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2022 18:04:16 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMJ60-0000u1-09;
	Fri, 12 Aug 2022 01:04:16 +0000
Date: Fri, 12 Aug 2022 09:04:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:review-hans 116/124] ld.lld: error:
 arch/riscv/built-in.a(kernel/sys_riscv.o):(function __se_sys_mmap:
 .text+0x60): relocation R_RISCV_HI20 out of range: 534389 is not in
 [-524288, 524287]; references riscv_sys_mmap.______f
Message-ID: <202208120846.jLpPIBjX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: linux-kernel@vger.kernel.org
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   0059c13eb43750ec454e048c2cbf757e793c667f
commit: c59bb4c73c57f4a90b227490c5e1f07d4a4fec95 [116/124] platform/x86/amd/pmf: Get performance metrics from PMFW
config: riscv-randconfig-r024-20220811 (https://download.01.org/0day-ci/archive/20220812/202208120846.jLpPIBjX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=c59bb4c73c57f4a90b227490c5e1f07d4a4fec95
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout c59bb4c73c57f4a90b227490c5e1f07d4a4fec95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/sys_riscv.o):(function __se_sys_mmap: .text+0x60): relocation R_RISCV_HI20 out of range: 534389 is not in [-524288, 524287]; references riscv_sys_mmap.______f
   >>> referenced by sys_riscv.c:30 (arch/riscv/kernel/sys_riscv.c:30)
   >>> defined in arch/riscv/built-in.a(kernel/sys_riscv.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/sys_riscv.o):(function __se_sys_mmap: .text+0xc8): relocation R_RISCV_HI20 out of range: 534389 is not in [-524288, 524287]; references riscv_sys_mmap.______f.2
   >>> referenced by sys_riscv.c:18 (arch/riscv/kernel/sys_riscv.c:18)
   >>> defined in arch/riscv/built-in.a(kernel/sys_riscv.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/sys_riscv.o):(function __se_sys_riscv_flush_icache: .text+0x17c): relocation R_RISCV_HI20 out of range: 534389 is not in [-524288, 524287]; references __do_sys_riscv_flush_icache.______f
   >>> referenced by sys_riscv.c:18 (arch/riscv/kernel/sys_riscv.c:18)
   >>> defined in arch/riscv/built-in.a(kernel/sys_riscv.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
