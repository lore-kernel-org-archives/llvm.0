Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55543FADEE;
	Thu, 28 May 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981456; cv=none; b=mNl1n0DR6vkuLGgytVlLZQu1slniaRDk9NrhjTAhSKr/O+MU7A+sNA8hV6uc9PKzFDAWaHScEBNjP/CXNEOID1+qYIrE39LlSf0NgQHzUPmxE0mIl4XMP01+YZHlEc2hpipOLVLbKNy9DBXTSQEiRMfd+dV0VWoyjmhaKJQ6+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981456; c=relaxed/simple;
	bh=nkYsmQpnRx6ydd9zDeBefyemk1LDnClWVkJ8WH9rxzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FKawzP50W/kqAC6z2Ke5WFqw1B9antZPoQvPVVNrnEubxH/vOmBiVNiCWjr9LGLaed+oD8gIWHYNTKGIzIsKJ62SiNCDtQNySa9mI+uODs4PyvD0Rx/RHK4SmURRIUWoVYazx6CtNHSsfo0K8WkLETd8j+g7IGhhZdFJ+ZhUmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTwxWuM3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTwxWuM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779981455; x=1811517455;
  h=date:from:to:cc:subject:message-id;
  bh=nkYsmQpnRx6ydd9zDeBefyemk1LDnClWVkJ8WH9rxzk=;
  b=dTwxWuM3LUX4gXw47QIwgUeQatu22m2z9WwcdK6mH+ppseYBRFJCuhsF
   lXYa8aaVjdV/U1rwE6AVpduJo+yXu5VodCixeDKGwb4M0BGut3rhk8W31
   rZ45I6UWTCRryaR3mpZ35MS4qsxk+u51IlwW6mGYrEpp+t1aeNU65l9AL
   iiO/PD1NwRVBRo08vaY/KBGUsfpgaEQFK20UPHrhCTs/JUTEU6AP2WXbW
   TcMCh/cBr7dzpQ3mpXC0Cd7eAytsRV7gwycsFOYU9GTWALUdJIaeDkLIi
   iOUsl2ebPlb1R0VbLDFQLfcOSlMJutrzdjoYvCviTymTqFdnk99Db8jQo
   Q==;
X-CSE-ConnectionGUID: Ay+sQjqIQOGildCz0Tn9vQ==
X-CSE-MsgGUID: EsXb7blXQCan6Yuz3WH1QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80817490"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80817490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:17:34 -0700
X-CSE-ConnectionGUID: zsxZVoSdT4C60mPtEeD0XQ==
X-CSE-MsgGUID: ujpSpoYSReOv8cgcmrFyww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="246854159"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2026 08:17:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wScUF-0000000064E-1J4j;
	Thu, 28 May 2026 15:17:31 +0000
Date: Thu, 28 May 2026 23:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v4 46/61]
 arch/riscv/kernel/sbi_mpxy.c:287:5: error: call to undeclared function
 'memdesc_section'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605282348.7h06tCJa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   f532a039b5f6357db1cefa8fba19666b46049341
commit: d715c82481af6e5c6576ae0cb3a17bdb66a9e4ea [46/61] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-001-20260528 (https://download.01.org/0day-ci/archive/20260528/202605282348.7h06tCJa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282348.7h06tCJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282348.7h06tCJa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/sbi_mpxy.c:287:5: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |                          page_to_phys(shmem_page), 0, 0, 0, 0, 0);
         |                          ^
   include/asm-generic/memory_model.h:79:24: note: expanded from macro 'page_to_phys'
      79 |         unsigned long __pfn = page_to_pfn(page);                        \
         |                               ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   arch/riscv/kernel/sbi_mpxy.c:289:29: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     289 |                 free_pages((unsigned long)page_to_virt(shmem_page),
         |                                           ^
   arch/riscv/include/asm/page.h:160:41: note: expanded from macro 'page_to_virt'
     160 | #define page_to_virt(page)      (pfn_to_virt(page_to_pfn(page)))
         |                                              ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   arch/riscv/kernel/sbi_mpxy.c:294:16: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |         mpxy->shmem = page_to_virt(shmem_page);
         |                       ^
   arch/riscv/include/asm/page.h:160:41: note: expanded from macro 'page_to_virt'
     160 | #define page_to_virt(page)      (pfn_to_virt(page_to_pfn(page)))
         |                                              ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   arch/riscv/kernel/sbi_mpxy.c:295:26: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         mpxy->shmem_phys_addr = page_to_phys(shmem_page);
         |                                 ^
   include/asm-generic/memory_model.h:79:24: note: expanded from macro 'page_to_phys'
      79 |         unsigned long __pfn = page_to_pfn(page);                        \
         |                               ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   4 errors generated.


vim +/memdesc_section +287 arch/riscv/kernel/sbi_mpxy.c

   267	
   268	static int mpxy_setup_shmem(unsigned int cpu)
   269	{
   270		struct page *shmem_page;
   271		struct mpxy_local *mpxy;
   272		struct sbiret sret;
   273	
   274		mpxy = per_cpu_ptr(&mpxy_local, cpu);
   275		if (mpxy->shmem_active)
   276			return 0;
   277	
   278		shmem_page = alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(mpxy_shmem_size));
   279		if (!shmem_page)
   280			return -ENOMEM;
   281	
   282		/*
   283		 * Linux setup of shmem is done in mpxy OVERWRITE mode.
   284		 * flags[1:0] = 00b
   285		 */
   286		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SET_SHMEM,
 > 287				 page_to_phys(shmem_page), 0, 0, 0, 0, 0);
   288		if (sret.error) {
   289			free_pages((unsigned long)page_to_virt(shmem_page),
   290				   get_order(mpxy_shmem_size));
   291			return sbi_err_map_linux_errno(sret.error);
   292		}
   293	
   294		mpxy->shmem = page_to_virt(shmem_page);
   295		mpxy->shmem_phys_addr = page_to_phys(shmem_page);
   296		mpxy->shmem_active = true;
   297	
   298		return 0;
   299	}
   300	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
