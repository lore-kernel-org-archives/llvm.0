Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90772395AD9;
	Sat, 30 May 2026 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780128392; cv=none; b=TgK0DZbl9Sgu6CFB2BB6GKbTeI3jMaNJF3G3BOh2R864BkKV7j/g4xXl0BdXOlLyQV1YqexrAFEijCZUmRp54gPIQnbs5UL47LzgWrCKwwISfrYbTy8A7Hv4BXbJL9+/OK1Tlt89bfjXJAJQIagVpDpjHY81E43lrpXwJ4M5xO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780128392; c=relaxed/simple;
	bh=j3gfeyVZY2ssDDVHc7acJu8yJrcpTlrFxArCawh6eqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TJ3qTJDofxQM55v1Qa6nSkyEXymFo5v4ek1IdkozZgSQDWfKG/k7aPnxJwdSGq3nxYrQwF9TfnAeAi2Ul5srwbk8KYCmTLb9w4+ULuQEtNQP0JCK4czQ2yo4i0/xsbAZvtiiGI3Aet/T99N7LU11slxg0YYmvcq59dUHKyE4QR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrVQME8H; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrVQME8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780128388; x=1811664388;
  h=date:from:to:cc:subject:message-id;
  bh=j3gfeyVZY2ssDDVHc7acJu8yJrcpTlrFxArCawh6eqA=;
  b=IrVQME8HcJsOb7PuVhKyZ6sKvatbnnOf0QUxBJ3HJqEx4jMyLyoRJdOu
   2xszKxcLpNAPhKPzGKlDFcVn/0SX+fSOXUwuCCs86NbAzj38yHasD89Aj
   FwzESDFVkH2WDPh3Gg8O9w1mDcWDAdoe8MedmPmGEGeGq1cbu+8SssbTN
   L0/KWr68G74AmPdcl1/EfuP6OTN/uHY8HB6RRtS/qIzuEQocCvx1cG0XC
   5P7yyMMuLacqEqQUnLObqFE6lLbSwmjLOEC8a5IqbqQhAaYFLKXJyM6m9
   e6AA6ShhXMgrH+BlI9f1bwsqByfO1srkAjXKAf65NScE7aSZcgnYWBrpG
   A==;
X-CSE-ConnectionGUID: CL4c+Ax5RKuPptxtH3vfsA==
X-CSE-MsgGUID: ad5GigbVS4mWY+ZRjZROVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="68503772"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="68503772"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 01:06:27 -0700
X-CSE-ConnectionGUID: ehsw7bRORkeIctIRC0Wodg==
X-CSE-MsgGUID: WkQ9BD9cQk+4VJrClv+YJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247066583"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2026 01:06:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTEi7-000000008FK-30Cl;
	Sat, 30 May 2026 08:06:23 +0000
Date: Sat, 30 May 2026 16:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 36/62] arch/riscv/kvm/vm.c:119:5:
 error: conflicting types for 'kvm_set_routing_entry'
Message-ID: <202605301516.5ASb5D8J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: a6d4d8101aadb871b519c5181244d79ed9c41809 [36/62] kvm: Pass plane_level to kvm_set_routing_entry()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605301516.5ASb5D8J-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301516.5ASb5D8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301516.5ASb5D8J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/vm.c:13:
   include/linux/kvm_host.h:1084:56: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1084 |                   "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
         |                                                                ~~~~  ^
   include/linux/kvm_host.h:1095:58: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1095 |                   "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
         |                                                                  ~~~~  ^
>> arch/riscv/kvm/vm.c:119:5: error: conflicting types for 'kvm_set_routing_entry'
     119 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^
   include/linux/kvm_host.h:2336:5: note: previous declaration is here
    2336 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^
   3 errors generated.


vim +/kvm_set_routing_entry +119 arch/riscv/kvm/vm.c

99cdc6c18c2d81 Anup Patel          2021-09-27  @13  #include <linux/kvm_host.h>
4ecbd3eb5b1ba4 Anup Patel          2025-06-18   14  #include <asm/kvm_mmu.h>
99cdc6c18c2d81 Anup Patel          2021-09-27   15  
da142f3d373a6d Sean Christopherson 2025-12-05   16  const struct kvm_stats_desc kvm_vm_stats_desc[] = {
99cdc6c18c2d81 Anup Patel          2021-09-27   17  	KVM_GENERIC_VM_STATS()
99cdc6c18c2d81 Anup Patel          2021-09-27   18  };
99cdc6c18c2d81 Anup Patel          2021-09-27   19  static_assert(ARRAY_SIZE(kvm_vm_stats_desc) ==
99cdc6c18c2d81 Anup Patel          2021-09-27   20  		sizeof(struct kvm_vm_stat) / sizeof(u64));
99cdc6c18c2d81 Anup Patel          2021-09-27   21  
99cdc6c18c2d81 Anup Patel          2021-09-27   22  const struct kvm_stats_header kvm_vm_stats_header = {
99cdc6c18c2d81 Anup Patel          2021-09-27   23  	.name_size = KVM_STATS_NAME_SIZE,
99cdc6c18c2d81 Anup Patel          2021-09-27   24  	.num_desc = ARRAY_SIZE(kvm_vm_stats_desc),
99cdc6c18c2d81 Anup Patel          2021-09-27   25  	.id_offset =  sizeof(struct kvm_stats_header),
99cdc6c18c2d81 Anup Patel          2021-09-27   26  	.desc_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE,
99cdc6c18c2d81 Anup Patel          2021-09-27   27  	.data_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE +
99cdc6c18c2d81 Anup Patel          2021-09-27   28  		       sizeof(kvm_vm_stats_desc),
99cdc6c18c2d81 Anup Patel          2021-09-27   29  };
99cdc6c18c2d81 Anup Patel          2021-09-27   30  
99cdc6c18c2d81 Anup Patel          2021-09-27   31  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
99cdc6c18c2d81 Anup Patel          2021-09-27   32  {
99cdc6c18c2d81 Anup Patel          2021-09-27   33  	int r;
99cdc6c18c2d81 Anup Patel          2021-09-27   34  
dd82e35638d67f Anup Patel          2025-06-18   35  	r = kvm_riscv_mmu_alloc_pgd(kvm);
99cdc6c18c2d81 Anup Patel          2021-09-27   36  	if (r)
99cdc6c18c2d81 Anup Patel          2021-09-27   37  		return r;
99cdc6c18c2d81 Anup Patel          2021-09-27   38  
26708234eb12e7 Anup Patel          2022-05-09   39  	r = kvm_riscv_gstage_vmid_init(kvm);
fd7bb4a251dfc1 Anup Patel          2021-09-27   40  	if (r) {
dd82e35638d67f Anup Patel          2025-06-18   41  		kvm_riscv_mmu_free_pgd(kvm);
fd7bb4a251dfc1 Anup Patel          2021-09-27   42  		return r;
fd7bb4a251dfc1 Anup Patel          2021-09-27   43  	}
fd7bb4a251dfc1 Anup Patel          2021-09-27   44  
54e43320c2ba0c Anup Patel          2023-01-10   45  	kvm_riscv_aia_init_vm(kvm);
54e43320c2ba0c Anup Patel          2023-01-10   46  
cca986fab9e819 Nikolay Borisov     2022-07-29   47  	kvm_riscv_guest_timer_init(kvm);
cca986fab9e819 Nikolay Borisov     2022-07-29   48  
cca986fab9e819 Nikolay Borisov     2022-07-29   49  	return 0;
99cdc6c18c2d81 Anup Patel          2021-09-27   50  }
99cdc6c18c2d81 Anup Patel          2021-09-27   51  
99cdc6c18c2d81 Anup Patel          2021-09-27   52  void kvm_arch_destroy_vm(struct kvm *kvm)
99cdc6c18c2d81 Anup Patel          2021-09-27   53  {
27592ae8dbe410 Marc Zyngier        2021-11-16   54  	kvm_destroy_vcpus(kvm);
54e43320c2ba0c Anup Patel          2023-01-10   55  
54e43320c2ba0c Anup Patel          2023-01-10   56  	kvm_riscv_aia_destroy_vm(kvm);
99cdc6c18c2d81 Anup Patel          2021-09-27   57  }
99cdc6c18c2d81 Anup Patel          2021-09-27   58  
00f918f61c56a4 Anup Patel          2023-06-15   59  int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
00f918f61c56a4 Anup Patel          2023-06-15   60  			  bool line_status)
00f918f61c56a4 Anup Patel          2023-06-15   61  {
00f918f61c56a4 Anup Patel          2023-06-15   62  	if (!irqchip_in_kernel(kvm))
00f918f61c56a4 Anup Patel          2023-06-15   63  		return -ENXIO;
00f918f61c56a4 Anup Patel          2023-06-15   64  
00f918f61c56a4 Anup Patel          2023-06-15   65  	return kvm_riscv_aia_inject_irq(kvm, irql->irq, irql->level);
00f918f61c56a4 Anup Patel          2023-06-15   66  }
00f918f61c56a4 Anup Patel          2023-06-15   67  
00f918f61c56a4 Anup Patel          2023-06-15   68  int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
00f918f61c56a4 Anup Patel          2023-06-15   69  		struct kvm *kvm, int irq_source_id,
00f918f61c56a4 Anup Patel          2023-06-15   70  		int level, bool line_status)
00f918f61c56a4 Anup Patel          2023-06-15   71  {
00f918f61c56a4 Anup Patel          2023-06-15   72  	struct kvm_msi msi;
00f918f61c56a4 Anup Patel          2023-06-15   73  
00f918f61c56a4 Anup Patel          2023-06-15   74  	if (!level)
00f918f61c56a4 Anup Patel          2023-06-15   75  		return -1;
00f918f61c56a4 Anup Patel          2023-06-15   76  
00f918f61c56a4 Anup Patel          2023-06-15   77  	msi.address_lo = e->msi.address_lo;
00f918f61c56a4 Anup Patel          2023-06-15   78  	msi.address_hi = e->msi.address_hi;
00f918f61c56a4 Anup Patel          2023-06-15   79  	msi.data = e->msi.data;
00f918f61c56a4 Anup Patel          2023-06-15   80  	msi.flags = e->msi.flags;
00f918f61c56a4 Anup Patel          2023-06-15   81  	msi.devid = e->msi.devid;
00f918f61c56a4 Anup Patel          2023-06-15   82  
00f918f61c56a4 Anup Patel          2023-06-15   83  	return kvm_riscv_aia_inject_msi(kvm, &msi);
00f918f61c56a4 Anup Patel          2023-06-15   84  }
00f918f61c56a4 Anup Patel          2023-06-15   85  
00f918f61c56a4 Anup Patel          2023-06-15   86  static int kvm_riscv_set_irq(struct kvm_kernel_irq_routing_entry *e,
00f918f61c56a4 Anup Patel          2023-06-15   87  			     struct kvm *kvm, int irq_source_id,
00f918f61c56a4 Anup Patel          2023-06-15   88  			     int level, bool line_status)
00f918f61c56a4 Anup Patel          2023-06-15   89  {
00f918f61c56a4 Anup Patel          2023-06-15   90  	return kvm_riscv_aia_inject_irq(kvm, e->irqchip.pin, level);
00f918f61c56a4 Anup Patel          2023-06-15   91  }
00f918f61c56a4 Anup Patel          2023-06-15   92  
00f918f61c56a4 Anup Patel          2023-06-15   93  int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines)
00f918f61c56a4 Anup Patel          2023-06-15   94  {
00f918f61c56a4 Anup Patel          2023-06-15   95  	struct kvm_irq_routing_entry *ents;
00f918f61c56a4 Anup Patel          2023-06-15   96  	int i, rc;
00f918f61c56a4 Anup Patel          2023-06-15   97  
bf4afc53b77aea Linus Torvalds      2026-02-21   98  	ents = kzalloc_objs(*ents, lines);
00f918f61c56a4 Anup Patel          2023-06-15   99  	if (!ents)
00f918f61c56a4 Anup Patel          2023-06-15  100  		return -ENOMEM;
00f918f61c56a4 Anup Patel          2023-06-15  101  
00f918f61c56a4 Anup Patel          2023-06-15  102  	for (i = 0; i < lines; i++) {
00f918f61c56a4 Anup Patel          2023-06-15  103  		ents[i].gsi = i;
00f918f61c56a4 Anup Patel          2023-06-15  104  		ents[i].type = KVM_IRQ_ROUTING_IRQCHIP;
00f918f61c56a4 Anup Patel          2023-06-15  105  		ents[i].u.irqchip.irqchip = 0;
00f918f61c56a4 Anup Patel          2023-06-15  106  		ents[i].u.irqchip.pin = i;
00f918f61c56a4 Anup Patel          2023-06-15  107  	}
00f918f61c56a4 Anup Patel          2023-06-15  108  	rc = kvm_set_irq_routing(kvm, ents, lines, 0);
00f918f61c56a4 Anup Patel          2023-06-15  109  	kfree(ents);
00f918f61c56a4 Anup Patel          2023-06-15  110  
00f918f61c56a4 Anup Patel          2023-06-15  111  	return rc;
00f918f61c56a4 Anup Patel          2023-06-15  112  }
00f918f61c56a4 Anup Patel          2023-06-15  113  
00f918f61c56a4 Anup Patel          2023-06-15  114  bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
00f918f61c56a4 Anup Patel          2023-06-15  115  {
00f918f61c56a4 Anup Patel          2023-06-15  116  	return irqchip_in_kernel(kvm);
00f918f61c56a4 Anup Patel          2023-06-15  117  }
00f918f61c56a4 Anup Patel          2023-06-15  118  
00f918f61c56a4 Anup Patel          2023-06-15 @119  int kvm_set_routing_entry(struct kvm *kvm,
00f918f61c56a4 Anup Patel          2023-06-15  120  			  struct kvm_kernel_irq_routing_entry *e,
00f918f61c56a4 Anup Patel          2023-06-15  121  			  const struct kvm_irq_routing_entry *ue)
00f918f61c56a4 Anup Patel          2023-06-15  122  {
00f918f61c56a4 Anup Patel          2023-06-15  123  	int r = -EINVAL;
00f918f61c56a4 Anup Patel          2023-06-15  124  
00f918f61c56a4 Anup Patel          2023-06-15  125  	switch (ue->type) {
00f918f61c56a4 Anup Patel          2023-06-15  126  	case KVM_IRQ_ROUTING_IRQCHIP:
00f918f61c56a4 Anup Patel          2023-06-15  127  		e->set = kvm_riscv_set_irq;
00f918f61c56a4 Anup Patel          2023-06-15  128  		e->irqchip.irqchip = ue->u.irqchip.irqchip;
00f918f61c56a4 Anup Patel          2023-06-15  129  		e->irqchip.pin = ue->u.irqchip.pin;
00f918f61c56a4 Anup Patel          2023-06-15  130  		if ((e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS) ||
00f918f61c56a4 Anup Patel          2023-06-15  131  		    (e->irqchip.irqchip >= KVM_NR_IRQCHIPS))
00f918f61c56a4 Anup Patel          2023-06-15  132  			goto out;
00f918f61c56a4 Anup Patel          2023-06-15  133  		break;
00f918f61c56a4 Anup Patel          2023-06-15  134  	case KVM_IRQ_ROUTING_MSI:
00f918f61c56a4 Anup Patel          2023-06-15  135  		e->set = kvm_set_msi;
00f918f61c56a4 Anup Patel          2023-06-15  136  		e->msi.address_lo = ue->u.msi.address_lo;
00f918f61c56a4 Anup Patel          2023-06-15  137  		e->msi.address_hi = ue->u.msi.address_hi;
00f918f61c56a4 Anup Patel          2023-06-15  138  		e->msi.data = ue->u.msi.data;
00f918f61c56a4 Anup Patel          2023-06-15  139  		e->msi.flags = ue->flags;
00f918f61c56a4 Anup Patel          2023-06-15  140  		e->msi.devid = ue->u.msi.devid;
19d32870833e45 Joerg Roedel        2026-04-16  141  		e->msi.plane_level = 0;
00f918f61c56a4 Anup Patel          2023-06-15  142  		break;
00f918f61c56a4 Anup Patel          2023-06-15  143  	default:
00f918f61c56a4 Anup Patel          2023-06-15  144  		goto out;
00f918f61c56a4 Anup Patel          2023-06-15  145  	}
00f918f61c56a4 Anup Patel          2023-06-15  146  	r = 0;
00f918f61c56a4 Anup Patel          2023-06-15  147  out:
00f918f61c56a4 Anup Patel          2023-06-15  148  	return r;
00f918f61c56a4 Anup Patel          2023-06-15  149  }
00f918f61c56a4 Anup Patel          2023-06-15  150  

:::::: The code at line 119 was first introduced by commit
:::::: 00f918f61c56a46d9e09ce21b54b8c21f496c753 RISC-V: KVM: Skeletal in-kernel AIA irqchip support

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
