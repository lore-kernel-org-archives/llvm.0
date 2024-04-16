Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB92679ED;
	Tue, 16 Apr 2024 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713303196; cv=none; b=rvKaCcKZL4i9Z2iqEnbDH9c+yQKu00EuK/yxK2+BSE1EPcHad9vAbC2B9Z4WYV9I0iDHSqRIqUEQJtleI6GYcRMJdzJ53f05dH3trBNWRHL0ZjOx1icNm2ne/0dxGxMj+QdSs5EqsuCyBALrslleP2YU+NYLq5/Bmy9kT6Asy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713303196; c=relaxed/simple;
	bh=6Tgoow+FueyN5t2+VgpEknGsIkLM75WRJwiGL8lZLbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdjvTDigfKcjiF5ZrzK3PDTE9mQGCGM7xWScTKfnB1nyoywgxLVPwulTn0KemJdNpShek55aRsvpNwQhLdmlrPodTN/4WaVbuXP89ehiFysZMw9YQYPeQgvFP6NWoRSYOnXc8cwPYqHHoBOZ2UDH4gQ57WTDQDy5z9wy6VQ12qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbzNY/34; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbzNY/34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713303195; x=1744839195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Tgoow+FueyN5t2+VgpEknGsIkLM75WRJwiGL8lZLbA=;
  b=FbzNY/34ztD1fRnteS0USLpZAEbN0/gf1mypRze1Pkr6c0mApaSee4VH
   wV/AHc4jZ5AzvX4u8UzvlvqIXYvzThz9EYqLYSFdpeEmqyi57R9uKBz91
   h9gSWJCTmpXhXMwdazUxwm/b+P6+D8msxI+WtSq4Qzw/hLpKzNoNmHbDX
   tPpYXQLUjH3MOcZqTov4bwo0yu6EFHOBRwEx6LSRj4/aZvh1R1XVuFwz8
   bEnFeuIGMrBZomnjjGxHcZd/pg7zDtmadbhdWnCN7A9OFO6YvBj5jk6s3
   mxamxXg4MFnpMBcD1vRHeIx8AITFO0EWEwii4edPH/l9+XX76NFuG2vbP
   A==;
X-CSE-ConnectionGUID: gpHLSyQMSAmLwb7VvMkF1A==
X-CSE-MsgGUID: aC7Brem4TY2LS+U1cli8Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9323481"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="9323481"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 14:33:14 -0700
X-CSE-ConnectionGUID: r2CQ5yXLT56VjqDn/dWDHQ==
X-CSE-MsgGUID: PYRHf5MgRDy2Ujy7h9zRWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22985223"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2024 14:33:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwqQP-0005lF-2L;
	Tue, 16 Apr 2024 21:33:09 +0000
Date: Wed, 17 Apr 2024 05:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 9/9] drm/xe: Add a shrinker for xe bos
Message-ID: <202404170528.tBjGQKCR-lkp@intel.com>
References: <20240416100730.6666-10-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416100730.6666-10-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc4 next-20240416]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240416-181717
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240416100730.6666-10-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 9/9] drm/xe: Add a shrinker for xe bos
config: i386-buildonly-randconfig-001-20240417 (https://download.01.org/0day-ci/archive/20240417/202404170528.tBjGQKCR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170528.tBjGQKCR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170528.tBjGQKCR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_bo.c:2420:
>> drivers/gpu/drm/xe/tests/xe_bo.c:382:6: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     381 |         kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |                                       ~~~
         |                                       %zu
     382 |                    total);
         |                    ^~~~~
   include/kunit/test.h:546:39: note: expanded from macro 'kunit_info'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   include/kunit/test.h:534:21: note: expanded from macro 'kunit_printk'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |                                                            ~~~
     534 |                   (test)->name, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/kunit/test.h:527:21: note: expanded from macro 'kunit_log'
     527 |                 printk(lvl fmt, ##__VA_ARGS__);                         \
         |                            ~~~    ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:2420:
>> drivers/gpu/drm/xe/tests/xe_bo.c:382:6: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     381 |         kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |                                       ~~~
         |                                       %zu
     382 |                    total);
         |                    ^~~~~
   include/kunit/test.h:546:39: note: expanded from macro 'kunit_info'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   include/kunit/test.h:534:21: note: expanded from macro 'kunit_printk'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |                                                            ~~~
     534 |                   (test)->name, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/kunit/test.h:529:8: note: expanded from macro 'kunit_log'
     528 |                 kunit_log_append((test_or_suite)->log,  fmt,            \
         |                                                         ~~~
     529 |                                  ##__VA_ARGS__);                        \
         |                                    ^~~~~~~~~~~
   2 warnings generated.


vim +382 drivers/gpu/drm/xe/tests/xe_bo.c

   362	
   363	/*
   364	 * Try to create system bos corresponding to twice the amount
   365	 * of available system memory to test shrinker functionality.
   366	 * If no swap space is available to accommodate the
   367	 * memory overcommit, mark bos purgeable.
   368	 */
   369	static int shrink_test_run_device(struct xe_device *xe)
   370	{
   371		struct kunit *test = xe_cur_kunit();
   372		LIST_HEAD(bos);
   373		struct xe_bo_link *link, *next;
   374		struct sysinfo si;
   375		size_t total, alloced;
   376		unsigned int interrupted = 0, successful = 0;
   377	
   378		si_meminfo(&si);
   379		total = si.freeram * si.mem_unit;
   380	
   381		kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
 > 382			   total);
   383	
   384		total <<= 1;
   385		for (alloced = 0; alloced < total ; alloced += XE_BO_SHRINK_SIZE) {
   386			struct xe_bo *bo;
   387			unsigned int mem_type;
   388	
   389			link = kzalloc(sizeof(*link), GFP_KERNEL);
   390			if (!link) {
   391				KUNIT_FAIL(test, "Unexpeced link allocation failure\n");
   392				break;
   393			}
   394	
   395			INIT_LIST_HEAD(&link->link);
   396	
   397			/* We can create bos using WC caching here. But it is slower. */
   398			bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
   399					       DRM_XE_GEM_CPU_CACHING_WB,
   400					       ttm_bo_type_device,
   401					       XE_BO_FLAG_SYSTEM);
   402			if (IS_ERR(bo)) {
   403				if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
   404				    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
   405					KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
   406				kfree(link);
   407				break;
   408			}
   409			link->bo = bo;
   410			list_add_tail(&link->link, &bos);
   411			xe_bo_lock(bo, false);
   412	
   413			/*
   414			 * If we're low on swap entries, we can't shrink unless the bo
   415			 * is marked purgeable.
   416			 */
   417			if (get_nr_swap_pages() < (XE_BO_SHRINK_SIZE >> PAGE_SHIFT) * 128) {
   418				struct xe_ttm_tt *xe_tt =
   419					container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   420				long num_pages = xe_tt->ttm.num_pages;
   421	
   422				xe_tt->purgeable = true;
   423				xe_shrinker_mod_pages(xe->mem.shrinker, -num_pages,
   424						      num_pages);
   425			}
   426	
   427			mem_type = bo->ttm.resource->mem_type;
   428			xe_bo_unlock(bo);
   429			if (mem_type != XE_PL_TT)
   430				KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
   431					   bo->ttm.resource->mem_type);
   432			cond_resched();
   433			if (signal_pending(current))
   434				break;
   435		}
   436	
   437		/* Read back and destroy bos */
   438		list_for_each_entry_safe_reverse(link, next, &bos, link) {
   439			static struct ttm_operation_ctx ctx = {.interruptible = true};
   440			struct xe_bo *bo = link->bo;
   441			int ret;
   442	
   443			if (!signal_pending(current)) {
   444				xe_bo_lock(bo, NULL);
   445				ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
   446				xe_bo_unlock(bo);
   447				if (ret && ret != -EINTR)
   448					KUNIT_FAIL(test, "Validation failed: %pe\n",
   449						   ERR_PTR(ret));
   450				else if (ret)
   451					interrupted++;
   452				else
   453					successful++;
   454			}
   455			xe_bo_put(link->bo);
   456			list_del(&link->link);
   457			kfree(link);
   458			cond_resched();
   459		}
   460		kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
   461			   interrupted, successful);
   462	
   463		return 0;
   464	}
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
