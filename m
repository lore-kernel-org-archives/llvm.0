Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6493BB139;
	Tue, 28 Jul 2026 23:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281902; cv=none; b=Ug/aOiiLA8gA34xLEo1QJPpUtxefbsCCYG4xVwIMqHjrLgMynwmtfVzTN3m86drv/X47dHi0fDFO+rmKBtePjfAUqeBcqlBz2Le5TLnpD0WZVMkw/E3axWJE50OMPKMLX+V4fU5RbbyP/VAGpAatTsCdny34Q/8HqIsdrKlNMwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281902; c=relaxed/simple;
	bh=Ntnlp3Q2sP4vbsOjkVW+KfqnWdd1rqrFOkQIDl8VGsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CMC1A+zWrAIcQHM4+IUm7kYmlsjt4rtbXEBbDrByVSQ5/QMOav6rG1MOTtGJILeitlLEK6jSbE66nMqbhrImCU/HFlN4RzClIKzhMLGaw8U2IfuzdoYiJiPYTDZwDO4tMSlB4Ercv5a1tto04EmnH3DPQ0B014v8RPkIatFANdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGTOIEBd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGTOIEBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785281898; x=1816817898;
  h=date:from:to:cc:subject:message-id;
  bh=Ntnlp3Q2sP4vbsOjkVW+KfqnWdd1rqrFOkQIDl8VGsc=;
  b=QGTOIEBdTUvysAKfKEOJEmCpRiPFk6hp3AlzNYPrLEEBCEgS6j0gy55J
   RIPhVQf+0roDqkwwk2c4FzOtCyhfCttbvv6NEjXSgll+5jg0RJwLchlJL
   N8Xn0JqhQvb4iuDRRVDuGiJLgv/yPZS+xlifECKK2qs3KKgV4DEUXD/bx
   qQKt63caEJtNyxcAkBGoBW5BQ1/pm8KUZpcdgvYcMN9dvP0GeHd7zbl1A
   KekGfqpwQCi3pv9h7eZERgS+GCfKEJAOaf3fzev3h3QjLe+8CRpQlKRA6
   19FB6/CB4Km9fv/oroI34QBIeLIpsOZIpiAERt2i7OUCAsa944XPVm8af
   w==;
X-CSE-ConnectionGUID: J3/OgdHjTtGXnkjv2x35PQ==
X-CSE-MsgGUID: mQ0Pmx0OSJ+I+nMkVhfI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97392355"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="97392355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 16:38:13 -0700
X-CSE-ConnectionGUID: L0Q3gQuETBubwYVbGOjqSw==
X-CSE-MsgGUID: jZOScUZTQWWPxuOrFGfKEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="260486504"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 16:38:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1worNB-0000000022W-2PqL;
	Tue, 28 Jul 2026 23:38:09 +0000
Date: Wed, 29 Jul 2026 01:38:08 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_bug_on_bad_eoi_vector 120/120]
 arch/x86/kvm/lapic.c:1625:6: error: conflicting types for
 'kvm_apic_set_eoi_accelerated'
Message-ID: <202607290113.C6cbGCss-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/no_bug_on_bad_eoi_vector
head:   49569850d8b90a3da31a4d3e2518ce4aa618c242
commit: 49569850d8b90a3da31a4d3e2518ce4aa618c242 [120/120] KVM: x86: Track kvm_vcpu_arch.pending_ioapic_eoi as a u8 to drop dead BUG_ON()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260729/202607290113.C6cbGCss-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290113.C6cbGCss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290113.C6cbGCss-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/lapic.c:1625:6: error: conflicting types for 'kvm_apic_set_eoi_accelerated'
    1625 | void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, u8 vector)
         |      ^
   arch/x86/kvm/lapic.h:180:6: note: previous declaration is here
     180 | void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, int vector);
         |      ^
   1 error generated.


vim +/kvm_apic_set_eoi_accelerated +1625 arch/x86/kvm/lapic.c

  1620	
  1621	/*
  1622	 * this interface assumes a trap-like exit, which has already finished
  1623	 * desired side effect including vISR and vPPR update.
  1624	 */
> 1625	void kvm_apic_set_eoi_accelerated(struct kvm_vcpu *vcpu, u8 vector)
  1626	{
  1627		struct kvm_lapic *apic = vcpu->arch.apic;
  1628	
  1629		trace_kvm_eoi(apic, vector);
  1630	
  1631		kvm_ioapic_send_eoi(apic, vector);
  1632		kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
  1633	}
  1634	EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_eoi_accelerated);
  1635	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
