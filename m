Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF28C145;
	Mon,  4 Sep 2023 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693853188; x=1725389188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XcZahxCuMIGsIuIqVmRnDdfOvuFMQf7tkUV9dUMF9as=;
  b=SipPFn3AyqpOfq9rGPxtrUPfbfZacduTBkbFkZIipJJlPeJShHrx7oN8
   dKjvMUxRH2PdiJxZ7hcLhBapZ2cl74XAYKEdgA+cRqbZTRQalsVo0k2c2
   bSNfDU7VX9Xcnr9TXUWLklMa9HWPBW9jfGMDF7Fn8fCbGuUbm8PXfsu5M
   2NnmT+0sf8rxwJ+ufDkVo4/MeA1QQzQG+r+HDga44BZ+P8Hg1n6lzwO0k
   paIyN0pFSk2EyLuKpe7uU6ouIIWUZSWxOyNv8CxZ5ECra3wELFNI+qbgh
   +VFmxP7xozLbNitnsXC8YzbTi8hc/kflNPtYqoRhNf71FRKjlHxllQVOm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="375536750"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="375536750"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914582161"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="914582161"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Sep 2023 11:46:24 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdEaa-0000kt-0o;
	Mon, 04 Sep 2023 18:46:20 +0000
Date: Tue, 5 Sep 2023 02:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 27/30]
 arch/x86/kernel/apic/apic_flat_64.c:106:3: error: field designator
 'nmi_to_offline_cpu' does not refer to any field in type 'struct apic'
Message-ID: <202309050235.BwYsObQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   1e0a6155f60f402c59f26124cd743356417e3647
commit: 4577a747b1f101822f4b1b458788bc3a5f1494d4 [27/30] x86/apic: Provide apic_force_nmi_on_cpu()
config: x86_64-randconfig-r022-20230904 (https://download.01.org/0day-ci/archive/20230905/202309050235.BwYsObQS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050235.BwYsObQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050235.BwYsObQS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic_flat_64.c:106:3: error: field designator 'nmi_to_offline_cpu' does not refer to any field in type 'struct apic'
           .nmi_to_offline_cpu             = true,
            ^
   arch/x86/kernel/apic/apic_flat_64.c:179:3: error: field designator 'nmi_to_offline_cpu' does not refer to any field in type 'struct apic'
           .nmi_to_offline_cpu             = true,
            ^
   2 errors generated.
--
>> arch/x86/kernel/apic/x2apic_phys.c:169:3: error: field designator 'nmi_to_offline_cpu' does not refer to any field in type 'struct apic'
           .nmi_to_offline_cpu             = true,
            ^
   1 error generated.
--
>> arch/x86/kernel/apic/x2apic_cluster.c:254:3: error: field designator 'nmi_to_offline_cpu' does not refer to any field in type 'struct apic'
           .nmi_to_offline_cpu             = true,
            ^
   1 error generated.


vim +106 arch/x86/kernel/apic/apic_flat_64.c

    78	
    79	static struct apic apic_flat __ro_after_init = {
    80		.name				= "flat",
    81		.probe				= flat_probe,
    82		.acpi_madt_oem_check		= flat_acpi_madt_oem_check,
    83		.apic_id_registered		= default_apic_id_registered,
    84	
    85		.delivery_mode			= APIC_DELIVERY_MODE_FIXED,
    86		.dest_mode_logical		= true,
    87	
    88		.disable_esr			= 0,
    89	
    90		.init_apic_ldr			= default_init_apic_ldr,
    91		.cpu_present_to_apicid		= default_cpu_present_to_apicid,
    92		.phys_pkg_id			= flat_phys_pkg_id,
    93	
    94		.max_apic_id			= 0xFE,
    95		.get_apic_id			= flat_get_apic_id,
    96		.set_apic_id			= set_apic_id,
    97	
    98		.calc_dest_apicid		= apic_flat_calc_apicid,
    99	
   100		.send_IPI			= default_send_IPI_single,
   101		.send_IPI_mask			= flat_send_IPI_mask,
   102		.send_IPI_mask_allbutself	= flat_send_IPI_mask_allbutself,
   103		.send_IPI_allbutself		= default_send_IPI_allbutself,
   104		.send_IPI_all			= default_send_IPI_all,
   105		.send_IPI_self			= default_send_IPI_self,
 > 106		.nmi_to_offline_cpu		= true,
   107	
   108		.read				= native_apic_mem_read,
   109		.write				= native_apic_mem_write,
   110		.eoi				= native_apic_mem_eoi,
   111		.icr_read			= native_apic_icr_read,
   112		.icr_write			= native_apic_icr_write,
   113		.wait_icr_idle			= apic_mem_wait_icr_idle,
   114		.safe_wait_icr_idle		= apic_mem_wait_icr_idle_timeout,
   115	};
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
