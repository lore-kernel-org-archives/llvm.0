Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E618D;
	Sun, 15 Sep 2024 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726359269; cv=none; b=sxj9FhE0VmJNfsAUp2TNJXwkB6B1/HV2Os+dO9jotGFa9eWoQmcJFpXrCNlCBKtWUYuMwOZ8thlEfnqKd9ejxaQuY82zbJ67cUuBunpEwl4/PlO+64qLcmG+Xyu4xNG/FfivzQ92l2KmlY8+mva447so7VhjRpo2Cy8t9xQ+oTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726359269; c=relaxed/simple;
	bh=OajOtESybW1GqmzxdoWrg1NXJ0MqAYNmE9gFxiELiQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XF+fqdhAlzA0y5UEpgl9IH7mLL6RFHcSx2EpaFKbmbwkH0UvONnp0/7DM7PhQekiEYVGAXZmC4bzMW73vTQ33LkJlDLeH8U0CGmwRlyKq0e3Rwsh0Guc5cCaQ43uhF6Mk1sxFc9Rt1ITuoFnvaUpS04rn8oiWvK+Hh10V0xYE0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZQJsNRL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZQJsNRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726359266; x=1757895266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OajOtESybW1GqmzxdoWrg1NXJ0MqAYNmE9gFxiELiQQ=;
  b=AZQJsNRLI2jbrl2+iCJ1nXSw+AT5bwKWxeWns/1oaPFqgBshbunQHOvf
   CtWGo+W8iqWK3dHfiEqn5S73nd80/RLZ44i0GUv97hdcvoelIQtDvQZwH
   4GVoMzSjCZS1sC/o9AOannUXLOlv/88l6bRckN3KdkoE9+GUZN5eoUY/b
   9DXgi1m/+/5eWovbKNKB+CTf5iFbqBpWSLETEaQAMRAPxg8TuqNwu6nPx
   ArRe35Z7JlZLgqzlKV5UqYSSUJuvAe68MJ080UwxuAlevsMpjtq2eCyoo
   t7nooazBSwREVMN38tNcBGQUhn3jHqpG7aHU6C2Dsvd+Id7HaGJCh32EQ
   w==;
X-CSE-ConnectionGUID: QO9hIm3+Sg+fpX0kinESrw==
X-CSE-MsgGUID: p/p/6eoFQiObnapQxuO8mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25433736"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="25433736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 17:14:26 -0700
X-CSE-ConnectionGUID: 0mFmPP99Tvq3HGa0xyVGGg==
X-CSE-MsgGUID: 5p8wgZtfQQuINlRGCBo/dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="99170395"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 17:14:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spcuD-0008Go-2y;
	Sun, 15 Sep 2024 00:14:21 +0000
Date: Sun, 15 Sep 2024 08:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [linux-next:master 11040/11962]
 drivers/gpu/drm/xe/tests/xe_bo.c:456:10: error: implicit conversion from
 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from
 34359738368 to 0
Message-ID: <202409150832.VygUI9CQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
commit: 5a90b60db5e6765367d9bb2c03f66b14d72946d2 [11040/11962] drm/xe: Add a xe_bo subtest for shrinking / swapping
config: i386-randconfig-003-20240915 (https://download.01.org/0day-ci/archive/20240915/202409150832.VygUI9CQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150832.VygUI9CQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150832.VygUI9CQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_bo.c:2399:
>> drivers/gpu/drm/xe/tests/xe_bo.c:456:10: error: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 34359738368 to 0 [-Werror,-Wconstant-conversion]
     456 |         limit = SZ_32G;
         |               ~ ^~~~~~
   include/linux/sizes.h:49:19: note: expanded from macro 'SZ_32G'
      49 | #define SZ_32G                          _AC(0x800000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:155:1: note: expanded from here
     155 | 0x800000000ULL
         | ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:2399:
   drivers/gpu/drm/xe/tests/xe_bo.c:459:11: error: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 17179869184 to 0 [-Werror,-Wconstant-conversion]
     459 |                 limit = SZ_16G;
         |                       ~ ^~~~~~
   include/linux/sizes.h:48:19: note: expanded from macro 'SZ_16G'
      48 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:156:1: note: expanded from here
     156 | 0x400000000ULL
         | ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:2399:
>> drivers/gpu/drm/xe/tests/xe_bo.c:470:6: error: variable 'purgeable' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
     470 |         if (to_alloc > ram_and_swap)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:472:2: note: uninitialized use occurs here
     472 |         purgeable += purgeable / 5;
         |         ^~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:470:2: note: remove the 'if' if its condition is always true
     470 |         if (to_alloc > ram_and_swap)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     471 |                 purgeable = to_alloc - ram_and_swap;
   drivers/gpu/drm/xe/tests/xe_bo.c:443:37: note: initialize the variable 'purgeable' to silence this warning
     443 |         size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
         |                                            ^
         |                                             = 0
   3 errors generated.


vim +456 drivers/gpu/drm/xe/tests/xe_bo.c

   430	
   431	/*
   432	 * Try to create system bos corresponding to twice the amount
   433	 * of available system memory to test shrinker functionality.
   434	 * If no swap space is available to accommodate the
   435	 * memory overcommit, mark bos purgeable.
   436	 */
   437	static int shrink_test_run_device(struct xe_device *xe)
   438	{
   439		struct kunit *test = kunit_get_current_test();
   440		LIST_HEAD(bos);
   441		struct xe_bo_link *link, *next;
   442		struct sysinfo si;
   443		size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
   444		unsigned int interrupted = 0, successful = 0, count = 0;
   445		struct rnd_state prng;
   446		u64 rand_seed;
   447		bool failed = false;
   448	
   449		rand_seed = get_random_u64();
   450		prandom_seed_state(&prng, rand_seed);
   451		kunit_info(test, "Random seed is 0x%016llx.\n",
   452			   (unsigned long long)rand_seed);
   453	
   454		/* Skip if execution time is expected to be too long. */
   455	
 > 456		limit = SZ_32G;
   457		/* IGFX with flat CCS needs to copy when swapping / shrinking */
   458		if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
   459			limit = SZ_16G;
   460	
   461		si_meminfo(&si);
   462		ram = (size_t)si.freeram * si.mem_unit;
   463		if (ram > limit) {
   464			kunit_skip(test, "Too long expected execution time.\n");
   465			return 0;
   466		}
   467		to_alloc = ram * 2;
   468	
   469		ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
 > 470		if (to_alloc > ram_and_swap)
   471			purgeable = to_alloc - ram_and_swap;
   472		purgeable += purgeable / 5;
   473	
   474		kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
   475			   (unsigned long)ram);
   476		for (alloced = 0; alloced < to_alloc; alloced += XE_BO_SHRINK_SIZE) {
   477			struct xe_bo *bo;
   478			unsigned int mem_type;
   479			struct xe_ttm_tt *xe_tt;
   480	
   481			link = kzalloc(sizeof(*link), GFP_KERNEL);
   482			if (!link) {
   483				KUNIT_FAIL(test, "Unexpected link allocation failure\n");
   484				failed = true;
   485				break;
   486			}
   487	
   488			INIT_LIST_HEAD(&link->link);
   489	
   490			/* We can create bos using WC caching here. But it is slower. */
   491			bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
   492					       DRM_XE_GEM_CPU_CACHING_WB,
   493					       XE_BO_FLAG_SYSTEM);
   494			if (IS_ERR(bo)) {
   495				if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
   496				    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
   497					KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
   498				kfree(link);
   499				failed = true;
   500				break;
   501			}
   502			xe_bo_lock(bo, false);
   503			xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   504	
   505			/*
   506			 * Allocate purgeable bos first, because if we do it the
   507			 * other way around, they may not be subject to swapping...
   508			 */
   509			if (alloced < purgeable) {
   510				xe_tt->purgeable = true;
   511				bo->ttm.priority = 0;
   512			} else {
   513				int ret = shrink_test_fill_random(bo, &prng, link);
   514	
   515				if (ret) {
   516					xe_bo_unlock(bo);
   517					xe_bo_put(bo);
   518					KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
   519						   ERR_PTR(ret));
   520					kfree(link);
   521					failed = true;
   522					break;
   523				}
   524			}
   525	
   526			mem_type = bo->ttm.resource->mem_type;
   527			xe_bo_unlock(bo);
   528			link->bo = bo;
   529			list_add_tail(&link->link, &bos);
   530	
   531			if (mem_type != XE_PL_TT) {
   532				KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
   533					   bo->ttm.resource->mem_type);
   534				failed = true;
   535			}
   536			cond_resched();
   537			if (signal_pending(current))
   538				break;
   539		}
   540	
   541		/*
   542		 * Read back and destroy bos. Reset the pseudo-random seed to get an
   543		 * identical pseudo-random number sequence for readback.
   544		 */
   545		prandom_seed_state(&prng, rand_seed);
   546		list_for_each_entry_safe(link, next, &bos, link) {
   547			static struct ttm_operation_ctx ctx = {.interruptible = true};
   548			struct xe_bo *bo = link->bo;
   549			struct xe_ttm_tt *xe_tt;
   550			int ret;
   551	
   552			count++;
   553			if (!signal_pending(current) && !failed) {
   554				bool purgeable, intr = false;
   555	
   556				xe_bo_lock(bo, NULL);
   557	
   558				/* xe_tt->purgeable is cleared on validate. */
   559				xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   560				purgeable = xe_tt->purgeable;
   561				do {
   562					ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
   563					if (ret == -EINTR)
   564						intr = true;
   565				} while (ret == -EINTR && !signal_pending(current));
   566	
   567				if (!ret && !purgeable)
   568					failed = shrink_test_verify(test, bo, count, &prng, link);
   569	
   570				xe_bo_unlock(bo);
   571				if (ret) {
   572					KUNIT_FAIL(test, "Validation failed: %pe\n",
   573						   ERR_PTR(ret));
   574					failed = true;
   575				} else if (intr) {
   576					interrupted++;
   577				} else {
   578					successful++;
   579				}
   580			}
   581			xe_bo_put(link->bo);
   582			list_del(&link->link);
   583			kfree(link);
   584		}
   585		kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
   586			   interrupted, successful);
   587	
   588		return 0;
   589	}
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
