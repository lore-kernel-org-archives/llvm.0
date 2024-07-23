Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3014373B;
	Tue, 23 Jul 2024 23:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721778179; cv=none; b=RpZsaK4bApYfo+oB6nwKysplN910j3YitkgMZ1JXM/TXMglgpgrunAaiIhBCfRoWZY2W0vIITqxjSPUCKzoCSJfKYagqZDBe8oaBmTqautme51g7hlg2PrSrBgGJoR5WF753gYZpNhmqqAFhnaAV0tmrlLN9DkwC6tbxMBhHR3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721778179; c=relaxed/simple;
	bh=7YUzzdXo6LOTS/FMwL7qR6m813tbhE6vFeU5B9dD+9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxakEW6q6gcDJw1Mle7bt37519ag5naAlQJB51lRaBOgPq3lhfVEFaYc5zJn1ifKIcJsY7DdS6hifM+2nKyWVI8/ItWuzfkbkGmI2gV08ykD9j6GlB/Q/xMYsMKrVemt2R+8Dq6TlWQbgY4CLh1gw0GbdcYq0DeIeXo3QK9RVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlSarIFz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlSarIFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721778178; x=1753314178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7YUzzdXo6LOTS/FMwL7qR6m813tbhE6vFeU5B9dD+9I=;
  b=UlSarIFzbg/WBs5KjC4l3+nV6HN28aL+A/JZheQfS5vX3unGA5nT2XOd
   RQQg2B+v31DmQdziWpNmV/MVZJad/cA4kyui6PGJrYb2F0dDmsjYEjUqm
   KTaR9kD8Nkuxomi2fZCi7HAayFQrLVvCdqEocZLQdK3BIilh8VsnYv0SM
   1vNID2CmgVwf0pMmhGr/NkjVYT3zd3SGeeDci4t4uhsRUUt+Bn3RFBVtK
   ancsnWUUyajJogBIzQ3hDVrr6CEM6yd1+b8YdMAVm/T7VDIRXJ1HrkAhI
   qZ+gUbrEHmzAFY93Nz+iFDetGa06vAQIYTPileHYrt18K83WExPJcwpWN
   A==;
X-CSE-ConnectionGUID: F8G8t0IhTY+O58MzbVHzOg==
X-CSE-MsgGUID: M5PG3mwoSdSNCyS7cqbAPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19614614"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="19614614"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 16:42:57 -0700
X-CSE-ConnectionGUID: 6gIFngaPSPGF841huVhMhw==
X-CSE-MsgGUID: 52Ey9e9DRzqR36ezTgmFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="52111328"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2024 16:42:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWP9h-000mSe-1Z;
	Tue, 23 Jul 2024 23:42:53 +0000
Date: Wed, 24 Jul 2024 07:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 8/9] drm/i915/gt: Allow the user to change the CCS
 mode through sysfs
Message-ID: <202407240711.p22n6yyE-lkp@intel.com>
References: <20240723112046.123938-9-andi.shyti@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723112046.123938-9-andi.shyti@linux.intel.com>

Hi Andi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10 next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Shyti/drm-i915-gt-Refactor-uabi-engine-class-instance-list-creation/20240723-192341
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240723112046.123938-9-andi.shyti%40linux.intel.com
patch subject: [RFC PATCH 8/9] drm/i915/gt: Allow the user to change the CCS mode through sysfs
config: i386-randconfig-001-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240711.p22n6yyE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240711.p22n6yyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240711.p22n6yyE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c:79:6: warning: variable 'mode_val' set but not used [-Wunused-but-set-variable]
      79 |         u32 mode_val = 0;
         |             ^
>> drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c:185:26: warning: unused variable 'engine' [-Wunused-variable]
     185 |         struct intel_engine_cs *engine;
         |                                 ^~~~~~
>> drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c:186:23: warning: unused variable 'id' [-Wunused-variable]
     186 |         enum intel_engine_id id;
         |                              ^~
   3 warnings generated.


vim +/engine +185 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c

    75	
    76	void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode)
    77	{
    78		unsigned long cslices_mask = gt->ccs.cslice_mask;
  > 79		u32 mode_val = 0;
    80		int ccs_id;
    81		int cslice;
    82		u32 m = mode;
    83	
    84		lockdep_assert_held(&gt->ccs.mutex);
    85	
    86		if (!IS_DG2(gt->i915))
    87			return;
    88	
    89		/*
    90		 * The mode has two bit dedicated for each engine
    91		 * that will be used for the CCS balancing algorithm:
    92		 *
    93		 *    BIT | CCS slice
    94		 *   ------------------
    95		 *     0  | CCS slice
    96		 *     1  |     0
    97		 *   ------------------
    98		 *     2  | CCS slice
    99		 *     3  |     1
   100		 *   ------------------
   101		 *     4  | CCS slice
   102		 *     5  |     2
   103		 *   ------------------
   104		 *     6  | CCS slice
   105		 *     7  |     3
   106		 *   ------------------
   107		 *
   108		 * When a CCS slice is not available, then we will write 0x7,
   109		 * oterwise we will write the user engine id which load will
   110		 * be forwarded to that slice.
   111		 *
   112		 * The possible configurations are:
   113		 *
   114		 * 1 engine (ccs0):
   115		 *   slice 0, 1, 2, 3: ccs0
   116		 *
   117		 * 2 engines (ccs0, ccs1):
   118		 *   slice 0, 2: ccs0
   119		 *   slice 1, 3: ccs1
   120		 *
   121		 * 4 engines (ccs0, ccs1, ccs2, ccs3):
   122		 *   slice 0: ccs0
   123		 *   slice 1: ccs1
   124		 *   slice 2: ccs2
   125		 *   slice 3: ccs3
   126		 */
   127		ccs_id = __ffs(cslices_mask);
   128	
   129		for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
   130			if (!(cslices_mask & BIT(cslice))) {
   131				/*
   132				 * If not available, mark the slice as unavailable
   133				 * and no task will be dispatched here.
   134				 */
   135				mode_val |= XEHP_CCS_MODE_CSLICE(cslice,
   136							     XEHP_CCS_MODE_CSLICE_MASK);
   137				continue;
   138			}
   139	
   140			mode_val |= XEHP_CCS_MODE_CSLICE(cslice, ccs_id);
   141	
   142			if (!m) {
   143				m = mode;
   144				ccs_id = __ffs(cslices_mask);
   145				continue;
   146			}
   147	
   148			m--;
   149			ccs_id = find_next_bit(&cslices_mask, I915_MAX_CCS, ccs_id + 1);
   150		}
   151	
   152		gt->ccs.mode_reg_val = mode;
   153	}
   154	
   155	static ssize_t num_cslices_show(struct device *dev,
   156					struct device_attribute *attr,
   157					char *buff)
   158	{
   159		struct intel_gt *gt = kobj_to_gt(&dev->kobj);
   160		u32 num_slices;
   161	
   162		num_slices = hweight32(gt->ccs.cslice_mask);
   163	
   164		return sysfs_emit(buff, "%u\n", num_slices);
   165	}
   166	static DEVICE_ATTR_RO(num_cslices);
   167	
   168	static ssize_t ccs_mode_show(struct device *dev,
   169				     struct device_attribute *attr, char *buff)
   170	{
   171		struct intel_gt *gt = kobj_to_gt(&dev->kobj);
   172		u32 ccs_mode;
   173	
   174		ccs_mode = hweight32(CCS_MASK(gt));
   175	
   176		return sysfs_emit(buff, "%u\n", ccs_mode);
   177	}
   178	
   179	static ssize_t ccs_mode_store(struct device *dev,
   180				      struct device_attribute *attr,
   181				      const char *buff, size_t count)
   182	{
   183		struct intel_gt *gt = kobj_to_gt(&dev->kobj);
   184		int num_cslices = hweight32(gt->ccs.cslice_mask);
 > 185		struct intel_engine_cs *engine;
 > 186		enum intel_engine_id id;
   187		intel_wakeref_t wakeref;
   188		ssize_t ret;
   189		u32 val;
   190	
   191		/*
   192		 * We don't want to change the CCS
   193		 * mode while someone is using the GT
   194		 */
   195		if (intel_gt_pm_is_awake(gt))
   196			return -EBUSY;
   197	
   198		ret = kstrtou32(buff, 0, &val);
   199		if (ret)
   200			return ret;
   201	
   202		/*
   203		 * As of now possible values to be set are 1, 2, 4,
   204		 * up to the maximum number of available slices
   205		 */
   206		if ((!val) || (val > num_cslices) || (num_cslices % val))
   207			return -EINVAL;
   208	
   209		/*
   210		 * Nothing to do if the requested setting
   211		 * is the same as the current one
   212		 */
   213		if (val == hweight32(CCS_MASK(gt)))
   214			return count;
   215	
   216		/* Recreate engine exposure */
   217		intel_engines_remove_sysfs(gt->i915);
   218	
   219		mutex_lock(&gt->ccs.mutex);
   220		intel_gt_apply_ccs_mode(gt, val - 1);
   221		mutex_unlock(&gt->ccs.mutex);
   222	
   223		wakeref = intel_runtime_pm_get(gt->uncore->rpm);
   224	
   225		i915_perf_fini(gt->i915);
   226		intel_engines_release(gt);
   227		intel_engines_free(gt);
   228	
   229		mutex_lock(&gt->ccs.mutex);
   230		engine_update_mask(gt, val);
   231		mutex_unlock(&gt->ccs.mutex);
   232	
   233		intel_engines_init_mmio(gt);
   234		i915_perf_init(gt->i915);
   235		intel_engines_init(gt);
   236	
   237		gt->i915->uabi_engines = RB_ROOT;
   238		intel_engines_driver_register(gt->i915);
   239	
   240		intel_runtime_pm_put(gt->uncore->rpm, wakeref);
   241	
   242		intel_engines_add_sysfs(gt->i915);
   243	
   244		return count;
   245	}
   246	static DEVICE_ATTR_RW(ccs_mode);
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
