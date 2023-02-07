Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC71BD0F;
	Tue,  7 Feb 2023 03:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675740452; x=1707276452;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JEKCFnLgvSAN9iV9DoSXCNUV/dPTWdUZqEnDNGRNB9Q=;
  b=cmYaJerFIPqQ8zUC5rwYhya0Y5tLmEvIlHGmejxNIDv7IRmwk6TVAWRi
   fAT7Lx9F0z8g5grRv71uHyRdKdPhuHugUtkD02AMw6/5qntb9AiPoumRJ
   SumYeoAXwNAg1bUhRpTPFdnPI9oYxCP3RAE8DR+DOxTvgiDt7lqxzNbsz
   MtAIawAi64optWLerrajqGccrplfI7R/Xa0n+1C1LENgNM1iq+QSuXncm
   8IcOudMEs9RvyJu1nITakKJM18Bx+S2TIvI6bPdqug3Uf1EqBgq0z9nfL
   eQXaWwgUaYeG3dg3hDQ/lNosFAfTACQOcdNqpIymIYITXfMQX07TTpMlY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356758228"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="356758228"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 19:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="697100176"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="697100176"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Feb 2023 19:27:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPEdl-00030Q-2j;
	Tue, 07 Feb 2023 03:27:29 +0000
Date: Tue, 7 Feb 2023 11:26:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 98/110] ld.lld: error: vmlinux.a(fs/xfs/xfs_filestream.o):(function
 xfs_filestream_lookup_ag: .text+0x21c): relocation R_RISCV_HI20 out of
 range: 534791 is not in [-524288, 524287]; references .L.str.3
Message-ID: <202302071109.EpPGhZwK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   22dbb33daf6ec003524bc455253a81ccf7043849
commit: 5ff134dc19f1ab5f93b334b24978c1246019ccd0 [98/110] ASoC: dt-bindings: Drop broken irondevice,sma1303 binding
config: riscv-randconfig-r003-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071109.EpPGhZwK-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/krzk/linux/commit/5ff134dc19f1ab5f93b334b24978c1246019ccd0
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout 5ff134dc19f1ab5f93b334b24978c1246019ccd0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/xfs/xfs_filestream.o):(function xfs_filestream_lookup_ag: .text+0x21c): relocation R_RISCV_HI20 out of range: 534791 is not in [-524288, 524287]; references .L.str.3
   >>> referenced by xfs_filestream.c:0 (fs/xfs/xfs_filestream.c:0)
   >>> defined in vmlinux.a(fs/xfs/xfs_filestream.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_filestream.o):(function xfs_filestream_lookup_ag: .text+0x23a): relocation R_RISCV_HI20 out of range: 534681 is not in [-524288, 524287]; references .L.str
   >>> referenced by xfs_filestream.c:0 (fs/xfs/xfs_filestream.c:0)
   >>> defined in vmlinux.a(fs/xfs/xfs_filestream.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_filestream.o):(function xfs_filestream_pick_ag: .text+0x3b6): relocation R_RISCV_HI20 out of range: 535501 is not in [-524288, 524287]; references __sancov_gen_cov_switch_values
   >>> referenced by xfs_filestream.c:283 (fs/xfs/xfs_filestream.c:283)
   >>> defined in vmlinux.a(fs/xfs/xfs_filestream.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_filestream.o):(function xfs_filestream_lookup_ag: .text+0xbc): relocation R_RISCV_HI20 out of range: 536723 is not in [-524288, 524287]; references __tracepoint_xfs_filestream_lookup
   >>> referenced by xfs_filestream.c:49 (fs/xfs/xfs_filestream.c:49)
   >>> defined in vmlinux.a(fs/xfs/xfs_trace.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_filestream.o):(function xfs_filestream_lookup_ag: .text+0x156): relocation R_RISCV_HI20 out of range: 535501 is not in [-524288, 524287]; references xfs_params
   >>> referenced by xfs_filestream.c:274 (fs/xfs/xfs_filestream.c:274)
   >>> defined in vmlinux.a(fs/xfs/xfs_globals.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_filestream.o):(function xfs_filestream_lookup_ag: .text+0x1e8): relocation R_RISCV_HI20 out of range: 536715 is not in [-524288, 524287]; references trace_xfs_filestream_lookup.__warned
   >>> referenced by xfs_filestream.c:275 (fs/xfs/xfs_filestream.c:275)
   >>> defined in vmlinux.a(fs/xfs/xfs_filestream.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
