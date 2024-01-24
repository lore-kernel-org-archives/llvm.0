Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA6F4F3;
	Wed, 24 Jan 2024 05:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706075697; cv=none; b=GRzV/hFSxn8Xs8YQtYiqMCF0DmcoXeXebdGgDy9hYCZM0k66bzSgrQpcqljDoDIUoILNwLmA2CbcI8q1E47voj4pdINlrzP+36W1JyAfomeb/u1KkwZGrtwH+j3BMSbLvxFSKrJZMrY/of4jRoVlytuUJzmnUhZsy0nHqNuFclo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706075697; c=relaxed/simple;
	bh=iCQV5u7Bm9rFSHA45cGM20F3yPuPRPF4rPN48lmk0TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n93/WEi+N8wA7PNru73rh49xvw59+AHQfduRTY9al6f4PepVwY7j1unc4xmTjRb0AXVIHNdYBFbNq/c0jEbGo9cDJEsrybAk/Nenuukz43TVpnlbRraCuzVIVg1wpMwy1h/upBgIO06ZPtdCE79l9wsGU3SbQb/bcrBvZ8Foe34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOCQAWB+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOCQAWB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706075696; x=1737611696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iCQV5u7Bm9rFSHA45cGM20F3yPuPRPF4rPN48lmk0TQ=;
  b=WOCQAWB+9mj0a2+R6BlNlzppaTfFGh9IFufC4dUWHcvdXXTNb51icT1/
   BbKI+ae4Gbe7OUBybvZO4Q/cRZGJtLAMpDh2pjw+4n9mGtzPK/qnFPg8P
   v8YnV48kf5IBX6tC1vGylbqT61HNakAlYDC8jvWmsDjQNntDp6uKvY0aR
   ztxu7CLhZ7d3GaNH8EV6Ar6NzQavYlp8vrqBnw0KTGmYg2i4UvIqcmqyY
   FgkN4wbiE9IPVhHpU+puqsgOIEeNZvexwZT7G2wjtuYwy8xQGu0nuGO1l
   331Huu1Lqq6XA4dmkPYhnWLNHkamIB9seGqAKY3dLsksEi/na5NrY4aZb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="649048"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="649048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 21:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1866537"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2024 21:54:54 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSWDr-0007ud-3B;
	Wed, 24 Jan 2024 05:54:51 +0000
Date: Wed, 24 Jan 2024 13:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 70/252] arch/x86/kvm/vmx/main.c:83:17:
 error: no member named 'flush_remote_tlbs' in 'struct kvm_x86_ops'
Message-ID: <202401241306.xcL02JqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   cd5f3a9ef935bc249a18a3c6607ae2128c1ced06
commit: a47c5a9442130f45fc09c1d4ae0e4352054be636 [70/252] KVM: TDX: TDP MMU TDX support
config: x86_64-buildonly-randconfig-001-20240124 (https://download.01.org/0day-ci/archive/20240124/202401241306.xcL02JqR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241306.xcL02JqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241306.xcL02JqR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/main.c:83:17: error: no member named 'flush_remote_tlbs' in 'struct kvm_x86_ops'
      83 |         if (vt_x86_ops.flush_remote_tlbs ||
         |             ~~~~~~~~~~ ^
>> arch/x86/kvm/vmx/main.c:84:17: error: no member named 'flush_remote_tlbs_range' in 'struct kvm_x86_ops'
      84 |             vt_x86_ops.flush_remote_tlbs_range) {
         |             ~~~~~~~~~~ ^
   arch/x86/kvm/vmx/main.c:92:14: error: no member named 'flush_remote_tlbs' in 'struct kvm_x86_ops'
      92 |                 vt_x86_ops.flush_remote_tlbs = vt_flush_remote_tlbs;
         |                 ~~~~~~~~~~ ^
   3 errors generated.


vim +83 arch/x86/kvm/vmx/main.c

    50	
    51	static __init int vt_hardware_setup(void)
    52	{
    53		int ret;
    54	
    55		ret = vmx_hardware_setup();
    56		if (ret)
    57			return ret;
    58	
    59		/*
    60		 * As kvm_mmu_set_ept_masks() updates enable_mmio_caching, call it
    61		 * before checking enable_mmio_caching.
    62		 */
    63		if (enable_ept)
    64			kvm_mmu_set_ept_masks(enable_ept_ad_bits,
    65					      cpu_has_vmx_ept_execute_only());
    66		/* TDX requires KVM TDP MMU. */
    67		if (enable_tdx && !tdp_enabled) {
    68			enable_tdx = false;
    69			pr_warn_ratelimited("TDX requires TDP MMU.  Please enable TDP MMU for TDX.\n");
    70		}
    71	
    72		/* TDX requires MMIO caching. */
    73		if (enable_tdx && !enable_mmio_caching) {
    74			enable_tdx = false;
    75			pr_warn_ratelimited("TDX requires mmio caching.  Please enable mmio caching for TDX.\n");
    76		}
    77	
    78		/*
    79		 * TDX KVM overrides flush_remote_tlbs method and assumes
    80		 * flush_remote_tlbs_range = NULL that falls back to
    81		 * flush_remote_tlbs.  Disable TDX if there are conflicts.
    82		 */
  > 83		if (vt_x86_ops.flush_remote_tlbs ||
  > 84		    vt_x86_ops.flush_remote_tlbs_range) {
    85			enable_tdx = false;
    86			pr_warn_ratelimited("TDX requires baremetal. Not Supported on VMM guest.\n");
    87		}
    88	
    89		enable_tdx = enable_tdx && !tdx_hardware_setup(&vt_x86_ops);
    90	
    91		if (enable_tdx)
    92			vt_x86_ops.flush_remote_tlbs = vt_flush_remote_tlbs;
    93	
    94		return 0;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
