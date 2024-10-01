Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A931CCB36
	for <llvm@lists.linux.dev>; Tue,  1 Oct 2024 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727806608; cv=none; b=O3ZtqLh1RfbTnV0CwtNkKoev6FySYOwMRKulpmseQKThX4cvPwAJyXvX/b8OzNo6S93+pylhIRGKYXVJnFa2hbCGrxQR5cKw7LLUtBC7EB2Q3PGrJSjePLPgFWZ5g4BxfKMrzErx2V5CnAp/kbPcVYcWvtn1CCk4jaypTZttvWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727806608; c=relaxed/simple;
	bh=583aKZ9l0xQjgk1LBumhwVy9engtD/OQ9RYSzWJPy9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttAei62ofuDioEuOWDKKDK94E9mk9hgxE6dUmwT7C8972IhvNaCrj+oB9gU3kn7VuVCoSW7idoUCFp+cJcj4Wed2hwk/qTyUlFBiml21CJ7AkXE+j/FJykCNDppNIiprYNM5/lQLRtwPBbQyXO3v+OMzsKj5JK4MAfPE3vDispg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyK0qFoi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyK0qFoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D2CC4CEC6;
	Tue,  1 Oct 2024 18:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727806608;
	bh=583aKZ9l0xQjgk1LBumhwVy9engtD/OQ9RYSzWJPy9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyK0qFoif3xuIDhjbLiQaq2/stp0xjr4dDcw2q02MjoYYkvVzL5F0Try1G5+KKVE+
	 w9pItcquVjOG+ZJAjGN6eBOGcnN7Mp9gMpKpFzakAE7eETvawZwdhHX2Vi33HhKRZF
	 MSo822ZEYcE2GE44cspKghsi1FlU1AHw3vxiNNpZ3K6htGWB/S4xcBSNMVq6SJj9cP
	 ZptcC1qxwLMwnGdvfIFAO7pYmAx2HViPVNi4KWz9rDCGRk98OwxMcF14dEylqErMrB
	 M/3zUxtqVQN1n2RIJ8HecgTw5ZzVFVqWrDCdrM/al/U/FOft00ylVRSHcoLMILEpwi
	 uQjxwNIE8WIcA==
Date: Tue, 1 Oct 2024 11:16:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
	Matthew Auld <matthew.auld@intel.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v3] drm/xe: Add a xe_bo subtest for shrinking / swapping
Message-ID: <20241001181646.GA25328@thelio-3990X>
References: <20240909085654.5064-1-thomas.hellstrom@linux.intel.com>
 <20240913195649.GA61514@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913195649.GA61514@thelio-3990X>

Ping? In particular, the instance of -Wsometimes-uninitialized breaks
our CI for several configurations that enable -Werror (we don't have any
32-bit architectures with -Werror, so the other ones do not matter as
much, but should still be fixed) and that one does not show up with GCC
(even though I think it should). Should purgeable just be zero
initialized? I am happy to send a patch but I need some input on what
the correct solution is since I am unfamiliar with this code.

This is one of only two issues preventing our CI from being green on
-next, which we would usually expect after -rc1.

Cheers,
Nathan

On Fri, Sep 13, 2024 at 12:56:49PM -0700, Nathan Chancellor wrote:
> On Mon, Sep 09, 2024 at 10:56:54AM +0200, Thomas Hellström wrote:
> > Add a subtest that tries to allocate twice the amount of
> > buffer object memory available, write data to it and then read
> > all the data back verifying data integrity.
> > In order to be able to do this on systems that
> > have no or not enough swap-space available, allocate some memory
> > as purgeable, and introduce a function to purge such memory from
> > the TTM swap_notify path.
> > 
> > this test is intended to add test coverage to the current
> > bo swap path and upcoming shrinking path.
> > 
> > The test has previously been part of the xe bo shrinker series.
> > 
> > v2:
> > - Skip test if the execution time is expected to be too long.
> > - Minor code cleanups.
> > 
> > v3:
> > - Print random seed. (Matthew Auld)
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ...
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 8dac069483e8..7d3fd720478b 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> ...
> > +/*
> > + * Try to create system bos corresponding to twice the amount
> > + * of available system memory to test shrinker functionality.
> > + * If no swap space is available to accommodate the
> > + * memory overcommit, mark bos purgeable.
> > + */
> > +static int shrink_test_run_device(struct xe_device *xe)
> > +{
> > +	struct kunit *test = kunit_get_current_test();
> > +	LIST_HEAD(bos);
> > +	struct xe_bo_link *link, *next;
> > +	struct sysinfo si;
> > +	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
> > +	unsigned int interrupted = 0, successful = 0, count = 0;
> > +	struct rnd_state prng;
> > +	u64 rand_seed;
> > +	bool failed = false;
> > +
> > +	rand_seed = get_random_u64();
> > +	prandom_seed_state(&prng, rand_seed);
> > +	kunit_info(test, "Random seed is 0x%016llx.\n",
> > +		   (unsigned long long)rand_seed);
> > +
> > +	/* Skip if execution time is expected to be too long. */
> > +
> > +	limit = SZ_32G;
> > +	/* IGFX with flat CCS needs to copy when swapping / shrinking */
> > +	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
> > +		limit = SZ_16G;
> > +
> > +	si_meminfo(&si);
> > +	ram = (size_t)si.freeram * si.mem_unit;
> > +	if (ram > limit) {
> > +		kunit_skip(test, "Too long expected execution time.\n");
> > +		return 0;
> > +	}
> > +	to_alloc = ram * 2;
> > +
> > +	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
> > +	if (to_alloc > ram_and_swap)
> > +		purgeable = to_alloc - ram_and_swap;
> > +	purgeable += purgeable / 5;
> > +
> > +	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
> > +		   (unsigned long)ram);
> > +	for (alloced = 0; alloced < to_alloc; alloced += XE_BO_SHRINK_SIZE) {
> > +		struct xe_bo *bo;
> > +		unsigned int mem_type;
> > +		struct xe_ttm_tt *xe_tt;
> > +
> > +		link = kzalloc(sizeof(*link), GFP_KERNEL);
> > +		if (!link) {
> > +			KUNIT_FAIL(test, "Unexpected link allocation failure\n");
> > +			failed = true;
> > +			break;
> > +		}
> > +
> > +		INIT_LIST_HEAD(&link->link);
> > +
> > +		/* We can create bos using WC caching here. But it is slower. */
> > +		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
> > +				       DRM_XE_GEM_CPU_CACHING_WB,
> > +				       XE_BO_FLAG_SYSTEM);
> > +		if (IS_ERR(bo)) {
> > +			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
> > +			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
> > +				KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
> > +			kfree(link);
> > +			failed = true;
> > +			break;
> > +		}
> > +		xe_bo_lock(bo, false);
> > +		xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
> > +
> > +		/*
> > +		 * Allocate purgeable bos first, because if we do it the
> > +		 * other way around, they may not be subject to swapping...
> > +		 */
> > +		if (alloced < purgeable) {
> > +			xe_tt->purgeable = true;
> > +			bo->ttm.priority = 0;
> > +		} else {
> > +			int ret = shrink_test_fill_random(bo, &prng, link);
> > +
> > +			if (ret) {
> > +				xe_bo_unlock(bo);
> > +				xe_bo_put(bo);
> > +				KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
> > +					   ERR_PTR(ret));
> > +				kfree(link);
> > +				failed = true;
> > +				break;
> > +			}
> > +		}
> > +
> > +		mem_type = bo->ttm.resource->mem_type;
> > +		xe_bo_unlock(bo);
> > +		link->bo = bo;
> > +		list_add_tail(&link->link, &bos);
> > +
> > +		if (mem_type != XE_PL_TT) {
> > +			KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
> > +				   bo->ttm.resource->mem_type);
> > +			failed = true;
> > +		}
> > +		cond_resched();
> > +		if (signal_pending(current))
> > +			break;
> > +	}
> 
> This function introduces three warnings with clang:
> 
>   $ make -skj"$(nproc)" ARCH=i386 LLVM=1 allmodconfig drivers/gpu/drm/xe/xe_bo.o
>   ...
>   In file included from drivers/gpu/drm/xe/xe_bo.c:2406:
>   drivers/gpu/drm/xe/tests/xe_bo.c:456:10: error: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 34359738368 to 0 [-Werror,-Wconstant-conversion]
>     456 |         limit = SZ_32G;
>         |               ~ ^~~~~~
>   include/linux/sizes.h:49:19: note: expanded from macro 'SZ_32G'
>      49 | #define SZ_32G                          _AC(0x800000000, ULL)
>         |                                         ^~~~~~~~~~~~~~~~~~~~~
>   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
>      21 | #define _AC(X,Y)        __AC(X,Y)
>         |                         ^~~~~~~~~
>   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
>      20 | #define __AC(X,Y)       (X##Y)
>         |                          ^~~~
>   <scratch space>:31:1: note: expanded from here
>      31 | 0x800000000ULL
>         | ^~~~~~~~~~~~~~
>   In file included from drivers/gpu/drm/xe/xe_bo.c:2406:
>   drivers/gpu/drm/xe/tests/xe_bo.c:459:11: error: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 17179869184 to 0 [-Werror,-Wconstant-conversion]
>     459 |                 limit = SZ_16G;
>         |                       ~ ^~~~~~
>   include/linux/sizes.h:48:19: note: expanded from macro 'SZ_16G'
>      48 | #define SZ_16G                          _AC(0x400000000, ULL)
>         |                                         ^~~~~~~~~~~~~~~~~~~~~
>   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
>      21 | #define _AC(X,Y)        __AC(X,Y)
>         |                         ^~~~~~~~~
>   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
>      20 | #define __AC(X,Y)       (X##Y)
>         |                          ^~~~
>   <scratch space>:32:1: note: expanded from here
>      32 | 0x400000000ULL
>         | ^~~~~~~~~~~~~~
>   In file included from drivers/gpu/drm/xe/xe_bo.c:2406:
>   drivers/gpu/drm/xe/tests/xe_bo.c:470:6: error: variable 'purgeable' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     470 |         if (to_alloc > ram_and_swap)
>         |             ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/xe/tests/xe_bo.c:472:2: note: uninitialized use occurs here
>     472 |         purgeable += purgeable / 5;
>         |         ^~~~~~~~~
>   drivers/gpu/drm/xe/tests/xe_bo.c:470:2: note: remove the 'if' if its condition is always true
>     470 |         if (to_alloc > ram_and_swap)
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     471 |                 purgeable = to_alloc - ram_and_swap;
>   drivers/gpu/drm/xe/tests/xe_bo.c:443:37: note: initialize the variable 'purgeable' to silence this warning
>     443 |         size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
>         |                                            ^
>         |                                             = 0
>   3 errors generated.
> 
> I tried to make GCC show the same warnings with an explicit
> -Wmaybe-uninitialized but only the overflow warnings show up (is
> purgeable always set because of the if condition?):
> 
>   $ make -skj"$(nproc)" ARCH=i386 CROSS_COMPILE=i386-linux- KCFLAGS=-Wmaybe-uninitialized allmodconfig drivers/gpu/drm/xe/xe_bo.o
>   In file included from include/vdso/const.h:5,
>                    from include/linux/const.h:4,
>                    from include/linux/bits.h:5,
>                    from include/linux/ratelimit_types.h:5,
>                    from include/linux/printk.h:9,
>                    from include/asm-generic/bug.h:22,
>                    from arch/x86/include/asm/bug.h:99,
>                    from include/linux/bug.h:5,
>                    from include/linux/mmdebug.h:5,
>                    from include/linux/mm.h:6,
>                    from include/linux/pagemap.h:8,
>                    from include/drm/ttm/ttm_tt.h:30,
>                    from drivers/gpu/drm/xe/xe_bo.h:9,
>                    from drivers/gpu/drm/xe/xe_bo.c:6:
>   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
>   include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '34359738368' to '0' [-Werror=overflow]
>      20 | #define __AC(X,Y)       (X##Y)
>         |                         ^
>   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
>      21 | #define _AC(X,Y)        __AC(X,Y)
>         |                         ^~~~
>   include/linux/sizes.h:49:41: note: in expansion of macro '_AC'
>      49 | #define SZ_32G                          _AC(0x800000000, ULL)
>         |                                         ^~~
>   drivers/gpu/drm/xe/tests/xe_bo.c:456:17: note: in expansion of macro 'SZ_32G'
>     456 |         limit = SZ_32G;
>         |                 ^~~~~~
>   include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '17179869184' to '0' [-Werror=overflow]
>      20 | #define __AC(X,Y)       (X##Y)
>         |                         ^
>   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
>      21 | #define _AC(X,Y)        __AC(X,Y)
>         |                         ^~~~
>   include/linux/sizes.h:48:41: note: in expansion of macro '_AC'
>      48 | #define SZ_16G                          _AC(0x400000000, ULL)
>         |                                         ^~~
>   drivers/gpu/drm/xe/tests/xe_bo.c:459:25: note: in expansion of macro 'SZ_16G'
>     459 |                 limit = SZ_16G;
>         |                         ^~~~~~
>   cc1: all warnings being treated as errors
