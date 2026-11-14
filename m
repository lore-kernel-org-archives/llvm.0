Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651749;
	b=kCSatZDqC93VyuLu6Kzi6mC8Nma+YYFJWJFZDeUDDZZS7UO3nsuCwxY48/6UG1t7MA5s
	 nMavymV+697wwy7i1YoYO/+m9bzj3KG/TgRHvMUoPyyHitBCVWjMBzHkYkPqSaDrnef30
	 qlYYl/q56616kFt5YUmcYYjAKOiZQcH9UTtg8eIyfu5/CIiJ7TDEYHZ0F8hGdfvmyVxm2
	 /0YzR7SsUm/jvEVKA/jJIJkiUzTA2jqIwNGwVwFJ5QJd6c/7lLvw+msaoFfZGz4OZUx7l
	 ahG7DS/8owX75doQSl6IyjF/6ChlVdhM+k58JvOkpUzmQuOLAhUTxyLLojyd4Axf2eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gINY6oV2ssh+w1KwGsGOnqGb4O2fSr7ssqnp2PKca0Q=;
	b=uzQ+fBADY/9TE5ioDkpYzwb+/gxLIysS4OpZ9sA/FQsRuUXk7mxwzGe52xmdqAjZUQxi
	 hfGKNgq4kr7dnL1EThO6AigJ3y2CjVDJDZOgBqvl2zamrzFFQsys+4jehhxL4SADXzlF2
	 izdh+W1rjt9Be2LHujkrQfsKlhdUImPSkOsZH6s4umQO6XfEpDclskSgqvsZPO6a1NV88
	 JdHVgAixpaRnvzsQl6RkRDcY9Gw7oDz8POeZIuWfMj9MZACMh31fumIb9Rvl8YW2uWI3N
	 7UMc4EnzQCDyBIh9lZ4udgUsU03BNx3QUEede6i4K1PxhjAGw+2TBRv/xwKE/X6lhQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bJxdz3Ri;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3260606A32E;
	Sat, 14 Nov 2026 10:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3260606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bJxdz3Ri
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794651748; x=1826187748;
  h=date:from:to:cc:subject:message-id;
  bh=LkPV88IrJoEWaKfyV4HY3mHy6jFA8DIvOPuaKpRv2NM=;
  b=bJxdz3Ri3GQkVAshKUg+VcbwG0oSLADMgmFXbWwlg+PuVrPPwM2zggtH
   IjUPu2eydxSgBXngNgXCuBUHhXTOvCRvw0Q53NwtafE5QCCv7I9pJDvBH
   0deF9Lw8zQ9QAu1EoW5QVzVWr5862SD8jSTVuJkDghe8Dox/HxVYWFjiY
   Q4TFhUkrtpZR/J4yjDIP5M3UJx6Jk9ncqnxLB0AVn/zOYNE+/JZmb6wR0
   JjdRCgtu0WraytduhIrs5txexsV3e5u00evYildNQ/P/lBTod685OIbQj
   nXJ1XHqJhbnHLWYxwhA6wsDFL5Bg+ZrUT3l4QeZWIgDAbi/suUDZZetcM
   g==;
X-CSE-ConnectionGUID: pVAGP+TrTKK/mZVHX1QGAw==
X-CSE-MsgGUID: fLMf5CItQIm9d7P3Xt/NrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3321176"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3321176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 02:22:28 -0800
X-CSE-ConnectionGUID: t4legRw5S46m1TcbPM8RYA==
X-CSE-MsgGUID: 93PH6AnKSqSOTPOfG19GUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9213953"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2026 02:22:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSAtr-000000015Kq-2CZY;
	Sat, 14 Nov 2026 10:22:23 +0000
Date: Sat, 14 Nov 2026 18:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Fang <peter.fang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Xu Yilun <yilun.xu@linux.intel.com>
Subject: [intel-tdx:tdx-module-ext 20/21]
 arch/x86/kvm/vmx/tdx.c:1659:7: error: call to undeclared function
 'kvm_range_has_vm_memory_attributes'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202611141848.b1Q0Pcxe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/intel/tdx.git tdx-module-ext
head:   3ed76ae19ed58ea4ef8a5d849dbc75a1de082a2d
commit: 160e84c531a3459ec04ef06b5670096e1671e257 [20/21] KVM: TDX: Add in-kernel Quote generation
config: x86_64-randconfig-1011-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141848.b1Q0Pcxe-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141848.b1Q0Pcxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141848.b1Q0Pcxe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx.c:1659:7: error: call to undeclared function 'kvm_range_has_vm_memory_attributes'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1659 |         if (!kvm_range_has_vm_memory_attributes(vcpu->kvm, gfn_start, gfn_end,
         |              ^
   1 error generated.


vim +/kvm_range_has_vm_memory_attributes +1659 arch/x86/kvm/vmx/tdx.c

  1637	
  1638	static u64 tdx_get_quote_check_args(struct kvm_vcpu *vcpu, u64 gpa, u64 size)
  1639	{
  1640		gfn_t gfn_start, gfn_end;
  1641		u64 end;
  1642	
  1643		if (!size)
  1644			return TDVMCALL_STATUS_INVALID_OPERAND;
  1645	
  1646		if (!PAGE_ALIGNED(gpa) || !PAGE_ALIGNED(size))
  1647			return TDVMCALL_STATUS_ALIGN_ERROR;
  1648	
  1649		if (check_add_overflow(gpa, size, &end))
  1650			return TDVMCALL_STATUS_INVALID_OPERAND;
  1651	
  1652		gfn_start = gpa_to_gfn(gpa);
  1653		gfn_end = gpa_to_gfn(end);
  1654	
  1655		/*
  1656		 * Reject if the guest didn't explicitly convert its quote pages to
  1657		 * shared.
  1658		 */
> 1659		if (!kvm_range_has_vm_memory_attributes(vcpu->kvm, gfn_start, gfn_end,
  1660							KVM_MEMORY_ATTRIBUTE_PRIVATE, 0))
  1661			return TDVMCALL_STATUS_INVALID_OPERAND;
  1662	
  1663		return TDVMCALL_STATUS_SUCCESS;
  1664	}
  1665	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
