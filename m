Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4761F5F6;
	Sat,  7 Sep 2024 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725710740; cv=none; b=cPgf2hbAuF8m0kv0LGAzBZ+ZrNA8qSYxCKFLZZqRjFiLZW8K7QFW5mqZ9/Mug7TK+lN6JrTbQPFmp0tSbabLiW7vH4/W7G9dER+xAPW2FlFaurU/qagqeL1MMPGr0yJjKgPjAdoFoQKdCpUYZXbtQTSyoPjpStsgGh1lO0MuKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725710740; c=relaxed/simple;
	bh=/UwRberGvU2t1niULN5i19QH04zEg8OqI0wfV+JSEMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XP+GuSfunLO0ayseiNy/VajQzPs7oLZGZ3iNlyLxGO41ZcdlJWsGKoSaA8QA986rCYgFunynWvmc03p+9BYsN5aeT0RJxApA5s1CR/hZIzz66Iu/VRzCgPPn5kKf3zwxDF8h4AxnQpDRVtt7hL8ZyvkxnL7fePHJOiSh3fpUxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs7Wb2eS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs7Wb2eS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725710738; x=1757246738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/UwRberGvU2t1niULN5i19QH04zEg8OqI0wfV+JSEMI=;
  b=bs7Wb2eSPvCrqT150SrRAZ1kb2Plpjby1Fzo6F9LKitD0w6H8McyGteT
   CaJAEmaEAm1GQCpn4BF1469Lt3NnmrweB/9AcDMbZOHwMwsIiDgko2mTI
   ZIykoOriWOKFo0yEBtfY+5OAFGvGoDBhg8FgCsO4b9OmOrpWXddIhi+fF
   TCStIAX+sQ6f+0O8EJEqDA2Wile1jj/IqgpGnq7nM2a/+iuDrm3AiJRdw
   6tPbck8rdxQs3TXlEQ8qVdkzs4hwuEF4uA67iV85YkbMegeqtPRoAyDwr
   BQyeX70VvGVpzZDuKdi2oL/F9+oJ+WkH1CFcR/ZUz6PyiMKaAgwIXX6sl
   A==;
X-CSE-ConnectionGUID: ED4SFKkpROSNbLRYwRx9XA==
X-CSE-MsgGUID: UoL/7PWbT8y7GKfFY8VnGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49872522"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="49872522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 05:05:37 -0700
X-CSE-ConnectionGUID: s5q6p47wSIucd5YEsDyslw==
X-CSE-MsgGUID: mizN2WkKTySES/SuflFAgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70322272"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 05:05:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smuC6-000CXF-1K;
	Sat, 07 Sep 2024 12:05:34 +0000
Date: Sat, 7 Sep 2024 20:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 08/10] mm/mshare: Add basic page table sharing
 support
Message-ID: <202409071904.cD6tLY7d-lkp@intel.com>
References: <20240903232241.43995-9-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903232241.43995-9-anthony.yznaga@oracle.com>

Hi Anthony,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc6 next-20240906]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-Yznaga/mm-Add-msharefs-filesystem/20240904-072513
base:   linus/master
patch link:    https://lore.kernel.org/r/20240903232241.43995-9-anthony.yznaga%40oracle.com
patch subject: [RFC PATCH v3 08/10] mm/mshare: Add basic page table sharing support
config: powerpc64-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071904.cD6tLY7d-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071904.cD6tLY7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071904.cD6tLY7d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mshare.c:52:3: error: call to undeclared function 'set_p4d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   set_pgd(guest_pgd, *pgd);
                   ^
   include/asm-generic/pgtable-nop4d.h:33:33: note: expanded from macro 'set_pgd'
   #define set_pgd(pgdptr, pgdval) set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
                                   ^
   1 error generated.


vim +/set_p4d +52 mm/mshare.c

    36	
    37	/* Returns holding the host mm's lock for read.  Caller must release. */
    38	vm_fault_t
    39	find_shared_vma(struct vm_area_struct **vmap, unsigned long *addrp)
    40	{
    41		struct vm_area_struct *vma, *guest = *vmap;
    42		struct mshare_data *m_data = guest->vm_private_data;
    43		struct mm_struct *host_mm = m_data->mm;
    44		unsigned long host_addr;
    45		pgd_t *pgd, *guest_pgd;
    46	
    47		mmap_read_lock(host_mm);
    48		host_addr = *addrp - guest->vm_start + host_mm->mmap_base;
    49		pgd = pgd_offset(host_mm, host_addr);
    50		guest_pgd = pgd_offset(guest->vm_mm, *addrp);
    51		if (!pgd_same(*guest_pgd, *pgd)) {
  > 52			set_pgd(guest_pgd, *pgd);
    53			mmap_read_unlock(host_mm);
    54			return VM_FAULT_NOPAGE;
    55		}
    56	
    57		*addrp = host_addr;
    58		vma = find_vma(host_mm, host_addr);
    59	
    60		/* XXX: expand stack? */
    61		if (vma && vma->vm_start > host_addr)
    62			vma = NULL;
    63	
    64		*vmap = vma;
    65	
    66		/*
    67		 * release host mm lock unless a matching vma is found
    68		 */
    69		if (!vma)
    70			mmap_read_unlock(host_mm);
    71		return 0;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
