Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBA1D8E01;
	Wed,  4 Feb 2026 00:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165183; cv=none; b=ESWn+8ruJAmHw8WeNb78Z5P4hRNN6tpqwWGydMKB43+5YVPTtAN1wtv+HbyIT95PV5qV8c0r7xd04rh4w7HdMi/05p7TG71LvteyUZMaboZidX+Ej6EEVMGbNMKSh+d7iy+m2jg/KzLLEYX4062UiNzYCfAp7yqY78GQ3YrCh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165183; c=relaxed/simple;
	bh=CtxeYGZrf6GdemXtSbS6AORMoabjNq/3r5bHPMGd+N4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hXxu2WSYOEbSyjtztqSz4VUHws2rp5yZThOXWWQdHAFI5KhpLLJQYsijZHS1Xyc9Gwte4lz9SSFhRea7bzjHkQgDM9lTxaAy28cgiWa7OK+kRZERmc73zcTyxg0FPIWO2BHovTptodgVnmqGFprHe9VNXDRl8slSX1YP/CCdVDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lx2CZv7k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx2CZv7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770165182; x=1801701182;
  h=date:from:to:cc:subject:message-id;
  bh=CtxeYGZrf6GdemXtSbS6AORMoabjNq/3r5bHPMGd+N4=;
  b=lx2CZv7klXwLBIPmAFSZQ6OdnkRr7aO/itDHGiW5tCyw8x3K4B+eLDfD
   yCnkVdoRrHT0uYlyCnCT3XNKzGzBBvY9ZoTwCXUyAtvdxvwxQ2YUOKFuB
   Hplt0F4tAbZ1u689ytK4PojgIxmbK1UdKkXvLbTaSbUr4B01bX2VvSh+N
   lbzQivmuDNSP/r0se7Nvl+8lhskrqgViC30GDXGT1DEfhyRkG88OIbZQt
   KQJhisaIvjpgCra2DN36DiBBJEdl1dctD35/5JAhbNY6AWQUKVnL5ZZ9+
   s2/o1RK1Anqjx3I8z1FdX0eI7sa5//AO323sVSrcQ5UqWwMjvYM56GqTA
   A==;
X-CSE-ConnectionGUID: FjR6AYn3SVKEYwSkpIcqVA==
X-CSE-MsgGUID: 1S1n7j5/TuyZ79DHud4muA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70546835"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="70546835"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:33:01 -0800
X-CSE-ConnectionGUID: HXbLnb23R/KvdZviGOrxxg==
X-CSE-MsgGUID: 5bkRTNh6Ti29PHLTDsak0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210037561"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2026 16:32:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQpE-00000000hK8-2r5U;
	Wed, 04 Feb 2026 00:32:56 +0000
Date: Wed, 04 Feb 2026 08:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v3 27/60]
 arch/riscv/kvm/aia_imsic.c:837:2: warning: variable 'vcpu' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202602040830.MzgbMKTQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v3
head:   e6550b7b7b811a0a3d16982322597770df39483d
commit: d451ba4a68d954a76d24cd625c21bacbf13ed693 [27/60] RISC-V: KVM: Add guest file irqbypass support
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260204/202602040830.MzgbMKTQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040830.MzgbMKTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040830.MzgbMKTQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:837:2: warning: variable 'vcpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     837 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1012:6: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_imsic.c:841:7: note: uninitialized use occurs here
     841 |         if (!vcpu)
         |              ^~~~
   arch/riscv/kvm/aia_imsic.c:837:2: note: remove the 'if' if its condition is always true
     837 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^
   include/linux/kvm_host.h:1012:2: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |         ^
   arch/riscv/kvm/aia_imsic.c:804:23: note: initialize the variable 'vcpu' to silence this warning
     804 |         struct kvm_vcpu *vcpu;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +837 arch/riscv/kvm/aia_imsic.c

   793	
   794	void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
   795					   struct kvm_kernel_irq_routing_entry *old,
   796					   struct kvm_kernel_irq_routing_entry *new)
   797	{
   798		struct riscv_iommu_ir_vcpu_info vcpu_info;
   799		struct kvm *kvm = irqfd->kvm;
   800		struct kvm_aia *aia = &kvm->arch.aia;
   801		int host_irq = irqfd->producer->irq;
   802		struct irq_data *irqdata = irq_get_irq_data(host_irq);
   803		unsigned long tmp, flags;
   804		struct kvm_vcpu *vcpu;
   805		struct imsic *imsic;
   806		struct msi_msg msg;
   807		u64 msi_addr_mask;
   808		gpa_t target;
   809		int ret;
   810	
   811		if (old && old->type == KVM_IRQ_ROUTING_MSI &&
   812		    new && new->type == KVM_IRQ_ROUTING_MSI &&
   813		    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
   814			return;
   815	
   816		if (!new) {
   817			if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
   818				ret = irq_set_vcpu_affinity(host_irq, NULL);
   819				WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   820			}
   821			return;
   822		}
   823	
   824		if (new->type != KVM_IRQ_ROUTING_MSI)
   825			return;
   826	
   827		target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
   828		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
   829			return;
   830	
   831		msg = (struct msi_msg){
   832			.address_hi = new->msi.address_hi,
   833			.address_lo = new->msi.address_lo,
   834			.data = new->msi.data,
   835		};
   836	
 > 837		kvm_for_each_vcpu(tmp, vcpu, kvm) {
   838			if (target == vcpu->arch.aia_context.imsic_addr)
   839				break;
   840		}
   841		if (!vcpu)
   842			return;
   843	
   844		msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
   845		vcpu_info = (struct riscv_iommu_ir_vcpu_info){
   846			.gpa = target,
   847			.msi_addr_mask = msi_addr_mask,
   848			.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
   849			.group_index_bits = aia->nr_group_bits,
   850			.group_index_shift = aia->nr_group_shift,
   851		};
   852	
   853		imsic = vcpu->arch.aia_context.imsic_state;
   854	
   855		read_lock_irqsave(&imsic->vsfile_lock, flags);
   856	
   857		if (WARN_ON_ONCE(imsic->vsfile_cpu < 0))
   858			goto out;
   859	
   860		vcpu_info.hpa = imsic->vsfile_pa;
   861	
   862		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
   863		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   864		if (ret)
   865			goto out;
   866	
   867		irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
   868	
   869	out:
   870		read_unlock_irqrestore(&imsic->vsfile_lock, flags);
   871	}
   872	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
