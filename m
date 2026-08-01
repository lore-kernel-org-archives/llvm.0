Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566831E830;
	Sat,  1 Aug 2026 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785582136; cv=none; b=OGONM/ElLdoWIMM/rewPPykA9sYFvTii0YRokovYk8uCDlPvGyfK7t28rX2JZTxR4qHQr1r9jxMin0+EI34sKqBj0FA4zteumD+Qk+NFCDdDKFxXB9elDr9h/AOIUDX1kPRwJMFXSzwjMBLyi9blCmn6URXmHkUdg+h2rYDd7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785582136; c=relaxed/simple;
	bh=ThAiP80UbNnXaRLKaLcsuzy0tJSZW/e5XwuQmV5u2CE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cOqIvncOMaB6BS5C12wnYHI1j8cdVe6lJCFLHNgVGg05MxShN1h2mX9mjR5I793z6IkDoSW0/YY2SgiGaVM/2bQC8wWDinPoDpc8BZIzgzQVEQ4aulZl15hTwdpzFfkDyiuwp618r+2FBZhrSPJmG71N7DssOGaiNGcesHhTPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeynveZi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeynveZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785582133; x=1817118133;
  h=date:from:to:cc:subject:message-id;
  bh=ThAiP80UbNnXaRLKaLcsuzy0tJSZW/e5XwuQmV5u2CE=;
  b=HeynveZiuRvMbACEsc4aMf6VKKeT+hl/tReFGIsgNCu30Up9zkX1tDer
   g3BRg140rIrZwSCDCBLJkbEpbh2jL8Eqnbzu4aelnPGDBkejPjiLft/RP
   yxR/JFrU9Zb6kF8iiZm7sA3Gl/Bz/jTl5/gln8paf9HL/iBGH38zuFiBQ
   y/vwSZbP5M5MqYMwGDD94+DYyh7sAyWBKdKhxq9G9m2511rhPJM1sj1wt
   ek7ZyyevR3OJpjn9nJp9Sabm9shbr16CBKcQ/bMshEMmHjMc5Y0AnTSu5
   S31ZX6bnuRO1clWGheo8nLO+odvgbO8d6HReTIgfz+C9Pzryl/InTTVab
   w==;
X-CSE-ConnectionGUID: L6QmV+5RRJKru5ylNESLFQ==
X-CSE-MsgGUID: EfExiGfwQPeNzOhj3WrxXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="90008032"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="90008032"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 04:02:12 -0700
X-CSE-ConnectionGUID: 0oXMRMHERMGWywrfxdQYCw==
X-CSE-MsgGUID: xa/ZuVZ9Sf2d1Gpb+M7Hew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="284159847"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Aug 2026 04:02:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq7Tk-000000003Dt-47De;
	Sat, 01 Aug 2026 11:02:08 +0000
Date: Sat, 01 Aug 2026 18:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 15/17]
 arch/arm64/include/asm/percpu.h:341:1: error: value size does not match
 register size specified by the constraint and modifier
Message-ID: <202608011803.FrWG8JeW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   f118f6b23da9a83459d961ce6fffa6af0ec1bf39
commit: 77d5cf0c2a25eeec3bd2e5ade17d5be8b91ea05f [15/17] arm64: percpu: Implement preemptible CMPXCHG ops
config: arm64-randconfig-001-20260801 (https://download.01.org/0day-ci/archive/20260801/202608011803.FrWG8JeW-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011803.FrWG8JeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011803.FrWG8JeW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:6:
   In file included from arch/arm64/include/asm/stat.h:12:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/arm64/include/asm/timex.h:8:
   In file included from arch/arm64/include/asm/arch_timer.h:18:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:12:
>> arch/arm64/include/asm/percpu.h:341:1: error: value size does not match register size specified by the constraint and modifier [-Werror,-Wasm-operand-widths]
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
   arch/arm64/include/asm/percpu.h:342:1: error: value size does not match register size specified by the constraint and modifier [-Werror,-Wasm-operand-widths]
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
   arch/arm64/include/asm/percpu.h:343:1: error: value size does not match register size specified by the constraint and modifier [-Werror,-Wasm-operand-widths]
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
   3 errors generated.


vim +341 arch/arm64/include/asm/percpu.h

   340	
 > 341	PERCPU_CMPXCHG_OP(w, b, 8)
   342	PERCPU_CMPXCHG_OP(w, h, 16)
   343	PERCPU_CMPXCHG_OP(w,  , 32)
   344	PERCPU_CMPXCHG_OP(x,  , 64)
   345	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
