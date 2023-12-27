Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F447F69;
	Wed, 27 Dec 2023 20:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQuP69iL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703710003; x=1735246003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WlZslcJTLUSFPtfxC7Fw+lCqv8h0iz3VyjcE6pSLkRA=;
  b=fQuP69iLE4ZePGz8++cvube00z1T2zelEzs6+Kba6v7XmuzsmFqnYDRx
   BVS782PdTGVs3fa27Ao6yitjHFpiL4A8bzYwAb1BWtXI+gfj4ZhMuuZsb
   2zWolyOJM4k+v4BRCqHrrdehLxTA22ZLkBk/YdQ4czI7221sG4mK51yCa
   uTJF2Da4+603Qv+toFtiwaLsie3XB3zoA2lFeY2qgha08zHoAuTZ/nUpZ
   3XgOk1LFViIr0ihffELYh/6H2d9u6eV8vbOtB+xCu8lo/e/Ra0qatNtQZ
   CmMAf+3hhDBPGYD0/dQad4gfuJs9CEy0bEoraHfXP73QXVQc4OyZH/sWi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3566737"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3566737"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 12:46:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="868949895"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="868949895"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Dec 2023 12:46:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIanT-000FkS-2l;
	Wed, 27 Dec 2023 20:46:35 +0000
Date: Thu, 28 Dec 2023 04:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Wen Xiong <wenxiong@us.ibm.com>
Subject: Re: [PATCHv10 3/3] powerpc/smp: Allow hole in paca_ptrs to
 accommodate boot_cpu
Message-ID: <202312280454.Et1Ovm5u-lkp@intel.com>
References: <20231227024147.12485-1-kernelfans@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227024147.12485-1-kernelfans@gmail.com>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/powerpc-kernel-Remove-check-on-paca_ptrs_size/20231227-104412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231227024147.12485-1-kernelfans%40gmail.com
patch subject: [PATCHv10 3/3] powerpc/smp: Allow hole in paca_ptrs to accommodate boot_cpu
config: powerpc64-randconfig-001-20231227 (https://download.01.org/0day-ci/archive/20231228/202312280454.Et1Ovm5u-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280454.Et1Ovm5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280454.Et1Ovm5u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:56:40: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__is_constexpr((x) - (y)),        \
                                                 ^
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:56:40: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__is_constexpr((x) - (y)),        \
                                 ~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:56:40: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__is_constexpr((x) - (y)),        \
                                                 ^
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:56:40: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__is_constexpr((x) - (y)),        \
                                 ~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                             ^
   include/linux/minmax.h:46:27: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                             ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                   ~~~~~~~~~~^~~~~
   include/linux/minmax.h:46:27: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                             ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                             ^
   include/linux/minmax.h:46:27: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                             ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                   ~~~~~~~~~~^~~~~
   include/linux/minmax.h:46:27: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                             ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                             ^
   include/linux/minmax.h:46:51: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                                                     ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                   ~~~~~~~~~~^~~~~
   include/linux/minmax.h:46:51: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                                                     ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                             ^
   include/linux/minmax.h:46:51: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                                                     ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:57:13: note: expanded from macro '__careful_cmp'
                   __cmp(op, x, y),                                \
                   ~~~~~~~~~~^~~~~
   include/linux/minmax.h:46:51: note: expanded from macro '__cmp'
   #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                                                     ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                                  ^
   include/linux/minmax.h:49:9: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                  ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:9: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                  ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                                  ^
   include/linux/minmax.h:49:9: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                  ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:9: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                  ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                                  ^
   include/linux/minmax.h:49:24: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                                 ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:24: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                                 ^
>> arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                                              ^
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                                  ^
   include/linux/minmax.h:49:24: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                                 ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
>> arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   include/linux/minmax.h:92:38: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(max, x, y)
                           ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:24: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                                 ^
   arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
   arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^
   include/uapi/linux/const.h:31:54: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                  ^
   include/uapi/linux/const.h:32:47: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   arch/powerpc/kernel/paca.c:248:48: error: use of undeclared identifier 'threads_in_core'; did you mean 'cpu_thread_in_core'?
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                                                         ^~~~~~~~~~~~~~~
                                                         cpu_thread_in_core
   include/linux/align.h:8:43: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                                        ^
   include/uapi/linux/const.h:31:70: note: expanded from macro '__ALIGN_KERNEL'
   #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
                                                                                  ^
   include/uapi/linux/const.h:32:58: note: expanded from macro '__ALIGN_KERNEL_MASK'
   #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
                                                               ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^
   arch/powerpc/include/asm/cputhreads.h:48:19: note: 'cpu_thread_in_core' declared here
   static inline int cpu_thread_in_core(int cpu)
                     ^
   arch/powerpc/kernel/paca.c:248:26: warning: cast to smaller integer type 'typeof ((0 + 1))' (aka 'int') from 'int (*)(int)' [-Wpointer-to-int-cast]
           cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
   #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
                                   ^


vim +248 arch/powerpc/kernel/paca.c

   242	
   243	void __init allocate_paca_ptrs(void)
   244	{
   245		unsigned int cnt;
   246	
   247		/* paca_ptrs should be big enough to hold boot cpu */
 > 248		cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
   249		paca_last_cpu_num = cnt;
   250		paca_ptrs_size = sizeof(struct paca_struct *) * cnt;
   251		paca_ptrs = memblock_alloc_raw(paca_ptrs_size, SMP_CACHE_BYTES);
   252		if (!paca_ptrs)
   253			panic("Failed to allocate %d bytes for paca pointers\n",
   254			      paca_ptrs_size);
   255	
   256		memset(paca_ptrs, 0x88, paca_ptrs_size);
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
