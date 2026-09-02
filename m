Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D163438B7;
	Wed,  2 Sep 2026 01:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313623; cv=none; b=uOjowJl1J2KYyLcg2stHweHDodgR5JvJPuSj7K9GY+qT/hGSUYnTp6odrjFhVUhXbnsx3XXWLp9FB4M7cU/hTe0anplRzyz+Y5VRK19KJnAcCsLt0NO/ACcyZA/Hyzwkj3DG4oSG6iulRaNNG9meoIjqXD5Ad9nZyHtDW6jzy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313623; c=relaxed/simple;
	bh=iE0qA2/7PV2SFwoLVDG51fTE95ezA9s75pujqNV61FM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WBihuzwZgS515ukB/3cQ+6nbD2PSzliyok4/v+fjtfIt4zQc49RVsZ7EPK8sUmkxyUbUfErVgqtSCPXsC69PiE7kAWX9LCgMlWLAVv7HRcSH46zq2xQ6sV5JYkEk8enpzAzA3UkoV73IE+g5r9wvEdtBKyJ49wJr3vwLNo0HnS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNxto4gV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNxto4gV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788313620; x=1819849620;
  h=date:from:to:cc:subject:message-id;
  bh=iE0qA2/7PV2SFwoLVDG51fTE95ezA9s75pujqNV61FM=;
  b=HNxto4gV7hD9GzGYaeoz7QI56IloNgQqu0ivWDcEdM2EB/oSBwdUXGW5
   Y+8JL2Y6pB7IsOjIglPWLjwP2vlW4H+30faW2aNL13HVUEfCzjon2eP6A
   bS9gh7MDa5RY5xKb8aDiJuEvqz+LQzeyp+0MflX6RTcrXalL35qECLX8W
   sL62fGagF0ST7mlV82yiFrcNaB5ANoR1bWv0HBcUsqMX8cxtFsCm/GNoo
   CBpnCu0R2C30zxWWl0XFf+7J3zSoeGV3HTsBmhW5UMEEZPvvcldxxJnZi
   FQaAkYTPDpNYYjh9FVuGbaIko+ZrlF/Nnufe9cx8y6M0/dbRY0RjDvl2i
   Q==;
X-CSE-ConnectionGUID: +w5LRzLKT3iThxNQs8ZZUQ==
X-CSE-MsgGUID: 3slytMvKQk2YymIFcSlXbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87698858"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="87698858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 18:46:54 -0700
X-CSE-ConnectionGUID: f2X8yTNDRfW9ga8iYW9T/Q==
X-CSE-MsgGUID: rBf27dSjSB2BSqS2GHr0rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269290220"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Sep 2026 18:46:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1a3t-000000001jG-2G3l;
	Wed, 02 Sep 2026 01:46:49 +0000
Date: Wed, 02 Sep 2026 09:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv3 19/19]
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h:207:2: warning: variable '__val'
 is uninitialized when used within its own initialization
Message-ID: <202609020944.8Ffx8eaS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv3
head:   ae6cf96796e7f11ecba10429d64400e708687cdf
commit: ae6cf96796e7f11ecba10429d64400e708687cdf [19/19] KVM: arm64: Avoid writing to MDSCR_EL1 unless necessary
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260902/202609020944.8Ffx8eaS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 678058af7da6a20593d8bb23076dc4773f9e55f1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020944.8Ffx8eaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020944.8Ffx8eaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/sysreg-sr.c:7:
>> arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h:207:2: warning: variable '__val' is uninitialized when used within its own initialization [-Wuninitialized]
     207 |         sysreg_cond_write(*ctxt_mdscr_el1(ctxt), mdscr_el1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:1222:16: note: expanded from macro 'sysreg_cond_write'
    1222 |                 write_sysreg(__val, sysreg);                            \
         |                 ~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:1179:20: note: expanded from macro 'write_sysreg'
    1179 |         u64 __val = (u64)(v);                                   \
         |             ~~~~~         ^
   1 warning generated.


vim +/__val +207 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h

   199	
   200	static inline void __sysreg_restore_common_state(struct kvm_cpu_context *ctxt)
   201	{
   202		/*
   203		 * KVM NV traps writes to MDSCR_EL1, as the access is
   204		 * otherwise written to memory, with no effects. Avoid the
   205		 * high trap cost by only writing if the value has changed.
   206		 */
 > 207		sysreg_cond_write(*ctxt_mdscr_el1(ctxt), mdscr_el1);
   208	
   209		// POR_EL0 can affect uaccess, so must be saved/restored early.
   210		if (ctxt_has_s1poe(ctxt))
   211			write_sysreg_s(ctxt_sys_reg(ctxt, POR_EL0),	SYS_POR_EL0);
   212	}
   213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
