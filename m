Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF85818
	for <llvm@lists.linux.dev>; Sat,  2 Jul 2022 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656758757; x=1688294757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D2nAWCMSrrT3IRnWyA2W/9ORIFYUDIkldnYmGGqk2D0=;
  b=lDWnqblaSm5LOasLuu2aJPzv6HlphAut1hZd1PeNtlXWe4Rn1go4Plb4
   uU2T89YYPD0vHyofEUdyFIl5u7HfTRCde9+KMqzWtpl4XSm+ztalxjJRk
   HTNKoMog51U8N7MHHUBKOT8+esBErC51nQwhZiEwxoFzbK4EMYF9uZAdt
   e4K+/aIJ8xAPq+pq+47W+bFOH0aTAfxX79ffidZHhrFzC9F9yYpOpSOvF
   UPCpD3pyHgKngCuWv9ZyWiB2qvftAqJQxxkqZ8UGtEzU1ozqq2xgKcP0y
   8TdxoTfJR2zVOWT71YoaCixRbnO0H5/H+H/Nhi5dojsemhQdDhZXOV+Sz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="271589377"
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="271589377"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 03:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="838334695"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2022 03:45:49 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7adJ-000F9P-0R;
	Sat, 02 Jul 2022 10:45:49 +0000
Date: Sat, 2 Jul 2022 18:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrey Konovalov <andreyknvl@google.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Christoph Hellwig <hch@lst.de>,
	Christoph Lameter <cl@linux-foundation.org>,
	David Rientjes <rientjes@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Pekka Enberg <penberg@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 04/45] x86: asm: instrument usercopy in get_user() and
 __put_user_size()
Message-ID: <202207021844.0J4s1Gjz-lkp@intel.com>
References: <20220701142310.2188015-5-glider@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701142310.2188015-5-glider@google.com>

Hi Alexander,

I love your patch! Yet something to improve:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on linus/master v5.19-rc4 next-20220701]
[cannot apply to tip/x86/core tip/x86/mm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220701-222712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220702/202207021844.0J4s1Gjz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a9119143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0ca0e4029535365a65588446ba55a952ca186079
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220701-222712
        git checkout 0ca0e4029535365a65588446ba55a952ca186079
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field requested
                   FPU_get_user(instruction_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:103:43: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_before((void *)&(x), ptr, sizeof(*(ptr))); \
                                                    ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field requested
                   FPU_get_user(instruction_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:109:42: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_after((void *)&(x), ptr, sizeof(*(ptr)), 0); \
                                                   ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field requested
                   FPU_get_user(instruction_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:103:43: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_before((void *)&(x), ptr, sizeof(*(ptr))); \
                                                    ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field requested
                   FPU_get_user(instruction_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:109:42: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_after((void *)&(x), ptr, sizeof(*(ptr)), 0); \
                                                   ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field requested
                   FPU_get_user(instruction_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:103:43: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_before((void *)&(x), ptr, sizeof(*(ptr))); \
                                                    ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
>> arch/x86/math-emu/reg_ld_str.c:1043:3: error: address of bit-field requested
                   FPU_get_user(instruction_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:109:42: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_after((void *)&(x), ptr, sizeof(*(ptr)), 0); \
                                                   ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   arch/x86/math-emu/reg_ld_str.c:1047:3: error: address of bit-field requested
                   FPU_get_user(operand_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:103:43: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_before((void *)&(x), ptr, sizeof(*(ptr))); \
                                                    ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   arch/x86/math-emu/reg_ld_str.c:1047:3: error: address of bit-field requested
                   FPU_get_user(operand_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:109:42: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_after((void *)&(x), ptr, sizeof(*(ptr)), 0); \
                                                   ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   arch/x86/math-emu/reg_ld_str.c:1047:3: error: address of bit-field requested
                   FPU_get_user(operand_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:103:43: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_before((void *)&(x), ptr, sizeof(*(ptr))); \
                                                    ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
   arch/x86/math-emu/reg_ld_str.c:1047:3: error: address of bit-field requested
                   FPU_get_user(operand_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^
   arch/x86/include/asm/uaccess.h:109:42: note: expanded from macro 'do_get_user_call'
           instrument_copy_from_user_after((void *)&(x), ptr, sizeof(*(ptr)), 0); \
                                                   ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
   arch/x86/math-emu/reg_ld_str.c:1047:3: error: address of bit-field requested
                   FPU_get_user(operand_address.selector,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/math-emu/fpu_system.h:127:36: note: expanded from macro 'FPU_get_user'
   #define FPU_get_user(x,y) do { if (get_user((x),(y))) FPU_abort; } while (0)
                                  ~~~~^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:131:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })


vim +1043 arch/x86/math-emu/reg_ld_str.c

^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1026  
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1027  u_char __user *fldenv(fpu_addr_modes addr_modes, u_char __user *s)
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1028  {
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1029  	unsigned short tag_word = 0;
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1030  	u_char tag;
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1031  	int i;
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1032  
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1033  	if ((addr_modes.default_mode == VM86) ||
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1034  	    ((addr_modes.default_mode == PM16)
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1035  	     ^ (addr_modes.override.operand_size == OP_SIZE_PREFIX))) {
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1036  		RE_ENTRANT_CHECK_OFF;
96d4f267e40f950 arch/x86/math-emu/reg_ld_str.c  Linus Torvalds 2019-01-03  1037  		FPU_access_ok(s, 0x0e);
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1038  		FPU_get_user(control_word, (unsigned short __user *)s);
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1039  		FPU_get_user(partial_status, (unsigned short __user *)(s + 2));
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1040  		FPU_get_user(tag_word, (unsigned short __user *)(s + 4));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1041  		FPU_get_user(instruction_address.offset,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1042  			     (unsigned short __user *)(s + 6));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30 @1043  		FPU_get_user(instruction_address.selector,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1044  			     (unsigned short __user *)(s + 8));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1045  		FPU_get_user(operand_address.offset,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1046  			     (unsigned short __user *)(s + 0x0a));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1047  		FPU_get_user(operand_address.selector,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1048  			     (unsigned short __user *)(s + 0x0c));
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1049  		RE_ENTRANT_CHECK_ON;
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1050  		s += 0x0e;
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1051  		if (addr_modes.default_mode == VM86) {
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1052  			instruction_address.offset
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1053  			    += (instruction_address.selector & 0xf000) << 4;
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1054  			operand_address.offset +=
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1055  			    (operand_address.selector & 0xf000) << 4;
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1056  		}
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1057  	} else {
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1058  		RE_ENTRANT_CHECK_OFF;
96d4f267e40f950 arch/x86/math-emu/reg_ld_str.c  Linus Torvalds 2019-01-03  1059  		FPU_access_ok(s, 0x1c);
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1060  		FPU_get_user(control_word, (unsigned short __user *)s);
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1061  		FPU_get_user(partial_status, (unsigned short __user *)(s + 4));
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1062  		FPU_get_user(tag_word, (unsigned short __user *)(s + 8));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1063  		FPU_get_user(instruction_address.offset,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1064  			     (unsigned long __user *)(s + 0x0c));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1065  		FPU_get_user(instruction_address.selector,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1066  			     (unsigned short __user *)(s + 0x10));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1067  		FPU_get_user(instruction_address.opcode,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1068  			     (unsigned short __user *)(s + 0x12));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1069  		FPU_get_user(operand_address.offset,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1070  			     (unsigned long __user *)(s + 0x14));
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1071  		FPU_get_user(operand_address.selector,
3d0d14f983b55a5 arch/x86/math-emu/reg_ld_str.c  Ingo Molnar    2008-01-30  1072  			     (unsigned long __user *)(s + 0x18));
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1073  		RE_ENTRANT_CHECK_ON;
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1074  		s += 0x1c;
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1075  	}
^1da177e4c3f415 arch/i386/math-emu/reg_ld_str.c Linus Torvalds 2005-04-16  1076  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
