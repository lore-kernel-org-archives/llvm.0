Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E569253CE;
	Mon, 17 Jul 2023 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689623469; x=1721159469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+1gNRrQsV4FsavVYDPD1buS5A3s5xetFgabg2L8BlU=;
  b=Cidp5hcqW0fVfxSAqr0HBFjj9PHt/6zw4qiyBadh1fjroIlvgJhIT2p8
   J86JXIpxOi9V6ZBl97//xateX726bkoI4bBK1e3GhGfQL7T411b/rCoZS
   poPKKMNx7fWoKgXPiJfNOlcwIF9fhh2xzKBVv+nPAE1/mDyrPlBaEUS9a
   dNffpPL6iCeQoCpS6S92ilkCB6YIh0ZXRPfqAL57mbYppYt1YIYZ34tvS
   u43jvqL0oVaK+ozLp9C9b7zQsKmL9OrZ2VbfyvIX0KH56m/gcNL+XkJT9
   sEI8bDUZwosZSHYdmQQLnfc0DbD0KQypNvOUumqfw+Ml3qpYojw67dBxM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432198587"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432198587"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758543106"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="758543106"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jul 2023 12:51:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLUFO-0009rg-2k;
	Mon, 17 Jul 2023 19:51:06 +0000
Date: Tue, 18 Jul 2023 03:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 51/58] arch/x86/kernel/setup.c:1021:2:
 error: call to undeclared function 'apic_setup_apic_calls'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202307180325.YEDq4PZ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   b4958e7260e30a731e3f64c031bbfa88fe79e7ec
commit: 9c546fe04c7cabeb22ef8ebaf7dfcbac75de0524 [51/58] x86/apic: Provide apic_update_callback()
config: i386-buildonly-randconfig-r004-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180325.YEDq4PZ2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180325.YEDq4PZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180325.YEDq4PZ2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/setup.c:1021:2: error: call to undeclared function 'apic_setup_apic_calls'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           apic_setup_apic_calls();
           ^
   1 error generated.


vim +/apic_setup_apic_calls +1021 arch/x86/kernel/setup.c

  1018	
  1019		x86_report_nx();
  1020	
> 1021		apic_setup_apic_calls();
  1022	
  1023		if (acpi_mps_check()) {
  1024	#ifdef CONFIG_X86_LOCAL_APIC
  1025			apic_is_disabled = true;
  1026	#endif
  1027			setup_clear_cpu_cap(X86_FEATURE_APIC);
  1028		}
  1029	
  1030		e820__reserve_setup_data();
  1031		e820__finish_early_params();
  1032	
  1033		if (efi_enabled(EFI_BOOT))
  1034			efi_init();
  1035	
  1036		reserve_ibft_region();
  1037		dmi_setup();
  1038	
  1039		/*
  1040		 * VMware detection requires dmi to be available, so this
  1041		 * needs to be done after dmi_setup(), for the boot CPU.
  1042		 * For some guest types (Xen PV, SEV-SNP, TDX) it is required to be
  1043		 * called before cache_bp_init() for setting up MTRR state.
  1044		 */
  1045		init_hypervisor_platform();
  1046	
  1047		tsc_early_init();
  1048		x86_init.resources.probe_roms();
  1049	
  1050		/* after parse_early_param, so could debug it */
  1051		insert_resource(&iomem_resource, &code_resource);
  1052		insert_resource(&iomem_resource, &rodata_resource);
  1053		insert_resource(&iomem_resource, &data_resource);
  1054		insert_resource(&iomem_resource, &bss_resource);
  1055	
  1056		e820_add_kernel_range();
  1057		trim_bios_range();
  1058	#ifdef CONFIG_X86_32
  1059		if (ppro_with_ram_bug()) {
  1060			e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM,
  1061					  E820_TYPE_RESERVED);
  1062			e820__update_table(e820_table);
  1063			printk(KERN_INFO "fixed physical RAM map:\n");
  1064			e820__print_table("bad_ppro");
  1065		}
  1066	#else
  1067		early_gart_iommu_check();
  1068	#endif
  1069	
  1070		/*
  1071		 * partially used pages are not usable - thus
  1072		 * we are rounding upwards:
  1073		 */
  1074		max_pfn = e820__end_of_ram_pfn();
  1075	
  1076		/* update e820 for memory not covered by WB MTRRs */
  1077		cache_bp_init();
  1078		if (mtrr_trim_uncached_memory(max_pfn))
  1079			max_pfn = e820__end_of_ram_pfn();
  1080	
  1081		max_possible_pfn = max_pfn;
  1082	
  1083		/*
  1084		 * Define random base addresses for memory sections after max_pfn is
  1085		 * defined and before each memory section base is used.
  1086		 */
  1087		kernel_randomize_memory();
  1088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
