Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183C042087C;
	Tue,  7 Jul 2026 23:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783465402; cv=none; b=HK9+M/3U1DAVaxebs2AxEb76P7L3TTAfgUTrzTwbpBh5BEmmUEbXKZOWu1/dae0Yz3gCXp3jdpA07h6XEftAPWgJpg2NhBtPztrGaaiN3DkCEle3AjiLIxuo2HUpbLUM8cGvJTb6Wk1fWVxF0uJfDFGhQlTPTZvlYvde6Z7sM+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783465402; c=relaxed/simple;
	bh=S89fNCs0/nbl2lHbOY0PQBokoSSgRoinFrMmZQ3td6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rpoRvbpGqJO/LIETzYGfQEnzReHJYQWVxZB7gvJ4cqSylW1F8ZcaaGlX2JYuSWWoWJgRXgTC89BxobnDNTM0fliZt9ZXswK8vDUgMm399gStdU8Stvib7Q2+wWfaLnHJjl8kfA2yF5r7toOeONdqpuoSd9NwpdGbJtqfjPyh/iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3VmIQKK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3VmIQKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783465400; x=1815001400;
  h=date:from:to:cc:subject:message-id;
  bh=S89fNCs0/nbl2lHbOY0PQBokoSSgRoinFrMmZQ3td6s=;
  b=l3VmIQKKUV+GC9WAmiRvvJECdLS6rD/XcfrsJJmVHVVpR0JE5H+0RgNB
   kQle0H92gANMcMrRXml2r7oMiYJLI77mr1Bj9+zX/FYkUux46Hx9f0X4N
   rC3ZW7+I4Uw2LYA+Ja335R5y6ZhsLKRaSry0wHZNg+iguUXDVL8okKKaw
   yR8wehF+2eeQt20rS0RrTST09HZUWR/q1h5GGpDI/9B3BEu0S9qxsZEz+
   rKMHBCUhbFv8mOG8Gnf+d4UJ+dDBPCHgo9YyxIxveTTsyrFgiCaYa3sFX
   57NVGNmumLRXVym7hgGx4R6dCxhww0HgaPD8iU4HrQx1Tn1aKAbV68q3G
   A==;
X-CSE-ConnectionGUID: kmMcU8JtQFSurReUOullKw==
X-CSE-MsgGUID: 6APJI1utTRqXpoKIwLSC4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84180421"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84180421"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 16:03:19 -0700
X-CSE-ConnectionGUID: vMT9ci5cQkKMwS4dUtvb/Q==
X-CSE-MsgGUID: zry1P70wSPC1FydDA47BVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257706693"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2026 16:03:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whEos-00000000Fjz-0Xlh;
	Tue, 07 Jul 2026 23:03:14 +0000
Date: Wed, 08 Jul 2026 07:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Marc Zyngier <maz@kernel.org>, "Wei-Lin Chang" <weilin.chang@arm.com>
Subject: [linux-next:master 3509/4300]
 arch/arm64/kvm/hyp/pgtable.c:1359:13: warning: implicit conversion from 'int'
 to 's8' (aka 'signed char') changes value from 2147483647 to -1
Message-ID: <202607080650.sMl0aR2a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c73cd9f0819c1c44e373e3dabb68318b1de1a12
commit: 100baf0184896f859290a684f864b8200d8ac872 [3509/4300] KVM: arm64: Ensure level is always initialized when relaxing perms
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607080650.sMl0aR2a-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080650.sMl0aR2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080650.sMl0aR2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/pgtable.c:1359:13: warning: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 2147483647 to -1 [-Wconstant-conversion]
    1359 |         s8 level = TLBI_TTL_UNKNOWN;
         |            ~~~~~   ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/tlbflush.h:163:26: note: expanded from macro 'TLBI_TTL_UNKNOWN'
     163 | #define TLBI_TTL_UNKNOWN        INT_MAX
         |                                 ^~~~~~~
   include/vdso/limits.h:8:19: note: expanded from macro 'INT_MAX'
       8 | #define INT_MAX         ((int)(~0U >> 1))
         |                          ^~~~~~~~~~~~~~~
   1 warning generated.


vim +1359 arch/arm64/kvm/hyp/pgtable.c

  1354	
  1355	int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
  1356					   enum kvm_pgtable_prot prot, enum kvm_pgtable_walk_flags flags)
  1357	{
  1358		kvm_pte_t xn = 0, set = 0, clr = 0;
> 1359		s8 level = TLBI_TTL_UNKNOWN;
  1360		int ret;
  1361	
  1362		if (prot & KVM_PTE_LEAF_ATTR_HI_SW)
  1363			return -EINVAL;
  1364	
  1365		if (prot & KVM_PGTABLE_PROT_R)
  1366			set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
  1367	
  1368		if (prot & KVM_PGTABLE_PROT_W)
  1369			set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
  1370	
  1371		ret = stage2_set_xn_attr(prot, &xn);
  1372		if (ret)
  1373			return ret;
  1374	
  1375		set |= xn & KVM_PTE_LEAF_ATTR_HI_S2_XN;
  1376		clr |= ~xn & KVM_PTE_LEAF_ATTR_HI_S2_XN;
  1377	
  1378		ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level, flags);
  1379		if (!ret || ret == -EAGAIN)
  1380			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr, level);
  1381		return ret;
  1382	}
  1383	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
