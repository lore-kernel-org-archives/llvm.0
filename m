Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7340628F;
	Thu, 30 Apr 2026 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559256; cv=none; b=m72bMqqGdk6WrbYYenrU4snGCP8FBVg7LJ9elqqVzkADCSHzntCfHa/bgEUkoeMDdDSdAhq9WQQd1xSnnTv7I/eyXYxGmylKYpORP2n5OVndKt7rV3j5JyHXTQk7yVXvdAu72mQGPF1hxZyRC3xX7UDXFihEUVGbIOVMTCV49Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559256; c=relaxed/simple;
	bh=iWKdoUOA5gr7KBPCbaMjLaH7qyrQE+m0WnuZhPKgbw0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WaZUgRSE3V217xL+PmMtiyruHO1h0qB3QZs2CxciwGlIJKCohDGJpLFgSjvGzZCCayhctjNwWln6EkiiICdtpgV1NUfIEKNhiLjK20UmgPc7S4CdgMgw945PG8chyNcktc0IowJmtSHl9iW7Yp4HlBLqU8L9La6AQUupVi6DJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6loDx72; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6loDx72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777559254; x=1809095254;
  h=date:from:to:cc:subject:message-id;
  bh=iWKdoUOA5gr7KBPCbaMjLaH7qyrQE+m0WnuZhPKgbw0=;
  b=k6loDx72ZhhYbZ5JdBfhfSWbgf2iwjTIfVGkl1/Uh0VU7pVwZYfHB8sx
   mQsT8okkSFVBbsmqHeRAS8Nr+Xwnb8/ZL5MWzVVdeYj+cX4S8IiGOJxEg
   w0BCXMYO94TqWCdVVwjalEkFGzL4IebDGju0oDuWJlNRmrkX5/lpqPPzA
   GyoPwpqHnuVpBgX063U3DYiRvUEzixpS5GyiutOicBkFjzZdJk3lX83Wy
   hJKh+voQeEH6tFwF9CJIZwaEcVuHiYDskXS6OvYIKLLQB+susIxRHNPpK
   8W6D4Kig4s3oHEpJNWvn+lUCmIuIYfgsvXl8/CD115oFEt8HEdJIAN7/K
   w==;
X-CSE-ConnectionGUID: pN5rxVaMT4qeJLatMyg+HQ==
X-CSE-MsgGUID: DnBOGvd/T4KdnvPlftJ0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="103962208"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="103962208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:27:33 -0700
X-CSE-ConnectionGUID: 2VLuEdbCT1+HEmmvvZbPUg==
X-CSE-MsgGUID: IK0yBxuJQVaPjLziv2SReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="228088919"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2026 07:27:32 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wISMT-00000000CT4-14Us;
	Thu, 30 Apr 2026 14:27:29 +0000
Date: Thu, 30 Apr 2026 22:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_irqbypass_v2 16/18]
 arch/riscv/kvm/aia_imsic.c:837:2: warning: variable 'vcpu' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202604302258.1VWlHeHH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: 0ae68ded2664be53f2e34c2be7b639b6b2ef711f [16/18] RISC-V: KVM: Add guest file irqbypass support
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260430/202604302258.1VWlHeHH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302258.1VWlHeHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302258.1VWlHeHH-lkp@intel.com/

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
