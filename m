Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1572066DE;
	Sat, 11 Jul 2026 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774517; cv=none; b=u8dEh7+qy+ZTyGLcX154RWNioQj5LoPVDoo5FfFqvxl3L0RYgv2+CyHnV/+VXVjVLriv2ThdvVVMgF4DSyqVzNKqPyn1I+GwHSmAROOz9NquDlsV0ZtMf/gHJ0KXD4En4BJbz4jd4tVGEgNAO+Q5ct7Sop1S3V+rUQxKyoNkxkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774517; c=relaxed/simple;
	bh=9yCfQocRiz4+f6dr1Madb/hlPXfZ2DDAlrT4hO0bP64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NiYW+CNAs+sW7v1HvDPkSNIpnPXWODCtGxlSBk9ZwEpimW5a6KfL1E+SaE+1ULjKeeSx15a+ni0l9m5merujQTnd+asWAVlzRvXHDPkzPOqV9VBRwqzSTSsxPts7EZh1a6jfebapWwPVRPsB7NepMCK/A1A0UzKj0CCtqcZPYI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqCF4Rp3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqCF4Rp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783774516; x=1815310516;
  h=date:from:to:cc:subject:message-id;
  bh=9yCfQocRiz4+f6dr1Madb/hlPXfZ2DDAlrT4hO0bP64=;
  b=KqCF4Rp3Lafmi7eAPMETHSRDzanRwP81d4m80dsxy82ZwNVC5ux/IRTk
   yyrB85Sc9LVOybSoiFSI3zvnUJfP7wgXMgsiG1/rluJvRpvStwmf1VQPP
   2lgpIs+4p0R0yFTdfC2oAYESH6FZh09sUXhhBR25QaNAIJIt4LDJcLHaR
   msvuYRqsINaDu1zctr2S2dClkVRcqth51FJD5M1zPZzgX5IX21/ZgBB4S
   FzS6U1WOoNiBvI63goy+4e0yDjEgiEBEfv0g6AnATygxcgBbn6PVpNDhT
   l+peOcmYbZh3lSvYQAzyh/MeOK6RF4/1Y8lkN3gjEyt8jIVtaibSGwGvM
   A==;
X-CSE-ConnectionGUID: tUNlFWhYR8K9dIzYjL6iTQ==
X-CSE-MsgGUID: yT41VbdTSjiln4zN/a4mTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84505445"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84505445"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 05:55:15 -0700
X-CSE-ConnectionGUID: YOR+xpKeRHmLXH86iDmZCQ==
X-CSE-MsgGUID: BsdfnQYSTJGDF/CMuKXZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254623791"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Jul 2026 05:55:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiXEY-00000000K3r-1kCP;
	Sat, 11 Jul 2026 12:55:08 +0000
Date: Sat, 11 Jul 2026 20:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 5603/5655] arch/x86/kvm/msrs.c:654:7:
 error: call to undeclared function 'static_cpu_has'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202607112000.6Z3R9tRe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: d9b292f64e4bc5ab3e14dc0b89a7b0cc47c11e00 [5603/5655] Merge branch 'next' of git://git.kernel.org/pub/scm/virt/kvm/kvm.git
config: x86_64-randconfig-071-20260710 (https://download.01.org/0day-ci/archive/20260711/202607112000.6Z3R9tRe-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607112000.6Z3R9tRe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607112000.6Z3R9tRe-lkp@intel.com/

Note: the linux-next/master HEAD bee763d5f341b99cf472afeb508d4988f62a6ca1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/x86/kvm/msrs.c:654:7: error: call to undeclared function 'static_cpu_has'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     654 |         if (!static_cpu_has(X86_FEATURE_XSAVES) &&
         |              ^
   arch/x86/kvm/msrs.c:654:7: note: did you mean '__static_cpu_has'?
   arch/x86/include/asm/cpufeature.h:99:29: note: '__static_cpu_has' declared here
      99 | static __always_inline bool __static_cpu_has(u16 bit)
         |                             ^
   1 error generated.


vim +/static_cpu_has +654 arch/x86/kvm/msrs.c

7a268308015843 Sean Christopherson 2026-06-12  623  
7a268308015843 Sean Christopherson 2026-06-12  624  static int set_efer(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
7a268308015843 Sean Christopherson 2026-06-12  625  {
7a268308015843 Sean Christopherson 2026-06-12  626  	u64 old_efer = vcpu->arch.efer;
7a268308015843 Sean Christopherson 2026-06-12  627  	u64 efer = msr_info->data;
7a268308015843 Sean Christopherson 2026-06-12  628  	int r;
7a268308015843 Sean Christopherson 2026-06-12  629  
7a268308015843 Sean Christopherson 2026-06-12  630  	if (efer & efer_reserved_bits)
7a268308015843 Sean Christopherson 2026-06-12  631  		return 1;
7a268308015843 Sean Christopherson 2026-06-12  632  
7a268308015843 Sean Christopherson 2026-06-12  633  	if (!msr_info->host_initiated) {
7a268308015843 Sean Christopherson 2026-06-12  634  		if (!__kvm_valid_efer(vcpu, efer))
7a268308015843 Sean Christopherson 2026-06-12  635  			return 1;
7a268308015843 Sean Christopherson 2026-06-12  636  
7a268308015843 Sean Christopherson 2026-06-12  637  		if (is_paging(vcpu) &&
7a268308015843 Sean Christopherson 2026-06-12  638  		    (vcpu->arch.efer & EFER_LME) != (efer & EFER_LME))
7a268308015843 Sean Christopherson 2026-06-12  639  			return 1;
7a268308015843 Sean Christopherson 2026-06-12  640  	}
7a268308015843 Sean Christopherson 2026-06-12  641  
7a268308015843 Sean Christopherson 2026-06-12  642  	efer &= ~EFER_LMA;
7a268308015843 Sean Christopherson 2026-06-12  643  	efer |= vcpu->arch.efer & EFER_LMA;
7a268308015843 Sean Christopherson 2026-06-12  644  
7a268308015843 Sean Christopherson 2026-06-12  645  	r = kvm_x86_call(set_efer)(vcpu, efer);
7a268308015843 Sean Christopherson 2026-06-12  646  	if (r) {
7a268308015843 Sean Christopherson 2026-06-12  647  		WARN_ON(r > 0);
7a268308015843 Sean Christopherson 2026-06-12  648  		return r;
7a268308015843 Sean Christopherson 2026-06-12  649  	}
7a268308015843 Sean Christopherson 2026-06-12  650  
7a268308015843 Sean Christopherson 2026-06-12  651  	if ((efer ^ old_efer) & KVM_MMU_EFER_ROLE_BITS)
7a268308015843 Sean Christopherson 2026-06-12  652  		kvm_mmu_reset_context(vcpu);
7a268308015843 Sean Christopherson 2026-06-12  653  
7a268308015843 Sean Christopherson 2026-06-12 @654  	if (!static_cpu_has(X86_FEATURE_XSAVES) &&
7a268308015843 Sean Christopherson 2026-06-12  655  	    (efer & EFER_SVME))
7a268308015843 Sean Christopherson 2026-06-12  656  		kvm_hv_xsaves_xsavec_maybe_warn(vcpu);
7a268308015843 Sean Christopherson 2026-06-12  657  
7a268308015843 Sean Christopherson 2026-06-12  658  	return 0;
7a268308015843 Sean Christopherson 2026-06-12  659  }
7a268308015843 Sean Christopherson 2026-06-12  660  

:::::: The code at line 654 was first introduced by commit
:::::: 7a268308015843c7e8b15dda588b2e9adf45223f KVM: x86: Move the bulk of MSR specific code from x86.c to msrs.{c,h}

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
