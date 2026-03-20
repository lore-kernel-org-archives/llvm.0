Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3292F2EDD6B;
	Fri, 20 Mar 2026 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774033718; cv=none; b=ENplmpgBG2j1DUNFlUmiD9Z2QqwPZ7YY6hEU4SDbQV/q89dZqM7ZS7O4EM/Wwbu9TKHsDP3/bt2a3B9FGQ8l3EbYiZ7PFr/h+ZWFslT1KvYvvCyfw+1OxMzM60hDJcBr9V1vZ9eatxphvMdZNOp9Ra+wNqOWrNb7/3xfQFNhj/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774033718; c=relaxed/simple;
	bh=bik8oyNGLaTjVM6yI4cw1LkuBzrb1094LbbMjw3GXXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tdBJ1fuZvicCGhdVCOwFl7uO2kJBwGO2Z2msuGsBgzOWUg0mHe2w5I5eOt7M8vxpOpnrGGKQEGl9pLS01X6lYsptVCdcNkNag8uF0PUF3TVsW5JMNPcCSkcY+qd84OpEsBXhyLzmjKW8ADll8NC3U14IS5yA7Bum7J1d5/GtXqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjT+2H6i; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjT+2H6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774033717; x=1805569717;
  h=date:from:to:cc:subject:message-id;
  bh=bik8oyNGLaTjVM6yI4cw1LkuBzrb1094LbbMjw3GXXE=;
  b=DjT+2H6i//cOkO6MfOwBNYWS65pleNrVQ5MGfzIek5bN2xJcFFh6KvE4
   +5eWkuL1Zf+qHZ3y9GQ8NiBcwxP0ULqrVIDX8FHK7Ta148Xj+v7tFsDQ2
   gDeM4si6bYn/A0o82gKqt4W/ns+HaVPU8/LSnoIgXW5idq0cyZiMTAF3s
   PHB44wcnGVMH9TzLQ+K/EJ4SoAHAhFDm8Kuo9RNszUSkXmTG3EZ99GI4i
   mzSbySsPlpoPrUabXyvBHrXDrTFI2097tvbX4zOl3HJFeFut0AjuWrjk/
   O3RBUB/GpArj2XLlQAB60v8kqsd2EmC72zzqjAV6D5Y/zSlunFk/GUWX/
   A==;
X-CSE-ConnectionGUID: YX+eHLZeQKypphTMrawSYg==
X-CSE-MsgGUID: rfONXukxSe2r18s/KYRcpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="92703160"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92703160"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 12:08:37 -0700
X-CSE-ConnectionGUID: Nlo5YKSWSDSFxWvXoeKTYg==
X-CSE-MsgGUID: YkHZN1G4RNKSolHs5WSrUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246403998"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2026 12:08:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3fCz-0000000056B-2hHW;
	Fri, 20 Mar 2026 19:08:33 +0000
Date: Fri, 20 Mar 2026 20:07:58 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/14] arch/x86/kernel/irq.c:138:17:
 error: use of undeclared identifier 'IRQ_COUNT_X86_POSTED_MSI'
Message-ID: <202603202055.hSvtFKgU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   9e85c64195f3479abcad77115c7d5626e6905546
commit: d5debb2dd149e388fe3fdc1660437d2362579d28 [4/14] x86/irq: Make irqstats array based
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260320/202603202055.hSvtFKgU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202055.hSvtFKgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202055.hSvtFKgU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/irq.c:138:17: error: use of undeclared identifier 'IRQ_COUNT_X86_POSTED_MSI'
     138 |                 irq_stat_info[IRQ_COUNT_X86_POSTED_MSI].skip_vector = 1;
         |                               ^
   1 error generated.


vim +/IRQ_COUNT_X86_POSTED_MSI +138 arch/x86/kernel/irq.c

   123	
   124	void __init irq_init_stats(void)
   125	{
   126		struct irq_stat_info *info = irq_stat_info;
   127	
   128		for (unsigned int i = 0; i < ARRAY_SIZE(irq_stat_info); i++, info++) {
   129			if (info->skip_vector && test_bit(info->skip_vector, system_vectors))
   130				info->skip_vector = 0;
   131		}
   132	
   133		if (!x86_platform_ipi_callback)
   134			irq_stat_info[IRQ_COUNT_X86_PLATFORM_IPI].skip_vector = 1;
   135	
   136	#ifdef CONFIG_X86_POSTED_MSI
   137		if (!posted_msi_enabled())
 > 138			irq_stat_info[IRQ_COUNT_X86_POSTED_MSI].skip_vector = 1;
   139	#endif
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
