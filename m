Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91C6AA5;
	Thu,  7 Sep 2023 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694093889; x=1725629889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aXAGRS+BSVhyH7CA7dsgLIrt3pJUQ9obpeCmwNHacWo=;
  b=PJCEG+1ami9qs2VzwFrnpqXRA8WjGWrUACaF/QX+gN8d8jjhE4XyCzYr
   Vfqq6b042boHc1ezDKeZQQ16t1hLtpZ1gGmfGZZkZ21Jmj9PB9/UKzWwH
   YccXMoWXV4xDSbqb5i5qeq+Q9m9yH1U1hRRjrxYbxaAvIpRp8gx9XadH7
   cjW7Kqw8s3xPYW/gcbdW2GNZEsCDZwRY7355lBXucMsvzHEwUXpJ6NM9y
   x//rNXIcBF4ghlT+zEncSaqlkbyDm8aLOvYvVkx67B1NH1o7pkJ0Yr7iA
   w2nu8xZjlJvJ7GyBtNtN2W0kmuLXXrRo2rnSoblQwnBakcI8qFHrqMJ3/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="408354868"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="408354868"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 06:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="885157066"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="885157066"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2023 06:37:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeFCt-0001G9-1m;
	Thu, 07 Sep 2023 13:38:03 +0000
Date: Thu, 7 Sep 2023 21:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Run relevant bits of debugfs
 drop_caches per GT
Message-ID: <202309072112.hlih7zXW-lkp@intel.com>
References: <20230907101135.176326-1-andi.shyti@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907101135.176326-1-andi.shyti@linux.intel.com>

Hi Andi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Shyti/drm-i915-Run-relevant-bits-of-debugfs-drop_caches-per-GT/20230907-181322
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230907101135.176326-1-andi.shyti%40linux.intel.com
patch subject: [Intel-gfx] [PATCH v2] drm/i915: Run relevant bits of debugfs drop_caches per GT
config: x86_64-buildonly-randconfig-003-20230907 (https://download.01.org/0day-ci/archive/20230907/202309072112.hlih7zXW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072112.hlih7zXW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072112.hlih7zXW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_debugfs.c:751:2: warning: ordered comparison between pointer and integer ('struct intel_gt *' and 'int')
           for_each_gt(i915, i, gt) {
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gt.h:170:14: note: expanded from macro 'for_each_gt'
                (id__) < I915_MAX_GT; \
                ~~~~~~ ^ ~~~~~~~~~~~
>> drivers/gpu/drm/i915/i915_debugfs.c:751:2: error: member reference type 'unsigned int' is not a pointer
           for_each_gt(i915, i, gt) {
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gt.h:172:35: note: expanded from macro 'for_each_gt'
                   for_each_if(((gt__) = (i915__)->gt[(id__)]))
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/drm/drm_util.h:63:38: note: expanded from macro 'for_each_if'
   #define for_each_if(condition) if (!(condition)) {} else
                                        ^~~~~~~~~
>> drivers/gpu/drm/i915/i915_debugfs.c:751:2: error: array subscript is not an integer
           for_each_gt(i915, i, gt) {
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gt.h:172:37: note: expanded from macro 'for_each_gt'
                   for_each_if(((gt__) = (i915__)->gt[(id__)]))
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/drm/drm_util.h:63:38: note: expanded from macro 'for_each_if'
   #define for_each_if(condition) if (!(condition)) {} else
                                        ^~~~~~~~~
   1 warning and 2 errors generated.


vim +751 drivers/gpu/drm/i915/i915_debugfs.c

   738	
   739	static int
   740	i915_drop_caches_set(void *data, u64 val)
   741	{
   742		struct drm_i915_private *i915 = data;
   743		struct intel_gt *gt;
   744		unsigned int flags;
   745		unsigned int i;
   746		int ret;
   747	
   748		drm_dbg(&i915->drm, "Dropping caches: 0x%08llx [0x%08llx]\n",
   749			val, val & DROP_ALL);
   750	
 > 751		for_each_gt(i915, i, gt) {
   752			ret = gt_drop_caches(gt, val);
   753			if (ret)
   754				return ret;
   755		}
   756	
   757		fs_reclaim_acquire(GFP_KERNEL);
   758		flags = memalloc_noreclaim_save();
   759		if (val & DROP_BOUND)
   760			i915_gem_shrink(NULL, i915, LONG_MAX, NULL, I915_SHRINK_BOUND);
   761	
   762		if (val & DROP_UNBOUND)
   763			i915_gem_shrink(NULL, i915, LONG_MAX, NULL, I915_SHRINK_UNBOUND);
   764	
   765		if (val & DROP_SHRINK_ALL)
   766			i915_gem_shrink_all(i915);
   767		memalloc_noreclaim_restore(flags);
   768		fs_reclaim_release(GFP_KERNEL);
   769	
   770		if (val & DROP_RCU)
   771			rcu_barrier();
   772	
   773		if (val & DROP_FREED)
   774			i915_gem_drain_freed_objects(i915);
   775	
   776		return 0;
   777	}
   778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
