Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F861CD21;
	Wed,  7 Feb 2024 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707287985; cv=none; b=sM+uJIlQrZ6OFVnBV9PxgwUe1a1eKgfvWys0hkDVmUTS0kXV1bmMiVPc0dkAAXcUnr+cTOOylMQMbL27ssL3t6fmCwP4lLopXE/wNuGiJVvjyub2ePh2YQjhepHxwCNasqmh2TkJmrBhyjk2pJMuu1a2b4yXiTclnltLnCYauxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707287985; c=relaxed/simple;
	bh=tjR9njG9HVoy0DwiNNSuIEwwUg5WJNH3Au1ObXomNbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QDyouo5EZ9hbR+KBT0BgtlTwzvp9w9ME0zGfS6GxjDf6iZH3P3sULY0NkzBsspv3UOirC2/792BkjC5xkzkXGQgz9LthYnN/WlySRWcVCzBwDGKX+QH94Ak5xDQrmXUw3IBK3dPsetML0ecd5CfLMvJWSe3UZv9FurPQnDWTRGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQX3fb8E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQX3fb8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707287983; x=1738823983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjR9njG9HVoy0DwiNNSuIEwwUg5WJNH3Au1ObXomNbk=;
  b=MQX3fb8EQbs5p0hamI/j69p9GpVkQbz+MsuMDcPT2zJPKVJNMCEdbAT/
   0VyRrSoVZ8sGhHguwJ6/1wySwxUkrQcUnShVsH/lg/Wp8YREHFCcC8n3z
   xf2ZG3BTssqnEOx3zPE7vqsWcWVHiozN49H1ySWnpYHZkONF56/dguaQR
   doLGPhVkbW/QDJBXALFYoDJOCR/VP04BdTaA31ohfA3lSkNhocYd3xx4f
   V6fSXJhAjCx6+BGmi1Ftv6ry+5C8w0Gd8WACIOLRr5UyXY8zlPxE5pQa+
   6RSTCpKcgKJ7FLNhfbWDN1AFv2u0i7dP3yIicFP+9K9EqRS/vW8arAgxS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11569146"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="11569146"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 22:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5857542"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2024 22:39:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXbas-0002Hk-2h;
	Wed, 07 Feb 2024 06:39:38 +0000
Date: Wed, 7 Feb 2024 14:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/signed-sanitizer 22/23]
 include/linux/atomic/atomic-arch-fallback.h:2422:42: error: call to
 undeclared function 'wrapping_add'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202402071422.zeaLMLRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/signed-sanitizer
head:   e8fb67c1c93048b6cdfd9315ec8df73a684c1e92
commit: 9896208386fe6f65438f312f80e5e5f957d66091 [22/23] locking/atomic: Annotate generic atomics with wrapping
config: arm-assabet_defconfig (https://download.01.org/0day-ci/archive/20240207/202402071422.zeaLMLRb-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071422.zeaLMLRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071422.zeaLMLRb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:68:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:2422:42: error: call to undeclared function 'wrapping_add'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, a)));
                                                   ^
   include/linux/atomic/atomic-arch-fallback.h:2422:55: error: expected expression
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, a)));
                                                                ^
   include/linux/atomic/atomic-arch-fallback.h:2491:42: error: call to undeclared function 'wrapping_add'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, 1)));
                                                   ^
   include/linux/atomic/atomic-arch-fallback.h:2491:55: error: expected expression
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, 1)));
                                                                ^
>> include/linux/atomic/atomic-arch-fallback.h:2518:42: error: call to undeclared function 'wrapping_sub'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_sub(int, c, 1)));
                                                   ^
   include/linux/atomic/atomic-arch-fallback.h:2518:55: error: expected expression
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_sub(int, c, 1)));
                                                                ^
   include/linux/atomic/atomic-arch-fallback.h:2543:9: error: call to undeclared function 'wrapping_sub'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   dec = wrapping_sub(int, c, 1);
                         ^
   include/linux/atomic/atomic-arch-fallback.h:2543:22: error: expected expression
                   dec = wrapping_sub(int, c, 1);
                                      ^
   include/linux/atomic/atomic-arch-fallback.h:4603:44: error: call to undeclared function 'wrapping_add'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_add(s64, c, 1)));
                                                     ^
   include/linux/atomic/atomic-arch-fallback.h:4603:57: error: unexpected type name 's64': expected expression
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_add(s64, c, 1)));
                                                                  ^
   include/linux/atomic/atomic-arch-fallback.h:4630:44: error: call to undeclared function 'wrapping_sub'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_sub(s64, c, 1)));
                                                     ^
   include/linux/atomic/atomic-arch-fallback.h:4630:57: error: unexpected type name 's64': expected expression
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_sub(s64, c, 1)));
                                                                  ^
   12 errors generated.
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/wrapping_add +2422 include/linux/atomic/atomic-arch-fallback.h

  2398	
  2399	/**
  2400	 * raw_atomic_fetch_add_unless() - atomic add unless value with full ordering
  2401	 * @v: pointer to atomic_t
  2402	 * @a: int value to add
  2403	 * @u: int value to compare with
  2404	 *
  2405	 * If (@v != @u), atomically updates @v to (@v + @a) with full ordering.
  2406	 *
  2407	 * Safe to use in noinstr code; prefer atomic_fetch_add_unless() elsewhere.
  2408	 *
  2409	 * Return: The original value of @v.
  2410	 */
  2411	static __always_inline int
  2412	raw_atomic_fetch_add_unless(atomic_t *v, int a, int u)
  2413	{
  2414	#if defined(arch_atomic_fetch_add_unless)
  2415		return arch_atomic_fetch_add_unless(v, a, u);
  2416	#else
  2417		int c = raw_atomic_read(v);
  2418	
  2419		do {
  2420			if (unlikely(c == u))
  2421				break;
> 2422		} while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, a)));
  2423	
  2424		return c;
  2425	#endif
  2426	}
  2427	
  2428	/**
  2429	 * raw_atomic_add_unless() - atomic add unless value with full ordering
  2430	 * @v: pointer to atomic_t
  2431	 * @a: int value to add
  2432	 * @u: int value to compare with
  2433	 *
  2434	 * If (@v != @u), atomically updates @v to (@v + @a) with full ordering.
  2435	 *
  2436	 * Safe to use in noinstr code; prefer atomic_add_unless() elsewhere.
  2437	 *
  2438	 * Return: @true if @v was updated, @false otherwise.
  2439	 */
  2440	static __always_inline bool
  2441	raw_atomic_add_unless(atomic_t *v, int a, int u)
  2442	{
  2443	#if defined(arch_atomic_add_unless)
  2444		return arch_atomic_add_unless(v, a, u);
  2445	#else
  2446		return raw_atomic_fetch_add_unless(v, a, u) != u;
  2447	#endif
  2448	}
  2449	
  2450	/**
  2451	 * raw_atomic_inc_not_zero() - atomic increment unless zero with full ordering
  2452	 * @v: pointer to atomic_t
  2453	 *
  2454	 * If (@v != 0), atomically updates @v to (@v + 1) with full ordering.
  2455	 *
  2456	 * Safe to use in noinstr code; prefer atomic_inc_not_zero() elsewhere.
  2457	 *
  2458	 * Return: @true if @v was updated, @false otherwise.
  2459	 */
  2460	static __always_inline bool
  2461	raw_atomic_inc_not_zero(atomic_t *v)
  2462	{
  2463	#if defined(arch_atomic_inc_not_zero)
  2464		return arch_atomic_inc_not_zero(v);
  2465	#else
  2466		return raw_atomic_add_unless(v, 1, 0);
  2467	#endif
  2468	}
  2469	
  2470	/**
  2471	 * raw_atomic_inc_unless_negative() - atomic increment unless negative with full ordering
  2472	 * @v: pointer to atomic_t
  2473	 *
  2474	 * If (@v >= 0), atomically updates @v to (@v + 1) with full ordering.
  2475	 *
  2476	 * Safe to use in noinstr code; prefer atomic_inc_unless_negative() elsewhere.
  2477	 *
  2478	 * Return: @true if @v was updated, @false otherwise.
  2479	 */
  2480	static __always_inline bool
  2481	raw_atomic_inc_unless_negative(atomic_t *v)
  2482	{
  2483	#if defined(arch_atomic_inc_unless_negative)
  2484		return arch_atomic_inc_unless_negative(v);
  2485	#else
  2486		int c = raw_atomic_read(v);
  2487	
  2488		do {
  2489			if (unlikely(c < 0))
  2490				return false;
  2491		} while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, 1)));
  2492	
  2493		return true;
  2494	#endif
  2495	}
  2496	
  2497	/**
  2498	 * raw_atomic_dec_unless_positive() - atomic decrement unless positive with full ordering
  2499	 * @v: pointer to atomic_t
  2500	 *
  2501	 * If (@v <= 0), atomically updates @v to (@v - 1) with full ordering.
  2502	 *
  2503	 * Safe to use in noinstr code; prefer atomic_dec_unless_positive() elsewhere.
  2504	 *
  2505	 * Return: @true if @v was updated, @false otherwise.
  2506	 */
  2507	static __always_inline bool
  2508	raw_atomic_dec_unless_positive(atomic_t *v)
  2509	{
  2510	#if defined(arch_atomic_dec_unless_positive)
  2511		return arch_atomic_dec_unless_positive(v);
  2512	#else
  2513		int c = raw_atomic_read(v);
  2514	
  2515		do {
  2516			if (unlikely(c > 0))
  2517				return false;
> 2518		} while (!raw_atomic_try_cmpxchg(v, &c, wrapping_sub(int, c, 1)));
  2519	
  2520		return true;
  2521	#endif
  2522	}
  2523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
