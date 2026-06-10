Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78F11465B4;
	Wed, 10 Jun 2026 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781059322; cv=none; b=digf9d897Mdzn62S5k5kGdCc2yzEn7j6GFO/PA4HWOvETBto0SORJB8Hldou2ItUqzMHevL7iXA4IeJGrsXMVoqbub4pP56eWj1mUkRFQmdbk2kGxJChlUryhxpLdQNnvrUqD+17fmjoSxLiBOYJfC86QeiEFuYUtA6qSf6Cm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781059322; c=relaxed/simple;
	bh=FzCRQp7EQcm2MVEnS6GRXQeHzEvOtguwaMHZ5KVf15Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SFaJCDpJYpLbo8Dv6tpW1uUVubXRKsejdPR+lxtXhYLB5EdtDJd45971t365BE7KcejqHCeSPN36jsWARH+tDW7Z3UvTxwpJsJDnC7vw/BdZr/ZpVi7LWCATRb4HtNIeNYCeryaPNe5aV+3Z85JKzW0R7VUf6pFjJ9iPHaxEnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2/19kTZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2/19kTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781059320; x=1812595320;
  h=date:from:to:cc:subject:message-id;
  bh=FzCRQp7EQcm2MVEnS6GRXQeHzEvOtguwaMHZ5KVf15Y=;
  b=E2/19kTZ5t58uqtsnZQFVbv9ZVqvp4FL8PsTl8mtiWQGZjlCvEmqbCtD
   /8RsV5k3NTuBd19OT0xTo6oHhu0wypTZ2ib6cOSd5XZRJrkobVcB1Hu7X
   +YcAN6c+LEe2OWM3fTsaMu5CsxkIlN2eHCKqeZHMSxiy2cfo1UtwLudbZ
   yuvYUhXApkJSo6+5kKdIiEI7paMtbON019nSEEzB18cndMun49un6DCe7
   +hpxK3d64p1DRBsIc0KztnAALaDQc93l5Vm9nAWIOO5Ect389HNwfPyO6
   bPbrNTkneedZjf0t/wxlDWiaCTi23k2ixRM11LFNzUhaJTFypTTw+Y+6H
   Q==;
X-CSE-ConnectionGUID: WcrByv1+QIKtCNr4dirCNg==
X-CSE-MsgGUID: f5eiFV6OR5moB3cW6shIbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81890162"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81890162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:41:59 -0700
X-CSE-ConnectionGUID: C0z58JHPRhKb21Rp6EuqAw==
X-CSE-MsgGUID: WugA5359T3aEEUflLLjSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243578732"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jun 2026 19:41:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX8t9-00000000Kow-0Qm0;
	Wed, 10 Jun 2026 02:41:55 +0000
Date: Wed, 10 Jun 2026 10:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v4 42/81]
 arch/riscv/kvm/aia_imsic.c:923:2: warning: variable 'vcpu' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202606101041.MjpVfbMX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   79783024b7bd12897e21fecfaf6ac7dad02a8f0e
commit: ad85db7c4e6fc14b499d0453702948501a67b18d [42/81] RISC-V: KVM: Add guest file irqbypass support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260610/202606101041.MjpVfbMX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101041.MjpVfbMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101041.MjpVfbMX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:923:2: warning: variable 'vcpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     923 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1012:6: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_imsic.c:927:7: note: uninitialized use occurs here
     927 |         if (!vcpu)
         |              ^~~~
   arch/riscv/kvm/aia_imsic.c:923:2: note: remove the 'if' if its condition is always true
     923 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^
   include/linux/kvm_host.h:1012:2: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |         ^
   arch/riscv/kvm/aia_imsic.c:887:23: note: initialize the variable 'vcpu' to silence this warning
     887 |         struct kvm_vcpu *vcpu;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +923 arch/riscv/kvm/aia_imsic.c

   876	
   877	void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
   878					   struct kvm_kernel_irq_routing_entry *old,
   879					   struct kvm_kernel_irq_routing_entry *new)
   880	{
   881		struct riscv_iommu_ir_vcpu_info vcpu_info;
   882		struct kvm *kvm = irqfd->kvm;
   883		struct kvm_aia *aia = &kvm->arch.aia;
   884		int host_irq;
   885		struct irq_data *irqdata;
   886		unsigned long tmp, flags;
   887		struct kvm_vcpu *vcpu;
   888		struct imsic *imsic;
   889		struct msi_msg msg;
   890		u64 msi_addr_mask;
   891		gpa_t target;
   892		int ret;
   893	
   894		host_irq = irqfd->producer->irq;
   895		irqdata = irq_get_irq_data(host_irq);
   896	
   897		if (old && old->type == KVM_IRQ_ROUTING_MSI &&
   898		    new && new->type == KVM_IRQ_ROUTING_MSI &&
   899		    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
   900			return;
   901	
   902		if (!new) {
   903			if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
   904				ret = irq_set_vcpu_affinity(host_irq, NULL);
   905				WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   906			}
   907			return;
   908		}
   909	
   910		if (new->type != KVM_IRQ_ROUTING_MSI)
   911			return;
   912	
   913		target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
   914		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
   915			return;
   916	
   917		msg = (struct msi_msg){
   918			.address_hi = new->msi.address_hi,
   919			.address_lo = new->msi.address_lo,
   920			.data = new->msi.data,
   921		};
   922	
 > 923		kvm_for_each_vcpu(tmp, vcpu, kvm) {
   924			if (target == vcpu->arch.aia_context.imsic_addr)
   925				break;
   926		}
   927		if (!vcpu)
   928			return;
   929	
   930		msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
   931		vcpu_info = (struct riscv_iommu_ir_vcpu_info){
   932			.gpa = target,
   933			.msi_addr_mask = msi_addr_mask,
   934			.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
   935			.group_index_bits = aia->nr_group_bits,
   936			.group_index_shift = aia->nr_group_shift,
   937		};
   938	
   939		imsic = vcpu->arch.aia_context.imsic_state;
   940	
   941		read_lock_irqsave(&imsic->vsfile_lock, flags);
   942	
   943		if (imsic->vsfile_cpu < 0)
   944			goto out;
   945	
   946		vcpu_info.hpa = imsic->vsfile_pa;
   947	
   948		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
   949		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   950		if (ret)
   951			goto out;
   952	
   953		/*
   954		 * Unlike x86 (which updates the IRTE) and arm64 (which updates
   955		 * the ITS ITTE), RISC-V reprograms the device MSI target address
   956		 * to the guest IMSIC GPA. The device writes to the guest GPA;
   957		 * the IOMMU MSI table maps guest GPA -> host VS-file HPA.
   958		 */
   959		irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
   960	
   961	out:
   962		read_unlock_irqrestore(&imsic->vsfile_lock, flags);
   963	}
   964	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
