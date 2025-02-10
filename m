Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A383596A;
	Mon, 10 Feb 2025 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739151610; cv=none; b=eq9OdHZepQy0atjQW2j+VgTXqRe37lHpO9umxeFBRISQj6UT59PzX7oQa8cJwr95GbROMXO6FdgnZBVt0NEn0DTQKJMcSyb3hzaiXWrQ0G6bcmbGB9vGBF/m8z+rRNwviwdkopEzn4bRcU0+3En3s3uQpqh2/LD5m1Q++fRGBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739151610; c=relaxed/simple;
	bh=0X3TGr6+RrerfXCFz/YSGMQebGxVzRjsYIWZ35TeNNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NIsJBwlNR61GSXJJ1UPeWBK1ZNXnA3IvNdTgsUkMmHxKD3CV5KZj97EnaVY2MEaqziknVmh/5RHJa33B2+BrM43f3uFNH9P8Ywe3aZN3dMs5j+uoKr3/PbOuOOMjHBWYHoxGCxLaGcq2jHgaBq+5ZT6bvGMNkFBPWuJbm227KCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORqh4iOu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORqh4iOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739151608; x=1770687608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0X3TGr6+RrerfXCFz/YSGMQebGxVzRjsYIWZ35TeNNg=;
  b=ORqh4iOujM8Usg0Po0NbhKSg9vK3eYOq6RwXQB9gNtET3kNSl4Xcmh9s
   man8W6pGApRN9GE9aZJXEEUrZWTT6Jhd4crNH/jJhBs+7jIW+lezs/5zO
   WgEDrq6NGnQIgMKB6Gmoyuqu0+vXt48EhV9gFfrILEgKzmVTpD1W75YvH
   sW4nliWNuJ9bOVQ965dEu2n4rNGQuGXoK5djE9M2rOqMZTlhklnDt4F8V
   kiNEy0Dh7Kx5gUyI8Jw9ZzaFeY5NNmOzJsHGTYCusBqsWztQIXO8zE+SP
   B2JKX8Sp/K9h7yTbPlKzcnuJgEV66ub/lJLOg9g9fQOr92KGNGzRlnnJm
   Q==;
X-CSE-ConnectionGUID: C5txWT03SlGl2c7dA9DrMQ==
X-CSE-MsgGUID: D2VKB9jLR4uEPLeIaxnVvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51112188"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="51112188"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 17:40:08 -0800
X-CSE-ConnectionGUID: J/iQNsU+ShWZDGxNupx+iQ==
X-CSE-MsgGUID: 827OAA7iQNWFPr2Pt/rE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112686731"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Feb 2025 17:40:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thImI-001283-36;
	Mon, 10 Feb 2025 01:40:02 +0000
Date: Mon, 10 Feb 2025 09:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Perret <qperret@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvmarm:fixes 18/18] arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202502100911.8c9DbtKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fixes
head:   eabc7aaef7a553b64bf6e631ce04526af6c8d104
commit: eabc7aaef7a553b64bf6e631ce04526af6c8d104 [18/18] KVM: arm64: Simplify np-guest hypercalls
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100911.8c9DbtKD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1086 |         return ret;
         |                ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1076:9: note: initialize the variable 'ret' to silence this warning
    1076 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1086 arch/arm64/kvm/hyp/nvhe/mem_protect.c

76f0b18b3db578 Quentin Perret 2024-12-18  1071  
76f0b18b3db578 Quentin Perret 2024-12-18  1072  int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
76f0b18b3db578 Quentin Perret 2024-12-18  1073  {
76f0b18b3db578 Quentin Perret 2024-12-18  1074  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
76f0b18b3db578 Quentin Perret 2024-12-18  1075  	u64 ipa = hyp_pfn_to_phys(gfn);
76f0b18b3db578 Quentin Perret 2024-12-18  1076  	int ret;
76f0b18b3db578 Quentin Perret 2024-12-18  1077  
eabc7aaef7a553 Quentin Perret 2025-02-07  1078  	if (pkvm_hyp_vm_is_protected(vm))
eabc7aaef7a553 Quentin Perret 2025-02-07  1079  		return -EPERM;
76f0b18b3db578 Quentin Perret 2024-12-18  1080  
eabc7aaef7a553 Quentin Perret 2025-02-07  1081  	assert_host_shared_guest(vm, ipa);
eabc7aaef7a553 Quentin Perret 2025-02-07  1082  	guest_lock_component(vm);
76f0b18b3db578 Quentin Perret 2024-12-18  1083  	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
76f0b18b3db578 Quentin Perret 2024-12-18  1084  	guest_unlock_component(vm);
76f0b18b3db578 Quentin Perret 2024-12-18  1085  
76f0b18b3db578 Quentin Perret 2024-12-18 @1086  	return ret;

:::::: The code at line 1086 was first introduced by commit
:::::: 76f0b18b3db57868fb0cabe691201aad3085b712 KVM: arm64: Introduce __pkvm_host_mkyoung_guest()

:::::: TO: Quentin Perret <qperret@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
