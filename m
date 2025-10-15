Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD831DD91;
	Wed, 15 Oct 2025 07:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512786; cv=none; b=eIpEJ5ZEH1CawY/iO3BUo1p8C+qvOYDBlgX0rncoOOaBpqtN8KnvatIokcDoyCl8TmzClR7PitU3T4DRInwtULdlhN20fvDMAvZnGsn8FEJYn6lH8b8EmqhjmMok7ghX2KWTNataXzStqjTqEyVpolGtdYGBVU/t8SgFJaU07qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512786; c=relaxed/simple;
	bh=4OVWgFTHdVIsxx5/CGfppICYI7ldIXEDUAiTbNxP0ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B37DZylWLru3+09B6QSSo1ejxRmJ3PI40PIt84Nz/mC9lqCsphrdLl7i/L3FUOHMwEBV+hEXxxY2wHHag3Y4fUYvKZdl9BIr7lZn6Pydz3o/TW7FZ4OyNo4GqehNWdC3MllM087pOnWb0BBie+dPD4ALiddnrJu62r517a33aBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLwgsarA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLwgsarA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760512785; x=1792048785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4OVWgFTHdVIsxx5/CGfppICYI7ldIXEDUAiTbNxP0ro=;
  b=SLwgsarAeyDziURSyr9Qhg/ozsDaGUi21rWocyIMamiE243YP0cKLZ0W
   NRDzaqan1soCLf1HQJ1l/v23xmTIiZzI6zROA3K72LNAv992My4XnW5Ld
   jwSb0us9RZ+Ea3ZZlb1NIRHvZp/hNLiK1n3CLu7KeWmq9xBcS32yJBx+O
   yIHd7m2/6tsLQMsyvQb3aVlS4SNUSHMEkU9IxMOQTGA9x+qpBbvLIIQS+
   VUuJV4Rr7dSdNWWgDcq8uiYl7Tzrjek4ENPsL/fJkczG4pKKaps/W2d0x
   bfm0YqGuixnstr1Y9jgaEbKXOSn6XJBj1drA26qikEGbbXLEoONDRfOyE
   Q==;
X-CSE-ConnectionGUID: H20mo7SMT+25jP+P8mGrTg==
X-CSE-MsgGUID: s8h7o4NVT/ivwTNnHNqQXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73781889"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="73781889"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 00:19:44 -0700
X-CSE-ConnectionGUID: Ke5DQZOHTOyy6Toh18ADjA==
X-CSE-MsgGUID: ZQECKB4vThCLhNJVHYsqpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="186351871"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2025 00:19:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8vn9-0003ZD-1S;
	Wed, 15 Oct 2025 07:19:40 +0000
Date: Wed, 15 Oct 2025 15:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 18/50]
 arch/riscv/kvm/aia_imsic.c:825:2: warning: variable 'vcpu' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202510151501.pC50Z8fs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   7ea2b232f9a3668b568e12b4d4e1609433bde7d2
commit: d39015a85f4509ae43f8f5a7b6cf167e3d649558 [18/50] RISC-V: KVM: Add guest file irqbypass support
config: riscv-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151501.pC50Z8fs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151501.pC50Z8fs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151501.pC50Z8fs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:825:2: warning: variable 'vcpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     825 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1002:6: note: expanded from macro 'kvm_for_each_vcpu'
    1002 |         if (atomic_read(&kvm->online_vcpus))                            \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_imsic.c:829:7: note: uninitialized use occurs here
     829 |         if (!vcpu)
         |              ^~~~
   arch/riscv/kvm/aia_imsic.c:825:2: note: remove the 'if' if its condition is always true
     825 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^
   include/linux/kvm_host.h:1002:2: note: expanded from macro 'kvm_for_each_vcpu'
    1002 |         if (atomic_read(&kvm->online_vcpus))                            \
         |         ^
   arch/riscv/kvm/aia_imsic.c:792:23: note: initialize the variable 'vcpu' to silence this warning
     792 |         struct kvm_vcpu *vcpu;
         |                              ^
         |                               = NULL
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +825 arch/riscv/kvm/aia_imsic.c

   781	
   782	void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
   783					   struct kvm_kernel_irq_routing_entry *old,
   784					   struct kvm_kernel_irq_routing_entry *new)
   785	{
   786		struct riscv_iommu_ir_vcpu_info vcpu_info;
   787		struct kvm *kvm = irqfd->kvm;
   788		struct kvm_aia *aia = &kvm->arch.aia;
   789		int host_irq = irqfd->producer->irq;
   790		struct irq_data *irqdata = irq_get_irq_data(host_irq);
   791		unsigned long tmp, flags;
   792		struct kvm_vcpu *vcpu;
   793		struct imsic *imsic;
   794		struct msi_msg msg;
   795		u64 msi_addr_mask;
   796		gpa_t target;
   797		int ret;
   798	
   799		if (old && old->type == KVM_IRQ_ROUTING_MSI &&
   800		    new && new->type == KVM_IRQ_ROUTING_MSI &&
   801		    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
   802			return;
   803	
   804		if (!new) {
   805			if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
   806				ret = irq_set_vcpu_affinity(host_irq, NULL);
   807				WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   808			}
   809			return;
   810		}
   811	
   812		if (new->type != KVM_IRQ_ROUTING_MSI)
   813			return;
   814	
   815		target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
   816		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
   817			return;
   818	
   819		msg = (struct msi_msg){
   820			.address_hi = new->msi.address_hi,
   821			.address_lo = new->msi.address_lo,
   822			.data = new->msi.data,
   823		};
   824	
 > 825		kvm_for_each_vcpu(tmp, vcpu, kvm) {
   826			if (target == vcpu->arch.aia_context.imsic_addr)
   827				break;
   828		}
   829		if (!vcpu)
   830			return;
   831	
   832		msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
   833		vcpu_info = (struct riscv_iommu_ir_vcpu_info){
   834			.gpa = target,
   835			.msi_addr_mask = msi_addr_mask,
   836			.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
   837			.group_index_bits = aia->nr_group_bits,
   838			.group_index_shift = aia->nr_group_shift,
   839		};
   840	
   841		imsic = vcpu->arch.aia_context.imsic_state;
   842	
   843		read_lock_irqsave(&imsic->vsfile_lock, flags);
   844	
   845		if (WARN_ON_ONCE(imsic->vsfile_cpu < 0))
   846			goto out;
   847	
   848		vcpu_info.hpa = imsic->vsfile_pa;
   849	
   850		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
   851		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   852		if (ret)
   853			goto out;
   854	
   855		irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
   856	
   857	out:
   858		read_unlock_irqrestore(&imsic->vsfile_lock, flags);
   859	}
   860	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
