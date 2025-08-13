Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0087271A71;
	Wed, 13 Aug 2025 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120534; cv=none; b=tRPjVL6veccOmBNfsZnhrn6VH6a3DOtRVMzIklOETNXOhh56mGU99XH13xKyExZ5ADR/fsPpgiPnHHJDZWvHdiSuV/siv6S4eNc4bGxPe2XCL8rndpL8PJe5+yZvTUumnFWjtjdfuQkT6gE1Q4H3IpkwuS+hKGbxusgzH4m4oZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120534; c=relaxed/simple;
	bh=TIFSIQ0LsJfPs50PWyjz0H038Lwnq83CQOjy1rvLSvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKglN6xvSIEr9UsLybeQyY+DsmDIFXX4cZX7FiBC/yItyvoCR2aiguTgeUiyULWJdcyMCE/RvNonSpy+Mg2lRLH2XjFgDNjRfy2aQPSduIJ2GsOMnbsu+mqXW2Hw8BzBZDQc4HfDmS2ZnDEYyHps+ItFtcdWpGKxG0JahPtH/aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNUH7veo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNUH7veo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755120533; x=1786656533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TIFSIQ0LsJfPs50PWyjz0H038Lwnq83CQOjy1rvLSvM=;
  b=LNUH7veoQkFtPkhdGtzNuCB9iw6r95HjwICj56kmuDODiWduHuakyqGM
   4F7RVJgwiNjEYC8HGIe6k/Ry9r5CvYo+IDHZh2cbQo27t5UuoLRfSZzIW
   6ha+4UPceAMYnuK0Q5xdsfW36etDYaPZC//r68SF5+ov8luMwdIT/VhOU
   BV5Svi5xk02mabYetHvszFStLPdTng6+xtcVnOfpjCehicgfo7fuTxKPw
   Ap4PLk/tWXqGa2ToVxNwMrQgBaCQIvkzMxJVsu4s339Z4fqgU+6+XPBSH
   6npNxkLPwmljP/gTNz7hiryUxBmnN4wMstrNKPnPPWSQdE3W1je2hgj1z
   w==;
X-CSE-ConnectionGUID: iE6eUBg0RpaTS+V/ZLGeTw==
X-CSE-MsgGUID: /E3UMMCDQ9G1LQIbPzvm4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56642682"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="56642682"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 14:28:52 -0700
X-CSE-ConnectionGUID: h4WsnkKTQqeA6OHGo0G/9g==
X-CSE-MsgGUID: /ka5BKTRTlWMikcJkNK9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166957054"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 14:28:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umJ1d-000AKi-0m;
	Wed, 13 Aug 2025 21:28:49 +0000
Date: Thu, 14 Aug 2025 05:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:cpuid 4/4] arch/x86/kernel/kvm.c:899:30: error: a function
 declaration without a prototype is deprecated in all versions of C
Message-ID: <202508140537.ByBMF2YF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux cpuid
head:   7a7b1aa66380243dddb2037ff113bb2265b529ff
commit: 73038303178dd4d4f847ffe024b87b4a2a0930a5 [4/4] x86/kvm: Obtain TSC frequency from CPUID if present
config: x86_64-buildonly-randconfig-002-20250814 (https://download.01.org/0day-ci/archive/20250814/202508140537.ByBMF2YF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140537.ByBMF2YF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140537.ByBMF2YF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/kvm.c:899:30: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     899 | unsigned int kvm_para_tsc_khz()
         |                              ^
         |                               void
   1 error generated.


vim +899 arch/x86/kernel/kvm.c

   898	
 > 899	unsigned int kvm_para_tsc_khz()
   900	{
   901		u32 base = kvm_cpuid_base();
   902	
   903		if (cpuid_eax(base) >= (base | KVM_CPUID_TIMING_INFO))
   904			return cpuid_eax(base | KVM_CPUID_TIMING_INFO);
   905	
   906		return 0;
   907	}
   908	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
