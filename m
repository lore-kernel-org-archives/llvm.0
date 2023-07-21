Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750127F37;
	Fri, 21 Jul 2023 15:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689952286; x=1721488286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oqZm12mtp8Vvj4aO2YUOeJFsc05OSkLNfD7crEdTtz4=;
  b=F4aE8Kmps4NbRp2XBqJ9ufrqtljt6qXRbQEZfTt4ArzPMOhvE6Cjg9KE
   1smIpPxGtlnrkK2AF+XGm5oDXg8jRz+mJoXW9kzB4d7sb5LG15s4tv+1W
   GRbGrmn+6jhUDvbPjUC65zcR3morW0KhEUqpd7ESVkQj7Fk7YfqOLZ+pS
   yV8EJYeF33aWWd20l0UCHTsZM+VBD5+nWmFhRsCbUKLAEDCzXZZbRPEei
   6okMvnYTldzZhnxhBSOmwFHCX/0e+4hVXJbE0gLcpLrG71Gz+Fu+FJEWz
   n248RBq9KseGQHfP9EDK7S7sbpbLzlf01xRWTPUL9PqJNkz5RG9wTvNYK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351922700"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="351922700"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="868270083"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2023 08:11:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMrms-0007OT-0t;
	Fri, 21 Jul 2023 15:11:22 +0000
Date: Fri, 21 Jul 2023 23:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/apic 51/58] arch/x86/kernel/setup.c:1021:2: error:
 call to undeclared function 'apic_setup_apic_calls'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202307212330.rVLwqzbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/apic
head:   11f85db0679f4f37798c648f3028126b6f7c6163
commit: 3f5136df0d2d4fa65ac488bafe53c7ce531c9148 [51/58] x86/apic: Provide apic_update_callback()
config: i386-randconfig-i016-20230720 (https://download.01.org/0day-ci/archive/20230721/202307212330.rVLwqzbY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307212330.rVLwqzbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307212330.rVLwqzbY-lkp@intel.com/

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
