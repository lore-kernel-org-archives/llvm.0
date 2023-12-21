Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2046438;
	Thu, 21 Dec 2023 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVJIZE30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703170579; x=1734706579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEGxqhJl2obb8Fkb8BBo1oVvSmtQSpwV1fD4sRn6M4E=;
  b=LVJIZE30QxwcYiWOF+4Jr8lOqU5jRVrT6WWzMJ+yti3gx5ThHLYGUkVH
   UZeHPASBQ08Vb8dya/kY4Z65CpgAby3Rhs3CC8Egl7xo0finNPsSP2tCu
   dPHOLzmELsdVznnZ4jUa5levbTpIsJYMnBYB2QjI26Nk9HX+Zj5jp9TeD
   I1JUXazNERjMJ+uCQ1692dmdHfkA77g+LU/rU66zu0jjC3/PeeOfFzFBY
   qKsVCyFtCBxnhmyGXx4GSVE86FI1ZiBeBYKPaFF5WdkRz7usC60kCL5ON
   haxezy1NY4epLXTaazMWuHyUiVcLVVLKH+HmHTcVpQjMwzpK6OzdcBQzM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="14666976"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="14666976"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 06:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="780211445"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="780211445"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Dec 2023 06:56:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGKT5-0008Q1-0l;
	Thu, 21 Dec 2023 14:56:12 +0000
Date: Thu, 21 Dec 2023 22:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 69/110]
 drivers/platform/mpam/mpam_devices.c:244:17: warning: result of comparison
 of constant 18446744073709551615 with expression of type 'u32' (aka
 'unsigned int') is always false
Message-ID: <202312212255.Yo4L0DZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: 5a666c3b177c179161ce86a695d62d3019f83a58 [69/110] arm_mpam: Add the class and component structures for ris firmware described
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231221/202312212255.Yo4L0DZV-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7022a24771c8404f847abb226735a3ae21794426)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312212255.Yo4L0DZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312212255.Yo4L0DZV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/mpam/mpam_devices.c:244:17: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     244 |                         if (cache_id == ~0UL) {
         |                             ~~~~~~~~ ^  ~~~~
   drivers/platform/mpam/mpam_devices.c:565:24: error: no member named 'mon_sel_lock' in 'struct mpam_msc'; did you mean 'part_sel_lock'?
     565 |                 spin_lock_init(&msc->mon_sel_lock);
         |                                      ^~~~~~~~~~~~
         |                                      part_sel_lock
   include/linux/spinlock.h:335:38: note: expanded from macro 'spin_lock_init'
     335 |         __raw_spin_lock_init(spinlock_check(lock),              \
         |                                             ^
   drivers/platform/mpam/mpam_internal.h:44:14: note: 'part_sel_lock' declared here
      44 |         spinlock_t              part_sel_lock;
         |                                 ^
   1 warning and 1 error generated.


vim +244 drivers/platform/mpam/mpam_devices.c

   208	
   209	/*
   210	 * The cacheinfo structures are only populated when CPUs are online.
   211	 * This helper walks the device tree to include offline CPUs too.
   212	 */
   213	static int get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
   214					     cpumask_t *affinity)
   215	{
   216		int cpu, err;
   217		u32 iter_level;
   218		int iter_cache_id;
   219		struct device_node *iter;
   220	
   221		if (!acpi_disabled)
   222			return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
   223	
   224		for_each_possible_cpu(cpu) {
   225			iter = of_get_cpu_node(cpu, NULL);
   226			if (!iter) {
   227				pr_err("Failed to find cpu%d device node\n", cpu);
   228				return -ENOENT;
   229			}
   230	
   231			while ((iter = of_find_next_cache_node(iter))) {
   232				err = of_property_read_u32(iter, "cache-level",
   233							   &iter_level);
   234				if (err || (iter_level != cache_level)) {
   235					of_node_put(iter);
   236					continue;
   237				}
   238	
   239				/*
   240				 * get_cpu_cacheinfo_id() isn't ready until sometime
   241				 * during device_initcall(). Use cache_of_get_id().
   242				 */
   243				iter_cache_id = cache_of_get_id(iter);
 > 244				if (cache_id == ~0UL) {
   245					of_node_put(iter);
   246					continue;
   247				}
   248	
   249				if (iter_cache_id == cache_id)
   250					cpumask_set_cpu(cpu, affinity);
   251	
   252				of_node_put(iter);
   253			}
   254		}
   255	
   256		return 0;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
