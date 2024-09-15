Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA602CA6;
	Sun, 15 Sep 2024 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726392583; cv=none; b=dw7Tl+q8plu1ZzjhrX5pfU4QG3uHCAGJhk7AYLUepbgbK5MXHrZhjHPQJaU+ltkD8uUhAIhmUZ83bI94JNrGhTVKZIaiXJzcAuMg2nWfMnTWHtBWgVVnIEmff/S8Df+xvli3JrEYOtRnm9nt//21IXtQYC1yPoLcIsHaOdOnIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726392583; c=relaxed/simple;
	bh=TszFXaylzmnPuohkYga8ClQMG3bQ89E0bbgJZ3Z+hMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFyDLhkPzST3MAr2AlAxcpo4CZm5mcRWF+8eUhOtPo+lGhkfcJYHnUn/E5eKk6l72vNWXK/VJnyDzskfwmCKehD2TgCs4s9BUIoCheWhJKoOaHu5ypdaSjIdgWYYBKg/GsVIPxX5lRA1euI3HiRz/Vpfsxy3jF2Y4kbA1DWDcHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHnKCbn1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHnKCbn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726392581; x=1757928581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TszFXaylzmnPuohkYga8ClQMG3bQ89E0bbgJZ3Z+hMg=;
  b=GHnKCbn1cGoTIHgzpLK7tjY/vNSgoLaQUzaT/WV6ckj7hOfB0c6P1Ucf
   yQtyrUDqfxaHD5kKhNoUBQ0IwHz2K/GoeXiascnIVHh4U9gPcZDLquQ9f
   BvlJyWHBQfl4F46b9pybBND6HDEzfgPU+/GJR2EC+rC8g47jbBjMNe74l
   2uOBXtUESqNRzNxwH1cYRDpZMjmJx/849hjuVijq8CID1WzpO66Oi9ee8
   0lY06QprQu6H1iPMUxWwh78ckUMiNWlIqG4FpDayxB6FemMrl4mcepplx
   gSlQ7OzpV/eAnko4+CxHFb/uFAR7eM0WmLxOQGGsjb0+bxh4vG4gKNOuH
   A==;
X-CSE-ConnectionGUID: q89VNaiCS1u1dpljAJjDSQ==
X-CSE-MsgGUID: 6ZQdb25QTU+bRY8hVUG5PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35922843"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="35922843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 02:29:40 -0700
X-CSE-ConnectionGUID: 8FJKq9YcTX+jS3kt3zKdFg==
X-CSE-MsgGUID: HLFfcmXwRiWN+0zCgaq2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="73358385"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2024 02:29:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1splZY-0008Zy-1R;
	Sun, 15 Sep 2024 09:29:36 +0000
Date: Sun, 15 Sep 2024 17:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Kaplan <david.kaplan@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 16/34] x86/bugs: Restructure l1tf mitigation
Message-ID: <202409151724.plotIQDU-lkp@intel.com>
References: <20240912190857.235849-17-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912190857.235849-17-david.kaplan@amd.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on next-20240913]
[cannot apply to tip/x86/core tip/smp/core tip/auto-latest linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Kaplan/x86-bugs-Relocate-mds-taa-mmio-rfds-defines/20240913-031908
base:   tip/master
patch link:    https://lore.kernel.org/r/20240912190857.235849-17-david.kaplan%40amd.com
patch subject: [RFC PATCH 16/34] x86/bugs: Restructure l1tf mitigation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240915/202409151724.plotIQDU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151724.plotIQDU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151724.plotIQDU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:270:11: warning: enumeration value 'L1TF_MITIGATION_AUTO' not handled in switch [-Wswitch]
     270 |                 switch (l1tf_mitigation) {
         |                         ^~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:7626:11: warning: enumeration value 'L1TF_MITIGATION_AUTO' not handled in switch [-Wswitch]
    7626 |                 switch (l1tf_mitigation) {
         |                         ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/L1TF_MITIGATION_AUTO +270 arch/x86/kvm/vmx/vmx.c

7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  247  
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  248  static int vmx_setup_l1d_flush(enum vmx_l1d_flush_state l1tf)
a399477e52c17e arch/x86/kvm/vmx.c     Konrad Rzeszutek Wilk 2018-07-02  249  {
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  250  	struct page *page;
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  251  	unsigned int i;
a399477e52c17e arch/x86/kvm/vmx.c     Konrad Rzeszutek Wilk 2018-07-02  252  
19a36d329f5b1e arch/x86/kvm/vmx/vmx.c Waiman Long           2019-08-26  253  	if (!boot_cpu_has_bug(X86_BUG_L1TF)) {
19a36d329f5b1e arch/x86/kvm/vmx/vmx.c Waiman Long           2019-08-26  254  		l1tf_vmx_mitigation = VMENTER_L1D_FLUSH_NOT_REQUIRED;
19a36d329f5b1e arch/x86/kvm/vmx/vmx.c Waiman Long           2019-08-26  255  		return 0;
19a36d329f5b1e arch/x86/kvm/vmx/vmx.c Waiman Long           2019-08-26  256  	}
19a36d329f5b1e arch/x86/kvm/vmx/vmx.c Waiman Long           2019-08-26  257  
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  258  	if (!enable_ept) {
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  259  		l1tf_vmx_mitigation = VMENTER_L1D_FLUSH_EPT_DISABLED;
a399477e52c17e arch/x86/kvm/vmx.c     Konrad Rzeszutek Wilk 2018-07-02  260  		return 0;
a399477e52c17e arch/x86/kvm/vmx.c     Konrad Rzeszutek Wilk 2018-07-02  261  	}
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  262  
7974c0643ee3b4 arch/x86/kvm/vmx/vmx.c Sean Christopherson   2024-04-23  263  	if (kvm_host.arch_capabilities & ARCH_CAP_SKIP_VMENTRY_L1DFLUSH) {
8e0b2b916662e0 arch/x86/kvm/vmx.c     Paolo Bonzini         2018-08-05  264  		l1tf_vmx_mitigation = VMENTER_L1D_FLUSH_NOT_REQUIRED;
8e0b2b916662e0 arch/x86/kvm/vmx.c     Paolo Bonzini         2018-08-05  265  		return 0;
8e0b2b916662e0 arch/x86/kvm/vmx.c     Paolo Bonzini         2018-08-05  266  	}
8e0b2b916662e0 arch/x86/kvm/vmx.c     Paolo Bonzini         2018-08-05  267  
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  268  	/* If set to auto use the default l1tf mitigation method */
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  269  	if (l1tf == VMENTER_L1D_FLUSH_AUTO) {
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13 @270  		switch (l1tf_mitigation) {
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  271  		case L1TF_MITIGATION_OFF:
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  272  			l1tf = VMENTER_L1D_FLUSH_NEVER;
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  273  			break;
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  274  		case L1TF_MITIGATION_FLUSH_NOWARN:
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  275  		case L1TF_MITIGATION_FLUSH:
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  276  		case L1TF_MITIGATION_FLUSH_NOSMT:
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  277  			l1tf = VMENTER_L1D_FLUSH_COND;
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  278  			break;
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  279  		case L1TF_MITIGATION_FULL:
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  280  		case L1TF_MITIGATION_FULL_FORCE:
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  281  			l1tf = VMENTER_L1D_FLUSH_ALWAYS;
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  282  			break;
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  283  		}
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  284  	} else if (l1tf_mitigation == L1TF_MITIGATION_FULL_FORCE) {
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  285  		l1tf = VMENTER_L1D_FLUSH_ALWAYS;
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  286  	}
d90a7a0ec83fb8 arch/x86/kvm/vmx.c     Jiri Kosina           2018-07-13  287  
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  288  	if (l1tf != VMENTER_L1D_FLUSH_NEVER && !vmx_l1d_flush_pages &&
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  289  	    !boot_cpu_has(X86_FEATURE_FLUSH_L1D)) {
4183683918efc3 arch/x86/kvm/vmx/vmx.c Ben Gardon            2019-02-11  290  		/*
4183683918efc3 arch/x86/kvm/vmx/vmx.c Ben Gardon            2019-02-11  291  		 * This allocation for vmx_l1d_flush_pages is not tied to a VM
4183683918efc3 arch/x86/kvm/vmx/vmx.c Ben Gardon            2019-02-11  292  		 * lifetime and so should not be charged to a memcg.
4183683918efc3 arch/x86/kvm/vmx/vmx.c Ben Gardon            2019-02-11  293  		 */
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  294  		page = alloc_pages(GFP_KERNEL, L1D_CACHE_ORDER);
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  295  		if (!page)
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  296  			return -ENOMEM;
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  297  		vmx_l1d_flush_pages = page_address(page);
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  298  
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  299  		/*
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  300  		 * Initialize each page with a different pattern in
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  301  		 * order to protect against KSM in the nested
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  302  		 * virtualization case.
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  303  		 */
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  304  		for (i = 0; i < 1u << L1D_CACHE_ORDER; ++i) {
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  305  			memset(vmx_l1d_flush_pages + i * PAGE_SIZE, i + 1,
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  306  			       PAGE_SIZE);
288d152c23dcf3 arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-18  307  		}
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  308  	}
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  309  
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  310  	l1tf_vmx_mitigation = l1tf;
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  311  
895ae47f991883 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  312  	if (l1tf != VMENTER_L1D_FLUSH_NEVER)
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  313  		static_branch_enable(&vmx_l1d_should_flush);
895ae47f991883 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  314  	else
895ae47f991883 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  315  		static_branch_disable(&vmx_l1d_should_flush);
895ae47f991883 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  316  
427362a142441f arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-21  317  	if (l1tf == VMENTER_L1D_FLUSH_COND)
427362a142441f arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-21  318  		static_branch_enable(&vmx_l1d_flush_cond);
895ae47f991883 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  319  	else
427362a142441f arch/x86/kvm/vmx.c     Nicolai Stange        2018-07-21  320  		static_branch_disable(&vmx_l1d_flush_cond);
7db92e165ac814 arch/x86/kvm/vmx.c     Thomas Gleixner       2018-07-13  321  	return 0;
a399477e52c17e arch/x86/kvm/vmx.c     Konrad Rzeszutek Wilk 2018-07-02  322  }
a399477e52c17e arch/x86/kvm/vmx.c     Konrad Rzeszutek Wilk 2018-07-02  323  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
