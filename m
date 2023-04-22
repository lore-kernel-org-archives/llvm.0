Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C29A7F;
	Sat, 22 Apr 2023 07:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682148821; x=1713684821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjnGsAE5xOMEFblBB5sn4CsjqXUSCpTeNGJ60HeZERg=;
  b=VEbI0LkqEVFRA+YnaYTOryvke5QXuI+zwZETv7rX+lrD2HMdl1hqIbOp
   fjMltmOujQPcHemOW39KdK+0SgThTndDd50PQH/zAL9IKtksHcRehRFmZ
   Y5Sv1DVjQVH7gdjdpAtYgaXDwKoWUGjKxATS8Enjg9DF29qD/QUxa0dzB
   YXZwZzLE205xnLTHLP2mPgZU/4dVdFHLejcv+Qhrxm2+aM0tzcA+mgjYx
   9/STtgpGzmJuKzFawVIjHueyNRmQxe/H5uw3KszhNrobCwIGwzKwffMls
   u1xlAz9N9o+FQcqoD3PPl34t6K6KtU0CJjCucvzjk4HnjP//ofQGh6jHU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409075357"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409075357"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 00:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="692488458"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="692488458"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Apr 2023 00:33:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq7kY-000hAQ-0n;
	Sat, 22 Apr 2023 07:33:38 +0000
Date: Sat, 22 Apr 2023 15:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 1/4] include/linux/mman.h:153:9: warning:
 division by zero is undefined
Message-ID: <202304221538.ChgrACiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   bb4ed72d010d114a825cba50a2f910b8a6bdadf7
commit: 96ffcf4468d55cf44750a267aa5e54c4de560a5b [1/4] debugobjects: Add obj_data to a debug_obj
config: powerpc-katmai_defconfig (https://download.01.org/0day-ci/archive/20230422/202304221538.ChgrACiJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=96ffcf4468d55cf44750a267aa5e54c4de560a5b
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 96ffcf4468d55cf44750a267aa5e54c4de560a5b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221538.ChgrACiJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:162:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[3] = op(a3, b3);                                 \
                   ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:162:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[2] = op(a2, b2);                                 \
                   ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:27: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                                    ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:10: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                   ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:20: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                                    ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:3: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                   ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
>> include/linux/mman.h:153:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   30 warnings and 1 error generated.
   make[2]: *** [scripts/Makefile.build:114: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +153 include/linux/mman.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  145  
^1da177e4c3f41 Linus Torvalds  2005-04-16  146  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  147   * Combine the mmap "flags" argument into "vm_flags" used internally.
^1da177e4c3f41 Linus Torvalds  2005-04-16  148   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  149  static inline unsigned long
^1da177e4c3f41 Linus Torvalds  2005-04-16  150  calc_vm_flag_bits(unsigned long flags)
^1da177e4c3f41 Linus Torvalds  2005-04-16  151  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  152  	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
b6fb293f2497a9 Jan Kara        2017-11-01 @153  	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
b3fbbea4c00220 Kevin Brodsky   2019-11-25  154  	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
b3fbbea4c00220 Kevin Brodsky   2019-11-25  155  	       arch_calc_vm_flag_bits(flags);
^1da177e4c3f41 Linus Torvalds  2005-04-16  156  }
00619bcc44d6b7 Jerome Marchand 2013-11-12  157  

:::::: The code at line 153 was first introduced by commit
:::::: b6fb293f2497a9841d94f6b57bd2bb2cd222da43 mm: Define MAP_SYNC and VM_SYNC flags

:::::: TO: Jan Kara <jack@suse.cz>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
