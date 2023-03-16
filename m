Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB717CF;
	Thu, 16 Mar 2023 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678950030; x=1710486030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRKM/A5fizMPqe1m8FjHZeYm9IPxADYTIS/OhPFgy24=;
  b=apCC8F3bZSCFRKk6FqkIvnBJuELe+NHdQv8JvnWCOtP0ERHe8rV+f+3C
   47kMnaIoN7SBvrjfFi4xlp48YaHOYBmkNoYNk+Oz1k+BcvzkJc1La6oHa
   l+OYCejD8zXMQZ2Gtlk09qG+8Eg7VpzqgoiKG8Yt2vjuEOeLNDk1ngOZ9
   Os8TQEtIlfpKcasHeCs+Ja6g/JR6fpax+B+layGx6Fw5VoZKjCZxLk9Xh
   OF+OSBjnhUmoIkBsjsnOGqlN09opg5fydJUHCSBG+EiMEFs5C6mwsUyLI
   EAOJ/dYO+dY2H/0udRG1TUjfVe7kjoI2Tf8t2s2wYdj2W2Y5ZHY6QIr6P
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337925650"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="337925650"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 00:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="712216537"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="712216537"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 00:00:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pchb5-0008Nc-2I;
	Thu, 16 Mar 2023 07:00:23 +0000
Date: Thu, 16 Mar 2023 14:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 3796/4036] kernel/bpf/../module/internal.h:212:2:
 error: incomplete definition of type 'struct module'
Message-ID: <202303161404.OrmfCy09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 2a6427ca8f3a8f08498c7b60e486c95af88d0afd [3796/4036] bpf: Fix attaching fentry/fexit/fmod_ret/lsm to modules
config: riscv-randconfig-r042-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161404.OrmfCy09-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2a6427ca8f3a8f08498c7b60e486c95af88d0afd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2a6427ca8f3a8f08498c7b60e486c95af88d0afd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161404.OrmfCy09-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:27:
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each_entry_rcu'
                pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:47: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:74: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                            ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
>> kernel/bpf/../module/internal.h:212:2: error: offsetof of incomplete type 'typeof (*mod)' (aka 'struct module')
           list_for_each_entry_rcu(mod, &modules, list,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each_entry_rcu'
                pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
           ((type *)(__mptr - offsetof(type, member))); })
                              ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                  ~~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
>> kernel/bpf/../module/internal.h:212:2: error: assigning to 'struct module *' from incompatible type 'void'
           list_for_each_entry_rcu(mod, &modules, list,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:391:11: note: expanded from macro 'list_for_each_entry_rcu'
                pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/verifier.c:27:
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
           list_for_each_entry_rcu(mod, &modules, list,
           ^                       ~~~
   include/linux/rculist.h:392:7: note: expanded from macro 'list_for_each_entry_rcu'
                   &pos->member != (head);                                 \
                    ~~~^
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   In file included from kernel/bpf/verifier.c:27:
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
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
>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
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
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +212 kernel/bpf/../module/internal.h

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
