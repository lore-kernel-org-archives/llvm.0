Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6052737F2;
	Fri, 30 Jan 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769805454; cv=none; b=nonOP9y4OuQSuHZzWYXSx9408clLEUEElCaWwkqnPG6D+UHyiNLtfOLmyZL3SVANmy4NPfuH5ItSjK2pgX2UpG2Xy8Q/7wXhXULMqlgHNb1S3ZqsRLJBdoAk+yoIP7vJ0CHboLkK5AY6i0YvJywQM5NGVuEKTJI5AMDlQY9siKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769805454; c=relaxed/simple;
	bh=Qj+qRU6QNb2iDZSZAC4Q29ueq1xUCL2pvqte8O7rjcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JREjFqi+1omAiM/SiAZEjnRhCg5Ktl1GbBzTUiDB6hNuylmR0qeHjN2clws1mc0YW2FjU9x+0eXBVZ8X0DBLnO4x21BrV5+tCte/WkANGngEtLMEEjQOtoXYsbnGh6orId2E8H7DrIH4mwAVZW2DygojhysVDNrQUps9PUzM5mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZmsL//2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZmsL//2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769805452; x=1801341452;
  h=date:from:to:cc:subject:message-id;
  bh=Qj+qRU6QNb2iDZSZAC4Q29ueq1xUCL2pvqte8O7rjcg=;
  b=SZmsL//2r4il5MYWoMkC5y0/CsqWHWwt5ZRLWQ2Pm6bp3hL2WQsPO7Wa
   dXdOBVxsGQxXt7rV2ezxku2oEgFBo2bPdUl40Ibw2MDSNpki8NfOPX/iO
   +IgVKke3yXFPAEVo0w2sZmkMKMBDwGvHLQZa1YA077SOtJtQqKkz+nYsj
   05jmgliVbXlNLOumfbnVPzscnf2Q/uysBirQgathH0ACRBzbJgYO7ahnw
   Rqe01995DYfnt9merGfFAKq0jUkrBv+3c6djHrMyey6Gry4qCoKWBM2JX
   V3yBm8NJ3Krur9czqL7+0Rs44wOUar14YixwJ6ZY9qBb9DchBTaM+BM01
   g==;
X-CSE-ConnectionGUID: 53yR0jjXQPK9Yo/2reAqWw==
X-CSE-MsgGUID: ctTT+YHYTX+TwTuUqG+BSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71098008"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71098008"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 12:37:31 -0800
X-CSE-ConnectionGUID: yX2+yQjgRzCMXqjqIF/lkA==
X-CSE-MsgGUID: ov/tu1BPRjqVcOUXuzlQMA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 12:37:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlvF9-00000000dL0-39um;
	Fri, 30 Jan 2026 20:37:27 +0000
Date: Sat, 31 Jan 2026 04:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 22/22]
 arch/x86/boot/startup/map_kernel.c:111:21: error: no member named
 'kaslr_va_shift' in 'struct boot_params'
Message-ID: <202601310427.EhGxWXZn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   1857f672aab1ce60b60db9458e7120522a7b5056
commit: 1857f672aab1ce60b60db9458e7120522a7b5056 [22/22] WIP
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260131/202601310427.EhGxWXZn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310427.EhGxWXZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310427.EhGxWXZn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/boot/startup/map_kernel.c:111:21: error: no member named 'kaslr_va_shift' in 'struct boot_params'
     111 |                 p2v_offset -= bp->kaslr_va_shift;
         |                               ~~  ^
   1 error generated.


vim +111 arch/x86/boot/startup/map_kernel.c

    78	
    79	/*
    80	 * This code is compiled using PIC codegen because it will execute from the
    81	 * early 1:1 mapping of memory, which deviates from the mapping expected by the
    82	 * linker. Due to this deviation, taking the address of a global variable will
    83	 * produce an ambiguous result when using the plain & operator.  Instead,
    84	 * rip_rel_ptr() must be used, which will return the RIP-relative address in
    85	 * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
    86	 * subtracting p2v_offset from the RIP-relative address.
    87	 */
    88	unsigned long __init __startup_64(unsigned long p2v_offset,
    89					  struct boot_params *bp)
    90	{
    91		pmd_t (*early_pgts)[PTRS_PER_PMD] = rip_rel_ptr(early_dynamic_pgts);
    92		unsigned long physaddr = (unsigned long)rip_rel_ptr(_text);
    93		unsigned long va_text, va_end;
    94		unsigned long pgtable_flags;
    95		unsigned long load_delta;
    96		pgdval_t *pgd;
    97		p4dval_t *p4d;
    98		pudval_t *pud;
    99		pmdval_t *pmd, pmd_entry;
   100		bool la57;
   101		int i;
   102	
   103		la57 = check_la57_support();
   104	
   105		/* Is the address too large? */
   106		if (physaddr >> MAX_PHYSMEM_BITS)
   107			for (;;);
   108	
   109		sanitize_boot_params(bp);
   110		if (IS_ENABLED(CONFIG_RELOCATABLE_PIE))
 > 111			p2v_offset -= bp->kaslr_va_shift;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
