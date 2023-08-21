Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B7611737;
	Mon, 21 Aug 2023 20:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692651401; x=1724187401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6XopZWwfsNkH1VsGSyaQrxnSYYAB5c5w4FFiAi1pP4=;
  b=CVHjt+XBk32xCKC3dRl8nwAc5qkKPJPY8Jt5M7YZ4dbYPO7++2tJQvXH
   qk032a7Xnoe8+8Mes4/k2t6HKkxHTk4ck4MM+TVYFq9YlDhJiOdil3icC
   I496WdW0Qjmcgyx3aBQ47oHinRR4umq10XkPXgMsNFuS16N5YJSYEi2gX
   P4TgS60iwaxuPv4twKvNQNLhyE1DNF2hHSLwip9RSuKLvyYWj+Qi1JfLp
   J/UFNsZcBsNHyAuxraGy/OIp75t7XYCna101aCNHUW3kEGR9bxh6LYapu
   ULXsTFwC1oXaDWEQx836tewDrHVhcysijus34AWgPej5GP93//DgdOjqq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377451484"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="377451484"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 13:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739058777"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="739058777"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2023 13:56:40 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYBwq-0000v6-0J;
	Mon, 21 Aug 2023 20:56:31 +0000
Date: Tue, 22 Aug 2023 04:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 30/34] drivers/acpi/osl.c:410: warning:
 cannot understand function prototype: 'void *__ref
 acpi_os_map_memory_opregion(acpi_physical_address phys, acpi_size size) '
Message-ID: <202308220403.Cnc4i2d5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   f84bcdf50d1bb34ff2715bb067074582b407f3d9
commit: 7be70dd0f99a936b19893afa9b0719009181bd34 [30/34] acpica: add acpi_os_map_memory_opregion
config: i386-randconfig-001-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220403.Cnc4i2d5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220403.Cnc4i2d5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220403.Cnc4i2d5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/osl.c:410: warning: cannot understand function prototype: 'void *__ref acpi_os_map_memory_opregion(acpi_physical_address phys, acpi_size size) '


vim +410 drivers/acpi/osl.c

   391	
   392	/**
   393	 * acpi_os_map_memory_opregion - Get a virtual address for a given physical
   394	 * address range. This function is intended to be used only for AML operation
   395	 * regions. In a confidential computing guest such regions needs to be explicitly
   396	 * shared with the host to avoid breaking the communication. 
   397	 *
   398	 * @phys: Start of the physical address range to map.
   399	 * @size: Size of the physical address range to map.
   400	 *
   401	 * Look up the given physical address range in the list of existing ACPI memory
   402	 * mappings.  If found, get a reference to it and return a pointer to it (its
   403	 * virtual address).  If not found, map it, add it to that list and return a
   404	 * pointer to it.
   405	 *
   406	 * During early init (when acpi_permanent_mmap has not been set yet) this
   407	 * routine simply calls __acpi_map_table() to get the job done.
   408	 */
   409	void *__ref acpi_os_map_memory_opregion(acpi_physical_address phys, acpi_size size)
 > 410	{
   411		if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
   412			return (void *)__acpi_os_map_iomem(phys, size, false);
   413		else
   414			return (void *)__acpi_os_map_iomem(phys, size, true);
   415	}
   416	EXPORT_SYMBOL_GPL(acpi_os_map_memory_opregion);
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
