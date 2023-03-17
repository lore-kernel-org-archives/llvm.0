Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A916665D;
	Fri, 17 Mar 2023 07:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679037067; x=1710573067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40m6sRJLU04Rkw6JbhnTeyxh1oiKWwNHP2LG6ej5fjU=;
  b=h+Za64+rZHBltMg+mHXzPkZyjYDRemxjNABwfX5t5PlhMsGGvqcTANW2
   qHTBagq29m2QX2nPzXRirgEaxecjSfJmdDf+4x9G3pLqaIhaaC2d1Yvsv
   vCgOa48gI6nMOdV0dCtCh/KIK0C/L5d7RswkE8IFVeARHkZSd7ro784B0
   9GrdTSn+myQLCko17oaAMHP9ZynpeVtf4cn3BmVnsoBhHThsfuaEKO3m9
   p830a4ZggrBk/fHBshYXa0YHbJwh1I06TxklpPMfYnebzqV0922e4KY5u
   wqeGW+/fGBzU9hRnQVAgfbmNUuSOsL/AdkOTEXRKRJrVSx0kwKKfRsYsN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335692913"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="335692913"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 00:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854349087"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="854349087"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 00:11:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd4Et-0009AW-2S;
	Fri, 17 Mar 2023 07:10:59 +0000
Date: Fri, 17 Mar 2023 15:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 3949/4413] kernel/bpf/../module/internal.h:212:2:
 error: operand of type 'void' where arithmetic or pointer type is required
Message-ID: <202303171506.Af2gNUDA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: 31bf1dbccfb0a9861d4846755096b3fff5687f8a [3949/4413] bpf: Fix attaching fentry/fexit/fmod_ret/lsm to modules
config: powerpc-randconfig-r002-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171506.Af2gNUDA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=31bf1dbccfb0a9861d4846755096b3fff5687f8a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 31bf1dbccfb0a9861d4846755096b3fff5687f8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171506.Af2gNUDA-lkp@intel.com/

All errors (new ones prefixed by >>):

          ^
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                   ^~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:355:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                   ^~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:362:15: note: expanded from macro '__unqual_scalar_typeof'
                            default: (x)))
                                      ^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                   ^~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                   ^~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
>> kernel/bpf/../module/internal.h:212:2: error: operand of type 'void' where arithmetic or pointer type is required
           list_for_each_entry_rcu(mod, &modules, list,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^~~~~
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
   kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
                   pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
                                        ~~~^
   include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
                                  ^~~
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'


vim +/void +212 kernel/bpf/../module/internal.h

58d208de3e8d87 Aaron Tomlin     2022-03-22  204  
58d208de3e8d87 Aaron Tomlin     2022-03-22  205  static inline void mod_tree_insert(struct module *mod) { }
58d208de3e8d87 Aaron Tomlin     2022-03-22  206  static inline void mod_tree_remove_init(struct module *mod) { }
58d208de3e8d87 Aaron Tomlin     2022-03-22  207  static inline void mod_tree_remove(struct module *mod) { }
446d55666d5599 Christophe Leroy 2022-02-23  208  static inline struct module *mod_find(unsigned long addr, struct mod_tree_root *tree)
58d208de3e8d87 Aaron Tomlin     2022-03-22  209  {
58d208de3e8d87 Aaron Tomlin     2022-03-22  210  	struct module *mod;
58d208de3e8d87 Aaron Tomlin     2022-03-22  211  
58d208de3e8d87 Aaron Tomlin     2022-03-22 @212  	list_for_each_entry_rcu(mod, &modules, list,
58d208de3e8d87 Aaron Tomlin     2022-03-22  213  				lockdep_is_held(&module_mutex)) {
58d208de3e8d87 Aaron Tomlin     2022-03-22  214  		if (within_module(addr, mod))
58d208de3e8d87 Aaron Tomlin     2022-03-22  215  			return mod;
58d208de3e8d87 Aaron Tomlin     2022-03-22  216  	}
58d208de3e8d87 Aaron Tomlin     2022-03-22  217  
58d208de3e8d87 Aaron Tomlin     2022-03-22  218  	return NULL;
58d208de3e8d87 Aaron Tomlin     2022-03-22  219  }
58d208de3e8d87 Aaron Tomlin     2022-03-22  220  #endif /* CONFIG_MODULES_TREE_LOOKUP */
b33465fe9c52a3 Aaron Tomlin     2022-03-22  221  

:::::: The code at line 212 was first introduced by commit
:::::: 58d208de3e8d87dbe196caf0b57cc58c7a3836ca module: Move latched RB-tree support to a separate file

:::::: TO: Aaron Tomlin <atomlin@redhat.com>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
