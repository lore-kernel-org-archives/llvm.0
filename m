Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083F3A7F78;
	Tue, 20 Jan 2026 20:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768940154; cv=none; b=H14SCgv8EDC3vwtJgsvX8ZtWISDY2Dw9zYNPpW2tsD8SrxmN7rxP3+j7lKCWNS+FeRFampPo8M48HCuP/usJsbdYKaXHDRPS8/4PerKxs3fZEqKBBUHzjYCf9QfM3wrzGp9UDd41Aabb2jQc4v8iyicQPK6Ew1aan5U4ykJ5xmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768940154; c=relaxed/simple;
	bh=58fpisV8pyLg2TTsu3PMcGliO8Bx3We5VMk8lz5Y++M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqT95bnPpb75+MYB4dclnC0hl9R5KSYTktrsBrTScxqZk7bxJJ4c60XBa47jE43V4jEfVOw+Bkz125MnedE6LUywy3bBeMV/yGp27xIHhDxzTLImIuvDvBhYXd0HjwM5Iuf8m2bgd0/YVtN/S3SyvEfydtLNxZ5NI84QeHiuGpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+Q8toyP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+Q8toyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768940151; x=1800476151;
  h=date:from:to:cc:subject:message-id;
  bh=58fpisV8pyLg2TTsu3PMcGliO8Bx3We5VMk8lz5Y++M=;
  b=E+Q8toyPmiRGSsIJv6K5G6Nx5v+nH8AnnJp7wgvrUFs0WBa+uUAR5yab
   Ru58Zv0UHjWFuwP/8C/7gHMe3P+KnwW5w6BgBe7ZwgrGnmp4OA814O71U
   g1mQeA48EuWZi/kA9/+ErINz84CbTDzwEtcTMisyJvk6iEZ6gv5LZS1JJ
   L3P+yUWaQLvPkCzGCD48pbk4T0N/fvdlwLVKRPGBXLQGwbllVYYVE8+3d
   ol+EDDJZNIFZIR6Lts4M5eUQyo3WrAkvt7shIAgvL/m1Kz/r0xwB/5Xdu
   EZk7xerpu8js6JZkes99ZMgurJNzaBs7Sy4QayZcB0Xi3hsmOR+2pgwAT
   Q==;
X-CSE-ConnectionGUID: GMkynId7RS+/EY6o+6WbIw==
X-CSE-MsgGUID: eqfrs+iWQT2I8qtcytNHyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70214565"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70214565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 12:15:51 -0800
X-CSE-ConnectionGUID: XpSJc4qdT36/aK4rHBp60Q==
X-CSE-MsgGUID: betD6N1PShGi4oM5jIXgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205464808"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2026 12:15:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viI8h-00000000PU7-1DaZ;
	Tue, 20 Jan 2026 20:15:47 +0000
Date: Wed, 21 Jan 2026 04:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-riscv-v6.19-rc1 2/2]
 arch/riscv/mm/physaddr-debug.c:18:26: error: use of undeclared identifier
 'vaddr'
Message-ID: <202601210409.mY4gdkvU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-riscv-v6.19-rc1
head:   877fcd0044b0a64fc875e01ea3c462f0fdeadd29
commit: 877fcd0044b0a64fc875e01ea3c462f0fdeadd29 [2/2] riscv: Make virt_to_pfn() a real function
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260121/202601210409.mY4gdkvU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210409.mY4gdkvU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210409.mY4gdkvU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/mm/physaddr-debug.c:18:26: error: use of undeclared identifier 'vaddr'
           return phys_to_pfn(__pa(vaddr));
                                   ^
   1 error generated.


vim +/vaddr +18 arch/riscv/mm/physaddr-debug.c

     8	
     9	phys_addr_t __virt_to_phys(unsigned long x)
    10	{
    11		/*
    12		 * Boundary checking aginst the kernel linear mapping space.
    13		 */
    14		WARN(!is_linear_mapping(x) && !is_kernel_mapping(x),
    15		     "virt_to_phys used for non-linear address: %p (%pS)\n",
    16		     (void *)x, (void *)x);
    17	
  > 18		return phys_to_pfn(__pa(vaddr));
    19	}
    20	EXPORT_SYMBOL(__virt_to_phys);
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
