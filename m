Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE94347A87D;
	Tue, 28 Jul 2026 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785280968; cv=none; b=TEC+JCXEyNG8nXKrS9rhKDP5J/OmSAFLzanTVg3l51Lbp5GgM5rweYlqUtQvfWP4SsK2RJ9PkHI4eyGljdvT2Vb5LUHyMvpFVqdMAczNZS3mNAjddlLfiIzEhe2qujMiuMydVW1Gl8rtVBU71tYRbZvjH81OAwx9aZvKzKF1pxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785280968; c=relaxed/simple;
	bh=IVr/M0qs+ii2dzfXtIZevgLJzrmOW3E+LFrPlqsdMc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NdvrIAlz5vWWKjhOvSoZoPvXb8+nSI9v8ck742e+veiFgynCOERumxME9CZlD2tSu4fcC33HA88dMFvpV0qtUq0OzF6AXNPlwJmIzls26AKsX+hWK4uDlVYpSNAOEhwfW+8IC5XOaxAf2KXZals6TIvGFQDRP7US4SmfPg5M4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biIki4Kh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biIki4Kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785280966; x=1816816966;
  h=date:from:to:cc:subject:message-id;
  bh=IVr/M0qs+ii2dzfXtIZevgLJzrmOW3E+LFrPlqsdMc4=;
  b=biIki4Khr5mNZJYeBZveD4JPbj2xb2BNOIyiDaIPO+SZ8lRJc+wwvoVr
   5Aacg4xS4YBFTy/YqeZmKEsaYgwcWYN5Z1hpAH/fUcY5n75fSK4F5PETF
   sorexBPdQKEnf2aDBRczWePRfT5VRxWt/vYAzexs894Wa7tghfKZctZwr
   NWojnLLwELoR4xdtsQ3SkwuWhi8pvWqVEF3K9oNdeTYx6AxNhL/F08lcS
   mJpf03ExmgLN4fYgdZsgAQM+YZqy7AmKb1eciC54ECrEt7kq33U6/sYDU
   /nQYfE+Kok3/yuIsES5kCYU1cenH0/aWeFXGHcJ8Ijd9KQZkfzX2egdir
   w==;
X-CSE-ConnectionGUID: 2o+q9OXcQ8Okum3sHqY5Uw==
X-CSE-MsgGUID: MltMCF3DRJqnlmKEkdBzbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108676306"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="108676306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 16:22:45 -0700
X-CSE-ConnectionGUID: L5ONUnO1Q9WkhkPvtJJ2kA==
X-CSE-MsgGUID: ESfimJCRS/2jAfFMzhZFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="289796876"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 16:22:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wor8D-00000000eqh-0OXn;
	Tue, 28 Jul 2026 23:22:41 +0000
Date: Wed, 29 Jul 2026 07:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_bug_on_bad_eoi_vector 120/120]
 arch/x86/kvm/lapic.c:1625:6: error: conflicting types for
 'kvm_apic_set_eoi_accelerated'
Message-ID: <202607290705.MVp63a8U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/no_bug_on_bad_eoi_vector
head:   49569850d8b90a3da31a4d3e2518ce4aa618c242
commit: 49569850d8b90a3da31a4d3e2518ce4aa618c242 [120/120] KVM: x86: Track kvm_vcpu_arch.pending_ioapic_eoi as a u8 to drop dead BUG_ON()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260729/202607290705.MVp63a8U-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290705.MVp63a8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290705.MVp63a8U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/lapic.c:1625:6: error: conflicting types for 'kvm_apic_set_eoi_accelerated'
    1625 | void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, u8 vector)
         |      ^
   arch/x86/kvm/lapic.h:180:6: note: previous declaration is here
     180 | void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, int vector);
         |      ^
   1 error generated.


vim +/kvm_apic_set_eoi_accelerated +1625 arch/x86/kvm/lapic.c

  1620	
  1621	/*
  1622	 * this interface assumes a trap-like exit, which has already finished
  1623	 * desired side effect including vISR and vPPR update.
  1624	 */
> 1625	void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, u8 vector)
  1626	{
  1627		struct kvm_lapic *apic = vcpu->arch.apic;
  1628	
  1629		trace_kvm_eoi(apic, vector);
  1630	
  1631		kvm_ioapic_send_eoi(apic, vector);
  1632		kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
  1633	}
  1634	EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_eoi_accelerated);
  1635	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
