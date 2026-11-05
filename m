Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871262;
	b=BTSZsGYqtpa3M9PNvOsHzxE7j1sL/e5hWc8+DDFD3Uk8vORWyCT6khigaI7Xcc8ju/pe
	 Tz+/WxPf2KH/SIYARzR8JDfMh5Xy2jEaJqJRBEFhodC94A8yYQx43lEl08gy7LfK+EuTm
	 Kozgtyccm2Jerp4vB8s6cNEmy91+Yp794ngxQZ/OTuboHIeMzfZzIxJzWRzMpKD9saQrL
	 pyOgO2lY72m8vLDn+sVBP0FN9dpNDiVMrlVCaNo4oPGr/H3ie8zhVwVCO2Q/zxrzp9uHX
	 00TXuKZLvbFq7/ghbFYCoPZFYmsuZ7oxDa8jOgn3WXgCCcfP6+QDVEAxKfVoSqy8Tsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871262;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9wmtx/cKzR5gKAa3MQZo80HEPKTIvmnLzoW7u/Hd8Gc=;
	b=3KqxeeyaxJg+rGKlRyDXbwIWTYCEQU1yzY8YIaHFE3Xkn0zzA+HrT1iIri2VQyZbwTAk
	 qG+fYROxSDw1nsv9R8JlGVVFqQS0I/JvMVP3XH+AB3rJFUcBLiJLGp1SDfwx7KnuiSVuB
	 FV5PdLD9s0fs8TWvWzznxQdpnagMCHDPP/1wLGolOS2UQFgTbPr+/N+PWYj+bqhUyxCSp
	 r6rnMnBJ0zmJDx+vzCOJTtJk4lQr+tlfhloDBAeQWk+ERPXWd9VwmL5vSSULINmrOf20c
	 7PLzr2AgPcYJO3pt5AsPb/qhsfRVp32+HRUsor3VmJDOhmi9jVpSVrIxB3i0QHKk33Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kdAevENF;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0E606A326;
	Thu,  5 Nov 2026 09:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kdAevENF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793871262; x=1825407262;
  h=date:from:to:cc:subject:message-id;
  bh=dV+OI1BsfFB9pMtNPGN9+Msb7D0q5d85mFIpAxO0Ca8=;
  b=kdAevENFT65GUUCu3HtoUu1XopWf4Xa0xds0UmZXTqxclnvzSWUSNzER
   J8TLDiuZDKADeZwb/Ve/E3aaWp4gQVrKy3W58/yZCUUjS1OYiQcewi9/f
   1JEILRSZ/BivFlzEUAUICcCrRU5IBVlxg2293xu7Fts1zFWmq5+DDLy9d
   Y0qM44xZpMvJprPk3VuZVFRnzqRILzg/L6FsOuiVC6ION/KNg4tCTK/1C
   yOcQaMPGZ4LuG0DwVxUFMiBG7ECnyG3u0DBGH/xN1/KAb+tUxKkYJyG59
   bYVKAgaOf+eaNMRJE9Y3LYb8KxygRBt+QVsdQO18tLngEIk2/bSwaZLSt
   A==;
X-CSE-ConnectionGUID: 4d+G7K1LSQ2c9ATlay7Uqw==
X-CSE-MsgGUID: 1IcxTlwSQoWKnVFu2M9gUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2537192"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2537192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:34:21 -0800
X-CSE-ConnectionGUID: 4ZPNxg7cTpqdgmBkOz90vg==
X-CSE-MsgGUID: SKWvFJUdSKygIepA+IUw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6843321"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Nov 2026 01:34:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOtrM-00000000m0l-3CXt;
	Thu, 05 Nov 2026 09:34:16 +0000
Date: Thu, 05 Nov 2026 17:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_misc_v1 27/35]
 arch/riscv/kvm/aia_imsic.c:838:2: warning: variable 'vcpu' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202611051709.5WUCGlXC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_iommu_misc_v1
head:   bfa7a6c4f67f2d4d155c3aa2fbc606e5c5189ca0
commit: ef0d72018fdf0d8d92e9031e7c12f621e1f36d7e [27/35] RISC-V: KVM: Add guest file irqbypass support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611051709.5WUCGlXC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 812626a41399a1d464a0d69627ab45c83b8ebfb9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051709.5WUCGlXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051709.5WUCGlXC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:838:2: warning: variable 'vcpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     838 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1014:6: note: expanded from macro 'kvm_for_each_vcpu'
    1014 |         if (atomic_read(&kvm->online_vcpus))                            \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_imsic.c:842:7: note: uninitialized use occurs here
     842 |         if (!vcpu)
         |              ^~~~
   arch/riscv/kvm/aia_imsic.c:838:2: note: remove the 'if' if its condition is always true
     838 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^
   include/linux/kvm_host.h:1014:2: note: expanded from macro 'kvm_for_each_vcpu'
    1014 |         if (atomic_read(&kvm->online_vcpus))                            \
         |         ^
   arch/riscv/kvm/aia_imsic.c:802:23: note: initialize the variable 'vcpu' to silence this warning
     802 |         struct kvm_vcpu *vcpu;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +838 arch/riscv/kvm/aia_imsic.c

   791	
   792	void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
   793					   struct kvm_kernel_irq_routing_entry *old,
   794					   struct kvm_kernel_irq_routing_entry *new)
   795	{
   796		struct riscv_iommu_ir_vcpu_info vcpu_info;
   797		struct kvm *kvm = irqfd->kvm;
   798		struct kvm_aia *aia = &kvm->arch.aia;
   799		int host_irq;
   800		struct irq_data *irqdata;
   801		unsigned long tmp, flags;
   802		struct kvm_vcpu *vcpu;
   803		struct imsic *imsic;
   804		struct msi_msg msg;
   805		u64 msi_addr_mask;
   806		gpa_t target;
   807		int ret;
   808	
   809		host_irq = irqfd->producer->irq;
   810		irqdata = irq_get_irq_data(host_irq);
   811	
   812		if (old && old->type == KVM_IRQ_ROUTING_MSI &&
   813		    new && new->type == KVM_IRQ_ROUTING_MSI &&
   814		    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
   815			return;
   816	
   817		if (!new) {
   818			if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
   819				ret = irq_set_vcpu_affinity(host_irq, NULL);
   820				WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   821			}
   822			return;
   823		}
   824	
   825		if (new->type != KVM_IRQ_ROUTING_MSI)
   826			return;
   827	
   828		target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
   829		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
   830			return;
   831	
   832		msg = (struct msi_msg){
   833			.address_hi = new->msi.address_hi,
   834			.address_lo = new->msi.address_lo,
   835			.data = new->msi.data,
   836		};
   837	
 > 838		kvm_for_each_vcpu(tmp, vcpu, kvm) {
   839			if (target == vcpu->arch.aia_context.imsic_addr)
   840				break;
   841		}
   842		if (!vcpu)
   843			return;
   844	
   845		msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
   846		vcpu_info = (struct riscv_iommu_ir_vcpu_info){
   847			.gpa = target,
   848			.msi_addr_mask = msi_addr_mask,
   849			.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
   850			.group_index_bits = aia->nr_group_bits,
   851			.group_index_shift = aia->nr_group_shift,
   852		};
   853	
   854		imsic = vcpu->arch.aia_context.imsic_state;
   855	
   856		read_lock_irqsave(&imsic->vsfile_lock, flags);
   857	
   858		if (imsic->vsfile_cpu < 0)
   859			goto out;
   860	
   861		vcpu_info.hpa = imsic->vsfile_pa;
   862	
   863		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
   864		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   865		if (ret)
   866			goto out;
   867	
   868		/*
   869		 * Unlike x86 (which updates the IRTE) and arm64 (which updates
   870		 * the ITS ITTE), RISC-V reprograms the device MSI target address
   871		 * to the guest IMSIC GPA. The device writes to the guest GPA;
   872		 * the IOMMU MSI table maps guest GPA -> host VS-file HPA.
   873		 */
   874		irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
   875	
   876	out:
   877		read_unlock_irqrestore(&imsic->vsfile_lock, flags);
   878	}
   879	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
