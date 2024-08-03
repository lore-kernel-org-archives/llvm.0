Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E891314D420;
	Sat,  3 Aug 2024 06:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722667417; cv=none; b=P8fTCyG/jp0mRR4LNTQ1dsiLhq0kOCYzL4V0Xtvx6sZM1pJF5FzaWU20iT0J8r+/o+FBxJAJHMnm51mcxRVDJO2Rmm5iOTbpCDc5t9G+9CnBDEvTwlcPbhhPrk6dBNHSxMduI0jeHrlHjPN72o253Te08/V41K7iz56aeZ965e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722667417; c=relaxed/simple;
	bh=zD1vDJwqv3jfe4TOWSQa3VPGLq8PcaWxOm1Fwcy7Ejs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvGdU+IlUjaPO0Z18b3/svkttnNIts6l0ydnku3f5qaTVbtHn2NqjZEIUcy/83Nk4hVZ9Rzqgxm7uGlNFhafFCRUa/ooP7w3wWWQzl9zUqqZdpgfMb/oRx70CNfYaEzfmmldbE8QPwr/lr2X65+58RoBN2c9yMhzqUssIRsyP0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFJfjCFw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFJfjCFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722667415; x=1754203415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zD1vDJwqv3jfe4TOWSQa3VPGLq8PcaWxOm1Fwcy7Ejs=;
  b=jFJfjCFwCZpTbqHNJsRHe09PRXWrTVAcgIOWV6heQPS3kSBgnDKg8ziL
   OoitBuI5Al/F5UqRn2GO1KS43XPb3Mv90GXHKhyoaB79ne49uLu1kzzBX
   3d9V+70twgDemaFuYxBVPmw8NeWVoA2Q+Q9at+jeyBwEzXaCkRLVqcMCK
   6WiVUITyt/6Ft2ut5j94I1RGEcZ4yWfTloFDM8cpO9D1YBYhiBkbKjAgr
   LNY2jphbHeiya0x296URiLGyDBe3ukiJbkvzc+/XinUCOydy5HRTurgC3
   FV9ztuxIe5Py+jNjRvxYLeNnhvMEUhYtPZjeGnRLKSTNr131xvyXLnrEF
   A==;
X-CSE-ConnectionGUID: dyfTnNSiTQi0ZpS5Ayoxaw==
X-CSE-MsgGUID: b/MBTusGQLKBwxG1wk6t4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20810079"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20810079"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 23:43:34 -0700
X-CSE-ConnectionGUID: q3/OU/1BTeO9Ze2yLSKD/A==
X-CSE-MsgGUID: YfTzSNjgRh6Rvi+eUOc+Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="56244620"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Aug 2024 23:43:33 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa8TQ-0000Bm-1z;
	Sat, 03 Aug 2024 06:43:07 +0000
Date: Sat, 3 Aug 2024 14:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
Subject: [intel-tdx:tdx_kvm_dev-2024-08-01-rebase 66/152]
 arch/x86/kvm/vmx/main.c:34:14: error: expression is not assignable
Message-ID: <202408031457.OSm7ShBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-08-01-rebase
head:   5c43d1421f84cdeb3172f10826e98cbb920657fa
commit: 9cf78ea6bd2d11c2f86e94a416ddcf6797a60602 [66/152] With fixup: KVM: TDX: TDP MMU TDX support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240803/202408031457.OSm7ShBY-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031457.OSm7ShBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031457.OSm7ShBY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/main.c:34:14: error: expression is not assignable
      34 |                 enable_tdx = false;
         |                 ~~~~~~~~~~ ^
   1 error generated.


vim +34 arch/x86/kvm/vmx/main.c

    17	
    18	static __init int vt_hardware_setup(void)
    19	{
    20		int ret;
    21	
    22		ret = vmx_hardware_setup();
    23		if (ret)
    24			return ret;
    25	
    26	#if IS_ENABLED(CONFIG_HYPERV)
    27		/*
    28		 * TDX KVM overrides flush_remote_tlbs method and assumes
    29		 * flush_remote_tlbs_range = NULL that falls back to
    30		 * flush_remote_tlbs.  Disable TDX if there are conflicts.
    31		 */
    32		if (vt_x86_ops.flush_remote_tlbs ||
    33		    vt_x86_ops.flush_remote_tlbs_range) {
  > 34			enable_tdx = false;
    35			pr_warn_ratelimited("TDX requires baremetal. Not Supported on VMM guest.\n");
    36		}
    37	#endif
    38	
    39		/*
    40		 * Undate vt_x86_ops::vm_size here so it is ready before
    41		 * kvm_ops_update() is called in kvm_x86_vendor_init().
    42		 *
    43		 * Note, the actual bringing up of TDX must be done after
    44		 * kvm_ops_update() because enabling TDX requires enabling
    45		 * hardware virtualization first, i.e., all online CPUs must
    46		 * be in post-VMXON state.  This means the @vm_size here
    47		 * may be updated to TDX's size but TDX may fail to enable
    48		 * at later time.
    49		 *
    50		 * The VMX/VT code could update kvm_x86_ops::vm_size again
    51		 * after bringing up TDX, but this would require exporting
    52		 * either kvm_x86_ops or kvm_ops_update() from the base KVM
    53		 * module, which looks overkill.  Anyway, the worst case here
    54		 * is KVM may allocate couple of more bytes than needed for
    55		 * each VM.
    56		 */
    57		if (enable_tdx) {
    58			vt_x86_ops.vm_size = max_t(unsigned int, vt_x86_ops.vm_size,
    59					sizeof(struct kvm_tdx));
    60			/*
    61			 * Note, TDX may fail to initialize in a later time in
    62			 * vt_init(), in which case it is not necessary to setup
    63			 * those callbacks.  But making them valid here even
    64			 * when TDX fails to init later is fine because those
    65			 * callbacks won't be called if the VM isn't TDX guest.
    66			 */
    67			vt_x86_ops.link_external_spt = tdx_sept_link_private_spt;
    68			vt_x86_ops.set_external_spte = tdx_sept_set_private_spte;
    69			vt_x86_ops.free_external_spt = tdx_sept_free_private_spt;
    70			vt_x86_ops.remove_external_spte = tdx_sept_remove_private_spte;
    71		}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
