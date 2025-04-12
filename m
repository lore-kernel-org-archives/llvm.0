Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA6C1F03EC;
	Sat, 12 Apr 2025 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744475680; cv=none; b=M9IUer9QY2eeXn95VmGugNASlJyXG9wkArnVs0UpkuEdn2aywK2wc81crOR5jEIh8zsGG/xoVwOU3dbMWbOHqVOwvmYrE0jXS1DHjmtKgoxpAaAv6EwG2Y0A8b7mIXFnyGXPOrfVWOcaoMIiJZXxNcf9nIuu4GG9EmM+gtCQUmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744475680; c=relaxed/simple;
	bh=cB00jvoQ/L021vf2OUMLGoinbu9qH3Kqr6MSTNQ9ToA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anzroXWspW8CFDb7JcK+MNQhx/R/YBvCBIoY/loxCXOhCErH+PJOk5cqLV54XazyC8EEMv8QL6b+so/CrzBKFOTmykVlWiMo6GrM7g+XTXcCSWWRDa1ELKK2ucViJ/MddTtAb5ECxDYfTmv6Wdr6Zek04pKyGCYJLT2umuV0c9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZ2CUOIl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZ2CUOIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744475679; x=1776011679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cB00jvoQ/L021vf2OUMLGoinbu9qH3Kqr6MSTNQ9ToA=;
  b=ZZ2CUOIlYBmKC8M1dq88NS6iO0fZP5LwzbLplcl8zdMJCPMOitIAIb3K
   6Z01AC/VR7lq0TgZbUNTpCj04+el7WWD3wROu/q8bx1LgHOwuuSmZNYTd
   2MNouvlsHYQmd4LNvGgFo8FcPWJmCHCtAk9Ou+haeCrO1CK2tCLS9W85R
   qTXTYKpUiQ9ZmOj/V8Z1mkun29JtkOtrGsFnA6ys3IhMbwjccTK79rVzm
   azqADD1gF5esInEeL1LWE8mtgIYD/+r5H+eWOds9gNt+J1p6K3e8kP8Oa
   szaPzu5EEeq5vZEDm+Y3CD8u+mWrhRfRYU31WdIoHGwGg2pJMsKu/zjG6
   w==;
X-CSE-ConnectionGUID: vMkXUjNeQbuKvTVC0vJfow==
X-CSE-MsgGUID: TO0U2mjEQoO+9EOF938sTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49835431"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="49835431"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 09:34:36 -0700
X-CSE-ConnectionGUID: 8PkIWhJJQS2wJEJHCurtKg==
X-CSE-MsgGUID: gxAf98t8Tg+vYzzrLDsVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134427969"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Apr 2025 09:34:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3doO-000Bxj-2W;
	Sat, 12 Apr 2025 16:34:32 +0000
Date: Sun, 13 Apr 2025 00:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 72/72]
 arch/x86/kvm/svm/avic.c:857:37: error: use of undeclared identifier 'ir'
Message-ID: <202504130049.MrONIpaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   eb313cd2befb6b7fdcab08d5c7d41ad3cb8f3ec2
commit: eb313cd2befb6b7fdcab08d5c7d41ad3cb8f3ec2 [72/72] tmp
config: i386-buildonly-randconfig-003-20250412 (https://download.01.org/0day-ci/archive/20250413/202504130049.MrONIpaS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130049.MrONIpaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130049.MrONIpaS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/avic.c:31:
   arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:895:3: error: unknown type name 'u128'
     895 |                 u128 data128[2];
         |                 ^
   arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:1053:3: error: unknown type name 'u128'
    1053 |                 u128 irte;
         |                 ^
>> arch/x86/kvm/svm/avic.c:857:37: error: use of undeclared identifier 'ir'
     857 |                         WARN_ON_ONCE(amd_iommu_update_ga(ir->data, cpu, ga_log_intr));
         |                                                          ^
   3 errors generated.


vim +/ir +857 arch/x86/kvm/svm/avic.c

   836	
   837	static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
   838						    enum avic_vcpu_action action)
   839	{
   840		bool ga_log_intr = (action & AVIC_START_BLOCKING);
   841		struct vcpu_svm *svm = to_svm(vcpu);
   842		struct kvm_kernel_irqfd *irqfd;
   843	
   844		lockdep_assert_held(&svm->ir_list_lock);
   845	
   846		/*
   847		 * Here, we go through the per-vcpu ir_list to update all existing
   848		 * interrupt remapping table entry targeting this vcpu.
   849		 */
   850		if (list_empty(&svm->ir_list))
   851			return;
   852	
   853		list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
   854			void *data = irqfd->irq_bypass_data;
   855	
   856			if (!(action & AVIC_TOGGLE_ON_OFF))
 > 857				WARN_ON_ONCE(amd_iommu_update_ga(ir->data, cpu, ga_log_intr));
   858			else if (cpu >= 0)
   859				WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, cpu, ga_log_intr));
   860			else
   861				WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
   862		}
   863	}
   864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
