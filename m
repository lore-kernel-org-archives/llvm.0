Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1427816C;
	Thu, 18 Jun 2026 00:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781744304; cv=none; b=LmK4Vn8eTCLil5LcvNsqmgXI1IhgTc9iuX7GM3OK/9XgRqzQbOCQUe4Kh64Eu6rcUqvim64qQ/rNG75FQ3FQLNZ8nEEnmvNYhVEyNAoYofdRWEhESfMEZGw7FW6Vm9wHkBMHAzbJFHs1t3hk1kf6U8dcJeKJIh/Cd2jOz3Q/ODk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781744304; c=relaxed/simple;
	bh=TBC066FDs+Js6ai4aj8oQrEvoG3Txy/X1SGsswvdZes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QTIAlIOlbTiX2dlNuZfaeiJ33AnDzbLj303AKveD2c6HT19frZGFNz6IsfcvmwTGQsgHYpUPb4db1T/L5CfaFGaunA/DeMMXZA8WjUh2IUJVAVkdmYWzz/jFqNLvrTwD5pVq84nmY0FUwMTv56WsOIad0TyGV8MyO7TjWV64GWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exfQJRDU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exfQJRDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781744303; x=1813280303;
  h=date:from:to:cc:subject:message-id;
  bh=TBC066FDs+Js6ai4aj8oQrEvoG3Txy/X1SGsswvdZes=;
  b=exfQJRDUa+goLbPV+R6MI4FpcPIxacwhdnMfA4PHWT7nosXMJTYy1lS5
   Ycq0Zk0GQXBBM71frtyiz7u3GVLJcp4jnVmBM4XuHNkEo2umYxa1Zl859
   GUSQcdXKtnqqB6z3XwwMLLxaUZ1GRoJscC4N2JuZCTApoiDPInG/vvf2p
   eyZgPxcdSTAASrHCMpx6DNtCfHAHYkwy3Iv7C1BX2kDQrctH2lgvccDPI
   9/UpLGvbCvzbWz+xaq2oY9nHADDznkrNgPyZbm0xlvCICgDh9OOKuSx+E
   vk8nfK4IppyMNNJW9avx6e3MMMNxMIpFyS2G+bZC+JPN37bNvpZhv1Ueq
   g==;
X-CSE-ConnectionGUID: oOZK9aSjSvubkL8CrQDdrw==
X-CSE-MsgGUID: JOVG2mWUTB6GGDX90esgaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="85124874"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="85124874"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:20 -0700
X-CSE-ConnectionGUID: /wz7/yUeSf2ODzcbYPIqUA==
X-CSE-MsgGUID: p2r3FTFsTTGpv3iTtAZJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="243864273"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2026 17:58:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa15F-00000000V8d-18E7;
	Thu, 18 Jun 2026 00:58:17 +0000
Date: Thu, 18 Jun 2026 08:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_bug_on_isr_count 1/1]
 arch/x86/kvm/lapic.c:770:65: error: extraneous ')' before ';'
Message-ID: <202606180808.GLXxpgBp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/no_bug_on_isr_count
head:   a641b87ae60a2279dc0b8db0be73d98a0f1a1c1e
commit: a641b87ae60a2279dc0b8db0be73d98a0f1a1c1e [1/1] KVM: x86: Bug the VM, not the kernel, if the ISR count {under,over}flows
config: x86_64-buildonly-randconfig-001-20260618 (https://download.01.org/0day-ci/archive/20260618/202606180808.GLXxpgBp-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180808.GLXxpgBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180808.GLXxpgBp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/lapic.c:770:65: error: extraneous ')' before ';'
     770 |                 KVM_BUG_ON(apic->isr_count > MAX_APIC_VECTOR, apic->vcpu->kvm));
         |                                                                               ^
   arch/x86/kvm/lapic.c:811:51: error: extraneous ')' before ';'
     811 |                 KVM_BUG_ON(apic->isr_count < 0, apic->vcpu->kvm));
         |                                                                 ^
   2 errors generated.


vim +770 arch/x86/kvm/lapic.c

   754	
   755	static inline void apic_set_isr(int vec, struct kvm_lapic *apic)
   756	{
   757		if (__test_and_set_bit(APIC_VECTOR_TO_BIT_NUMBER(vec),
   758				       apic_vector_to_isr(vec, apic)))
   759			return;
   760	
   761		/*
   762		 * With APIC virtualization enabled, all caching is disabled
   763		 * because the processor can modify ISR under the hood.  Instead
   764		 * just set SVI.
   765		 */
   766		if (unlikely(apic->apicv_active))
   767			kvm_x86_call(hwapic_isr_update)(apic->vcpu, vec);
   768		else {
   769			++apic->isr_count;
 > 770			KVM_BUG_ON(apic->isr_count > MAX_APIC_VECTOR, apic->vcpu->kvm));
   771			/*
   772			 * ISR (in service register) bit is set when injecting an interrupt.
   773			 * The highest vector is injected. Thus the latest bit set matches
   774			 * the highest bit in ISR.
   775			 */
   776			apic->highest_isr_cache = vec;
   777		}
   778	}
   779	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
