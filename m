Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7BD2AF06;
	Sun,  3 Nov 2024 01:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730597890; cv=none; b=oQJz27iCYQfWOBLi00311Uce0BaLZggidivNABANzZOOTD5XsyIkqR3sNg8X74dkgi5r/Hx40RqDijasdexEeaaEe1IC6BvqUc8OdkqOdhO1tJmU0sIBleDAlk1LwxxSasVmRA2XVMp1Z3FWEIxTbyCT7cXuT0qW+HpB62OpoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730597890; c=relaxed/simple;
	bh=lPztnIF9UQd0gvTXEqd6qfc8EMuKApdEcLmYTjBR9Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N1c5t7dYOJipg1580nc8gSpS4DHuM7wxtnjdkwhwcf4UoHxbZCcpvDGh2LUvDPKG+MRk2Zoz0GI+pUxhK7qJ+lv8qCbrt3ePdDPaoH/8pY+0GZxxvXFLFfftFZ8e2BFan2J8RIvYaNwHdCUAKuMBPj1Mfog7o0cGzr01TPUHm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOTGGF9r; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOTGGF9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730597888; x=1762133888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lPztnIF9UQd0gvTXEqd6qfc8EMuKApdEcLmYTjBR9Ec=;
  b=kOTGGF9r07cL5f8Wn4rAOSgrso5PUaXFEU/Q5g3AG2teU4RYW61nYmQF
   GByoS8clfIA5FjRdcpIknDXKXVsLhdsGcfe1uQVEfZo4lHwwt03y2yago
   xzEDwt4xw8JReXQL4T32jyEwwmEXirz9L2Ct/HdM46odh2/xBD3yYOJs7
   9vMrZLDsQa+eAJmbOHJerAmKNGgxORVfD8zcj94xSkW1IZ2YTkjDrcqsM
   J1YEAiJe4+JQiMAQRf+ZVVg5FDbtoiS+hcLtYGHwQk6/ZCdz6Zs/Nicy7
   WUv8QkfkyQJRKu0WR/OYIHeTEFhc5sxjRqG5+cNhK+v8Z8rYeVTzbLlfe
   g==;
X-CSE-ConnectionGUID: yArBbhH0SY2+HIfDaoEvMg==
X-CSE-MsgGUID: Wo+TuJdUSHqOSSnEXOHJiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="55721895"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="55721895"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 18:38:07 -0700
X-CSE-ConnectionGUID: WsyDJ/44QJ2JGswjKco+4A==
X-CSE-MsgGUID: ku5VJlnrSqediLHMOYgsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="83651454"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2024 18:38:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7PZ6-000jYr-1F;
	Sun, 03 Nov 2024 01:38:04 +0000
Date: Sun, 3 Nov 2024 09:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_3 19/24]
 include/linux/mm_types.h:1189:18: error: initializing 'struct mm_cid *' with
 an expression of incompatible type 'void'
Message-ID: <202411030909.Bh5bB81k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   2e0575143d13814d04f02a33a4110989ccdbf3a3
commit: dad4c7b2a8fb2c951d2b83ace0b4ad41de222cba [19/24] uprobes: Add mapping for optimized uprobe trampolines
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241103/202411030909.Bh5bB81k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030909.Bh5bB81k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030909.Bh5bB81k-lkp@intel.com/

All errors (new ones prefixed by >>):

      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1094:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1094 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   include/asm-generic/rwonce.h:55:20: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1094:17: error: no member named 'lru_gen' in 'struct mm_struct'
    1094 |         WRITE_ONCE(mm->lru_gen.bitmap, -1);
         |                    ~~  ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1138:27: error: no member named 'mm_mt' in 'struct mm_struct'
    1138 |         mas_init(&vmi->mas, &mm->mm_mt, addr);
         |                              ~~  ^
   include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
    1189 |                 struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
         |                                                       ~~  ^
   include/linux/percpu-defs.h:235:20: note: expanded from macro 'per_cpu_ptr'
     235 |         __verify_pcpu_ptr(ptr);                                         \
         |                           ^~~
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
    1189 |                 struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
         |                                                       ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
     236 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |                           ^~~
   include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PERCPU_PTR'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |                              ^~~
   include/linux/compiler.h:177:31: note: expanded from macro 'RELOC_HIDE'
     177 |      __ptr = (unsigned long) (ptr);                             \
         |                               ^~~
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
    1189 |                 struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
         |                                                       ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
     236 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |                           ^~~
   include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PERCPU_PTR'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |                                                        ^~~
   include/linux/compiler.h:177:31: note: expanded from macro 'RELOC_HIDE'
     177 |      __ptr = (unsigned long) (ptr);                             \
         |                               ^~~
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
    1189 |                 struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
         |                                                       ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
     236 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |                           ^~~
   include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PERCPU_PTR'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |                              ^~~
   include/linux/compiler.h:178:13: note: expanded from macro 'RELOC_HIDE'
     178 |     (typeof(ptr)) (__ptr + (off)); })
         |             ^~~
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
    1189 |                 struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
         |                                                       ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
     236 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |                           ^~~
   include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PERCPU_PTR'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |                                                        ^~~
   include/linux/compiler.h:178:13: note: expanded from macro 'RELOC_HIDE'
     178 |     (typeof(ptr)) (__ptr + (off)); })
         |             ^~~
   In file included from mm/init-mm.c:2:
>> include/linux/mm_types.h:1189:18: error: initializing 'struct mm_cid *' with an expression of incompatible type 'void'
    1189 |                 struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
         |                                ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:1199:6: error: no member named 'pcpu_cid' in 'struct mm_struct'
    1199 |         mm->pcpu_cid = alloc_percpu_noprof(struct mm_cid);
         |         ~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +1189 include/linux/mm_types.h

af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1183  
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1184  static inline void mm_init_cid(struct mm_struct *mm)
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1185  {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  1186  	int i;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  1187  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  1188  	for_each_possible_cpu(i) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20 @1189  		struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  1190  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  1191  		pcpu_cid->cid = MM_CID_UNSET;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  1192  		pcpu_cid->time = 0;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  1193  	}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1194  	cpumask_clear(mm_cidmask(mm));
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1195  }
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1196  

:::::: The code at line 1189 was first introduced by commit
:::::: 223baf9d17f25e2608dbdff7232c095c1e612268 sched: Fix performance regression introduced by mm_cid

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
