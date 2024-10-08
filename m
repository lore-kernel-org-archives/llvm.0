Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F939273FE;
	Tue,  8 Oct 2024 02:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728354214; cv=none; b=eR3Hs7ReQjz6dXZGMccYe2ibzGfjMxEJMiaTCgirHijEid3y/1r1yu/kjKeardbOocSN7ojZKEuWxWPsxOVUxgestnUY7BplsyGqYT+4+H2gHXFeILANt6blk7Lc97IPSVLvfqlqYY2QBUespPd8rQMs9Adkf69ZIpOylf4hMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728354214; c=relaxed/simple;
	bh=DDqU2wEcJ9GlWuWiNYb39gytykLHo6YmCGyvTArKPFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nx7dh/b8/t5h/9TE4PRYdqiJz8Yk/v3M/hcd47sYQiDma81ar3LwmR+6XS3vYhGXUq/SWTE1qGWM0LF5ZhoqfA5BFQqJ3rr92CKyULmPUIBb3LEoUcEvxfQxEaJbGVa7DlC8gcvPqNWkKq9igysWauNafH4+7TbNdJBiHIXIb7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxCG9259; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxCG9259"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728354213; x=1759890213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDqU2wEcJ9GlWuWiNYb39gytykLHo6YmCGyvTArKPFY=;
  b=nxCG9259GOSf7OngEsRmR5/iPkh6HXp9Q0NJy8lYRtixBPb2v4ncLMej
   nDXW3y9hvUt2zNZvxo4NyXXMuhkkKXPYFcxIZQKdiVvXqw5nsYhAXarr7
   EdK4vCRggDy++HINbRjDk2B1pUzldtPIoA3Eme2GVdV1CEfORKFBpaoum
   Pklu2KzWhAI/jZGbmw9S91SirUCk609KHqm75wM2lHFpZWbVdHJu1vS1O
   1VTetPZqQ8tCMriGlxFtNMHdcoJGdWbuqQ2aI11cPYgl+NenRqHC/7/M6
   KDAOC/RAE7awaTxOe9bsNZIt4ZzCY5leEaxDCwSREuXfckeyCh+QaRtTH
   A==;
X-CSE-ConnectionGUID: mxBOB8B4RValsZ7mumEF/Q==
X-CSE-MsgGUID: 2lWD8iKbT7q8golsENC0jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38913209"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="38913209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 19:23:31 -0700
X-CSE-ConnectionGUID: UBY0QXc2R4uFaIIYvg9MuA==
X-CSE-MsgGUID: zvmU3pnySIufJTBrEC+6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="76042955"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2024 19:23:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxzsl-0005nk-2C;
	Tue, 08 Oct 2024 02:23:27 +0000
Date: Tue, 8 Oct 2024 10:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.12-rc1 76/132]
 drivers/platform/arm64/mpam/mpam_devices.c:356:17: warning: result of
 comparison of constant 18446744073709551615 with expression of type 'u32'
 (aka 'unsigned int') is always false
Message-ID: <202410081031.8bueUllP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: cef6f9417b171fcf4f80d9283c16686b5bd5ffea [76/132] arm_mpam: Add the class and component structures for ris firmware described
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241008/202410081031.8bueUllP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081031.8bueUllP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081031.8bueUllP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_devices.c:6:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/arm64/mpam/mpam_devices.c:356:17: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     356 |                         if (cache_id == ~0UL) {
         |                             ~~~~~~~~ ^  ~~~~
   5 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +356 drivers/platform/arm64/mpam/mpam_devices.c

   320	
   321	/*
   322	 * The cacheinfo structures are only populated when CPUs are online.
   323	 * This helper walks the device tree to include offline CPUs too.
   324	 */
   325	static int get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
   326					     cpumask_t *affinity)
   327	{
   328		int cpu, err;
   329		u32 iter_level;
   330		int iter_cache_id;
   331		struct device_node *iter;
   332	
   333		if (!acpi_disabled)
   334			return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
   335	
   336		for_each_possible_cpu(cpu) {
   337			iter = of_get_cpu_node(cpu, NULL);
   338			if (!iter) {
   339				pr_err("Failed to find cpu%d device node\n", cpu);
   340				return -ENOENT;
   341			}
   342	
   343			while ((iter = of_find_next_cache_node(iter))) {
   344				err = of_property_read_u32(iter, "cache-level",
   345							   &iter_level);
   346				if (err || (iter_level != cache_level)) {
   347					of_node_put(iter);
   348					continue;
   349				}
   350	
   351				/*
   352				 * get_cpu_cacheinfo_id() isn't ready until sometime
   353				 * during device_initcall(). Use cache_of_get_id().
   354				 */
   355				iter_cache_id = cache_of_get_id(iter);
 > 356				if (cache_id == ~0UL) {
   357					of_node_put(iter);
   358					continue;
   359				}
   360	
   361				if (iter_cache_id == cache_id)
   362					cpumask_set_cpu(cpu, affinity);
   363	
   364				of_node_put(iter);
   365			}
   366		}
   367	
   368		return 0;
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
