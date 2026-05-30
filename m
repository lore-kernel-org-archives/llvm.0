Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63F39C621;
	Sat, 30 May 2026 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134936; cv=none; b=UPQqBUUisdnq6R+1T9KL98f3g7/SZCQNkTX5UbWyPSgFsFTilOFF2fxjdGkK+Mbagbb0snPbH+9SElBVlDDQnuz/VY2UdX4hOQwdBVKWsXYOUqo9WJ951eQz8w6Su9pmvjc1ZH5CclAk0MPnfA/3CxsMKqgs7DgcsZBL1jsZBO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134936; c=relaxed/simple;
	bh=J4/3TPVg/kQcwwK3ITFCqJkm26z4OuxNxkgaARFrcC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IKdeyegF4BJbbgyl4WaYJkhf9W15uSEOSROkTc/eh0xHh8Uow1Vfi4BI6+PLxQYemQ9evqqEKEXUVqkyrP7seMwmj3KYM1LVUKk4TbAlNHVhk5K6jL8pRWqqpeqgdDtw9Ds+sMARO0r2W1o7/kZO/zEA5bNwm7MVw6XJO3H5CeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtlTY7mP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtlTY7mP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780134935; x=1811670935;
  h=date:from:to:cc:subject:message-id;
  bh=J4/3TPVg/kQcwwK3ITFCqJkm26z4OuxNxkgaARFrcC0=;
  b=UtlTY7mPXT/PuMsEW/sTrFNFiGDWPZERq9c0i+ejn4DkbWSRdw8B4+Rk
   leURak1ydoO3qH9tuJNyu/Vx0s/EVK4RGp2faD04JWtdBtwMp+exE1Ufd
   ZOFecf1Ta27q4X+oMOsKiO3GKJozPiVySsakSZnvVpSYdBaOVU6rrK2kk
   62/XNHbv9fqkUeHbz7+9awpfDpfYui0ABHlkmEyfAgVZeqf33QTNYGWPm
   Vp1md3z06s4+wkg9hcpvdRGTGbbtTWwvU1TN+C2vrQgqQFmKUqRbDr85M
   LYx3uiN557vc+AUpp6JtWXonUOT1gM2HrEPxUKtfvPVXoXUwWphAFfcU+
   g==;
X-CSE-ConnectionGUID: UkjS6CbuRcKyh0w9jHOl9g==
X-CSE-MsgGUID: J3I6yMGxRKaLxWfpOmdSWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="68506026"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="68506026"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 02:55:32 -0700
X-CSE-ConnectionGUID: dKbBT4ZdSfSiLVy9OMhDtQ==
X-CSE-MsgGUID: +emGpQyjSJWjPRPm59rDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="248171977"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2026 02:55:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTGPg-000000008Im-1j3J;
	Sat, 30 May 2026 09:55:28 +0000
Date: Sat, 30 May 2026 17:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 38/62] arch/riscv/kvm/vm.c:108:46:
 error: too few arguments to function call, expected 5, have 4
Message-ID: <202605301745.3cIog3zy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: 02ee2b16b2c3d162c0bfe4315ef1fd6a1a2836fa [38/62] kvm: Make KVM_SET_GSI_ROUTING per plane
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605301745.3cIog3zy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301745.3cIog3zy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301745.3cIog3zy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/vm.c:13:
   include/linux/kvm_host.h:1084:56: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1084 |                   "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
         |                                                                ~~~~  ^
   include/linux/kvm_host.h:1095:58: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1095 |                   "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
         |                                                                  ~~~~  ^
>> arch/riscv/kvm/vm.c:108:46: error: too few arguments to function call, expected 5, have 4
     108 |         rc = kvm_set_irq_routing(kvm, ents, lines, 0);
         |              ~~~~~~~~~~~~~~~~~~~                    ^
   include/linux/kvm_host.h:2331:5: note: 'kvm_set_irq_routing' declared here
    2331 | int kvm_set_irq_routing(struct kvm *kvm,
         |     ^                   ~~~~~~~~~~~~~~~~
    2332 |                         const struct kvm_irq_routing_entry *entries,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2333 |                         unsigned nr,
         |                         ~~~~~~~~~~~~
    2334 |                         unsigned flags,
         |                         ~~~~~~~~~~~~~~~
    2335 |                         unsigned plane_level);
         |                         ~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vm.c:119:5: error: conflicting types for 'kvm_set_routing_entry'
     119 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^
   include/linux/kvm_host.h:2337:5: note: previous declaration is here
    2337 | int kvm_set_routing_entry(struct kvm *kvm,
         |     ^
   4 errors generated.


vim +108 arch/riscv/kvm/vm.c

00f918f61c56a4 Anup Patel     2023-06-15   92  
00f918f61c56a4 Anup Patel     2023-06-15   93  int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines)
00f918f61c56a4 Anup Patel     2023-06-15   94  {
00f918f61c56a4 Anup Patel     2023-06-15   95  	struct kvm_irq_routing_entry *ents;
00f918f61c56a4 Anup Patel     2023-06-15   96  	int i, rc;
00f918f61c56a4 Anup Patel     2023-06-15   97  
bf4afc53b77aea Linus Torvalds 2026-02-21   98  	ents = kzalloc_objs(*ents, lines);
00f918f61c56a4 Anup Patel     2023-06-15   99  	if (!ents)
00f918f61c56a4 Anup Patel     2023-06-15  100  		return -ENOMEM;
00f918f61c56a4 Anup Patel     2023-06-15  101  
00f918f61c56a4 Anup Patel     2023-06-15  102  	for (i = 0; i < lines; i++) {
00f918f61c56a4 Anup Patel     2023-06-15  103  		ents[i].gsi = i;
00f918f61c56a4 Anup Patel     2023-06-15  104  		ents[i].type = KVM_IRQ_ROUTING_IRQCHIP;
00f918f61c56a4 Anup Patel     2023-06-15  105  		ents[i].u.irqchip.irqchip = 0;
00f918f61c56a4 Anup Patel     2023-06-15  106  		ents[i].u.irqchip.pin = i;
00f918f61c56a4 Anup Patel     2023-06-15  107  	}
00f918f61c56a4 Anup Patel     2023-06-15 @108  	rc = kvm_set_irq_routing(kvm, ents, lines, 0);
00f918f61c56a4 Anup Patel     2023-06-15  109  	kfree(ents);
00f918f61c56a4 Anup Patel     2023-06-15  110  
00f918f61c56a4 Anup Patel     2023-06-15  111  	return rc;
00f918f61c56a4 Anup Patel     2023-06-15  112  }
00f918f61c56a4 Anup Patel     2023-06-15  113  

:::::: The code at line 108 was first introduced by commit
:::::: 00f918f61c56a46d9e09ce21b54b8c21f496c753 RISC-V: KVM: Skeletal in-kernel AIA irqchip support

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
