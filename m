Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB5B63BF;
	Tue, 24 Jan 2023 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674566341; x=1706102341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JOdCk0DiV45l316tFtpeTfnFpjQvJyYgP2HBIHZN350=;
  b=Vlw77vbLwZklTAj1ecwOxv29322dGIIfEnhuU/yih2DfJ63+VGJT/BL1
   tVq6Kg2lGiy7NV/KYt8SSHW/uS86nX8BW0YmBr7XNTsH+ACCv3zEDj44i
   lrZoCHwR4TfMa1oRDoxm5mW3r0qeBGke7x8OgTVw/kg8R9iJcRlvMhq6r
   kRZx2UeHDPyODaSOYPAY4PzFZFtLyOZ5/7IHBtS7I1P0xlapsqQLpCVnM
   aLDmxW+CTuINmjAbhCoJTMKfO2NHltQaO8NmoJ4WspA7AmS/EV0T/tuLE
   PA5NhjyfRLKW7Putc4h+pwHuRiOazT+UmCudvA3iHOQ438pSrASStYBsJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314191242"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="314191242"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 05:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725468695"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="725468695"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 05:18:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKJCS-0006VE-2H;
	Tue, 24 Jan 2023 13:18:56 +0000
Date: Tue, 24 Jan 2023 21:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hannes@cmpxchg.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	bfoster@redhat.com, willy@infradead.org, linux-api@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v7 2/3] cachestat: implement cachestat syscall
Message-ID: <202301242133.cLyYLZH6-lkp@intel.com>
References: <20230124021118.154078-3-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124021118.154078-3-nphamcs@gmail.com>

Hi Nhat,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1440f576022887004f719883acb094e7e0dd4944]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230124-101311
base:   1440f576022887004f719883acb094e7e0dd4944
patch link:    https://lore.kernel.org/r/20230124021118.154078-3-nphamcs%40gmail.com
patch subject: [PATCH v7 2/3] cachestat: implement cachestat syscall
config: mips-randconfig-r006-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242133.cLyYLZH6-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f902a360bb453bd6885cd89d4f9ad4a40205fd15
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230124-101311
        git checkout f902a360bb453bd6885cd89d4f9ad4a40205fd15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> <stdin>:1565:2: warning: syscall cachestat not implemented [-W#warnings]
   #warning syscall cachestat not implemented
    ^
   1 warning generated.
--
>> <stdin>:1565:2: warning: syscall cachestat not implemented [-W#warnings]
   #warning syscall cachestat not implemented
    ^
   1 warning generated.
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for function 'output_ptreg_defines' [-Wmissing-prototypes]
   void output_ptreg_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_ptreg_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for function 'output_task_defines' [-Wmissing-prototypes]
   void output_task_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_task_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for function 'output_thread_info_defines' [-Wmissing-prototypes]
   void output_thread_info_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_thread_info_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for function 'output_thread_defines' [-Wmissing-prototypes]
   void output_thread_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_thread_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for function 'output_mm_defines' [-Wmissing-prototypes]
   void output_mm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_mm_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:213:6: warning: no previous prototype for function 'output_sc_defines' [-Wmissing-prototypes]
   void output_sc_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:213:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_sc_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for function 'output_signal_defined' [-Wmissing-prototypes]
   void output_signal_defined(void)
        ^
   arch/mips/kernel/asm-offsets.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_signal_defined(void)
   ^
   static 
   7 warnings generated.
>> <stdin>:1565:2: warning: syscall cachestat not implemented [-W#warnings]
   #warning syscall cachestat not implemented
    ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
