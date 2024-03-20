Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842531642B;
	Wed, 20 Mar 2024 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710921908; cv=none; b=SJg8hBoK5iURzK1KU2C8MJd7YzyqFcBCByecjgsfEnvGZz9KEt9D5rsSWwwysTQi3u5pGgGi/156o1f30Ktaz99HANwknnBDLd7t7Vp++2FqGjSIPrBkO6Vaqym3JKXSyxPB4xVRIXgMLFyEWhvpHJXChNuDFvFvsIJRcS+VXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710921908; c=relaxed/simple;
	bh=eG0kDS/mrAl5KHOwo943JMDevz0ZPRw28X5sAdBVHyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1PUgIJhOOZY29R2jNnQfKdOv7q4WX6nOxYQpp7rRpeHY2PT8ZRMI8PVUwuqy4DCkLTTNWgZ2RGy0XKqysmnw4/YsYYCf97PHKCa+Bhn9kYuKqwPSFeQQaWRf45s+D7fIBeeKS/RZv+iwtBMwDMuQr9NJysfcvgz6Ki+RUR5KV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asjSYz4j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asjSYz4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710921906; x=1742457906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eG0kDS/mrAl5KHOwo943JMDevz0ZPRw28X5sAdBVHyc=;
  b=asjSYz4jnrLIBeq2JzMfltdoTEH5Rh9WGjusF++blSRbUr7IU69o3yOX
   CH1SjEod2HMk2dBcQWpQMefY1g0c57ZsxlEM/bcBpD7an05oDpUlNy3wg
   9G/iJ0Nkno3zcM1bOc1H1jgv1ArT+1twoUEN9s9hTDk3W1nwhQzwr1tl0
   hr6TAR/ToQhtJhXOhBUB1KxOaI+gQTmFwTqpEdP687mL0IW/PidhZW2B0
   6ckO0fvGUonOulPVpL3ZmDLdVUd5OUCVeL0Kjo/IGorkGloy129ojWQbA
   QCRtKsPrbURWM4LBLl393O32OfNWm3XGqevt7F7oLek8W3EBzyXvOrlcz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16375776"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="16375776"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 01:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="14083131"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Mar 2024 01:05:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmqwW-000ISl-1B;
	Wed, 20 Mar 2024 08:05:00 +0000
Date: Wed, 20 Mar 2024 16:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 50/65]
 arch/mips/include/asm/r4kcache.h:245:1: error: pasting formed '"Unsupported
 unroll count: "32', an invalid preprocessing token
Message-ID: <202403201512.c7bd4E1H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   3ec29f243914b957e581e1b00106eef6308d5680
commit: 7292c0205ebac9ec5f4d2ef3076e39971beed8bd [50/65] unroll: add generic loop unroll helpers
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20240320/202403201512.c7bd4E1H-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201512.c7bd4E1H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201512.c7bd4E1H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/mips-mt.c:20:
>> arch/mips/include/asm/r4kcache.h:245:1: error: pasting formed '"Unsupported unroll count: "32', an invalid preprocessing token
   __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
   ^
   arch/mips/include/asm/r4kcache.h:214:4: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                           ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:52: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                                                                    ^
   In file included from arch/mips/kernel/mips-mt.c:20:
>> arch/mips/include/asm/r4kcache.h:245:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:214:17: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                                        ^
>> arch/mips/include/asm/r4kcache.h:245:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:214:17: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                                        ^
>> arch/mips/include/asm/r4kcache.h:245:1: error: extraneous ')' before ';'
   arch/mips/include/asm/r4kcache.h:214:4: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                           ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:3: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:448:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:439:4: note: expanded from macro '__compiletime_assert'
                           __compiletime_error(msg);                       \
                           ^
   include/linux/compiler_attributes.h:151:71: note: expanded from macro '__compiletime_error'
   # define __compiletime_error(msg)       __attribute__((__error__(msg)))
                                                                         ^
   In file included from arch/mips/kernel/mips-mt.c:20:
>> arch/mips/include/asm/r4kcache.h:245:1: error: pasting formed '"Unsupported unroll count: "32', an invalid preprocessing token
   arch/mips/include/asm/r4kcache.h:224:3: note: expanded from macro '__BUILD_BLAST_CACHE'
                   cache_unroll(32, kernel_cache, hitop, start, lsize);    \
                   ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:52: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                                                                    ^
   In file included from arch/mips/kernel/mips-mt.c:20:
>> arch/mips/include/asm/r4kcache.h:245:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:224:16: note: expanded from macro '__BUILD_BLAST_CACHE'
                   cache_unroll(32, kernel_cache, hitop, start, lsize);    \
                                ^
>> arch/mips/include/asm/r4kcache.h:245:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:224:16: note: expanded from macro '__BUILD_BLAST_CACHE'
                   cache_unroll(32, kernel_cache, hitop, start, lsize);    \
                                ^
>> arch/mips/include/asm/r4kcache.h:245:1: error: extraneous ')' before ';'
   arch/mips/include/asm/r4kcache.h:224:3: note: expanded from macro '__BUILD_BLAST_CACHE'
                   cache_unroll(32, kernel_cache, hitop, start, lsize);    \
                   ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:3: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:448:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:439:4: note: expanded from macro '__compiletime_assert'
                           __compiletime_error(msg);                       \
                           ^
   include/linux/compiler_attributes.h:151:71: note: expanded from macro '__compiletime_error'
   # define __compiletime_error(msg)       __attribute__((__error__(msg)))
                                                                         ^
   In file included from arch/mips/kernel/mips-mt.c:20:
>> arch/mips/include/asm/r4kcache.h:245:1: error: pasting formed '"Unsupported unroll count: "32', an invalid preprocessing token
   arch/mips/include/asm/r4kcache.h:241:4: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                           ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:52: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                                                                    ^
   In file included from arch/mips/kernel/mips-mt.c:20:
>> arch/mips/include/asm/r4kcache.h:245:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:241:17: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                                        ^
>> arch/mips/include/asm/r4kcache.h:245:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:241:17: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                                        ^
>> arch/mips/include/asm/r4kcache.h:245:1: error: extraneous ')' before ';'
   arch/mips/include/asm/r4kcache.h:241:4: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                           ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:3: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:448:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:439:4: note: expanded from macro '__compiletime_assert'
                           __compiletime_error(msg);                       \
                           ^
   include/linux/compiler_attributes.h:151:71: note: expanded from macro '__compiletime_error'
   # define __compiletime_error(msg)       __attribute__((__error__(msg)))
                                                                         ^
   In file included from arch/mips/kernel/mips-mt.c:20:
   arch/mips/include/asm/r4kcache.h:246:1: error: pasting formed '"Unsupported unroll count: "32', an invalid preprocessing token
   __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
   ^
   arch/mips/include/asm/r4kcache.h:214:4: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                           ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:52: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                                                                    ^
   In file included from arch/mips/kernel/mips-mt.c:20:
   arch/mips/include/asm/r4kcache.h:246:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:214:17: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                                        ^
   arch/mips/include/asm/r4kcache.h:246:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:214:17: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                                        ^
   arch/mips/include/asm/r4kcache.h:246:1: error: extraneous ')' before ';'
   arch/mips/include/asm/r4kcache.h:214:4: note: expanded from macro '__BUILD_BLAST_CACHE'
                           cache_unroll(32, kernel_cache, indexop,         \
                           ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:3: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:448:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:439:4: note: expanded from macro '__compiletime_assert'
                           __compiletime_error(msg);                       \
                           ^
   include/linux/compiler_attributes.h:151:71: note: expanded from macro '__compiletime_error'
   # define __compiletime_error(msg)       __attribute__((__error__(msg)))
                                                                         ^
   In file included from arch/mips/kernel/mips-mt.c:20:
   arch/mips/include/asm/r4kcache.h:246:1: error: pasting formed '"Unsupported unroll count: "32', an invalid preprocessing token
   arch/mips/include/asm/r4kcache.h:224:3: note: expanded from macro '__BUILD_BLAST_CACHE'
                   cache_unroll(32, kernel_cache, hitop, start, lsize);    \
                   ^
   arch/mips/include/asm/r4kcache.h:197:2: note: expanded from macro 'cache_unroll'
           unrolled_call(times, _cache_op, insn, op,                       \
           ^
   include/linux/unroll.h:82:52: note: expanded from macro 'unrolled_call'
                   BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
                                                                    ^
   In file included from arch/mips/kernel/mips-mt.c:20:
   arch/mips/include/asm/r4kcache.h:246:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:224:16: note: expanded from macro '__BUILD_BLAST_CACHE'
                   cache_unroll(32, kernel_cache, hitop, start, lsize);    \
                                ^
   arch/mips/include/asm/r4kcache.h:246:1: error: expected ')'
   arch/mips/include/asm/r4kcache.h:224:16: note: expanded from macro '__BUILD_BLAST_CACHE'
                   cache_unroll(32, kernel_cache, hitop, start, lsize);    \
                                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +245 arch/mips/include/asm/r4kcache.h

76f072a46f179b include/asm-mips/r4kcache.h      Atsushi Nemoto 2006-01-29  244  
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14 @245  __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  246  __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  247  __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  248  __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 32, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  249  __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 32, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  250  __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I_Loongson2, 32, loongson2_)
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  251  __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 32, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  252  __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 64, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  253  __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 64, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  254  __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 64, )
18a8cd63c0d800 arch/mips/include/asm/r4kcache.h David Daney    2014-05-28  255  __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 128, )
18a8cd63c0d800 arch/mips/include/asm/r4kcache.h David Daney    2014-05-28  256  __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 128, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  257  __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 128, )
43a06847b9d277 arch/mips/include/asm/r4kcache.h Aaro Koskinen  2014-01-14  258  

:::::: The code at line 245 was first introduced by commit
:::::: 43a06847b9d277e9f2c3bf8052b44b74e17526c7 MIPS: fix blast_icache32 on loongson2

:::::: TO: Aaro Koskinen <aaro.koskinen@iki.fi>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
