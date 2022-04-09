Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50DA52
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 21:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649541505; x=1681077505;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DT6Rn5Dr+TonOjeGcIxRORHIjbZaqRktqT5cck7dBpQ=;
  b=TGL3JTYvtUGtsQSTATdm/h+Nsxyb2mx7GIh+hWdjwUmTjrdcaOHjIAxT
   DPLPdH+ez7Dc/uWYOyBxSpvbqCGbSAhg9yUV0n8cXRgZDStiRIMGOcUxX
   3pR5W8TG9lnr+a2ShXGxtJ8W0f72ypJQST6Sbw9Kt2DgiSktzFF06Nj6t
   zG/wEj46gvUWjB2EXpZImSZ+X7QDokmjtLfUgsl50DZ5/tZnDY+JH2M4I
   EbjZD2xlXAv0HzEEoCMpOjI+sYzfDzViTV621igj/hUx2EAuN89JnLMGE
   /6zxvp7FaTGbPphI0R8a+RxEmExPO5AP1al8Vi9yUZAUA5xw5xwEHaAWG
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10312"; a="260761171"
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="260761171"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2022 14:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="643572291"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2022 14:58:23 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndJ67-0000Qj-7B;
	Sat, 09 Apr 2022 21:58:23 +0000
Date: Sun, 10 Apr 2022 05:58:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [hnaz-mm:master 175/188] ld.lld: error:
 arch/riscv/built-in.a(kernel/perf_regs.o):(function perf_reg_value:
 .text+0x58): relocation R_RISCV_HI20 out of range: 531169 is not in
 [-524288, 524287]; references perf_reg_value.__if_trace.6.1
Message-ID: <202204100540.6fgSEvWS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Jonathan Lassoff <jof@thejof.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Petr Mladek <pmladek@suse.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hnaz/linux-mm master
head:   71e0d841ccd1c91e7038d385825e26342e87d198
commit: 5d611fa3457866c49ee52a993eb44fa230f25cf1 [175/188] fatfs: add FAT messages to printk index
config: riscv-randconfig-r016-20220410 (https://download.01.org/0day-ci/archive/20220410/202204100540.6fgSEvWS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/hnaz/linux-mm/commit/5d611fa3457866c49ee52a993eb44fa230f25cf1
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout 5d611fa3457866c49ee52a993eb44fa230f25cf1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the hnaz-mm/master HEAD 71e0d841ccd1c91e7038d385825e26342e87d198 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/perf_regs.o):(function perf_reg_value: .text+0x58): relocation R_RISCV_HI20 out of range: 531169 is not in [-524288, 524287]; references perf_reg_value.__if_trace.6.1
   >>> referenced by perf_regs.c
   >>> defined in arch/riscv/built-in.a(kernel/perf_regs.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/perf_regs.o):(function perf_reg_value: .text+0x84): relocation R_RISCV_HI20 out of range: 530978 is not in [-524288, 524287]; references perf_reg_value.______f.8
   >>> referenced by perf_regs.c
   >>> defined in arch/riscv/built-in.a(kernel/perf_regs.o)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on HAS_IOMEM && DRM && MMU
   Selected by
   - DRM_SSD130X && HAS_IOMEM && DRM

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
