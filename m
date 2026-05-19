Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8BC3D5247;
	Tue, 19 May 2026 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228305; cv=none; b=NXpmIzLiXw7g+wjr1QOGGxRqX1DoYrJNhkTvp7ERKZwkGsonJxVYW0oNEIJgDjZGb0N12zGHMg+JcSJJpxSrXT9umlBweh6Hji4xag2wvYB3p5ncB7wpGeWXbnIy/OpDOkgY8lWob66BdYEstX5r85AVhOQEA7eaLS7DThDocjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228305; c=relaxed/simple;
	bh=o3i+wjZrg7512I1WlGYiuvUuxey/6BQgXaoZjz49sHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B+2CkBnYn8hQ97VAawWlLV1C9t7y4+qIOQYjlIQIi5ZoeDuoyzrWLNS559PSfa1pqSHuOzuGqOlRPvX7bzBofKtAXLqOmB+xJIZr7GX2dgPJAmKWJOrhYjK8VbSKm12Z4w6PFuESekr6KBm61wt3ELnJhnT09I/Klpy+hFpONfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0SgW0k7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0SgW0k7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779228304; x=1810764304;
  h=date:from:to:cc:subject:message-id;
  bh=o3i+wjZrg7512I1WlGYiuvUuxey/6BQgXaoZjz49sHc=;
  b=O0SgW0k7h60QQ2jvm0+DCdxbLY3itieZmUeNwxOlgrIAlce/ckSLBhp1
   6xKxYnt/lf48kDLsZkGsn+wlXghPkCHY7D4HNHf6y9eSJ4IEsPf2/PiAu
   soj6KViIU0ncwLO51C00AblFigZ5hlsSWkByMy2+1LVz+LlfD8GmWREEH
   QPBmSVMvzoHTYKKu2sqipjLr1/GkwTLDiOqnB0Os1uHhJgLtKek9nerHp
   JcgOTXkn8T4Wokg03Pd4xhgC8gXhJ1q1RZz7k7sgDW/YEUkoS4pR+1o+l
   mCRr8RWzQIqUNdXM3ktPsG2lxkLp4199vKWOSqWDhWa6pwlupsR+pkFzC
   Q==;
X-CSE-ConnectionGUID: MDkI3rMyRxmFKZumPmG3Vw==
X-CSE-MsgGUID: gzcCrJr8QPq/zkqqSh+MDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91226014"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91226014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 15:05:04 -0700
X-CSE-ConnectionGUID: JiHaVvNvSZ2z9rcCFMniJw==
X-CSE-MsgGUID: MaqIws8gTUuBADcJuDe2yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237298936"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2026 15:05:00 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPSYF-0000000020J-2rsm;
	Tue, 19 May 2026 22:04:38 +0000
Date: Wed, 20 May 2026 06:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Jann Horn <jannh@google.com>,
 Feng Tang <feng.tang@linux.alibaba.com>
Subject: [ardb:arm64-remap-linear-data-alias-v5 2/13]
 arch/powerpc/lib/code-patching.c:120:23: error: passing 'const uint8_t[4096]'
 (aka 'const unsigned char[4096]') to parameter of type 'void *' discards
 qualifiers
Message-ID: <202605200630.X5WfUxK4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-remap-linear-data-alias-v5
head:   d3ef1c7a7d081f762b2bb61c614d06af61ace42b
commit: f8ca7ccc34aa79d6d288b0b2c2f7da546487afa4 [2/13] mm: Make empty_zero_page[] const
config: powerpc64-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200630.X5WfUxK4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200630.X5WfUxK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200630.X5WfUxK4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/lib/code-patching.c:120:23: error: passing 'const uint8_t[4096]' (aka 'const unsigned char[4096]') to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     120 |         err = map_patch_area(empty_zero_page, addr);
         |                              ^~~~~~~~~~~~~~~
   arch/powerpc/lib/code-patching.c:63:33: note: passing argument to parameter 'addr' here
      63 | static int map_patch_area(void *addr, unsigned long text_poke_addr);
         |                                 ^
   1 error generated.


vim +120 arch/powerpc/lib/code-patching.c

c28c15b6d28a77 Christopher M. Riedl 2022-11-09  104  
37bc3e5fd764fb Balbir Singh         2017-06-29  105  static int text_area_cpu_up(unsigned int cpu)
37bc3e5fd764fb Balbir Singh         2017-06-29  106  {
37bc3e5fd764fb Balbir Singh         2017-06-29  107  	struct vm_struct *area;
591b4b268435f0 Michael Ellerman     2022-02-23  108  	unsigned long addr;
591b4b268435f0 Michael Ellerman     2022-02-23  109  	int err;
37bc3e5fd764fb Balbir Singh         2017-06-29  110  
d262a192d38e52 Christophe Leroy     2025-02-12  111  	area = get_vm_area(PAGE_SIZE, 0);
37bc3e5fd764fb Balbir Singh         2017-06-29  112  	if (!area) {
37bc3e5fd764fb Balbir Singh         2017-06-29  113  		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
37bc3e5fd764fb Balbir Singh         2017-06-29  114  			cpu);
37bc3e5fd764fb Balbir Singh         2017-06-29  115  		return -1;
37bc3e5fd764fb Balbir Singh         2017-06-29  116  	}
591b4b268435f0 Michael Ellerman     2022-02-23  117  
591b4b268435f0 Michael Ellerman     2022-02-23  118  	// Map/unmap the area to ensure all page tables are pre-allocated
591b4b268435f0 Michael Ellerman     2022-02-23  119  	addr = (unsigned long)area->addr;
591b4b268435f0 Michael Ellerman     2022-02-23 @120  	err = map_patch_area(empty_zero_page, addr);
591b4b268435f0 Michael Ellerman     2022-02-23  121  	if (err)
591b4b268435f0 Michael Ellerman     2022-02-23  122  		return err;
591b4b268435f0 Michael Ellerman     2022-02-23  123  
591b4b268435f0 Michael Ellerman     2022-02-23  124  	unmap_patch_area(addr);
591b4b268435f0 Michael Ellerman     2022-02-23  125  
2f228ee1ade5d8 Benjamin Gray        2022-11-09  126  	this_cpu_write(cpu_patching_context.area, area);
2f228ee1ade5d8 Benjamin Gray        2022-11-09  127  	this_cpu_write(cpu_patching_context.addr, addr);
2f228ee1ade5d8 Benjamin Gray        2022-11-09  128  	this_cpu_write(cpu_patching_context.pte, virt_to_kpte(addr));
37bc3e5fd764fb Balbir Singh         2017-06-29  129  
37bc3e5fd764fb Balbir Singh         2017-06-29  130  	return 0;
37bc3e5fd764fb Balbir Singh         2017-06-29  131  }
37bc3e5fd764fb Balbir Singh         2017-06-29  132  

:::::: The code at line 120 was first introduced by commit
:::::: 591b4b268435f00d2f0b81f786c2c7bd5ef66416 powerpc/code-patching: Pre-map patch area

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
