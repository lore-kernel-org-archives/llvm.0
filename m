Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2D2356DF;
	Wed,  2 Apr 2025 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588875; cv=none; b=jJ6Gfn7VhCpnZOoEjnZ5l62NtJMB1QDAwwgBkKDh7zXOWot1KvDJ3TzdUedv6Qr2r07CW58pucp//unRxryqaPCP7TWgxlG3WBOh3ehbFzRG3GEx4J9+SIiana80rW2rf7HQNxNVFrAQqBEoFWcO3RNADocEOXSabjdB9O5/dFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588875; c=relaxed/simple;
	bh=spwZgUUW68l601UPwfZqsDc3aNAf9mIku+yRkw6rcKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnIi5HuIGQdrTyn+Y8AGlB1de2l9S+DbgAai/j5Zs28s2VrJ/rIE5bsrn5QdAj8aKU5OBfsUBoYlm9kjQAIhan0ujg7EFSbyPOZH9QRKSwwC0iwA4odYGPUBsUAvEuYYQXC8KQY00SVROIefoq2KIXpDGQ07+qLMRsAw8WV1QaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTlJeqrD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTlJeqrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743588873; x=1775124873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spwZgUUW68l601UPwfZqsDc3aNAf9mIku+yRkw6rcKs=;
  b=eTlJeqrDehr4z0SZ+H/EEd6kC8Ru2OzJG7PTOaAkuj0aO0joFiTeQpcC
   xbz3Itt47J3Gtt/ze4NQhUftEP75QzJUfUTtBFkju6Y5qQ1nN2Tt+8PGx
   B6eueV18Y/asdtmOmNX2T+80mQHI6x/HRjXkrl5u6KeDLs9Fil7yo47MQ
   uBsh+o6Wl6X5Yye3+fRfihIWN85YPl4f18b0mr0SVAPgJzeeiajVtf5np
   mODfpVInSs4zXkG1yvxL2CqSLuMplZQbiH85BwxFy6CyRcZAdDe2KNusS
   liqmwcc5waa1mtxDKr4ICAhmzRY95jh4IsWiMHvOOUH18uxEWdRszOROZ
   Q==;
X-CSE-ConnectionGUID: ni8UiQt2R9W+WTfC7Po8Tg==
X-CSE-MsgGUID: u3d+zhy/S6Cg+ykys3PdmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="32547259"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="32547259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 03:14:31 -0700
X-CSE-ConnectionGUID: kty9moIYRn6UHGcMOBnQxw==
X-CSE-MsgGUID: PYImLbUjSKS5laH9rhiK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; 
   d="scan'208";a="149842400"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Apr 2025 03:14:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzv74-000Ac0-2m;
	Wed, 02 Apr 2025 10:14:26 +0000
Date: Wed, 2 Apr 2025 18:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/stale_mmio_cleanup 70/72]
 arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in
 'struct kvm_arch'
Message-ID: <202504021847.1a4Hp0Cp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/stale_mmio_cleanup
head:   1f284ca401d9620d6f0e4aea289cc2a50c4403e9
commit: 7df9be2ef92ca4407a365455e0670f4f07af7e25 [70/72] KVM: VMX: Apply MMIO mitigation if KVM maps MMIO into the guest
config: i386-buildonly-randconfig-006-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021847.1a4Hp0Cp-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021847.1a4Hp0Cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021847.1a4Hp0Cp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:509:10: note: expanded from macro '__native_word'
     509 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:509:39: note: expanded from macro '__native_word'
     509 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:510:10: note: expanded from macro '__native_word'
     510 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:510:38: note: expanded from macro '__native_word'
     510 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:498:13: note: expanded from macro '__unqual_scalar_typeof'
     498 |                 _Generic((x),                                           \
         |                           ^
>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:505:15: note: expanded from macro '__unqual_scalar_typeof'
     505 |                          default: (x)))
         |                                    ^
>> arch/x86/kvm/vmx/vmx.c:7364:30: error: no member named 'mapped_host_mmio' in 'struct kvm_arch'
    7364 |                  READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
         |                            ~~~~~~~~~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   8 errors generated.


vim +7364 arch/x86/kvm/vmx/vmx.c

  7347	
  7348	static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
  7349						unsigned int flags)
  7350	{
  7351		struct vcpu_vmx *vmx = to_vmx(vcpu);
  7352	
  7353		guest_state_enter_irqoff();
  7354	
  7355		/*
  7356		 * L1D Flush includes CPU buffer clear to mitigate MDS, but VERW
  7357		 * mitigation for MDS is done late in VMentry and is still
  7358		 * executed in spite of L1D Flush. This is because an extra VERW
  7359		 * should not matter much after the big hammer L1D Flush.
  7360		 */
  7361		if (static_branch_unlikely(&vmx_l1d_should_flush))
  7362			vmx_l1d_flush(vcpu);
  7363		else if (static_branch_unlikely(&mmio_stale_data_clear) &&
> 7364			 READ_ONCE(vcpu->kvm->arch.mapped_host_mmio))
  7365			mds_clear_cpu_buffers();
  7366	
  7367		vmx_disable_fb_clear(vmx);
  7368	
  7369		if (vcpu->arch.cr2 != native_read_cr2())
  7370			native_write_cr2(vcpu->arch.cr2);
  7371	
  7372		vmx->fail = __vmx_vcpu_run(vmx, (unsigned long *)&vcpu->arch.regs,
  7373					   flags);
  7374	
  7375		vcpu->arch.cr2 = native_read_cr2();
  7376		vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
  7377	
  7378		vmx->idt_vectoring_info = 0;
  7379	
  7380		vmx_enable_fb_clear(vmx);
  7381	
  7382		if (unlikely(vmx->fail)) {
  7383			vmx->exit_reason.full = 0xdead;
  7384			goto out;
  7385		}
  7386	
  7387		vmx->exit_reason.full = vmcs_read32(VM_EXIT_REASON);
  7388		if (likely(!vmx->exit_reason.failed_vmentry))
  7389			vmx->idt_vectoring_info = vmcs_read32(IDT_VECTORING_INFO_FIELD);
  7390	
  7391		if ((u16)vmx->exit_reason.basic == EXIT_REASON_EXCEPTION_NMI &&
  7392		    is_nmi(vmx_get_intr_info(vcpu))) {
  7393			kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
  7394			if (cpu_feature_enabled(X86_FEATURE_FRED))
  7395				fred_entry_from_kvm(EVENT_TYPE_NMI, NMI_VECTOR);
  7396			else
  7397				vmx_do_nmi_irqoff();
  7398			kvm_after_interrupt(vcpu);
  7399		}
  7400	
  7401	out:
  7402		guest_state_exit_irqoff();
  7403	}
  7404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
