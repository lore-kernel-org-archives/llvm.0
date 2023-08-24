Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB4A95F;
	Thu, 24 Aug 2023 22:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692915254; x=1724451254;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nZ6l+0i/VurxQMVOM+hW8iAAjLMKRD14kxdawk1yZgw=;
  b=Odo3/QEQJivtKGdm4B+vR6rt2WHcL0xbJeEeQkFsFqrMMDmVA0NXQJyK
   ELB/R2PFR3LIl2HC3ncXnlfCkIKFOXhAUveKHqU+5kDu34IGAwh8n5QAs
   GwcTLaftYU98kjtpxt8ISCBjIjFwHZWwAr51Vcorv62uhUwVhp2uoi6MY
   GpYIta1vcG0MVrRq6ZwlfrKgzhxbI0MJ9j4tdLe4EtDdy4ivhsNIY2/W3
   2ZnLJ3y8L1V+4zMFSd16ZLH8eahDn3kewGTLGLkgY1rh1dBlq8DAdLZaN
   oAfxIlvk3HuKUbohZIYtY5qQO8kxCL+N0n4824zrz3XL+y455dpaNzr7V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405570385"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="405570385"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827341744"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827341744"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2023 15:14:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIaf-0002zs-06;
	Thu, 24 Aug 2023 22:14:09 +0000
Date: Fri, 25 Aug 2023 06:13:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android-4.14-stable 19285/30000]
 test_set_error_stamp: rm
 /kbuild/obj/consumer/x86_64-buildonly-randconfig-001-20230825/.reduce_errors/clang:error:missing-sanitizer-ignorelist:opt-cross-clang-ae42196bc4-lib-clang-share-cfi_ignorelist.txt
Message-ID: <202308250616.aqskhijc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   c399249bc92003dde1c005501c03056039f0ccce
commit: 1c7e2378b4a1b6861fbe45ded9ee34c61e64d528 [19285/30000] ANDROID: x86: add support for CONFIG_LTO_CLANG
config: x86_64-buildonly-randconfig-001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250616.aqskhijc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250616.aqskhijc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250616.aqskhijc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:24:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:51:
   In file included from include/linux/preempt.h:81:
   In file included from arch/x86/include/asm/preempt.h:7:
>> include/linux/thread_info.h:141:29: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned long') [-Wsign-compare]
           if (unlikely(sz >= 0 && sz < bytes)) {
                                   ~~ ^ ~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:24:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
>> include/linux/mmzone.h:999:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:26:
   In file included from include/linux/uaccess.h:5:
   In file included from include/linux/sched.h:15:
   In file included from include/linux/sem.h:9:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
>> include/linux/rhashtable.h:295:34: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           return atomic_read(&ht->nelems) > (tbl->size / 4 * 3) &&
                  ~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~
   include/linux/rhashtable.h:308:34: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           return atomic_read(&ht->nelems) < (tbl->size * 3 / 10) &&
                  ~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
>> include/linux/rhashtable.h:320:34: warning: comparison of integers of different signs: 'int' and 'const unsigned int' [-Wsign-compare]
           return atomic_read(&ht->nelems) > tbl->size &&
                  ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   include/linux/rhashtable.h:332:34: warning: comparison of integers of different signs: 'int' and 'const unsigned int' [-Wsign-compare]
           return atomic_read(&ht->nelems) >= ht->max_elems;
                  ~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/cgroup-defs.h:18:
>> include/linux/percpu-refcount.h:177:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_add(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:496:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:278:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:479:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op((pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/cgroup-defs.h:18:
   include/linux/percpu-refcount.h:276:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_sub(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:506:33: note: expanded from macro 'this_cpu_sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:496:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:438:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:479:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op((pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:635:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_add(memcg->stat->events[idx], count);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:496:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:319:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:479:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op((pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from arch/x86/kernel/asm-offsets.c:20:
   In file included from arch/x86/include/asm/tlbflush.h:11:
   In file included from arch/x86/include/asm/smp.h:13:
>> arch/x86/include/asm/apic.h:588:14: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           if (mps_cpu < nr_cpu_ids && cpu_present(mps_cpu))
               ~~~~~~~ ^ ~~~~~~~~~~
   10 warnings generated.
>> clang-16: error: missing sanitizer ignorelist: '/opt/cross/clang-ae42196bc4/lib/clang/16/share/cfi_ignorelist.txt'
   make[2]: *** [./Kbuild:74: missing-syscalls] Error 1 shuffle=2288069906
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1205: prepare0] Error 2 shuffle=2288069906
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2 shuffle=2288069906
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
