Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74E0BA37;
	Fri, 13 Sep 2024 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726253238; cv=none; b=tAOAIhw7p+jVNXVkMv5WLayRlVt85qWEVRj3Q8Tp34c5yE5nym4NUC8GJvAmwdcemptIzjw977zaV0Me8yGdjSfHhGC3g3i4TyVcWznZWFWvSC1uwgQcNIHlqxld8xrbXPQz2aw9fylWMQ3NPCCWGI5DrUIfjw4QOvx4DOr1nto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726253238; c=relaxed/simple;
	bh=Mn0loPp5U4L/icz1xLkVlHzdGcVblKS2F46A7SA88SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnZkkwiuihLyoBH355n7uzpcciB7apM+NW2+uTNwtIiJ6bN9jgkbVik2OSM4uuE+f063ruHdVj30ozTzZuMIj6s4lo7MGracDHfuzuMuCvoPmTM+W/xdzLiXqjlDOT265FOViqrFEVVIoTHhYGCbJFBkZjfsLjjXCFExdneGzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqcCA8qj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqcCA8qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726253237; x=1757789237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mn0loPp5U4L/icz1xLkVlHzdGcVblKS2F46A7SA88SY=;
  b=PqcCA8qjF7ESKh2CFiaUi5AJeQQAaF5yA+jhSAlAswen8MmqebTmW0aI
   tRw8UkPaxYQmX+A9haA0+KpYlYCHDCMRPsfP+cVbHNt0wyzktOjtj9ROq
   I+OpqL5hZqT0Zzh2iFEena6l/GqOH+9mpiHLtZcj0JF5tyVK/cFsmWtKu
   Dsx9JrU0n7DM3QiSlKNf2sRk6a3vUyDbNV4m25PGZC6I1EeqF4Pv6XgN0
   /DP78VetnGkHaB25PgZkcmiqT66qf5yOaQ07yNTvKBsr/EC+Gz1Wf7Fim
   IWcdjPaE8f4pJ93bFYdZ+yLWNMI+plzarr9rNAEZUgRLN5qJD8iX5aMO9
   w==;
X-CSE-ConnectionGUID: +H6lPP+ARTSi94gjOeaMng==
X-CSE-MsgGUID: VTNIxR4rTRegCRs45dpw0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24991159"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="24991159"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:47:16 -0700
X-CSE-ConnectionGUID: bW1FyCbKQe67w2ZGJo6NLQ==
X-CSE-MsgGUID: 7IToUScuR0yNJDHCFq9uhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="72529669"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 11:47:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spBK5-0006qO-0H;
	Fri, 13 Sep 2024 18:47:13 +0000
Date: Sat, 14 Sep 2024 02:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Roy <roypat@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 02/10] kvm: gmem: Add KVM_GMEM_GET_PFN_SHARED
Message-ID: <202409140259.UDF2K6th-lkp@intel.com>
References: <20240910163038.1298452-3-roypat@amazon.co.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910163038.1298452-3-roypat@amazon.co.uk>

Hi Patrick,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 332d2c1d713e232e163386c35a3ba0c1b90df83f]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrick-Roy/kvm-gmem-Add-option-to-remove-gmem-from-direct-map/20240911-003258
base:   332d2c1d713e232e163386c35a3ba0c1b90df83f
patch link:    https://lore.kernel.org/r/20240910163038.1298452-3-roypat%40amazon.co.uk
patch subject: [RFC PATCH v2 02/10] kvm: gmem: Add KVM_GMEM_GET_PFN_SHARED
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240914/202409140259.UDF2K6th-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140259.UDF2K6th-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140259.UDF2K6th-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/sev.c:3860:56: error: too few arguments to function call, expected 6, have 5
    3860 |                 if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
         |                     ~~~~~~~~~~~~~~~~                                 ^
   include/linux/kvm_host.h:2439:5: note: 'kvm_gmem_get_pfn' declared here
    2439 | int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
         |     ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2440 |                      gfn_t gfn, kvm_pfn_t *pfn, int *max_order, unsigned long flags);
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4715:53: error: too few arguments to function call, expected 6, have 5
    4715 |         ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
         |               ~~~~~~~~~~~~~~~~                             ^
   include/linux/kvm_host.h:2439:5: note: 'kvm_gmem_get_pfn' declared here
    2439 | int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
         |     ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2440 |                      gfn_t gfn, kvm_pfn_t *pfn, int *max_order, unsigned long flags);
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +3860 arch/x86/kvm/svm/sev.c

9b54e248d2644b Michael Roth 2024-05-01  3833  
e366f92ea99e19 Tom Lendacky 2024-05-01  3834  static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
e366f92ea99e19 Tom Lendacky 2024-05-01  3835  {
e366f92ea99e19 Tom Lendacky 2024-05-01  3836  	struct vcpu_svm *svm = to_svm(vcpu);
e366f92ea99e19 Tom Lendacky 2024-05-01  3837  
e366f92ea99e19 Tom Lendacky 2024-05-01  3838  	WARN_ON(!mutex_is_locked(&svm->sev_es.snp_vmsa_mutex));
e366f92ea99e19 Tom Lendacky 2024-05-01  3839  
e366f92ea99e19 Tom Lendacky 2024-05-01  3840  	/* Mark the vCPU as offline and not runnable */
e366f92ea99e19 Tom Lendacky 2024-05-01  3841  	vcpu->arch.pv.pv_unhalted = false;
e366f92ea99e19 Tom Lendacky 2024-05-01  3842  	vcpu->arch.mp_state = KVM_MP_STATE_HALTED;
e366f92ea99e19 Tom Lendacky 2024-05-01  3843  
e366f92ea99e19 Tom Lendacky 2024-05-01  3844  	/* Clear use of the VMSA */
e366f92ea99e19 Tom Lendacky 2024-05-01  3845  	svm->vmcb->control.vmsa_pa = INVALID_PAGE;
e366f92ea99e19 Tom Lendacky 2024-05-01  3846  
e366f92ea99e19 Tom Lendacky 2024-05-01  3847  	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
e366f92ea99e19 Tom Lendacky 2024-05-01  3848  		gfn_t gfn = gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
e366f92ea99e19 Tom Lendacky 2024-05-01  3849  		struct kvm_memory_slot *slot;
e366f92ea99e19 Tom Lendacky 2024-05-01  3850  		kvm_pfn_t pfn;
e366f92ea99e19 Tom Lendacky 2024-05-01  3851  
e366f92ea99e19 Tom Lendacky 2024-05-01  3852  		slot = gfn_to_memslot(vcpu->kvm, gfn);
e366f92ea99e19 Tom Lendacky 2024-05-01  3853  		if (!slot)
e366f92ea99e19 Tom Lendacky 2024-05-01  3854  			return -EINVAL;
e366f92ea99e19 Tom Lendacky 2024-05-01  3855  
e366f92ea99e19 Tom Lendacky 2024-05-01  3856  		/*
e366f92ea99e19 Tom Lendacky 2024-05-01  3857  		 * The new VMSA will be private memory guest memory, so
e366f92ea99e19 Tom Lendacky 2024-05-01  3858  		 * retrieve the PFN from the gmem backend.
e366f92ea99e19 Tom Lendacky 2024-05-01  3859  		 */
e366f92ea99e19 Tom Lendacky 2024-05-01 @3860  		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
e366f92ea99e19 Tom Lendacky 2024-05-01  3861  			return -EINVAL;
e366f92ea99e19 Tom Lendacky 2024-05-01  3862  
e366f92ea99e19 Tom Lendacky 2024-05-01  3863  		/*
e366f92ea99e19 Tom Lendacky 2024-05-01  3864  		 * From this point forward, the VMSA will always be a
e366f92ea99e19 Tom Lendacky 2024-05-01  3865  		 * guest-mapped page rather than the initial one allocated
e366f92ea99e19 Tom Lendacky 2024-05-01  3866  		 * by KVM in svm->sev_es.vmsa. In theory, svm->sev_es.vmsa
e366f92ea99e19 Tom Lendacky 2024-05-01  3867  		 * could be free'd and cleaned up here, but that involves
e366f92ea99e19 Tom Lendacky 2024-05-01  3868  		 * cleanups like wbinvd_on_all_cpus() which would ideally
e366f92ea99e19 Tom Lendacky 2024-05-01  3869  		 * be handled during teardown rather than guest boot.
e366f92ea99e19 Tom Lendacky 2024-05-01  3870  		 * Deferring that also allows the existing logic for SEV-ES
e366f92ea99e19 Tom Lendacky 2024-05-01  3871  		 * VMSAs to be re-used with minimal SNP-specific changes.
e366f92ea99e19 Tom Lendacky 2024-05-01  3872  		 */
e366f92ea99e19 Tom Lendacky 2024-05-01  3873  		svm->sev_es.snp_has_guest_vmsa = true;
e366f92ea99e19 Tom Lendacky 2024-05-01  3874  
e366f92ea99e19 Tom Lendacky 2024-05-01  3875  		/* Use the new VMSA */
e366f92ea99e19 Tom Lendacky 2024-05-01  3876  		svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
e366f92ea99e19 Tom Lendacky 2024-05-01  3877  
e366f92ea99e19 Tom Lendacky 2024-05-01  3878  		/* Mark the vCPU as runnable */
e366f92ea99e19 Tom Lendacky 2024-05-01  3879  		vcpu->arch.pv.pv_unhalted = false;
e366f92ea99e19 Tom Lendacky 2024-05-01  3880  		vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
e366f92ea99e19 Tom Lendacky 2024-05-01  3881  
e366f92ea99e19 Tom Lendacky 2024-05-01  3882  		svm->sev_es.snp_vmsa_gpa = INVALID_PAGE;
e366f92ea99e19 Tom Lendacky 2024-05-01  3883  
e366f92ea99e19 Tom Lendacky 2024-05-01  3884  		/*
e366f92ea99e19 Tom Lendacky 2024-05-01  3885  		 * gmem pages aren't currently migratable, but if this ever
e366f92ea99e19 Tom Lendacky 2024-05-01  3886  		 * changes then care should be taken to ensure
e366f92ea99e19 Tom Lendacky 2024-05-01  3887  		 * svm->sev_es.vmsa is pinned through some other means.
e366f92ea99e19 Tom Lendacky 2024-05-01  3888  		 */
e366f92ea99e19 Tom Lendacky 2024-05-01  3889  		kvm_release_pfn_clean(pfn);
e366f92ea99e19 Tom Lendacky 2024-05-01  3890  	}
e366f92ea99e19 Tom Lendacky 2024-05-01  3891  
e366f92ea99e19 Tom Lendacky 2024-05-01  3892  	/*
e366f92ea99e19 Tom Lendacky 2024-05-01  3893  	 * When replacing the VMSA during SEV-SNP AP creation,
e366f92ea99e19 Tom Lendacky 2024-05-01  3894  	 * mark the VMCB dirty so that full state is always reloaded.
e366f92ea99e19 Tom Lendacky 2024-05-01  3895  	 */
e366f92ea99e19 Tom Lendacky 2024-05-01  3896  	vmcb_mark_all_dirty(svm->vmcb);
e366f92ea99e19 Tom Lendacky 2024-05-01  3897  
e366f92ea99e19 Tom Lendacky 2024-05-01  3898  	return 0;
e366f92ea99e19 Tom Lendacky 2024-05-01  3899  }
e366f92ea99e19 Tom Lendacky 2024-05-01  3900  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
