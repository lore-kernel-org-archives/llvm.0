Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB0F170A15;
	Thu,  1 Aug 2024 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722507212; cv=none; b=OpfR0kpdD9wGBmDHF8MHyR066xPtZQzqIdjjO1frQcc9CEKIfJZTmDzXVYTel4HmIKoQgZw7CcKHiQTZkOHP9cQwp4yMnst5I7rDWtzWOHs635x1ipOB3fbEneFdOqZlRTpvfLmGPQrGvGWHEoZwUMPU7ZTuTMGtFcRlmKSfFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722507212; c=relaxed/simple;
	bh=epStvb5BwNCfpVeWj0Xk0WmtELQbwwRwMu08ebqzZKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BnCDwR9kvHIfxXCUKhTTZuhHaDavmvmEjUTXtIgDv7DOQK8ydqtmn4gxy/PSUJcB6iaM1rfHszbmQqVUUAJXv8Mw8L4eF6U5sUrs9ogitPcYk1oHiT4glIKleh26kRtM1L40WfoRu2GiKHZ3KTeNJ2a9IIpjTvzg9TkRvTS08/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+xEU8AX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+xEU8AX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722507210; x=1754043210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=epStvb5BwNCfpVeWj0Xk0WmtELQbwwRwMu08ebqzZKU=;
  b=R+xEU8AX7EJRj0yPTsilPrDU9M6deyiPWpW1lHDLYiMPGukwtWqlPCBu
   635wjDvSyBKunSMbf6CExmxphLQ4P+pT1T3OjmxtbSQw9VdXVGHCTC4T9
   MYFcOhADQi4ZCHlRZcC2wf8AH/ymQ1XHngscWKeaqSVltxTCnSY2sh6Ao
   mpGsT8olwwNek9pIex47PMI/4isvXcw1Zz4TYLaTm1gKmWBHbuW/1AQnD
   Ly0j3cTLQK74ZVMnWMv7KSvRSmWYjyMT4Y4jdEZGbB7SavtUlSYo9RH7b
   f7TJfLVdr41H8YO3FPwRxNHNQNH6tA0Nnzpw69IJf3V8Q71c+JiYz8fdd
   Q==;
X-CSE-ConnectionGUID: FArOiIA1RwSCgA+IJrVShw==
X-CSE-MsgGUID: iae3q/IRTWSU2SN+y9BLpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20605524"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20605524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 03:13:29 -0700
X-CSE-ConnectionGUID: CR879yZpRrSRC1bqIF+s3g==
X-CSE-MsgGUID: STK+gbuQSN23xdlIkhkmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54893815"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Aug 2024 03:13:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZSoG-000vSW-10;
	Thu, 01 Aug 2024 10:13:24 +0000
Date: Thu, 1 Aug 2024 18:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-el1-el2-switch 1/2]
 arch/arm64/kvm/emulate-nested.c:2341:6: warning: variable 'elr' is used
 uninitialized whenever '&&' condition is false
Message-ID: <202408011855.RzOkKq91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-el1-el2-switch
head:   c30164f2b10079c9e89d35f96eb6cdc9ec833567
commit: a9bfab5ae286e4c65045395d2fd6f6d22eaa7616 [1/2] Move EL1/EL2 switch into a helper
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240801/202408011855.RzOkKq91-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 430b90f04533b099d788db2668176038be38c53b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011855.RzOkKq91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011855.RzOkKq91-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/emulate-nested.c:8:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/emulate-nested.c:2341:6: warning: variable 'elr' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    2341 |         if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/emulate-nested.c:2364:18: note: uninitialized use occurs here
    2364 |                                       .elr      = elr,
         |                                                   ^~~
   arch/arm64/kvm/emulate-nested.c:2341:6: note: remove the '&&' if its condition is always true
    2341 |         if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/emulate-nested.c:2327:15: note: initialize the variable 'elr' to silence this warning
    2327 |         u64 spsr, elr, esr;
         |                      ^
         |                       = 0
   6 warnings generated.


vim +2341 arch/arm64/kvm/emulate-nested.c

a9bfab5ae286e4 Marc Zyngier 2024-07-18  2324  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2325  void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
47f3a2fc765ae2 Jintack Lim  2023-02-09  2326  {
213b3d1ea1612c Marc Zyngier 2024-04-19  2327  	u64 spsr, elr, esr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2328  
95537f06b9e826 Marc Zyngier 2024-04-19  2329  	/*
95537f06b9e826 Marc Zyngier 2024-04-19  2330  	 * Forward this trap to the virtual EL2 if the virtual
95537f06b9e826 Marc Zyngier 2024-04-19  2331  	 * HCR_EL2.NV bit is set and this is coming from !EL2.
95537f06b9e826 Marc Zyngier 2024-04-19  2332  	 */
95537f06b9e826 Marc Zyngier 2024-04-19  2333  	if (forward_traps(vcpu, HCR_NV))
95537f06b9e826 Marc Zyngier 2024-04-19  2334  		return;
95537f06b9e826 Marc Zyngier 2024-04-19  2335  
41011e2de3480f Marc Zyngier 2024-05-28  2336  	spsr = vcpu_read_sys_reg(vcpu, SPSR_EL2);
41011e2de3480f Marc Zyngier 2024-05-28  2337  	spsr = kvm_check_illegal_exception_return(vcpu, spsr);
41011e2de3480f Marc Zyngier 2024-05-28  2338  
213b3d1ea1612c Marc Zyngier 2024-04-19  2339  	/* Check for an ERETAx */
213b3d1ea1612c Marc Zyngier 2024-04-19  2340  	esr = kvm_vcpu_get_esr(vcpu);
213b3d1ea1612c Marc Zyngier 2024-04-19 @2341  	if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2342  		/*
41011e2de3480f Marc Zyngier 2024-05-28  2343  		 * Oh no, ERETAx failed to authenticate.
41011e2de3480f Marc Zyngier 2024-05-28  2344  		 *
41011e2de3480f Marc Zyngier 2024-05-28  2345  		 * If we have FPACCOMBINE and we don't have a pending
41011e2de3480f Marc Zyngier 2024-05-28  2346  		 * Illegal Execution State exception (which has priority
41011e2de3480f Marc Zyngier 2024-05-28  2347  		 * over FPAC), deliver an exception right away.
41011e2de3480f Marc Zyngier 2024-05-28  2348  		 *
41011e2de3480f Marc Zyngier 2024-05-28  2349  		 * Otherwise, let the mangled ELR value trickle down the
213b3d1ea1612c Marc Zyngier 2024-04-19  2350  		 * ERET handling, and the guest will have a little surprise.
213b3d1ea1612c Marc Zyngier 2024-04-19  2351  		 */
41011e2de3480f Marc Zyngier 2024-05-28  2352  		if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE) && !(spsr & PSR_IL_BIT)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2353  			esr &= ESR_ELx_ERET_ISS_ERETA;
213b3d1ea1612c Marc Zyngier 2024-04-19  2354  			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
213b3d1ea1612c Marc Zyngier 2024-04-19  2355  			kvm_inject_nested_sync(vcpu, esr);
213b3d1ea1612c Marc Zyngier 2024-04-19  2356  			return;
213b3d1ea1612c Marc Zyngier 2024-04-19  2357  		}
213b3d1ea1612c Marc Zyngier 2024-04-19  2358  	}
213b3d1ea1612c Marc Zyngier 2024-04-19  2359  
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2360  	nested_switch(vcpu, nv_switch_eret,
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2361  		      &(const union nv_switch_data){
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2362  			      .eret = {
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2363  				      .esr	= esr,
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2364  				      .elr	= elr,
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2365  				      .spsr	= spsr,
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2366  			      },
a9bfab5ae286e4 Marc Zyngier 2024-07-18  2367  		      });
47f3a2fc765ae2 Jintack Lim  2023-02-09  2368  }
47f3a2fc765ae2 Jintack Lim  2023-02-09  2369  

:::::: The code at line 2341 was first introduced by commit
:::::: 213b3d1ea1612c6d26153be446923831c4534689 KVM: arm64: nv: Handle ERETA[AB] instructions

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
