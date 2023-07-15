Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576538F48;
	Sat, 15 Jul 2023 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689460209; x=1720996209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/EH5U/kfl6Mmjc5dy/l5b0ih4yl8BiLqxp0g7zOp6k=;
  b=mCr26rg1NZ59ZVEIQTrea0xtx5c535v9qDzHoH7CgkxbGhSVGfTrodtE
   zfEg0VRYz49TsLyyHlkNivY+Vj7C/DigfbJ/6v9vVgbZ9C2M1aecdys9I
   D3/kjiMEcJ5JC4LYcW8DJJnYq+ZMygkXp/PTVhXtjz9Pl4xinX6z4GkeB
   GW3tnxPWPLTj3G/1Gtmnsu8afhhlF8jxKch0UrQK+lfoeNTV6Cu6r+EOe
   YoIb0EBp7Nhz9KDfuKgZJWkCsRbItfslNf3KrFQAJEPTwboCUjcjjVapY
   eYRPunqwO2PXd0J8f1F8UhzZvzt4oqRrbUCR+uJvtNQb6pKUtwyYYQtbU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="369255685"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="369255685"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 15:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="792771417"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="792771417"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jul 2023 15:30:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKnmA-0008ON-1t;
	Sat, 15 Jul 2023 22:30:06 +0000
Date: Sun, 16 Jul 2023 06:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 35/38]
 arch/x86/kernel/apic/x2apic_uv_x.c:832:21: error: use of undeclared
 identifier 'x2apic_send_IPI_self'
Message-ID: <202307160639.9JnuMbpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   59df0262d2da163a8281c806688cc62e4d919908
commit: 5d748a4117e8c1f79e30d6c823589ebe5d1cf7a5 [35/38] x86/apic/x2apic: Share all common IPI functions
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230716/202307160639.9JnuMbpb-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160639.9JnuMbpb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160639.9JnuMbpb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/x2apic_uv_x.c:832:21: error: use of undeclared identifier 'x2apic_send_IPI_self'
           .send_IPI_self                  = x2apic_send_IPI_self,
                                             ^
   1 error generated.


vim +/x2apic_send_IPI_self +832 arch/x86/kernel/apic/x2apic_uv_x.c

   807	
   808		.name				= "UV large system",
   809		.probe				= uv_probe,
   810		.acpi_madt_oem_check		= uv_acpi_madt_oem_check,
   811	
   812		.delivery_mode			= APIC_DELIVERY_MODE_FIXED,
   813		.dest_mode_logical		= false,
   814	
   815		.disable_esr			= 0,
   816	
   817		.check_apicid_used		= NULL,
   818		.ioapic_phys_id_map		= NULL,
   819		.cpu_present_to_apicid		= default_cpu_present_to_apicid,
   820		.phys_pkg_id			= uv_phys_pkg_id,
   821	
   822		.get_apic_id			= x2apic_get_apic_id,
   823		.set_apic_id			= set_apic_id,
   824	
   825		.calc_dest_apicid		= apic_default_calc_apicid,
   826	
   827		.send_IPI			= uv_send_IPI_one,
   828		.send_IPI_mask			= uv_send_IPI_mask,
   829		.send_IPI_mask_allbutself	= uv_send_IPI_mask_allbutself,
   830		.send_IPI_allbutself		= uv_send_IPI_allbutself,
   831		.send_IPI_all			= uv_send_IPI_all,
 > 832		.send_IPI_self			= x2apic_send_IPI_self,
   833	
   834		.wakeup_secondary_cpu		= uv_wakeup_secondary,
   835	
   836		.read				= native_apic_msr_read,
   837		.write				= native_apic_msr_write,
   838		.eoi_write			= native_apic_msr_eoi_write,
   839		.icr_read			= native_x2apic_icr_read,
   840		.icr_write			= native_x2apic_icr_write,
   841	};
   842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
