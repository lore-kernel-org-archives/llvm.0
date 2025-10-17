Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E66323E355;
	Fri, 17 Oct 2025 01:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760666250; cv=none; b=ICB7TTl3Uz237XEs1IQUsSvbjksDuPl6DwELSwu4CEJo/Yt4l/NzeyB6B9NO+BZLI/wKMMHmA5RZZGtzOHqunoMFzMRoXv7bpj7NakXDYUtVP1VwqVbMFhRMM/1Krc5zMJQC7EGEMYp09ySlD6ywrq/8XSHmwsUl1X3R5kBg408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760666250; c=relaxed/simple;
	bh=FSnXlUprzJ6/GjHT9jVLvuET62yTo0SOCQNl8MRc+pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8f3kvEOs2fZxXp0uAnSGBUD2xJQlBLN5RKTn68ay+jMHEN1FNlHh62roxNXyMfxuKNWYZz5P4I5LaNs1yJt07SxmgVeD+b6z9h1TEBjzPj6ngwc1YKGbdPAFTsFdkoI5ythGSWUIsd8BUdzDnJ0b/5PpAUfACaRHZVxR8qm1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2BweJwZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2BweJwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760666248; x=1792202248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSnXlUprzJ6/GjHT9jVLvuET62yTo0SOCQNl8MRc+pY=;
  b=n2BweJwZNCEC/yJy9IO8WA/PVyftmgjDOiAdfscVAm2AsmsjIWVXlFJt
   dfkWaXk7N9K5p6lGIFW0p5qnUuTNd0oYWuBLJPYlhsPAa4xoKVkBZmx1n
   KjJMTLeyNJHEPH5aLVCpr149ZNfYbdrNTNB6K5nLC0lswc7mZ1ryERA3P
   oO397AoMYN/khSh+k0F/HPcFPfyZukfcTJPJOOrnofOGCuU06K+yqKtqh
   EB3VoT7kWtj+d5l2zflmxqIaN72wbepR8wRLUE0oJAcsrRsF0OAbRlXku
   ALflq2kNoBWJVajqQPOXj9GPw4TP2rbFUNyrnPkmI5LmNcK7+kV5ldxEo
   A==;
X-CSE-ConnectionGUID: LePZ/I6/TAawue2PPcNcwA==
X-CSE-MsgGUID: m5ZM3v2cQEShPMs3YoyaxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73474677"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="73474677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 18:57:26 -0700
X-CSE-ConnectionGUID: JamR5+MQTiWzBebJzZGutA==
X-CSE-MsgGUID: Nq3e5COIQ7ejODCDWtfBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187007959"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2025 18:57:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Zic-0005Qp-2P;
	Fri, 17 Oct 2025 01:57:22 +0000
Date: Fri, 17 Oct 2025 09:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/l1tf_mitigation_mitigation 5/5]
 arch/x86/kvm/vmx/vmx.c:406:4: warning: non-void function 'vmx_l1d_flush'
 should return a value
Message-ID: <202510170938.TKwOcw1z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/l1tf_mitigation_mitigation
head:   6b03b37c78d0bdc369aa93991cfa0f209cf20964
commit: 87082229a1fad68bb7fcc327838157ebcd030c9f [5/5] KVM: x86: Unify L1TF flushing under per-CPU variable
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251017/202510170938.TKwOcw1z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170938.TKwOcw1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170938.TKwOcw1z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c:313:29: error: too many arguments to function call, expected 0, have 1
     313 |         return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
         |                ~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:306:12: note: 'vmx_setup_l1d_flush' declared here
     306 | static int vmx_setup_l1d_flush(void)
         |            ^
>> arch/x86/kvm/vmx/vmx.c:406:4: warning: non-void function 'vmx_l1d_flush' should return a value [-Wreturn-mismatch]
     406 |                         return;
         |                         ^
   1 warning and 1 error generated.


vim +/vmx_l1d_flush +406 arch/x86/kvm/vmx/vmx.c

   375	
   376	/*
   377	 * Software based L1D cache flush which is used when microcode providing
   378	 * the cache control MSR is not loaded.
   379	 *
   380	 * The L1D cache is 32 KiB on Nehalem and later microarchitectures, but to
   381	 * flush it is required to read in 64 KiB because the replacement algorithm
   382	 * is not exactly LRU. This could be sized at runtime via topology
   383	 * information but as all relevant affected CPUs have 32KiB L1D cache size
   384	 * there is no point in doing so.
   385	 */
   386	static noinstr bool vmx_l1d_flush(struct kvm_vcpu *vcpu)
   387	{
   388		int size = PAGE_SIZE << L1D_CACHE_ORDER;
   389	
   390		if (!static_branch_unlikely(&vmx_l1d_should_flush))
   391			return false;
   392	
   393		/*
   394		 * This code is only executed when the flush mode is 'cond' or
   395		 * 'always'
   396		 */
   397		if (static_branch_likely(&vmx_l1d_flush_cond)) {
   398			/*
   399			 * Clear the per-cpu flush bit, it gets set again if the vCPU
   400			 * is reloaded, i.e. if the vCPU is scheduled out or if KVM
   401			 * exits to userspace, or if KVM reaches one of the unsafe
   402			 * VMEXIT handlers, e.g. if KVM calls into the emulator,
   403			 * or from the interrupt handlers.
   404			 */
   405			if (!kvm_get_cpu_l1tf_flush_l1d())
 > 406				return;
   407			kvm_clear_cpu_l1tf_flush_l1d();
   408		}
   409	
   410		vcpu->stat.l1d_flush++;
   411	
   412		if (static_cpu_has(X86_FEATURE_FLUSH_L1D)) {
   413			native_wrmsrq(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
   414			return true;
   415		}
   416	
   417		asm volatile(
   418			/* First ensure the pages are in the TLB */
   419			"xorl	%%eax, %%eax\n"
   420			".Lpopulate_tlb:\n\t"
   421			"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
   422			"addl	$4096, %%eax\n\t"
   423			"cmpl	%%eax, %[size]\n\t"
   424			"jne	.Lpopulate_tlb\n\t"
   425			"xorl	%%eax, %%eax\n\t"
   426			"cpuid\n\t"
   427			/* Now fill the cache */
   428			"xorl	%%eax, %%eax\n"
   429			".Lfill_cache:\n"
   430			"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
   431			"addl	$64, %%eax\n\t"
   432			"cmpl	%%eax, %[size]\n\t"
   433			"jne	.Lfill_cache\n\t"
   434			"lfence\n"
   435			:: [flush_pages] "r" (vmx_l1d_flush_pages),
   436			    [size] "r" (size)
   437			: "eax", "ebx", "ecx", "edx");
   438		return true;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
