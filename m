Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353001CD13;
	Wed,  7 Feb 2024 05:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707282342; cv=none; b=DNIfxxbSOh3QXkUWz9jgJECNWTEPyZGfuHdDfVgxRSdipo6EedUUNgVUzpn5RVCyMnLp6o59DN6nfkOWjM3y3YEb5qx8d2ojF5tVdwxHS9PnK/KjPgW3mGAqCRscw3kHA0IU23lD2BU9X+7MuM+0bpX6l/TqRfA5P2Oe766yHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707282342; c=relaxed/simple;
	bh=cgGCkJB0Kf1y1VxVX3oe5UMXNHdjH7m/vPAUidkVj5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtT7oV8ZZSa+MK/XeWjkvm5qG+TN2uIWLVDNLeHPXPUGCZLRzyNN4OmsHXVYmHBxl6BK+vu9HsG+vlTC20UdgadY4v/eS9wNKv8Ql65nr8hfWk64yfbMT8YPBB4uBnqEyCje9As+xGEokboTbzIV4OeV5b9fLdxkyXUKqOcuzuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khxyUZll; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khxyUZll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707282341; x=1738818341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgGCkJB0Kf1y1VxVX3oe5UMXNHdjH7m/vPAUidkVj5Y=;
  b=khxyUZllvXowMdk3QD9YvQujB2JtFHTEZ7Gwv9sDdfgF3uUBuunYhB3c
   vp6D+C1QoMM9SkVc1m9RNwIW4lQRNW/UawGhaOCVfncSs+phHUAEzQ8bC
   jJwu91GiidNfboT9MLZDeaNKzBL+xM6QDDGqNGNoa9hAwJbOTyIbN9O4s
   T7ZPvLOETqGO84ajfanzymNoA/JPfdb90PsmjdVehSE1mRwJJDB8rU4x/
   4oDl7OPCwKQiCZFnmWt3PrY0MsnGPVrat6IPDlXpBfG9+ddTYIBwi4lFt
   MHK9Ax1EMxCnQVd1ZEtumimgwn4Mx+A4dkq7JNiCtnTOt6wIGjkX/g9uZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23389787"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="23389787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 21:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="6001417"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2024 21:05:38 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXa7s-0002Dw-0o;
	Wed, 07 Feb 2024 05:05:36 +0000
Date: Wed, 7 Feb 2024 13:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/signed-sanitizer 22/23]
 include/linux/atomic/atomic-arch-fallback.h:2491:42: error: implicit
 declaration of function 'wrapping_add' is invalid in C99
Message-ID: <202402071216.dMdA1Ngr-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240207/202402071216.dMdA1Ngr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071216.dMdA1Ngr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071216.dMdA1Ngr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:68:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:2491:42: error: implicit declaration of function 'wrapping_add' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, 1)));
                                                   ^
   include/linux/atomic/atomic-arch-fallback.h:2491:55: error: expected expression
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, 1)));
                                                                ^
>> include/linux/atomic/atomic-arch-fallback.h:2518:42: error: implicit declaration of function 'wrapping_sub' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_sub(int, c, 1)));
                                                   ^
   include/linux/atomic/atomic-arch-fallback.h:2518:55: error: expected expression
           } while (!raw_atomic_try_cmpxchg(v, &c, wrapping_sub(int, c, 1)));
                                                                ^
   include/linux/atomic/atomic-arch-fallback.h:2543:9: error: implicit declaration of function 'wrapping_sub' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   dec = wrapping_sub(int, c, 1);
                         ^
   include/linux/atomic/atomic-arch-fallback.h:2543:22: error: expected expression
                   dec = wrapping_sub(int, c, 1);
                                      ^
   include/linux/atomic/atomic-arch-fallback.h:4603:44: error: implicit declaration of function 'wrapping_add' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_add(s64, c, 1)));
                                                     ^
   include/linux/atomic/atomic-arch-fallback.h:4603:57: error: unexpected type name 's64': expected expression
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_add(s64, c, 1)));
                                                                  ^
   include/linux/atomic/atomic-arch-fallback.h:4630:44: error: implicit declaration of function 'wrapping_sub' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_sub(s64, c, 1)));
                                                     ^
   include/linux/atomic/atomic-arch-fallback.h:4630:57: error: unexpected type name 's64': expected expression
           } while (!raw_atomic64_try_cmpxchg(v, &c, wrapping_sub(s64, c, 1)));
                                                                  ^
   10 errors generated.
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/wrapping_add +2491 include/linux/atomic/atomic-arch-fallback.h

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
> 2491		} while (!raw_atomic_try_cmpxchg(v, &c, wrapping_add(int, c, 1)));
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
