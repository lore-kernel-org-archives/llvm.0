Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89E3D6E
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 19:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655755079; x=1687291079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZfYn+aWsfiJ7ahDwnRVWivlOmNHjzzAzXpYC7fuiG8k=;
  b=RTD/RQ0FiRTtk5x4LPJo84ysa91Z1jIyWGEDZt8DU/da9YkvmODI9IsH
   ULGPdCroqZudIlFUVzV2BDI/JKNvk5c5vycroutk3Q+H/DCFuDFbtfa/A
   WkzrNC/B9HOtcjW7fZNYjYG3qg5liDgjREF39MuQGDQtGxYge5595e2Rj
   9QKK1FkIo/054bkxjcNFF8rbQyK2hGSrzz8zUc7qkT0sPucMTzq5GFby2
   dI3Jq8jxbuFFaI9kWs9HlqGdjFdp+BJinrbeozybRgMqxtStPaisyMROd
   DKTokFziEaND8SCdKtC3DaEjtRFBH5Azyj+VMZZtWKUCR5JU/8HxJrmgg
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="341650194"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="341650194"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 12:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="620214268"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2022 12:57:55 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3NX0-000Vn9-M7;
	Mon, 20 Jun 2022 19:57:54 +0000
Date: Tue, 21 Jun 2022 03:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org, palmer@rivosinc.com, arnd@arndb.de,
	peterz@infradead.org, longman@redhat.com, boqun.feng@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5] riscv: Add qspinlock support
Message-ID: <202206210303.Vjl4rpPv-lkp@intel.com>
References: <20220620155404.1968739-1-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620155404.1968739-1-guoren@kernel.org>

Hi,

I love your patch! Yet something to improve:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v5.19-rc2 next-20220617]
[cannot apply to tip/locking/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-qspinlock-support/20220620-235653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20220621/202206210303.Vjl4rpPv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/326f4a13941845b6ef1c4f4eaba049fe265f52bf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-qspinlock-support/20220620-235653
        git checkout 326f4a13941845b6ef1c4f4eaba049fe265f52bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:62:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:13:
   In file included from include/linux/atomic.h:7:
>> arch/riscv/include/asm/atomic.h:299:1: error: expected expression
   ATOMIC_OPS()
   ^
   arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
           ATOMIC_OP(int,   , 4)
           ^
   arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
           return __xchg_relaxed(&(v->counter), n, size);                  \
                  ^
   arch/riscv/include/asm/cmpxchg.h:21:3: note: expanded from macro '__xchg_relaxed'
                   u32 temp;                                               \
                   ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:62:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:13:
   In file included from include/linux/atomic.h:7:
>> arch/riscv/include/asm/atomic.h:299:1: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
   arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
           ATOMIC_OP(int,   , 4)
           ^
   arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
           return __xchg_relaxed(&(v->counter), n, size);                  \
                  ^
   arch/riscv/include/asm/cmpxchg.h:31:28: note: expanded from macro '__xchg_relaxed'
                           : "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)    \
                                                   ^
   include/linux/string.h:159:12: note: 'bcmp' declared here
   extern int bcmp(const void *,const void *,__kernel_size_t);
              ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:62:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:13:
   In file included from include/linux/atomic.h:7:
>> arch/riscv/include/asm/atomic.h:299:1: error: invalid lvalue in asm output
   ATOMIC_OPS()
   ^~~~~~~~~~~~
   arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
           ATOMIC_OP(int,   , 4)
           ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
           return __xchg_relaxed(&(v->counter), n, size);                  \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:31:28: note: expanded from macro '__xchg_relaxed'
                           : "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)    \
                                                   ^~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:62:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:13:
   In file included from include/linux/atomic.h:7:
>> arch/riscv/include/asm/atomic.h:299:1: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
   arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
           ATOMIC_OP(int,   , 4)
           ^
   arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
           return __xchg_relaxed(&(v->counter), n, size);                  \
                  ^
   arch/riscv/include/asm/cmpxchg.h:22:7: note: expanded from macro '__xchg_relaxed'
                   u32 shif = ((ulong)__ptr & 2) ? 16 : 0;                 \
                       ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:700:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~


vim +299 arch/riscv/include/asm/atomic.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  298  
5ce6c1f3535fa8 Andrea Parri   2018-03-09 @299  ATOMIC_OPS()
fab957c11efe2f Palmer Dabbelt 2017-07-10  300  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
