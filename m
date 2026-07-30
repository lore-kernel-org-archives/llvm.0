Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2D280A56;
	Thu, 30 Jul 2026 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405677; cv=none; b=NHwZ7JKZSjjDWPdQFYJ8X7XeTQAJDqtCwwadVxX7j2Y0nunWDhkH0Q1Kw+AHQTScR1Ss8DUSBprC5naLEIFvopWSnX0Hi1FP7hxLXjh1gZh/HZTS2kRBpUg8umhzYdnUoUOLH7jQL+H4GmW3A4i44Go/7Kz2uOJ9d1NoaJbbq+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405677; c=relaxed/simple;
	bh=oFydtNBmo1XYDH7j817qXbomst2TT+5XY2ktn+4xRM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NfneMU1RQwm43tnppHpkiHknJTZ36UBDcHQEy6mMne63L5FgEJ6pDkCPnRe2iSRd1tFfx5CqLn8XAWFmLbP+aFn8MySist4nN78p32hOglAeATIXPOaISQYVKk9yBdiU1MuPk8fKbfnVXQipiCx+5wvPAOme6+Ink8rBuiA5I6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtQdgdOC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtQdgdOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785405676; x=1816941676;
  h=date:from:to:cc:subject:message-id;
  bh=oFydtNBmo1XYDH7j817qXbomst2TT+5XY2ktn+4xRM4=;
  b=YtQdgdOC+EwwDyexkzOaODW7GEf6tleTvw/e8AxOhf/pF4IJ7euYiRF1
   N+EOlAgLTxitEz0Y9PnEwmoI+EH2bbXs6kdutRdvuCqla3+8JKH6GEwZm
   80XnvpRlevGXLdXsUTMuQlEu+pLcjSTfoX934/v6jypgVo78VzgzEa9OG
   rY6sEvw0TSuyPQHruaS31w7hHzGeIicx55dUmB/bvVCyC2Fb2m0gR89DO
   5fstXKNxwz8+c1r3+350TLglqwyVLnaNQqBFL2E5CT0Csv67F0U8eGO3q
   ug1ZaDKSsi5LtWH1+xFJrehQKcBDrVKnBH4u5sQc+qOLb+VN5juxFyOe3
   Q==;
X-CSE-ConnectionGUID: CG6mrqaSR5mTyr3AwdBvMg==
X-CSE-MsgGUID: fBR623qgSJaSN0GVDHbhDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86036364"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86036364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:01:16 -0700
X-CSE-ConnectionGUID: 24sBpFwpQLap3Pod0hwSFw==
X-CSE-MsgGUID: b0t3d9xfQJCoCYwG35nxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="265310732"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2026 03:01:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpNZM-00000000gOA-0lD2;
	Thu, 30 Jul 2026 10:01:01 +0000
Date: Thu, 30 Jul 2026 18:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 17/17]
 arch/arm64/include/asm/percpu.h:330:1: warning: value size does not match
 register size specified by the constraint and modifier
Message-ID: <202607301718.iVkRNJ8y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   d1bf23b2ad173d4e8810016cbc69f2fb8f33ca93
commit: d1bf23b2ad173d4e8810016cbc69f2fb8f33ca93 [17/17] WIP: improve extension in this_cpu_cmpxchg*()
config: arm64-randconfig-002-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301718.iVkRNJ8y-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301718.iVkRNJ8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301718.iVkRNJ8y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:19:
>> arch/arm64/include/asm/percpu.h:330:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     330 | PERCPU_CMPXCHG_OP(w, b, 8)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:330:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:331:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     331 | PERCPU_CMPXCHG_OP(w, h, 16)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:331:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:332:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     332 | PERCPU_CMPXCHG_OP(w,  , 32)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:332:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   3 warnings generated.
--
   In file included from drivers/gpu/drm/pl111/pl111_versatile.c:13:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:13:
   In file included from arch/arm64/include/asm/processor.h:47:
   In file included from arch/arm64/include/asm/spectre.h:17:
>> arch/arm64/include/asm/percpu.h:330:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     330 | PERCPU_CMPXCHG_OP(w, b, 8)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:330:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:331:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     331 | PERCPU_CMPXCHG_OP(w, h, 16)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:331:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:332:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     332 | PERCPU_CMPXCHG_OP(w,  , 32)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:332:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   drivers/gpu/drm/pl111/pl111_versatile.c:489:24: warning: cast to smaller integer type 'enum versatile_clcd' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     489 |         versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/pl111/pl111_versatile.c:509:26: warning: cast to smaller integer type 'enum versatile_clcd' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     509 |                         versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
--
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:19:
>> arch/arm64/include/asm/percpu.h:330:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     330 | PERCPU_CMPXCHG_OP(w, b, 8)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:330:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:331:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     331 | PERCPU_CMPXCHG_OP(w, h, 16)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:331:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:332:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     332 | PERCPU_CMPXCHG_OP(w,  , 32)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:332:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   3 warnings generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/prandom.h:13:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:12:
>> arch/arm64/include/asm/percpu.h:330:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     330 | PERCPU_CMPXCHG_OP(w, b, 8)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:330:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:331:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     331 | PERCPU_CMPXCHG_OP(w, h, 16)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:331:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:332:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     332 | PERCPU_CMPXCHG_OP(w,  , 32)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:332:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   3 warnings generated.
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:24:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:15:
   In file included from arch/arm64/include/asm/arch_timer.h:18:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:12:
>> arch/arm64/include/asm/percpu.h:330:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     330 | PERCPU_CMPXCHG_OP(w, b, 8)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:330:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:331:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     331 | PERCPU_CMPXCHG_OP(w, h, 16)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:331:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:332:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     332 | PERCPU_CMPXCHG_OP(w,  , 32)
         | ^
   arch/arm64/include/asm/percpu.h:317:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |           [old] "r" (xw_zero_extend(old, sz)),                          \
         |                      ^
   arch/arm64/include/asm/atomic_ll_sc.h:248:31: note: expanded from macro 'xw_zero_extend'
     248 | #define xw_zero_extend(v, sz)   ((xwreg_t_##sz)(u##sz)(v))
         |                                 ^
   arch/arm64/include/asm/percpu.h:332:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:306:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     306 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   3 warnings generated.


vim +330 arch/arm64/include/asm/percpu.h

c03dfaa3c7ed10 Mark Rutland 2026-07-22  329  
27fb4c5ba7a4fb Mark Rutland 2026-07-22 @330  PERCPU_CMPXCHG_OP(w, b, 8)
27fb4c5ba7a4fb Mark Rutland 2026-07-22  331  PERCPU_CMPXCHG_OP(w, h, 16)
27fb4c5ba7a4fb Mark Rutland 2026-07-22  332  PERCPU_CMPXCHG_OP(w,  , 32)
27fb4c5ba7a4fb Mark Rutland 2026-07-22  333  PERCPU_CMPXCHG_OP(x,  , 64)
27fb4c5ba7a4fb Mark Rutland 2026-07-22  334  

:::::: The code at line 330 was first introduced by commit
:::::: 27fb4c5ba7a4fb529f6ad0ae5ea0ea4197cb477d arm64: percpu: Implement preemptible CMPXCHG ops

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Mark Rutland <mark.rutland@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
