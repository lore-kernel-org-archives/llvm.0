Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68967E
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653035135; x=1684571135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fn49An1DqjMYmUVjYZ6Ve0Mp1CxZbLOepEe7sDKTpN0=;
  b=GQDLSS5ZkZyNVwtwXFOGF1/jTrKg9Ej1JXynPgx6zaQ806sgUsVdu61E
   tv/BJIUXLL+mg5xv9PEgvwTzyn5x0MVuC7oPhfp0tWCa5SW8o6fDOgpwz
   qMkc6gCfSHj5PbvYCbvE0ezRemoEUAj0N7odrhdj/2SESVRbTpK7actCu
   XpkVPssqZESpEkG+JSUFQud6wy1/uAmUrJI7QCnLw+X4dMQ5HK5MLkHah
   8cIA9noQ9gFEePOc9cMvveo4Wwd0f0/yS785mcpqJPcAol0B6k0TiuNes
   oiYUbWfbYbZQWdh/zi60FYmCoSwvAyGAsJnBgPRIJ6yvplY0lecyRHKSD
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="335591070"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="335591070"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 01:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="674512507"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 May 2022 01:25:33 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrxwy-0004VZ-Nd;
	Fri, 20 May 2022 08:25:32 +0000
Date: Fri, 20 May 2022 16:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12308/12886] arch/x86/kvm/hyperv.c:1983:22:
 warning: shift count >= width of type
Message-ID: <202205201624.A4IhDdYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21498d01d045c5b95b93e0a0625ae965b4330ebe
commit: 81db71a60292e9a40ae8f6ef137b17f2aaa15a52 [12308/12886] KVM: x86: hyper-v: replace bitmap_weight() with hweight64()
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220520/202205201624.A4IhDdYX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=81db71a60292e9a40ae8f6ef137b17f2aaa15a52
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 81db71a60292e9a40ae8f6ef137b17f2aaa15a52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:10:9: note: expanded from macro '__const_hweight8'
            ((!!((w) & (1ULL << 0))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:11:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 1))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:12:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 2))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:13:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 3))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:14:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 4))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:15:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 5))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:16:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 6))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:17:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 7)))))
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:10:9: note: expanded from macro '__const_hweight8'
            ((!!((w) & (1ULL << 0))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:11:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 1))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:12:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 2))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:13:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 3))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:14:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 4))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:15:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 5))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:16:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 6))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:17:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 7)))))
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:10:9: note: expanded from macro '__const_hweight8'
            ((!!((w) & (1ULL << 0))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:11:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 1))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:12:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 2))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:13:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 3))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:14:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 4))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:15:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 5))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/bitops/const_hweight.h:16:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 6))) +     \
                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)


vim +1983 arch/x86/kvm/hyperv.c

  1934	
  1935	static u64 kvm_hv_send_ipi(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
  1936	{
  1937		struct kvm *kvm = vcpu->kvm;
  1938		struct hv_send_ipi_ex send_ipi_ex;
  1939		struct hv_send_ipi send_ipi;
  1940		DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
  1941		unsigned long valid_bank_mask;
  1942		u64 sparse_banks[KVM_HV_MAX_SPARSE_VCPU_SET_BITS];
  1943		u32 vector;
  1944		bool all_cpus;
  1945	
  1946		if (hc->code == HVCALL_SEND_IPI) {
  1947			if (!hc->fast) {
  1948				if (unlikely(kvm_read_guest(kvm, hc->ingpa, &send_ipi,
  1949							    sizeof(send_ipi))))
  1950					return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1951				sparse_banks[0] = send_ipi.cpu_mask;
  1952				vector = send_ipi.vector;
  1953			} else {
  1954				/* 'reserved' part of hv_send_ipi should be 0 */
  1955				if (unlikely(hc->ingpa >> 32 != 0))
  1956					return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1957				sparse_banks[0] = hc->outgpa;
  1958				vector = (u32)hc->ingpa;
  1959			}
  1960			all_cpus = false;
  1961			valid_bank_mask = BIT_ULL(0);
  1962	
  1963			trace_kvm_hv_send_ipi(vector, sparse_banks[0]);
  1964		} else {
  1965			if (!hc->fast) {
  1966				if (unlikely(kvm_read_guest(kvm, hc->ingpa, &send_ipi_ex,
  1967							    sizeof(send_ipi_ex))))
  1968					return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1969			} else {
  1970				send_ipi_ex.vector = (u32)hc->ingpa;
  1971				send_ipi_ex.vp_set.format = hc->outgpa;
  1972				send_ipi_ex.vp_set.valid_bank_mask = sse128_lo(hc->xmm[0]);
  1973			}
  1974	
  1975			trace_kvm_hv_send_ipi_ex(send_ipi_ex.vector,
  1976						 send_ipi_ex.vp_set.format,
  1977						 send_ipi_ex.vp_set.valid_bank_mask);
  1978	
  1979			vector = send_ipi_ex.vector;
  1980			valid_bank_mask = send_ipi_ex.vp_set.valid_bank_mask;
  1981			all_cpus = send_ipi_ex.vp_set.format == HV_GENERIC_SET_ALL;
  1982	
> 1983			if (hc->var_cnt != hweight64(valid_bank_mask))
  1984				return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1985	
  1986			if (all_cpus)
  1987				goto check_and_send_ipi;
  1988	
  1989			if (!hc->var_cnt)
  1990				goto ret_success;
  1991	
  1992			if (kvm_get_sparse_vp_set(kvm, hc, 1, sparse_banks,
  1993						  offsetof(struct hv_send_ipi_ex,
  1994							   vp_set.bank_contents)))
  1995				return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1996		}
  1997	
  1998	check_and_send_ipi:
  1999		if ((vector < HV_IPI_LOW_VECTOR) || (vector > HV_IPI_HIGH_VECTOR))
  2000			return HV_STATUS_INVALID_HYPERCALL_INPUT;
  2001	
  2002		if (all_cpus) {
  2003			kvm_send_ipi_to_many(kvm, vector, NULL);
  2004		} else {
  2005			sparse_set_to_vcpu_mask(kvm, sparse_banks, valid_bank_mask, vcpu_mask);
  2006	
  2007			kvm_send_ipi_to_many(kvm, vector, vcpu_mask);
  2008		}
  2009	
  2010	ret_success:
  2011		return HV_STATUS_SUCCESS;
  2012	}
  2013	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
