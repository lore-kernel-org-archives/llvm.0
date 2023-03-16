Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB293C00;
	Thu, 16 Mar 2023 15:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFF8C433D2;
	Thu, 16 Mar 2023 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678979676;
	bh=aISEv7sStNXt3K/WZiWeSXD+gsBf4b07nmGsoRPmw44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzIn3RnxOc7Rk/EfE+lvdrNst3sWS4obSzU9WfM+FUrDIOpqA4HKNY1olA7B0f753
	 xKQYPx73sgUt3G9apzK+A/KeXtjfrBC6bzGpNDyWTHLhanfW3JCA4SmitQnuqaO9l5
	 HEXgAI4TIpe/iGC12iHl0eu2merwypcbx8s43dRd/fck7uHR1RKUtCzppHp+LPN1p6
	 ydihDd5+7otF67ue8wO4rVVNikJPVEYn2gNevibBZvulzLIxgiHXeWMdv+vSumDNf0
	 x+qwp8GgUVkye9QI8dpEWQjS1M585REJOmplvHX1GM+mhFw70l0TO8Hz7VU5fgJXZV
	 jsWe8IW9p2LGQ==
Date: Thu, 16 Mar 2023 08:14:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Viktor Malik <vmalik@redhat.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [linux-next:master 3796/4036]
 kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type
 'struct module'
Message-ID: <20230316151434.GA1276310@dev-arch.thelio-3990X>
References: <202303161404.OrmfCy09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303161404.OrmfCy09-lkp@intel.com>

On Thu, Mar 16, 2023 at 02:59:48PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
> commit: 2a6427ca8f3a8f08498c7b60e486c95af88d0afd [3796/4036] bpf: Fix attaching fentry/fexit/fmod_ret/lsm to modules
> config: riscv-randconfig-r042-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161404.OrmfCy09-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2a6427ca8f3a8f08498c7b60e486c95af88d0afd
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 2a6427ca8f3a8f08498c7b60e486c95af88d0afd
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303161404.OrmfCy09-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each_entry_rcu'
>                 pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/container_of.h:20:47: note: expanded from macro 'container_of'
>            static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler_types.h:340:74: note: expanded from macro '__same_type'
>    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>                                                                             ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                     ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                                           ^~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: offsetof of incomplete type 'typeof (*mod)' (aka 'struct module')
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each_entry_rcu'
>                 pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
>            ((type *)(__mptr - offsetof(type, member))); })
>                               ^~~~~~~~~~~~~~~~~~~~~~
>    include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
>    #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>                                    ^                  ~~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: assigning to 'struct module *' from incompatible type 'void'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rculist.h:391:11: note: expanded from macro 'list_for_each_entry_rcu'
>                 pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:392:7: note: expanded from macro 'list_for_each_entry_rcu'
>                    &pos->member != (head);                                 \
>                     ~~~^
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>                                 ^~~~~~~~~
>    include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>                    if (!(condition))                                       \
>                          ^~~~~~~~~
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>            __READ_ONCE(x);                                                 \
>                        ^
>    include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
>    #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>                                                                     ^
>    include/linux/compiler_types.h:355:13: note: expanded from macro '__unqual_scalar_typeof'
>                    _Generic((x),                                           \
>                              ^
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>            __READ_ONCE(x);                                                 \
>                        ^
>    include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
>    #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>                                                                     ^
>    include/linux/compiler_types.h:362:15: note: expanded from macro '__unqual_scalar_typeof'
>                             default: (x)))
>                                       ^
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>            __READ_ONCE(x);                                                 \
>                        ^
>    include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
>    #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>                                                                            ^
>    include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                    ^~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: operand of type 'void' where arithmetic or pointer type is required
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/container_of.h:19:25: note: expanded from macro 'container_of'
>            void *__mptr = (void *)(ptr);                                   \
>                                   ^~~~~
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>                                                                  ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                                     ^~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                                           ^~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>                                                                  ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                                     ^~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                                           ^~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>                                                                  ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                                     ^~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                                           ^~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>                                                                  ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                                     ^~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                                           ^~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>            compiletime_assert_rwonce_type(x);                              \
>                                           ^
>    note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>                                                                  ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                                     ^~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                                           ^~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    In file included from kernel/bpf/verifier.c:27:
> >> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>            list_for_each_entry_rcu(mod, &modules, list,
>            ^                       ~~~
>    include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>                    pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>                                         ~~~^
>    include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>            container_of(READ_ONCE(ptr), type, member)
>                                   ^~~
>    include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>            __READ_ONCE(x);                                                 \
>                        ^
>    note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>                                                                  ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                                     ^~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                                           ^~~~
>    include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>    struct module;
>           ^
>    fatal error: too many errors emitted, stopping now [-ferror-limit=]
>    20 errors generated.
> 
> 
> vim +212 kernel/bpf/../module/internal.h
> 
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  204  
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  205  static inline void mod_tree_insert(struct module *mod) { }
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  206  static inline void mod_tree_remove_init(struct module *mod) { }
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  207  static inline void mod_tree_remove(struct module *mod) { }
> 446d55666d5599 Christophe Leroy 2022-02-23  208  static inline struct module *mod_find(unsigned long addr, struct mod_tree_root *tree)
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  209  {
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  210  	struct module *mod;
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  211  
> 58d208de3e8d87 Aaron Tomlin     2022-03-22 @212  	list_for_each_entry_rcu(mod, &modules, list,
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  213  				lockdep_is_held(&module_mutex)) {
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  214  		if (within_module(addr, mod))
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  215  			return mod;
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  216  	}
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  217  
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  218  	return NULL;
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  219  }
> 58d208de3e8d87 Aaron Tomlin     2022-03-22  220  #endif /* CONFIG_MODULES_TREE_LOOKUP */
> b33465fe9c52a3 Aaron Tomlin     2022-03-22  221  
> 
> :::::: The code at line 212 was first introduced by commit
> :::::: 58d208de3e8d87dbe196caf0b57cc58c7a3836ca module: Move latched RB-tree support to a separate file
> 
> :::::: TO: Aaron Tomlin <atomlin@redhat.com>
> :::::: CC: Luis Chamberlain <mcgrof@kernel.org>

This is not a clang specific error, I see it with GCC 12.2.0:

$ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build aspeed_g5_defconfig kernel/bpf/verifier.o
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/linux/timer.h:5,
                 from ../include/linux/workqueue.h:9,
                 from ../include/linux/bpf.h:10,
                 from ../include/linux/bpf-cgroup.h:5,
                 from ../kernel/bpf/verifier.c:7:
../kernel/bpf/../module/internal.h: In function 'mod_find':
../include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct module'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/linux/rculist.h:391:20: note: in expansion of macro 'list_entry_rcu'
  391 |              pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
      |                    ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:340:27: error: expression in static assertion is not an integer
  340 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/linux/rculist.h:391:20: note: in expansion of macro 'list_entry_rcu'
  391 |              pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
      |                    ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../include/uapi/linux/posix_types.h:5,
                 from ../include/uapi/linux/types.h:14,
                 from ../include/linux/types.h:6,
                 from ../include/uapi/linux/btf.h:6,
                 from ../kernel/bpf/verifier.c:6:
../include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct module'
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/linux/rculist.h:391:20: note: in expansion of macro 'list_entry_rcu'
  391 |              pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
      |                    ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../include/linux/pid.h:5,
                 from ../include/linux/sched.h:14,
                 from ../include/linux/sched/mm.h:7,
                 from ../include/linux/xarray.h:19,
                 from ../include/linux/radix-tree.h:21,
                 from ../include/linux/idr.h:15,
                 from ../include/linux/kernfs.h:12,
                 from ../include/linux/sysfs.h:16,
                 from ../include/linux/kobject.h:20,
                 from ../include/linux/module.h:21,
                 from ../include/linux/bpf.h:20:
../include/linux/rculist.h:392:21: error: invalid use of undefined type 'struct module'
  392 |                 &pos->member != (head);                                 \
      |                     ^~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
../include/asm-generic/rwonce.h:44:43: note: in expansion of macro '__unqual_scalar_typeof'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                           ^~~~~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/asm-generic/rwonce.h:44:43: note: in expansion of macro '__unqual_scalar_typeof'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                           ^~~~~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct module'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
  387 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
  399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/asm-generic/rwonce.h:44:43: note: in expansion of macro '__unqual_scalar_typeof'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                           ^~~~~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                                         ^~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |                       __same_type(*(ptr), void),                        \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |                      ^~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./../include/linux/compiler_types.h:340:27: error: expression in static assertion is not an integer
  340 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct module'
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
  307 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
  393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
      |                       ^~~~~~~~~~~~~~
../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
  212 |         list_for_each_entry_rcu(mod, &modules, list,
      |         ^~~~~~~~~~~~~~~~~~~~~~~

It appears to be some sort of header inclusion order issue?

Cheers,
Nathan
