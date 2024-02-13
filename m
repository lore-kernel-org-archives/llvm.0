Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CFA5EE76;
	Tue, 13 Feb 2024 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707839762; cv=none; b=S/XVLfrsi0Lb/0uen4zsOpP1JIRbHEQN57QkFVgfFvLiOS6/ZBNPS2vqWqQtBaogewt86t4EGqkY/+bBa0uxusaIj+NRDAlepGYyYnm2crTrOUopJqiQn+/Wg2Lnp9IA+n8uAA+jZlOLTut/1a2FL2uDBCzaIsVpXipJR+K11mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707839762; c=relaxed/simple;
	bh=ntjywOEWd+SH7BdTzaP24EHlwrHJViH2Kw6dp+x47s4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8ro9Lx/LgkHBTHulMH02ZshHjLRG0zHX5Ke0A1IOi56M6i7vUhefYAYgXcQdSO1siJSG4kR6okDmh2IrbW6VYXIHw/pNvzZ/yIeshnDZaDGaAbTVWHYc6xtiRkYmrKJOQrx3g5pp55yUfvCCZ1+G1vD4yu9PEBtqaR/zBaF0PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLn7GzU4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLn7GzU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707839760; x=1739375760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntjywOEWd+SH7BdTzaP24EHlwrHJViH2Kw6dp+x47s4=;
  b=JLn7GzU4hh6UvqBLKP8YctboX70mkz+JhP+tDtsF6SlmGGJIsZfDq0q+
   7jbkaCSuNqtOuJTFZldDmUjdTyFZZGGzBfW2cM/pD2heU7dHr0p/akawO
   dKHvi/daO9eeIodsaXbFZ4tnKj0doP1pp2k0bcbz9eSKGo3TBEmua4Muh
   6u3G+GnlIExEdA/+B1gS7CgtdSPO+svaINec04m2SX6swBev6ei+5pK0t
   ntJFOZsSqlb3CmcBxFEdaCnIM+SqxYUy/NtXmlEoNQQoCM/rCuTzlQQI+
   DqzI+9LTvqaf1A2sNT8cEDGe6QMQqKzCjOV9qfSCRQOF+VeLucAOP/sZ9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5687204"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="5687204"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 07:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3280556"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2024 07:55:58 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZv8V-0007r4-1r;
	Tue, 13 Feb 2024 15:55:55 +0000
Date: Tue, 13 Feb 2024 23:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:BROKEN-locking-bench 1/1] lib/slub_kunit.c:269:10: error:
 indirection requires pointer operand ('void' invalid)
Message-ID: <202402132334.1DkquRMb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git BROKEN-locking-bench
head:   e4d39d948cd5cea8989768ec08d7fdbd5171e918
commit: e4d39d948cd5cea8989768ec08d7fdbd5171e918 [1/1] slub_kunit: hack in a stupid locking/atomics microbenchmark
config: i386-randconfig-004-20240213 (https://download.01.org/0day-ci/archive/20240213/202402132334.1DkquRMb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402132334.1DkquRMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402132334.1DkquRMb-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/slub_kunit.c:227:2: error: unknown type name 'u128'
     227 |         u128 full;
         |         ^
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~^~
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/compiler_types.h:391:13: note: expanded from macro '__unqual_scalar_typeof'
     391 |                 _Generic((x),                                           \
         |                           ^
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~^~
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/compiler_types.h:398:15: note: expanded from macro '__unqual_scalar_typeof'
     398 |                          default: (x)))
         |                                    ^
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:127:21: note: expanded from macro '__this_cpu_generic_read_nopreempt'
     127 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                  ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~^~
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
>> lib/slub_kunit.c:269:10: error: indirection requires pointer operand ('void' invalid)
     269 |                         old = this_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:489:29: note: expanded from macro 'this_cpu_read'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
     230 | this_cpu_read_8
         | ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:137:11: note: expanded from macro '__this_cpu_generic_read_noirq'
     137 |         ___ret = raw_cpu_generic_read(pcp);                             \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:67:2: note: expanded from macro 'raw_cpu_generic_read'
      67 |         *raw_cpu_ptr(&(pcp));                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   lib/slub_kunit.c:271:13: error: expected ';' at end of declaration
     271 |                 } while (!this_cpu_try_cmpxchg(test_pcps.counter, &old, new));
         |                           ^
   include/linux/percpu-defs.h:499:2: note: expanded from macro 'this_cpu_try_cmpxchg'
     499 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^
   include/linux/percpu-defs.h:354:24: note: expanded from macro '__pcpu_size_call_return2bool'
     354 |         case 8: pscr2_ret__ = stem##8(variable, __VA_ARGS__); break;    \
         |                               ^
   <scratch space>:34:1: note: expanded from here
      34 | this_cpu_try_cmpxchg_8
         | ^
   include/asm-generic/percpu.h:498:2: note: expanded from macro 'this_cpu_try_cmpxchg_8'
     498 |         this_cpu_generic_try_cmpxchg(pcp, ovalp, nval)
         |         ^
   include/asm-generic/percpu.h:186:10: note: expanded from macro 'this_cpu_generic_try_cmpxchg'
     186 |         __ret = raw_cpu_generic_try_cmpxchg(pcp, ovalp, nval);          \
         |                 ^
   include/asm-generic/percpu.h:104:35: note: expanded from macro 'raw_cpu_generic_try_cmpxchg'
     104 |         typeof(pcp) __val = *__p, ___old = *(ovalp);                    \
         |                                          ^
   lib/slub_kunit.c:271:13: error: use of undeclared identifier '___old'
   include/linux/percpu-defs.h:499:2: note: expanded from macro 'this_cpu_try_cmpxchg'
     499 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^
   include/linux/percpu-defs.h:354:24: note: expanded from macro '__pcpu_size_call_return2bool'
     354 |         case 8: pscr2_ret__ = stem##8(variable, __VA_ARGS__); break;    \
         |                               ^
   <scratch space>:34:1: note: expanded from here
      34 | this_cpu_try_cmpxchg_8
         | ^
   include/asm-generic/percpu.h:498:2: note: expanded from macro 'this_cpu_try_cmpxchg_8'
     498 |         this_cpu_generic_try_cmpxchg(pcp, ovalp, nval)
         |         ^
   include/asm-generic/percpu.h:186:10: note: expanded from macro 'this_cpu_generic_try_cmpxchg'
     186 |         __ret = raw_cpu_generic_try_cmpxchg(pcp, ovalp, nval);          \
         |                 ^
   include/asm-generic/percpu.h:106:15: note: expanded from macro 'raw_cpu_generic_try_cmpxchg'
     106 |         if (__val == ___old) {                                          \
         |                      ^
   lib/slub_kunit.c:283:10: error: indirection requires pointer operand ('void' invalid)
     283 |                         old = raw_cpu_read(test_pcps.counter);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:408:28: note: expanded from macro 'raw_cpu_read'
     408 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
     324 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:52:1: note: expanded from here
      52 | raw_cpu_read_8
         | ^
   include/asm-generic/percpu.h:211:30: note: expanded from macro 'raw_cpu_read_8'
     211 | #define raw_cpu_read_8(pcp)             raw_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:67:2: note: expanded from macro 'raw_cpu_generic_read'
      67 |         *raw_cpu_ptr(&(pcp));                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   lib/slub_kunit.c:285:13: error: expected ';' at end of declaration
     285 |                 } while (!this_cpu_try_cmpxchg(test_pcps.counter, &old, new));
         |                           ^
   include/linux/percpu-defs.h:499:2: note: expanded from macro 'this_cpu_try_cmpxchg'
     499 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^
   include/linux/percpu-defs.h:354:24: note: expanded from macro '__pcpu_size_call_return2bool'
     354 |         case 8: pscr2_ret__ = stem##8(variable, __VA_ARGS__); break;    \
         |                               ^
   <scratch space>:86:1: note: expanded from here
      86 | this_cpu_try_cmpxchg_8
         | ^
   include/asm-generic/percpu.h:498:2: note: expanded from macro 'this_cpu_try_cmpxchg_8'
     498 |         this_cpu_generic_try_cmpxchg(pcp, ovalp, nval)
         |         ^
   include/asm-generic/percpu.h:186:10: note: expanded from macro 'this_cpu_generic_try_cmpxchg'
     186 |         __ret = raw_cpu_generic_try_cmpxchg(pcp, ovalp, nval);          \
         |                 ^
   include/asm-generic/percpu.h:104:35: note: expanded from macro 'raw_cpu_generic_try_cmpxchg'
     104 |         typeof(pcp) __val = *__p, ___old = *(ovalp);                    \
         |                                          ^
   lib/slub_kunit.c:285:13: error: use of undeclared identifier '___old'
   include/linux/percpu-defs.h:499:2: note: expanded from macro 'this_cpu_try_cmpxchg'
     499 |         __pcpu_size_call_return2bool(this_cpu_try_cmpxchg_, pcp, ovalp, nval)
         |         ^
   include/linux/percpu-defs.h:354:24: note: expanded from macro '__pcpu_size_call_return2bool'
     354 |         case 8: pscr2_ret__ = stem##8(variable, __VA_ARGS__); break;    \
         |                               ^
   <scratch space>:86:1: note: expanded from here
      86 | this_cpu_try_cmpxchg_8
         | ^
   include/asm-generic/percpu.h:498:2: note: expanded from macro 'this_cpu_try_cmpxchg_8'
     498 |         this_cpu_generic_try_cmpxchg(pcp, ovalp, nval)
         |         ^
   include/asm-generic/percpu.h:186:10: note: expanded from macro 'this_cpu_generic_try_cmpxchg'
     186 |         __ret = raw_cpu_generic_try_cmpxchg(pcp, ovalp, nval);          \
         |                 ^
   include/asm-generic/percpu.h:106:15: note: expanded from macro 'raw_cpu_generic_try_cmpxchg'
     106 |         if (__val == ___old) {                                          \
         |                      ^
>> lib/slub_kunit.c:297:21: error: initializing 'struct test_pcp *' with an expression of incompatible type 'void'
     297 |                         struct test_pcp *pcp = raw_cpu_ptr(&test_pcps);
         |                                          ^     ~~~~~~~~~~~~~~~~~~~~~~~
   lib/slub_kunit.c:301:13: error: expected ';' at end of declaration
     301 |                 } while (!this_cpu_try_cmpxchg128(test_pcps.counter_ptr.full,
         |                           ^
   include/asm-generic/percpu.h:517:2: note: expanded from macro 'this_cpu_try_cmpxchg128'
     517 |         this_cpu_generic_try_cmpxchg(pcp, ovalp, nval)
         |         ^
   include/asm-generic/percpu.h:186:10: note: expanded from macro 'this_cpu_generic_try_cmpxchg'
     186 |         __ret = raw_cpu_generic_try_cmpxchg(pcp, ovalp, nval);          \
         |                 ^
   include/asm-generic/percpu.h:104:35: note: expanded from macro 'raw_cpu_generic_try_cmpxchg'
     104 |         typeof(pcp) __val = *__p, ___old = *(ovalp);                    \
         |                                          ^
   lib/slub_kunit.c:301:13: error: use of undeclared identifier '___old'
   include/asm-generic/percpu.h:517:2: note: expanded from macro 'this_cpu_try_cmpxchg128'
     517 |         this_cpu_generic_try_cmpxchg(pcp, ovalp, nval)
         |         ^
   include/asm-generic/percpu.h:186:10: note: expanded from macro 'this_cpu_generic_try_cmpxchg'
     186 |         __ret = raw_cpu_generic_try_cmpxchg(pcp, ovalp, nval);          \
         |                 ^
   include/asm-generic/percpu.h:106:15: note: expanded from macro 'raw_cpu_generic_try_cmpxchg'
     106 |         if (__val == ___old) {                                          \
         |                      ^
   lib/slub_kunit.c:312:3: error: passing 'void' to parameter of incompatible type 'local_lock_t *'
     312 |                 local_lock(&test_pcps.llock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:16:27: note: expanded from macro 'local_lock'
      16 | #define local_lock(lock)                __local_lock(lock)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:68:22: note: expanded from macro '__local_lock'
      68 |                 local_lock_acquire(this_cpu_ptr(lock));         \
         |                                    ^~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_ptr'
     265 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_ptr'
     264 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:263:31: note: expanded from macro 'per_cpu_ptr'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:27:53: note: passing argument to parameter 'l' here
      27 | static inline void local_lock_acquire(local_lock_t *l)
         |                                                     ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +269 lib/slub_kunit.c

   245	
   246	static void test_lock_timings(struct kunit *test)
   247	{
   248		unsigned long long before, after;
   249		unsigned long __maybe_unused UP_flags;
   250		struct test_pcp *pcp;
   251		unsigned long flags;
   252	
   253		before = rdtsc_ordered();
   254	
   255		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   256			if (this_cpu_inc_return(test_pcps.counter) == 0)
   257				__dummy = true;
   258		}
   259	
   260		after = rdtsc_ordered();
   261	
   262		pr_info("%-25s %12llu cycles", "this_cpu_inc_return", after - before);
   263	
   264		before = rdtsc_ordered();
   265	
   266		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   267			unsigned long old, new;
   268			do {
 > 269				old = this_cpu_read(test_pcps.counter);
   270				new = old + 1;
   271			} while (!this_cpu_try_cmpxchg(test_pcps.counter, &old, new));
   272		}
   273	
   274		after = rdtsc_ordered();
   275	
   276		pr_info("%-25s %12llu cycles", "this_cpu_try_cmpxchg", after - before);
   277	
   278		before = rdtsc_ordered();
   279	
   280		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   281			unsigned long old, new;
   282			do {
   283				old = raw_cpu_read(test_pcps.counter);
   284				new = old + 1;
   285			} while (!this_cpu_try_cmpxchg(test_pcps.counter, &old, new));
   286		}
   287	
   288		after = rdtsc_ordered();
   289	
   290		pr_info("%-25s %12llu cycles", "raw+this_cpu_try_cmpxchg", after - before);
   291	
   292		before = rdtsc_ordered();
   293	
   294		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   295			counter_ptr_t old, new;
   296			do {
 > 297				struct test_pcp *pcp = raw_cpu_ptr(&test_pcps);
   298				old.full = pcp->counter_ptr.full;
   299				new.counter = old.counter + 1;
   300				new.dummy = old.dummy;
   301			} while (!this_cpu_try_cmpxchg128(test_pcps.counter_ptr.full,
   302							  &old.full, new.full));
   303		}
   304	
   305		after = rdtsc_ordered();
   306	
   307		pr_info("%-25s %12llu cycles", "this_cpu_try_cmpxchg128", after - before);
   308	
   309		before = rdtsc_ordered();
   310	
   311		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   312			local_lock(&test_pcps.llock);
   313	
   314			pcp = this_cpu_ptr(&test_pcps);
   315	
   316			pcp->counter++;
   317	
   318			local_unlock(&test_pcps.llock);
   319		}
   320	
   321		after = rdtsc_ordered();
   322	
   323		pr_info("%-25s %12llu cycles", "local_lock", after - before);
   324	
   325		before = rdtsc_ordered();
   326	
   327		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   328			if (likely(!in_interrupt())) {
   329				local_lock(&test_pcps.llock);
   330	
   331				pcp = this_cpu_ptr(&test_pcps);
   332	
   333				pcp->counter++;
   334	
   335				local_unlock(&test_pcps.llock);
   336			}
   337		}
   338	
   339		after = rdtsc_ordered();
   340	
   341		pr_info("%-25s %12llu cycles", "local_lock+in_intr()", after - before);
   342	
   343	
   344		before = rdtsc_ordered();
   345	
   346		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   347			local_lock_irq(&test_pcps.llock);
   348	
   349			pcp = this_cpu_ptr(&test_pcps);
   350	
   351			pcp->counter++;
   352	
   353			local_unlock_irq(&test_pcps.llock);
   354		}
   355	
   356		after = rdtsc_ordered();
   357	
   358		cond_resched();
   359	
   360		pr_info("%-25s %12llu cycles", "local_lock_irq", after - before);
   361	
   362		before = rdtsc_ordered();
   363	
   364		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   365			local_lock_irqsave(&test_pcps.llock, flags);
   366	
   367			pcp = this_cpu_ptr(&test_pcps);
   368	
   369			pcp->counter++;
   370	
   371			local_unlock_irqrestore(&test_pcps.llock, flags);
   372		}
   373	
   374		after = rdtsc_ordered();
   375	
   376		cond_resched();
   377	
   378		pr_info("%-25s %12llu cycles", "local_lock_irqsave", after - before);
   379	
   380		before = rdtsc_ordered();
   381	
   382		for (unsigned long i = 0; i < TIMING_ITERATIONS; i++) {
   383	
   384			pcp_trylock_prepare(UP_flags);
   385	
   386			pcp = pcpu_spin_trylock(struct test_pcp, slock, &test_pcps);
   387	
   388			pcp = this_cpu_ptr(&test_pcps);
   389	
   390			pcp->counter++;
   391	
   392			pcpu_spin_unlock(slock, pcp);
   393			pcp_trylock_finish(UP_flags);
   394		}
   395	
   396		after = rdtsc_ordered();
   397	
   398		cond_resched();
   399	
   400		pr_info("%-25s %12llu cycles", "pcpu_spin_trylock", after - before);
   401	}
   402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
