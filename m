Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE07E
	for <llvm@lists.linux.dev>; Sat,  4 Jun 2022 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654381256; x=1685917256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a04Jqyy3KA2M2YY6lFi2t7cv8KUnaK9UaPQkz3pAD90=;
  b=G8/w560zgq0IAlU2IESH+XOgMKpUVTNWWF1eLivCQfkgb9W/m9KzMv1U
   K8sk1Pobla00lJOqZmLjImMNWQOkPIz0gy+4uTEDfqfCgfUWHPYdRbF7c
   ENMJCQodHY7Tr5o01aF6d+yRd5ca79rd2G8C+9Ro315t99q2dxKYi5HnO
   t88Y3HO5Cb9W/cCvwTZ3k9+l/gIjIHLLFsboFjQc2q9qp7dnEoXRLhNw4
   aFuZzsYl2V6FyV7Rm+DHplgSSBOrqS6Q4kakP2RjYFI7J8IEZHVY5sFfN
   YsWxvMAYyfcRCtWTaO+LY45wY2FhUHee4bVryDpkiWMC+HCbyyZzSRWfG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10368"; a="258576515"
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="258576515"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 15:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="708519268"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jun 2022 15:20:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxc8b-000BFZ-QQ;
	Sat, 04 Jun 2022 22:20:53 +0000
Date: Sun, 5 Jun 2022 06:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] riscv: Add Zawrs support for spinlocks
Message-ID: <202206050633.lWua2j70-lkp@intel.com>
References: <20220602141032.169907-1-christoph.muellner@vrull.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602141032.169907-1-christoph.muellner@vrull.io>

Hi Christoph,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[cannot apply to v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Muellner/riscv-Add-Zawrs-support-for-spinlocks/20220602-221228
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d1dc87763f406d4e67caf16dbe438a5647692395
config: riscv-randconfig-c006-20220605 (https://download.01.org/0day-ci/archive/20220605/202206050633.lWua2j70-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b72c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8bacf50e3f136bfbce3e648e6f53443516125ba2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christoph-Muellner/riscv-Add-Zawrs-support-for-spinlocks/20220602-221228
        git checkout 8bacf50e3f136bfbce3e648e6f53443516125ba2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/bpf/ kernel/futex/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/helpers.c:291:3: error: indirection requires pointer operand ('int' invalid)
                   atomic_cond_read_relaxed(l, !VAL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:29:40: note: expanded from macro 'atomic_cond_read_relaxed'
   #define atomic_cond_read_relaxed(v, c) smp_cond_load_relaxed(&(v)->counter, (c))
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:144:10: note: expanded from macro 'smp_cond_load_relaxed'
                           VAL = __smp_load_reserved_relaxed(__PTR);       \
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:88:2: note: expanded from macro '__smp_load_reserved_relaxed'
           compiletime_assert_atomic_lrsc_type(*ptr);                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   1 error generated.
--
>> kernel/futex/requeue.c:182:9: error: indirection requires pointer operand ('int' invalid)
                   (void)atomic_cond_read_relaxed(&q->requeue_state, VAL != Q_REQUEUE_PI_WAIT);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:29:40: note: expanded from macro 'atomic_cond_read_relaxed'
   #define atomic_cond_read_relaxed(v, c) smp_cond_load_relaxed(&(v)->counter, (c))
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:144:10: note: expanded from macro 'smp_cond_load_relaxed'
                           VAL = __smp_load_reserved_relaxed(__PTR);       \
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:88:2: note: expanded from macro '__smp_load_reserved_relaxed'
           compiletime_assert_atomic_lrsc_type(*ptr);                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   1 error generated.


vim +291 kernel/bpf/helpers.c

d83525ca62cf8e Alexei Starovoitov 2019-01-31  284  
d83525ca62cf8e Alexei Starovoitov 2019-01-31  285  static inline void __bpf_spin_lock(struct bpf_spin_lock *lock)
d83525ca62cf8e Alexei Starovoitov 2019-01-31  286  {
d83525ca62cf8e Alexei Starovoitov 2019-01-31  287  	atomic_t *l = (void *)lock;
d83525ca62cf8e Alexei Starovoitov 2019-01-31  288  
d83525ca62cf8e Alexei Starovoitov 2019-01-31  289  	BUILD_BUG_ON(sizeof(*l) != sizeof(*lock));
d83525ca62cf8e Alexei Starovoitov 2019-01-31  290  	do {
d83525ca62cf8e Alexei Starovoitov 2019-01-31 @291  		atomic_cond_read_relaxed(l, !VAL);
d83525ca62cf8e Alexei Starovoitov 2019-01-31  292  	} while (atomic_xchg(l, 1));
d83525ca62cf8e Alexei Starovoitov 2019-01-31  293  }
d83525ca62cf8e Alexei Starovoitov 2019-01-31  294  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
