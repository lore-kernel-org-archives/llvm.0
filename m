Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D92C9D
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643331947; x=1674867947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDT/nMKUBh1WdeIy4UyOfFH/m+wz3ykbjI6v0HGp+I0=;
  b=oFRB1qhqi6RsVLYww+g1+CCYYwRpTZwfb56XNMImiavf9W6PZiigxL47
   J0jCosx0UIJhkCz0UJFwRTIqrkYr007yGvTZxbPv4IPo0khyHZgI1xnrF
   CWNvwmRco1aaALrlf96j1XXEvRNmxrhfLv+gUQPShwdfh1QW1vUpCd9Yr
   xpgRL6v2Yvysne9WIksCuH8QFkI4/rAUxFkUpk7lH/bgz3KpuuodeqgpQ
   lhN9ihKV5NshGemhRwcDKAcmugp9DVmSVdaHVkkYD8jJ6+VnH9yIbnamV
   Cf3bKa7yMv/ptv9K2ztVkI3lGjynENzE0/t2zA4WVzkme3eL6ySY+XECo
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245851303"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="245851303"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 17:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="564008468"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jan 2022 17:05:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDFhw-000NFK-Sb; Fri, 28 Jan 2022 01:05:44 +0000
Date: Fri, 28 Jan 2022 09:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 9980/9999] kernel/cfi.c:334:6: warning: no previous prototype for function
 '__cfi_slowpath'
Message-ID: <202201280858.mQTzGZcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   7edc8bc69d7def26c4528360c9ec96dbeadcd0a1
commit: e48efff5cb5fd63a687465347bdbb52ef98dad44 [9980/9999] ANDROID: arch/Kconfig: fix up LTO LLVM_IAS depdency
config: arm64-buildonly-randconfig-r006-20220127 (https://download.01.org/0day-ci/archive/20220128/202201280858.mQTzGZcJ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dccb9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/e48efff5cb5fd63a687465347bdbb52ef98dad44
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout e48efff5cb5fd63a687465347bdbb52ef98dad44
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/cfi.c:334:6: warning: no previous prototype for function '__cfi_slowpath' [-Wmissing-prototypes]
   void cfi_slowpath_handler(uint64_t id, void *ptr, void *diag)
        ^
   kernel/cfi.c:25:30: note: expanded from macro 'cfi_slowpath_handler'
   #define cfi_slowpath_handler    __cfi_slowpath
                                   ^
   kernel/cfi.c:334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cfi_slowpath_handler(uint64_t id, void *ptr, void *diag)
   ^
   static 
   kernel/cfi.c:343:6: warning: no previous prototype for function '__ubsan_handle_cfi_check_fail_abort' [-Wmissing-prototypes]
   void cfi_failure_handler(void *data, void *ptr, void *vtable)
        ^
   kernel/cfi.c:24:29: note: expanded from macro 'cfi_failure_handler'
   #define cfi_failure_handler     __ubsan_handle_cfi_check_fail_abort
                                   ^
   kernel/cfi.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cfi_failure_handler(void *data, void *ptr, void *vtable)
   ^
   static 
>> kernel/cfi.c:349:6: warning: no previous prototype for function '__cfi_check_fail' [-Wmissing-prototypes]
   void __cfi_check_fail(void *data, void *ptr)
        ^
   kernel/cfi.c:349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __cfi_check_fail(void *data, void *ptr)
   ^
   static 
   3 warnings generated.


vim +/__cfi_slowpath +334 kernel/cfi.c

2c351bb70ac5e5 Sami Tolvanen 2019-04-25  333  
2c351bb70ac5e5 Sami Tolvanen 2019-04-25 @334  void cfi_slowpath_handler(uint64_t id, void *ptr, void *diag)
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  335  {
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  336  	handle_cfi_failure(ptr); /* No modules */
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  337  }
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  338  
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  339  #endif /* CONFIG_MODULES */
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  340  
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  341  EXPORT_SYMBOL(cfi_slowpath_handler);
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  342  
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  343  void cfi_failure_handler(void *data, void *ptr, void *vtable)
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  344  {
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  345  	handle_cfi_failure(ptr);
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  346  }
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  347  EXPORT_SYMBOL(cfi_failure_handler);
2c351bb70ac5e5 Sami Tolvanen 2019-04-25  348  
2c351bb70ac5e5 Sami Tolvanen 2019-04-25 @349  void __cfi_check_fail(void *data, void *ptr)

:::::: The code at line 334 was first introduced by commit
:::::: 2c351bb70ac5e5212f247a495199042a95b43e38 ANDROID: add support for Clang's Control Flow Integrity (CFI)

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Alistair Delva <adelva@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
