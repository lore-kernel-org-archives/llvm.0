Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82377344057;
	Wed, 19 Nov 2025 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546072; cv=none; b=EaEn4huRWBwohpkmZom8N4Ue5NBxumI698tcpZivr9lT+00N8EptpNqnmRa3Lle8ZUlAw+7fPhozdRAhlcI/z39UkhMx2ub0aSYhnssJAk+bNneG7I6msBtgHLtSC45A6ddNRjwmaYAwewoijMMlu/doNVLimOWsPc8Jv4CJoqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546072; c=relaxed/simple;
	bh=z2TWP4jUGjsyaNtUefTFGo4oseDca+8u0WpqNMed2Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvhHeWsA2GGVgPWubDvhJWe4ZNuNZO7tRpX1PZljtT06o+M04vRUPyrzMTv241gfVcWNGdMOFNU2QIRfAx5dAJeZr3Hj9xoqeEHXdPiX1PaQZdKwSZ07ZNHjpz1OWnLYABGZBLrsFE36qzsqn+M2jHfXuvAI4Eli/dlLso+QgJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7WKN05f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7WKN05f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763546070; x=1795082070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2TWP4jUGjsyaNtUefTFGo4oseDca+8u0WpqNMed2Xw=;
  b=V7WKN05f+GplyNBI8ESFRXzp/iQr+pEHYwYIL9lknis/NgG6Nw6lnbaM
   /nriwz2bajR5YDGO1t1sLZJRbk8KA57SELCJrfGcr24mntwn+6al1KVZe
   f5ieRtNm9jOAJ4NwBYTFVHDTLt6ePmceQHwno065WFGRDLZavpdgx8jpd
   B0gBVdegr/o2TLIQg5A958mjZ68V85AUZJm390iXom5E9QwPi0YXMFyYv
   QaUtpC+XH+YT11xrK2gliett7MwgU278/6NtMBte0GjL6cRnnNqPOyo21
   qo7D1rGGs2Z60lXTzL/+lWs69AA4j6dFOAQsUHcD4X6adCKYbddWkIqi2
   Q==;
X-CSE-ConnectionGUID: GwLDBoM0R/+qJ4Tktzx94A==
X-CSE-MsgGUID: 5tdFNLylSOubgqZSkTPetA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="91057082"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="91057082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:54:28 -0800
X-CSE-ConnectionGUID: yOIF8ZUhQRSTcny4CCVT8w==
X-CSE-MsgGUID: kkPR3wzLStKg9Ni08IjELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="195485850"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Nov 2025 01:54:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLetN-0002h5-0w;
	Wed, 19 Nov 2025 09:54:25 +0000
Date: Wed, 19 Nov 2025 17:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/sgx2_pferr_intercept 9/9]
 arch/x86/kvm/vmx/vmx.c:5213:17: error: call to undeclared function
 'IS_ENABLED_'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202511191755.QwebkOuA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/sgx2_pferr_intercept
head:   8a7add4d5d370361f93bd73f26aa92f198250ce5
commit: 8a7add4d5d370361f93bd73f26aa92f198250ce5 [9/9] KVM: VMX: Always reflect SGX EPCM #PFs back into the guest
config: x86_64-randconfig-013-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191755.QwebkOuA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191755.QwebkOuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191755.QwebkOuA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:5213:17: error: call to undeclared function 'IS_ENABLED_'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5213 |                 WARN_ON_ONCE(!IS_ENABLED_(CONFIG_X86_SGX_KVM) ||
         |                               ^
>> arch/x86/kvm/vmx/vmx.c:5213:29: error: use of undeclared identifier 'CONFIG_X86_SGX_KVM'
    5213 |                 WARN_ON_ONCE(!IS_ENABLED_(CONFIG_X86_SGX_KVM) ||
         |                                           ^
   2 errors generated.


vim +/IS_ENABLED_ +5213 arch/x86/kvm/vmx/vmx.c

  5195	
  5196	static int vmx_handle_page_fault(struct kvm_vcpu *vcpu, u32 error_code)
  5197	{
  5198		unsigned long cr2 = vmx_get_exit_qual(vcpu);
  5199	
  5200		if (vcpu->arch.apf.host_apf_flags)
  5201			goto handle_pf;
  5202	
  5203		/* When using EPT, KVM intercepts #PF only to detect illegal GPAs. */
  5204		WARN_ON_ONCE(enable_ept && !allow_smaller_maxphyaddr);
  5205	
  5206		/*
  5207		 * On SGX2 hardware, EPCM violations are delivered as #PF with the SGX
  5208		 * flag set in the error code (SGX1 harware generates #GP(0)).  EPCM
  5209		 * violations have nothing to do with shadow paging and can never be
  5210		 * resolved by KVM; always reflect them into the guest.
  5211		 */
  5212		if (error_code & PFERR_SGX_MASK) {
> 5213			WARN_ON_ONCE(!IS_ENABLED_(CONFIG_X86_SGX_KVM) ||
  5214				     !cpu_feature_enabled(X86_FEATURE_SGX2));
  5215			if (guest_cpu_cap_has(vcpu, X86_FEATURE_SGX2))
  5216				kvm_fixup_and_inject_pf_error(vcpu, cr2, error_code);
  5217			else
  5218				kvm_inject_gp(vcpu, 0);
  5219			return 1;
  5220		}
  5221	
  5222		/*
  5223		 * If EPT is enabled, fixup and inject the #PF.  KVM intercepts #PFs
  5224		 * only to set PFERR_RSVD as appropriate (hardware won't set RSVD due
  5225		 * to the GPA being legal with respect to host.MAXPHYADDR).
  5226		 */
  5227		if (enable_ept) {
  5228			kvm_fixup_and_inject_pf_error(vcpu, cr2, error_code);
  5229			return 1;
  5230		}
  5231	
  5232	handle_pf:
  5233		return kvm_handle_page_fault(vcpu, error_code, cr2, NULL, 0);
  5234	}
  5235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
