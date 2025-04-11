Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3D42A9E;
	Fri, 11 Apr 2025 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408022; cv=none; b=lk1ldp09hwYzXmRP4/d3EfSuGZj6M6X7veo+XqEnJffETrTh4daJGI6g+r0p/yuwge+CB3Wn6UMvXmyTKEstF61ET8gJveKjDabiKdaDfO7v30aA9VPXOe/8YV7N4X3wUqi/v1Lucpa24FLCG6qrt0SL/JKx5DStylRF+d+QCFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408022; c=relaxed/simple;
	bh=c41/NBQigKT62i1YBHl9mzC986n1DF5Ga+1jnwDYVYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rK+R4Xuf5OdAos/csigjCiMmmdOPWLTE7GDVu/7v4LNa3Tb1eC4pOco7rBeeXPjfh3Glg2tjBC625NmLAIEGgDbZmdhMtugODyTZgHXmIz+/vDvHqgFua0/+90ehc+3EgfVt9qQ+4EuOqnAvstVNACntwr+qNbRa+ONZkSrbQsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEZbOLhn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEZbOLhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744408020; x=1775944020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c41/NBQigKT62i1YBHl9mzC986n1DF5Ga+1jnwDYVYk=;
  b=WEZbOLhnvxUNCLZSHSfC8IJQjTe+e1a4opbd7If8yQxjpXsLIppMubul
   Gnux/gJSMlO5L0twieCZaThYPo7atv0MlYvIHNpizKNMkj8LbJXg10kTu
   mbV3rIGQFCH3IJy0ZMnCelvKADeL85jg5g55E7DLUbQQx/532iWLnwu1d
   ESF7bWjQCc3ui4fRQzfbYvwzsBSU6a7kHkvATL6Gy71wB1XB1/NLu7Mvy
   z5o2Ma4gC3WNUY9ZBZMPQTWHbOoLEjqmhHbY2/WiHeaHevRE5+Jv/Lfdx
   ZW3jmzNc6G204urPQNc/SO94bsWNpmyOOWLpw9KqqS9wNsW3k8/Sx5KFA
   Q==;
X-CSE-ConnectionGUID: DO++mbTZTISSVOvHXOZsjQ==
X-CSE-MsgGUID: kGho0fwrSbWEQPmUu32ECQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45860295"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45860295"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:46:59 -0700
X-CSE-ConnectionGUID: HT+1SIX3T2Sj7jo5OUNslQ==
X-CSE-MsgGUID: WE+g5kl3QMyUZ86Kgnj40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134158851"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 14:46:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3MDA-000BP6-0v;
	Fri, 11 Apr 2025 21:46:56 +0000
Date: Sat, 12 Apr 2025 05:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 08/11] x86/sev: Split off startup code from core code
Message-ID: <202504120536.izfqm3jS-lkp@intel.com>
References: <20250410134117.3713574-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410134117.3713574-21-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on next-20250411]
[cannot apply to tip/x86/core tip/x86/mm efi/next tip/auto-latest linus/master v6.15-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-asm-Make-rip_rel_ptr-usable-from-fPIC-code/20250410-214836
base:   tip/master
patch link:    https://lore.kernel.org/r/20250410134117.3713574-21-ardb%2Bgit%40google.com
patch subject: [PATCH v4 08/11] x86/sev: Split off startup code from core code
config: x86_64-buildonly-randconfig-005-20250411 (https://download.01.org/0day-ci/archive/20250412/202504120536.izfqm3jS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120536.izfqm3jS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120536.izfqm3jS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/boot/compressed/sev.c:263:6: error: call to undeclared function 'vmgexit_psc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     263 |         if (vmgexit_psc(boot_ghcb, desc))
         |             ^
>> arch/x86/boot/compressed/sev.c:266:2: error: call to undeclared function 'pvalidate_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         pvalidate_pages(desc);
         |         ^
   arch/x86/boot/compressed/sev.c:266:2: note: did you mean 'pvalidate_4k_page'?
   arch/x86/boot/compressed/../../coco/sev/shared.c:1227:20: note: 'pvalidate_4k_page' declared here
    1227 | static void __head pvalidate_4k_page(unsigned long vaddr, unsigned long paddr,
         |                    ^
   2 errors generated.


vim +/vmgexit_psc +263 arch/x86/boot/compressed/sev.c

597cfe48212a3f arch/x86/boot/compressed/sev-es.c Joerg Roedel 2020-09-07  232  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  233  static phys_addr_t __snp_accept_memory(struct snp_psc_desc *desc,
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  234  				       phys_addr_t pa, phys_addr_t pa_end)
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  235  {
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  236  	struct psc_hdr *hdr;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  237  	struct psc_entry *e;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  238  	unsigned int i;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  239  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  240  	hdr = &desc->hdr;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  241  	memset(hdr, 0, sizeof(*hdr));
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  242  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  243  	e = desc->entries;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  244  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  245  	i = 0;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  246  	while (pa < pa_end && i < VMGEXIT_PSC_MAX_ENTRY) {
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  247  		hdr->end_entry = i;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  248  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  249  		e->gfn = pa >> PAGE_SHIFT;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  250  		e->operation = SNP_PAGE_STATE_PRIVATE;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  251  		if (IS_ALIGNED(pa, PMD_SIZE) && (pa_end - pa) >= PMD_SIZE) {
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  252  			e->pagesize = RMP_PG_SIZE_2M;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  253  			pa += PMD_SIZE;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  254  		} else {
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  255  			e->pagesize = RMP_PG_SIZE_4K;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  256  			pa += PAGE_SIZE;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  257  		}
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  258  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  259  		e++;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  260  		i++;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  261  	}
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  262  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06 @263  	if (vmgexit_psc(boot_ghcb, desc))
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  264  		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PSC);
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  265  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06 @266  	pvalidate_pages(desc);
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  267  
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  268  	return pa;
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  269  }
6c3211796326a9 arch/x86/boot/compressed/sev.c    Tom Lendacky 2023-06-06  270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
