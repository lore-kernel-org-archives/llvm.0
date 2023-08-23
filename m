Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B76BE6C;
	Wed, 23 Aug 2023 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692793200; x=1724329200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jf/KAd6jYEn0ig90OrcV/cRvSUivvkPKWWD0ZOcG2yQ=;
  b=QQY1iJN0+mHB04SwkC1npat2dfssdCeWqIcYkyMzH5RY4ZczzpVSmaO4
   BejdTn2FvuVz+gZptyG+CzCYJbvgsYfy7LR2njzj5HIUhBUU5weBhDqVT
   bLR6xpHRFwKtf5t/2GzkjfalS0DTKzjhIsBsOupODPDPNHKjpRnhZULtH
   XDp/JHiY4ehjIwiUdO9x0yqKrIaxHB3cD0UveTc5EtlBLlO6MkDTkedhm
   vOEHAhOEzgLO9+4KxOnyNOtu9OoDOkI8FCrQEFqERA33Nn5CwGvYGzUR7
   gAHKWEhYFbJT20MZ6995Amvy2t6n0bNcNQuQzH3ljg9FDbA0BtaQmv8fR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="438081770"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438081770"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="802086804"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="802086804"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 05:19:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYmq3-0001BM-04;
	Wed, 23 Aug 2023 12:19:55 +0000
Date: Wed, 23 Aug 2023 20:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 1/8] arch/x86/kernel/acpi/boot.c:1186:2:
 error: call to undeclared function 'cpu_hotplug_not_supported'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202308232008.WJtnOzai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   7d7a8fcef30fe2515b3cce811bd7b96a14e2a75f
commit: 602cc233a076ee5e78eb0bf5bc5e0519ecc15676 [1/8] cpu/hotplug, x86/acpi: Disable CPU hotplug for ACPI MADT wakeup
config: x86_64-randconfig-073-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232008.WJtnOzai-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232008.WJtnOzai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232008.WJtnOzai-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/acpi/boot.c:1186:2: error: call to undeclared function 'cpu_hotplug_not_supported'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cpu_hotplug_not_supported();
           ^
   1 error generated.


vim +/cpu_hotplug_not_supported +1186 arch/x86/kernel/acpi/boot.c

  1167	
  1168	#ifdef CONFIG_X86_64
  1169	static int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
  1170					     const unsigned long end)
  1171	{
  1172		struct acpi_madt_multiproc_wakeup *mp_wake;
  1173	
  1174		if (!IS_ENABLED(CONFIG_SMP))
  1175			return -ENODEV;
  1176	
  1177		mp_wake = (struct acpi_madt_multiproc_wakeup *)header;
  1178		if (BAD_MADT_ENTRY(mp_wake, end))
  1179			return -EINVAL;
  1180	
  1181		acpi_table_print_madt_entry(&header->common);
  1182	
  1183		acpi_mp_wake_mailbox_paddr = mp_wake->base_address;
  1184	
  1185		/* Disable CPU onlining/offlining */
> 1186		cpu_hotplug_not_supported();
  1187	
  1188		acpi_wake_cpu_handler_update(acpi_wakeup_cpu);
  1189	
  1190		return 0;
  1191	}
  1192	#endif				/* CONFIG_X86_64 */
  1193	#endif				/* CONFIG_X86_LOCAL_APIC */
  1194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
