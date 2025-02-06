Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE19211A11;
	Thu,  6 Feb 2025 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738818812; cv=none; b=s83ryC1gaPgMcK88F1c6UoSkbgFauSuM4QMvLXSU/xsF/XIPHUO0Vks39prkhStpUgr7oyS6OOJj7QlTZCeLifbjrNn3OO2KHvBVXpN+RLd0vBB4ROatSIMV3vXBwnuNGVU5IbJxbu4vEC271kdFb9reEZ1CLKWPh9bnbgevGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738818812; c=relaxed/simple;
	bh=50GCwaCPYSnvu2jymjTrhGWQUaX+t97ivVZwSS7tdUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UADF3pYHb/y+I7oMtkqhnsA1WLHTGNDb3HUa3YdBduHIUOj3vtQsLqLKO948QBrUZbL1ZMYEg41Xd52B9uKpmpmwXhTJReRjXS9LJnZ2NQgc1MV4fGYppaiN9GR94Wh1SYOCnuz0PG0hEmgycS/M+olcmwmmkVObS4z3NGU6I5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIRb8zrp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIRb8zrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738818810; x=1770354810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50GCwaCPYSnvu2jymjTrhGWQUaX+t97ivVZwSS7tdUo=;
  b=ZIRb8zrpvZq3xByZDK+WolLkL/RKnSe/QCXB+KCdO84qDbFKGrJceKY6
   UIP+l7Bc4e/fsL/GB5xBpyph0pH2NUsRhjhDmCinjR+EwwNfvjbUp4rgn
   RYTaWtuvagyHMkApqU299UN+Bd2MB2K5lLBI8e1LIFR6CsSUmp3HRN5Yj
   /9lZj/IniLi+yufxuQOYBCmeZcLO1wnZyjv9wB6bUNZ8506u7ny5ZeI4I
   OYQ7VcvgoLsUi4uT6ahunFBXi4UwFnL0QI9h0ZHLfgxd1lEtzK8wfcy83
   B7cUwbVLxjZxpLQlG345GOMSve6ocVPjGHx4TAljy9/pjFPhq4ZhrJO/k
   g==;
X-CSE-ConnectionGUID: xxBMbjI/SEe0oaywojGUEw==
X-CSE-MsgGUID: ccFyiZ/+SeyUjNM2B/po5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56824332"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="56824332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 21:13:30 -0800
X-CSE-ConnectionGUID: X4Jiv/0CTsWki2ed9Uwz9Q==
X-CSE-MsgGUID: YtCk657vSBmVjgiW+xNyeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="141988846"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2025 21:13:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfuCc-000wTr-0n;
	Thu, 06 Feb 2025 05:13:26 +0000
Date: Thu, 6 Feb 2025 13:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/kvm/fpsimd-fixes 8/11]
 arch/arm64/kvm/hyp/include/hyp/switch.h:380:15: warning: variable 'zcr_el2'
 set but not used
Message-ID: <202502061341.FvsCMKEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/kvm/fpsimd-fixes
head:   246fa113d11e53f51bf13b25bcf85161c2290b37
commit: 9b573af2d7bae55e446e8d422b6ec87a144d3148 [8/11] KVM: arm64: Eagerly switch ZCR_EL{1,2}
config: arm64-randconfig-003-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061341.FvsCMKEH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061341.FvsCMKEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061341.FvsCMKEH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:380:15: warning: variable 'zcr_el2' set but not used [-Wunused-but-set-variable]
           u64 zcr_el1, zcr_el2;
                        ^
   arch/arm64/kvm/hyp/include/hyp/switch.h:401:15: warning: variable 'zcr_el2' set but not used [-Wunused-but-set-variable]
           u64 zcr_el1, zcr_el2;
                        ^
   2 warnings generated.


vim +/zcr_el2 +380 arch/arm64/kvm/hyp/include/hyp/switch.h

   377	
   378	static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
   379	{
 > 380		u64 zcr_el1, zcr_el2;
   381	
   382		if (!guest_owns_fp_regs())
   383			return;
   384	
   385		if (vcpu_has_sve(vcpu)) {
   386			/* A guest hypervisor may restrict the effective max VL. */
   387			if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
   388				zcr_el2 = __vcpu_sys_reg(vcpu, ZCR_EL2);
   389			else
   390				zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
   391	
   392			sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
   393	
   394			zcr_el1 = __vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu));
   395			write_sysreg_el1(zcr_el1, SYS_ZCR);
   396		}
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
