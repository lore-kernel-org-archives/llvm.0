Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B561323B3;
	Fri, 31 Mar 2023 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680250772; x=1711786772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sTyPK2aPx9EAAE/rKaVZQ1hVq+o8RHIyOfvHP84mnUo=;
  b=m3Gru7ckFvgcMAT8EjT2poxbFgjJFtEZpMCzoIN9E38FNX7c6+QWOsRE
   qZp36v9lD8i29t+wa/CqT9jsr4VA8gA1G9vV7vEtdGCsq6ESypd+CFBQX
   kKAzFwVzgELMmp3AHFf81J5GC6Ft9TSpOmeyxTzXFjiYWoT0y3nHKCuiY
   GD7ESknuALRunHm4kN6egoAwpZ1glM3s579Fg1Uae8e66KLogwktHIkHO
   6ZmbtMV8YHj/lEkLNz9zqRDaInDeP2eDGXs/V34C8hQ3HXXvVJ2kcJq1L
   zi7m177pVNAUnPB9QWVERcs17VnUpR91Ls+A+7W2fABjAtqlpF3DZQaRm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="404110030"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="404110030"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 01:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="749547685"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="749547685"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2023 01:19:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi9yr-000LcA-02;
	Fri, 31 Mar 2023 08:19:29 +0000
Date: Fri, 31 Mar 2023 16:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Dai <davidai@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/6] sched/fair: Add util_guest for tasks
Message-ID: <202303311649.lIfqlXGx-lkp@intel.com>
References: <20230331014356.1033759-2-davidai@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331014356.1033759-2-davidai@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kvm/queue]
[also build test ERROR on kvmarm/next tip/sched/core linus/master v6.3-rc4 next-20230331]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Dai/sched-fair-Add-util_guest-for-tasks/20230331-094936
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230331014356.1033759-2-davidai%40google.com
patch subject: [RFC PATCH v2 1/6] sched/fair: Add util_guest for tasks
config: riscv-randconfig-r014-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311649.lIfqlXGx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/80e880c6cbaadfdac1b7da1672f571d1d7331166
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Dai/sched-fair-Add-util_guest-for-tasks/20230331-094936
        git checkout 80e880c6cbaadfdac1b7da1672f571d1d7331166
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311649.lIfqlXGx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:2034:8: error: no member named 'avg' in 'struct sched_entity'
           p->se.avg.util_guest = attr->sched_util_min;
           ~~~~~ ^
   1 error generated.
--
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:364:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                   ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:364:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                                ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:365:10: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                   ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:365:38: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                               ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                                         ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:353:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:360:15: note: expanded from macro '__unqual_scalar_typeof'
                            default: (x)))
                                      ^
>> kernel/sched/fair.c:6217:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
>> kernel/sched/fair.c:6217:2: error: statement requires expression of scalar type ('void' invalid)
           if (READ_ONCE(p->se.avg.util_guest))
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   9 errors generated.


vim +2034 kernel/sched/core.c

  2030	
  2031		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  2032			return;
  2033	
> 2034		p->se.avg.util_guest = attr->sched_util_min;
  2035	}
  2036	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
