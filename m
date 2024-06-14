Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158364C8B;
	Fri, 14 Jun 2024 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718372707; cv=none; b=ctFaVaOYFc0l1R23jj8nLvlC74aTqWHV3P2vJ/zE5PLmr1lURIF2atfbHKB01ux+q7VF3nIM05RNhIiOtE8jZN0amMTcblBB1MNtiWyvLdIXfonujnhWRai84zuujOuP9ilMaqiQTlYmmQcMjbXUvxhDCz+mKhJvB/Su3HvH+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718372707; c=relaxed/simple;
	bh=XVVxIjRw8aXnuO07fuMvjc8nOL4O5SMnmgXVfzEFIOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zu7esOxT2LUyB1vSUSVyKdN1/E1vCklIbwT8d7R4KHSmZDuxXYgrzTe1f3YiBDf7wg2K+JhGK8/jL7J6AA+AapQjZLE5sekNnbpgHBYo7ocpO9ZTrFKmAD5weLR2UCXEemYcg/y+EC3dNNgiledwtq0DX4uBzKcN2CM9MS0L/M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxRRkXK7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxRRkXK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718372705; x=1749908705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XVVxIjRw8aXnuO07fuMvjc8nOL4O5SMnmgXVfzEFIOc=;
  b=IxRRkXK7vR07l5s9bQbcM0LINoUT1/JDixdJWEAE61GSWu48BBk16LWW
   stsBUpzNYw+7Lmyzmi6VTkBx9l3/UfGG+NArMwcN7UeziCaDAz9HEKDry
   LQ1UBF8i4OtKRn90qkt4Y7/4ajtZLo+7KirKCgmjobu2VtcSwn7eByBRv
   rtCMhYitWDaNVG9gvXTCCi4INH0caYWw1f60ABQEbtfjMT4Ig2aQi0F2k
   tWzLr/50nMTSRpIioYlF4QOKYiISqFoe/4wYKkn+ecw6R5YJre+VMh0v2
   HhjRdzUTtANXkaKJMPraSZSORSoLLEGDP/zjcZb+TI61HiG1ppe2y9GEv
   w==;
X-CSE-ConnectionGUID: jHBg2inwRoWgwBwQH/bnAA==
X-CSE-MsgGUID: wHKWcO/RRlOmcdF6r71ppA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="18178295"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="18178295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:45:04 -0700
X-CSE-ConnectionGUID: yBmByUFKTdC+Ch3m8ZoOqw==
X-CSE-MsgGUID: sh1KYdidSzO3tgwB33fSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40430738"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2024 06:45:03 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI7Ei-0001MZ-2H;
	Fri, 14 Jun 2024 13:45:00 +0000
Date: Fri, 14 Jun 2024 21:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.10-rc1 65/114]
 drivers/platform/arm64/mpam/mpam_devices.c:318:17: warning: result of
 comparison of constant 18446744073709551615 with expression of type 'u32'
 (aka 'unsigned int') is always false
Message-ID: <202406142148.278A1iXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.10-rc1
head:   d9ba67a1a8dc6551a0b3254a8f2ee9993ad17957
commit: 80bb394628b9df80413dcc6f0b9198177355c199 [65/114] arm_mpam: Add the class and component structures for ris firmware described
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240614/202406142148.278A1iXo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142148.278A1iXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142148.278A1iXo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_devices.c:6:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/arm64/mpam/mpam_devices.c:318:17: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     318 |                         if (cache_id == ~0UL) {
         |                             ~~~~~~~~ ^  ~~~~
   6 warnings generated.


vim +318 drivers/platform/arm64/mpam/mpam_devices.c

   282	
   283	/*
   284	 * The cacheinfo structures are only populated when CPUs are online.
   285	 * This helper walks the device tree to include offline CPUs too.
   286	 */
   287	static int get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
   288					     cpumask_t *affinity)
   289	{
   290		int cpu, err;
   291		u32 iter_level;
   292		int iter_cache_id;
   293		struct device_node *iter;
   294	
   295		if (!acpi_disabled)
   296			return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
   297	
   298		for_each_possible_cpu(cpu) {
   299			iter = of_get_cpu_node(cpu, NULL);
   300			if (!iter) {
   301				pr_err("Failed to find cpu%d device node\n", cpu);
   302				return -ENOENT;
   303			}
   304	
   305			while ((iter = of_find_next_cache_node(iter))) {
   306				err = of_property_read_u32(iter, "cache-level",
   307							   &iter_level);
   308				if (err || (iter_level != cache_level)) {
   309					of_node_put(iter);
   310					continue;
   311				}
   312	
   313				/*
   314				 * get_cpu_cacheinfo_id() isn't ready until sometime
   315				 * during device_initcall(). Use cache_of_get_id().
   316				 */
   317				iter_cache_id = cache_of_get_id(iter);
 > 318				if (cache_id == ~0UL) {
   319					of_node_put(iter);
   320					continue;
   321				}
   322	
   323				if (iter_cache_id == cache_id)
   324					cpumask_set_cpu(cpu, affinity);
   325	
   326				of_node_put(iter);
   327			}
   328		}
   329	
   330		return 0;
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
