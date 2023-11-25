Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8659079E4;
	Sat, 25 Nov 2023 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G03DLTJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898225; x=1732434225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bb9FXwRuLyTWwaMz6jNEuebAer5qBwmm7TosoOJwHzk=;
  b=G03DLTJozAzkodAmom+NQrdB/9yWA72GtBbl6c/W2cAwuag7mQi9M2bH
   ccaymIWtq+zyKkx5JfDYwg0yJeJgROZbj5L74kAjIse0VIfP/ramuqIcl
   45TYoDCRmjJINYDudygzP60Kpe+Cxsq0l5GiP+8AAqqf/qfDwHbryi+iL
   ByP5YspETWeS9t/avYlLvQpCf2pfq0vlXuPoqVSA7yW7OHoAFQ9SJc/Mo
   t8O+ltn4hLQALWsPYPht1I0321ktPjjkLwe/vXzWP4rtfiipeciMJK60k
   9uJJeiNLvC2Mhfg9HSyRIuQWh70GDDeRJ+E7fJubtmkpx+SLh2uaBjPkU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395321541"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="395321541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="9329657"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2023 23:43:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nKE-0003kH-24;
	Sat, 25 Nov 2023 07:43:38 +0000
Date: Sat, 25 Nov 2023 15:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 10/41] drivers/acpi/arm64/iort.c:2014:18:
 warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka
 'unsigned int') changes value from 18446744073709551615 to 4294967295
Message-ID: <202311251401.PhjhNVYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: bee383fcba7cb2817bb5971e7e600ade21b0f096 [10/41] ACPI: IORT: Allow COMPILE_TEST of IORT
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311251401.PhjhNVYJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251401.PhjhNVYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251401.PhjhNVYJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/arm64/iort.c:2014:18: warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                           local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
                                       ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   drivers/acpi/arm64/iort.c:2023:18: warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                           local_limit = DMA_BIT_MASK(rc->memory_address_limit);
                                       ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   2 warnings generated.


vim +2014 drivers/acpi/arm64/iort.c

2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1978  
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1979  #ifdef CONFIG_ZONE_DMA
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1980  /*
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1981   * Extract the highest CPU physical address accessible to all DMA masters in
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1982   * the system. PHYS_ADDR_MAX is returned when no constrained device is found.
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1983   */
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1984  phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1985  {
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1986  	phys_addr_t limit = PHYS_ADDR_MAX;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1987  	struct acpi_iort_node *node, *end;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1988  	struct acpi_table_iort *iort;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1989  	acpi_status status;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1990  	int i;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1991  
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1992  	if (acpi_disabled)
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1993  		return limit;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1994  
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1995  	status = acpi_get_table(ACPI_SIG_IORT, 0,
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1996  				(struct acpi_table_header **)&iort);
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1997  	if (ACPI_FAILURE(status))
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1998  		return limit;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  1999  
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2000  	node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2001  	end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2002  
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2003  	for (i = 0; i < iort->node_count; i++) {
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2004  		if (node >= end)
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2005  			break;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2006  
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2007  		switch (node->type) {
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2008  			struct acpi_iort_named_component *ncomp;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2009  			struct acpi_iort_root_complex *rc;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2010  			phys_addr_t local_limit;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2011  
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2012  		case ACPI_IORT_NODE_NAMED_COMPONENT:
2b8652936f0ca9 Ard Biesheuvel 2020-11-19  2013  			ncomp = (struct acpi_iort_named_component *)node->node_data;
2b8652936f0ca9 Ard Biesheuvel 2020-11-19 @2014  			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);

:::::: The code at line 2014 was first introduced by commit
:::::: 2b8652936f0ca9ca2e6c984ae76c7bfcda1b3f22 arm64: mm: Set ZONE_DMA size based on early IORT scan

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
