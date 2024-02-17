Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA6F1CD1F;
	Sat, 17 Feb 2024 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708187727; cv=none; b=TdKM0zXBCBXnDoa93wM++upUaLlbGBJxmKefzLh+onOtazZzfWPqr/rbsi9VwEwpkgkZEwdxUfLuuC1Sfo/4pM/GPhzhgj00C4TmVYmLsmc3+rQu8+5XTlQdPXntYgADctWxxhWQdbNVNizNXOyMDKYMV2N8sW+pDFC9hgC2fic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708187727; c=relaxed/simple;
	bh=CX+7rTq+OJdFWPLeb2ZZ5IP3ugk/2VuCgRu3Ayflr7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ScPw8ydybscvTVU+6hdjKPh5CJur7wVFz3m2M7VRB+Jv/z5lSxU6bPMTEui6JuWW1RxOUtYER9v43ycwfB4hdo7gfW7D5z55sakk0u7KHcmeuf/8IFnY8fvx2RFr7bm1AqaAoM950lT4hd9lKVC4I95lmCC6X3AbCn3Aa1TBIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7bhnmOT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7bhnmOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708187725; x=1739723725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CX+7rTq+OJdFWPLeb2ZZ5IP3ugk/2VuCgRu3Ayflr7o=;
  b=i7bhnmOTwUdiYCvNpqyN2R/Xw0/XQq7v+CTrLEvNv55rxzSchc0mk5pr
   KdLlNB/iISbaS8QVTw3ZEOLKr/cb5Kg+70lNqVfK8iWCEuSu0ekCRQ89K
   TiEHPSYfVkFLBOMoGBzmVG/epHbe7b/X4T7B+ylUbv5/cRLVhbNCaPZv8
   Iej12CAa4SSmCdwErMEqFYUM8s4F6ICBGaqzBln53tQ7yE5KtkZZqloQf
   PJdDO873W+eBqmj1TW5Pu1g8eTcML9Mdnvl2YsCnvBoQB80vvMPb8OzhU
   8JBkN7xhoMaBUWEPGvLhyRVdQpEBR3ADfXg60Rs1nf1vImRwB0g+m1hYm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2456597"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2456597"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 08:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="826735543"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="826735543"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2024 08:35:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbNep-0002H1-2i;
	Sat, 17 Feb 2024 16:35:19 +0000
Date: Sun, 18 Feb 2024 00:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 2/37] arch/x86/mm/fault.c:264:6:
 warning: no previous prototype for function 'arch_sync_kernel_mappings'
Message-ID: <202402180012.4zwPepmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   23633d13a520a9f34caf0f1a13820660b95406b5
commit: d55de34a38a9b226f04758efc2a7949bf81e39fc [2/37] asm-generic/io.h: Kill vmalloc.h dependency
config: i386-buildonly-randconfig-002-20240217 (https://download.01.org/0day-ci/archive/20240218/202402180012.4zwPepmr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180012.4zwPepmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180012.4zwPepmr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.c:264:6: warning: no previous prototype for function 'arch_sync_kernel_mappings' [-Wmissing-prototypes]
     264 | void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
         |      ^
   arch/x86/mm/fault.c:264:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     264 | void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
         | ^
         | static 
   1 warning generated.


vim +/arch_sync_kernel_mappings +264 arch/x86/mm/fault.c

4819e15f740ec8 Joerg Roedel        2020-09-02  263  
1e15d374bb1cb9 Alexander Potapenko 2023-01-11 @264  void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
f2f13a8535174d Ingo Molnar         2009-02-20  265  {
86cf69f1d893d4 Joerg Roedel        2020-06-01  266  	unsigned long addr;
f2f13a8535174d Ingo Molnar         2009-02-20  267  
86cf69f1d893d4 Joerg Roedel        2020-06-01  268  	for (addr = start & PMD_MASK;
86cf69f1d893d4 Joerg Roedel        2020-06-01  269  	     addr >= TASK_SIZE_MAX && addr < VMALLOC_END;
86cf69f1d893d4 Joerg Roedel        2020-06-01  270  	     addr += PMD_SIZE) {
f2f13a8535174d Ingo Molnar         2009-02-20  271  		struct page *page;
f2f13a8535174d Ingo Molnar         2009-02-20  272  
a79e53d85683c6 Andrea Arcangeli    2011-02-16  273  		spin_lock(&pgd_lock);
f2f13a8535174d Ingo Molnar         2009-02-20  274  		list_for_each_entry(page, &pgd_list, lru) {
617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  275  			spinlock_t *pgt_lock;
617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  276  
a79e53d85683c6 Andrea Arcangeli    2011-02-16  277  			/* the pgt_lock only for Xen */
617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  278  			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  279  
617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  280  			spin_lock(pgt_lock);
86cf69f1d893d4 Joerg Roedel        2020-06-01  281  			vmalloc_sync_one(page_address(page), addr);
617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  282  			spin_unlock(pgt_lock);
f2f13a8535174d Ingo Molnar         2009-02-20  283  		}
a79e53d85683c6 Andrea Arcangeli    2011-02-16  284  		spin_unlock(&pgd_lock);
f2f13a8535174d Ingo Molnar         2009-02-20  285  	}
f2f13a8535174d Ingo Molnar         2009-02-20  286  }
f2f13a8535174d Ingo Molnar         2009-02-20  287  

:::::: The code at line 264 was first introduced by commit
:::::: 1e15d374bb1cb95f738334018a216e4f6360e821 Revert "x86: kmsan: sync metadata pages on page fault"

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
