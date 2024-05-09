Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DF1A2C37;
	Thu,  9 May 2024 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715238852; cv=none; b=OQ0RzNABJUSiDewT6eVN2OUo5Io0/nHj7H2tHHjZO9gFWrLZCWoY/HQaBgvW9YzUBwbWXB47JSlxi0Y9HILPTbJbm20TuDwa2h61ZHun95PgxsMVIXmITEBqIsbVLqjBFP153Q8xe5EJaKs9/a+DjdXEkKZ5TLOKm12fLNO2kNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715238852; c=relaxed/simple;
	bh=fIDvl+sN2aD/k5lPlxU58CPXl0CE8yLdhypmWSqkLQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvT+lLqJh+xzQ/SPhPaW3Ai1oZfrn9Sz4ezd+8F4/iKSzaWOC+SXTXzQamWYMemEbAxs0XjC4SJ97/8+H4egLFukmRnlMO0JnOTU5rmYg7Pn9PFA6CTA8IkMV6rWvdwxNH3/7zeOP2XcEg0XLnrkWWQWnfq/qw/7rP4I8e7Hf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyMT/gGj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyMT/gGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715238850; x=1746774850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fIDvl+sN2aD/k5lPlxU58CPXl0CE8yLdhypmWSqkLQI=;
  b=TyMT/gGjL/habDuZIZibcx++qw9R+uSpa6YkVHMe471wmVosdBwWuh2a
   zcL0kOxxc46I6s+o0mBdPe5rGCmsVQ1q5DJfSPhJa3xU4lJbpcs5qFfnn
   MBXx2VhWBrGZP3VEls9rzBH4ZVjugZNgocMzBDw6ChwU5YFG7LQjUSCKm
   EFjE3pGqmLX+HufArdo00EcDAMBEvAnxgFX+RX2S8h02w6N6+f4ymbl/2
   l0TSrmBmfWLssDV6xFDsM7rOkWi+XCNiQZiKQrWO7Nacm1J6oHVvQLLC2
   a/Azs1d7XoHUf4FLZcHHCs4LKunapfujma081xphOI4R3/UXzTht5J+kc
   g==;
X-CSE-ConnectionGUID: 5MCV1A9eRZKgRgb2mY6quw==
X-CSE-MsgGUID: mPPsaQZGQACX3mN0M/lqfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11265841"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11265841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 00:14:07 -0700
X-CSE-ConnectionGUID: /L6/aDr2SAKXZ0DLufGoCA==
X-CSE-MsgGUID: ex4eExK+TGmS5tVM/uDMQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="33712600"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2024 00:14:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4xyc-0004Y4-06;
	Thu, 09 May 2024 07:14:02 +0000
Date: Thu, 9 May 2024 15:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/kexec_file: fix extra size calculation for
 kexec FDT
Message-ID: <202405091511.8Sd2zYrn-lkp@intel.com>
References: <20240508130558.1939304-2-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508130558.1939304-2-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240508]
[cannot apply to powerpc/next powerpc/fixes linus/master v6.9-rc7 v6.9-rc6 v6.9-rc5 v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kexec_file-fix-extra-size-calculation-for-kexec-FDT/20240508-211003
base:   next-20240508
patch link:    https://lore.kernel.org/r/20240508130558.1939304-2-sourabhjain%40linux.ibm.com
patch subject: [PATCH 1/2] powerpc/kexec_file: fix extra size calculation for kexec FDT
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240509/202405091511.8Sd2zYrn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091511.8Sd2zYrn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091511.8Sd2zYrn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kexec/file_load_64.c:17:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
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
>> arch/powerpc/kexec/file_load_64.c:863:3: warning: variable 'cpu_nodes' is uninitialized when used here [-Wuninitialized]
     863 |                 cpu_nodes++;
         |                 ^~~~~~~~~
   arch/powerpc/kexec/file_load_64.c:854:24: note: initialize the variable 'cpu_nodes' to silence this warning
     854 |         unsigned int cpu_nodes, extra_size = 0;
         |                               ^
         |                                = 0
   6 warnings generated.


vim +/cpu_nodes +863 arch/powerpc/kexec/file_load_64.c

   843	
   844	/**
   845	 * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
   846	 *                              setup FDT for kexec/kdump kernel.
   847	 * @image:                      kexec image being loaded.
   848	 *
   849	 * Returns the estimated extra size needed for kexec/kdump kernel FDT.
   850	 */
   851	unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image, struct crash_mem *rmem)
   852	{
   853		struct device_node *dn;
   854		unsigned int cpu_nodes, extra_size = 0;
   855	
   856		// Budget some space for the password blob. There's already extra space
   857		// for the key name
   858		if (plpks_is_available())
   859			extra_size += (unsigned int)plpks_get_passwordlen();
   860	
   861		/* Get the number of CPU nodes in the current device tree */
   862		for_each_node_by_type(dn, "cpu") {
 > 863			cpu_nodes++;
   864		}
   865	
   866		/* Consider extra space for CPU nodes added since the boot time */
   867		if (cpu_nodes > boot_cpu_node_count)
   868			extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
   869	
   870		/* Consider extra space for reserved memory ranges if any */
   871		if (rmem->nr_ranges > 0)
   872			extra_size += sizeof(struct fdt_reserve_entry) * rmem->nr_ranges;
   873	
   874		return extra_size + kdump_extra_fdt_size_ppc64(image, cpu_nodes);
   875	}
   876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
