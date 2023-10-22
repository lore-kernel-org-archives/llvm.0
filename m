Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43313AEC;
	Sun, 22 Oct 2023 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0F0PKd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698011235; x=1729547235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9fgD/1WCdZwn29ccuNz/etmXEjj+eZaFD/OmvNCXIg=;
  b=A0F0PKd+I1fmEA5EZ2J/YKSBkcH0psORfhAiPtnXL6qBjgLi0E6PO0bI
   qo7zCes7CS6iabc7K7biD+gS6rs4wnka3H+u+gfbZftdd3VFTQFXra6fg
   cHnsJKsOhYNdjyOsqFjllDEsieomLFQDpjPMxHUe/vc4gxfBkm8E81moi
   tfQB3HNxx4Ja+F8sQiRUQgGO3za7KpyLqwDJDWJUVNZliDNTDSSOPukfD
   WR5Ic5AgT7AlbyEEFNpCzAiFhs4Amm2RVRlc4CKyKRA6k5HO1ZQWJgO6F
   jeJzi6ojNsA3rpVu1s4jElG1tq/ken/vlXEABXkVjOTQ9R2venwhoI/ov
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="386554065"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="386554065"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 14:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="828240346"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="828240346"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Oct 2023 14:47:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qugHs-0006Ha-2W;
	Sun, 22 Oct 2023 21:47:08 +0000
Date: Mon, 23 Oct 2023 05:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/tip/tdx/2023/1013 10/10]
 arch/x86/kernel/x86_init.c:153:32: error: use of undeclared identifier
 'print_mem_encrypt_feature_info'
Message-ID: <202310230519.cdlkHIMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/tip/tdx/2023/1013
head:   a1d4d1204a2799ff94c9d1d01f2dda125aafa8e2
commit: a1d4d1204a2799ff94c9d1d01f2dda125aafa8e2 [10/10] x86/mm: Print the encryption features correctly when a paravisor is present
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231023/202310230519.cdlkHIMz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310230519.cdlkHIMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230519.cdlkHIMz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/x86_init.c:153:32: error: use of undeclared identifier 'print_mem_encrypt_feature_info'
           .print_mem_enc_feature_info     = print_mem_encrypt_feature_info,
                                             ^
   1 error generated.


vim +/print_mem_encrypt_feature_info +153 arch/x86/kernel/x86_init.c

   139	
   140	struct x86_platform_ops x86_platform __ro_after_init = {
   141		.calibrate_cpu			= native_calibrate_cpu_early,
   142		.calibrate_tsc			= native_calibrate_tsc,
   143		.get_wallclock			= mach_get_cmos_time,
   144		.set_wallclock			= mach_set_cmos_time,
   145		.iommu_shutdown			= iommu_shutdown_noop,
   146		.is_untracked_pat_range		= is_ISA_range,
   147		.nmi_init			= default_nmi_init,
   148		.get_nmi_reason			= default_get_nmi_reason,
   149		.save_sched_clock_state		= tsc_save_sched_clock_state,
   150		.restore_sched_clock_state	= tsc_restore_sched_clock_state,
   151		.realmode_reserve		= reserve_real_mode,
   152		.realmode_init			= init_real_mode,
 > 153		.print_mem_enc_feature_info	= print_mem_encrypt_feature_info,
   154		.hyper.pin_vcpu			= x86_op_int_noop,
   155		.hyper.is_private_mmio		= is_private_mmio_noop,
   156	
   157		.guest = {
   158			.enc_status_change_prepare = enc_status_change_prepare_noop,
   159			.enc_status_change_finish  = enc_status_change_finish_noop,
   160			.enc_tlb_flush_required	   = enc_tlb_flush_required_noop,
   161			.enc_cache_flush_required  = enc_cache_flush_required_noop,
   162		},
   163	};
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
