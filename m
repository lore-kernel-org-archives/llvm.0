Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB5C3815E3;
	Sat,  1 Aug 2026 23:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785625930; cv=none; b=pwyFr4MB19DN6ltm3KkSonpORJVKValAw5H2H7AZVgDdn8ucuKWGVb3FH5UtIQD0oiafLQTnD5zpx+nTQZpiX/EFkH624hVji69hf8KVmMmow7VoxznFpoQZcOfAkS4jp9gVZE2RdpJr+wVjrJAqA1IZDjSCiORMx4FgqquQwSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785625930; c=relaxed/simple;
	bh=xusy0/pccoWYxYx3eOCwjcbAiqd/s1S7LHfXNU2veug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nx6a+DgO+PaGuOCzoWZSVVy3IWRm4rV7U8QFMmjN8+lWmxIS2p9o0TiCCGY3X/WJuyu0Sw5HpY91kOERBTu+Rj7HCOqRjzMpaYblzij+co8yfW5d9BHXw5T8w73WjwYMbGbktEONe0ASGYVC1Yo+SU/LebU06S8vGN0aNgCFf5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MC5+47JQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MC5+47JQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785625928; x=1817161928;
  h=date:from:to:cc:subject:message-id;
  bh=xusy0/pccoWYxYx3eOCwjcbAiqd/s1S7LHfXNU2veug=;
  b=MC5+47JQlejGDYtJQxj8aJPsFZc81kDckRydt8IgwM3i2rloK0IdGRd1
   9GyqGc373AZ9t4msSZ2J33/G7AeDvsFVD3H9YSNvge7TbxNF1k6jeeJIC
   vtuuMXMHP0ju4fYPEgNXUsojP9TFRgEAc8KQDf0WPIplN5E9N4TXfTzHO
   wNuknvBgUNUFunvx2x7mV0J8t1FNHiVaxrOov1SHikJg5Jhu0K2YWyGkv
   V1jbzq+rJW/8aUJ9iRtbC3FdLS+UzijWxqFYjs1cxZ7m+xDwx4csmyAbm
   SlyOvnXZHk8xdkkH+1QO+Pc/fGhPBoh+pliF1OxdaWUQ7sAhabDkTivVh
   Q==;
X-CSE-ConnectionGUID: gTckhvPdTy+67wlQrjP+Pg==
X-CSE-MsgGUID: p7DT8J//QxWKCCnYCjmH8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="103752629"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="103752629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 16:12:07 -0700
X-CSE-ConnectionGUID: SUjDqU+qQdSm65WPKyp/Qw==
X-CSE-MsgGUID: 6h3i5CYyQIGPU4J/HQgfyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="256971209"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Aug 2026 16:12:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqIs7-0000000042H-0yfD;
	Sat, 01 Aug 2026 23:12:03 +0000
Date: Sun, 02 Aug 2026 07:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 15/17] clang diag:
 arch/arm64/include/asm/percpu.h:341:1: warning: value size does not match
 register size specified by the constraint and modifier
Message-ID: <202608020748.H4paFOzR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   f118f6b23da9a83459d961ce6fffa6af0ec1bf39
commit: c45891bccd87033358a8d255b0f5ab8a74765d5d [15/17] arm64: percpu: Implement preemptible CMPXCHG ops
config: arm64-randconfig-001-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020748.H4paFOzR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020748.H4paFOzR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020748.H4paFOzR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang diag: arch/arm64/include/asm/percpu.h:341:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:342:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:343:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
--
         |                                         ^
   arch/arm64/include/asm/percpu.h:343:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:317:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   3 warnings generated.
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:24:
   In file included from arch/arm64/include/asm/vdso/gettimeofday.h:15:
   In file included from arch/arm64/include/asm/arch_timer.h:18:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:12:
   arch/arm64/include/asm/percpu.h:341:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     341 | PERCPU_CMPXCHG_OP(w, b, 8)
         | ^
   arch/arm64/include/asm/percpu.h:328:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     328 |           [old] "r" (xwreg_zero_extend(old, w, sz)),                    \
         |                      ^
   arch/arm64/include/asm/xwreg.h:11:38: note: expanded from macro 'xwreg_zero_extend'
      11 | #define xwreg_zero_extend(v, xw, sz)    ((xwreg_t(xw))(u##sz)(v))
         |                                         ^
   arch/arm64/include/asm/percpu.h:341:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:317:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:342:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     342 | PERCPU_CMPXCHG_OP(w, h, 16)
         | ^
   arch/arm64/include/asm/percpu.h:328:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     328 |           [old] "r" (xwreg_zero_extend(old, w, sz)),                    \
         |                      ^
   arch/arm64/include/asm/xwreg.h:11:38: note: expanded from macro 'xwreg_zero_extend'
      11 | #define xwreg_zero_extend(v, xw, sz)    ((xwreg_t(xw))(u##sz)(v))
         |                                         ^
   arch/arm64/include/asm/percpu.h:342:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:317:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:343:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     343 | PERCPU_CMPXCHG_OP(w,  , 32)
         | ^
   arch/arm64/include/asm/percpu.h:328:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     328 |           [old] "r" (xwreg_zero_extend(old, w, sz)),                    \
         |                      ^
   arch/arm64/include/asm/xwreg.h:11:38: note: expanded from macro 'xwreg_zero_extend'
      11 | #define xwreg_zero_extend(v, xw, sz)    ((xwreg_t(xw))(u##sz)(v))
         |                                         ^
   arch/arm64/include/asm/percpu.h:343:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:317:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   3 warnings generated.
   In file included from rust/helpers/helpers.c:41:
   In file included from rust/helpers/acpi.c:3:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:19:
   arch/arm64/include/asm/percpu.h:341:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     341 | PERCPU_CMPXCHG_OP(w, b, 8)
         | ^
   arch/arm64/include/asm/percpu.h:328:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     328 |           [old] "r" (xwreg_zero_extend(old, w, sz)),                    \
         |                      ^
   arch/arm64/include/asm/xwreg.h:11:38: note: expanded from macro 'xwreg_zero_extend'
      11 | #define xwreg_zero_extend(v, xw, sz)    ((xwreg_t(xw))(u##sz)(v))
         |                                         ^
   arch/arm64/include/asm/percpu.h:341:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:317:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:342:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     342 | PERCPU_CMPXCHG_OP(w, h, 16)
         | ^
   arch/arm64/include/asm/percpu.h:328:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     328 |           [old] "r" (xwreg_zero_extend(old, w, sz)),                    \
         |                      ^
   arch/arm64/include/asm/xwreg.h:11:38: note: expanded from macro 'xwreg_zero_extend'
      11 | #define xwreg_zero_extend(v, xw, sz)    ((xwreg_t(xw))(u##sz)(v))
         |                                         ^
   arch/arm64/include/asm/percpu.h:342:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:317:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
   arch/arm64/include/asm/percpu.h:343:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     343 | PERCPU_CMPXCHG_OP(w,  , 32)
         | ^
   arch/arm64/include/asm/percpu.h:328:15: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     328 |           [old] "r" (xwreg_zero_extend(old, w, sz)),                    \
         |                      ^
   arch/arm64/include/asm/xwreg.h:11:38: note: expanded from macro 'xwreg_zero_extend'
      11 | #define xwreg_zero_extend(v, xw, sz)    ((xwreg_t(xw))(u##sz)(v))
         |                                         ^
   arch/arm64/include/asm/percpu.h:343:1: note: use constraint modifier "w"
   arch/arm64/include/asm/percpu.h:317:19: note: expanded from macro 'PERCPU_CMPXCHG_OP'
     317 |         "       mov     %[oldval], %[old]\n"                            \
         |                                    ^
>> clang diag: arch/arm64/include/asm/percpu.h:341:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:342:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:343:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
>> clang diag: arch/arm64/include/asm/percpu.h:341:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:342:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:343:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
>> clang diag: arch/arm64/include/asm/percpu.h:341:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:342:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   clang diag: arch/arm64/include/asm/percpu.h:343:1: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
   3 warnings generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
