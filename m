Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426A513D62F;
	Fri, 12 Jul 2024 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720771698; cv=none; b=CNHF4qmEtjoc9DYKot69r+VZEeU3+vHsllioJbWRglbdZQRjP9bVcCTP1CJowVFtNc60Bk7KkkT43NMba2Z4xiEHWQW+4ZRFJ7MomtDzxR9/laiDI4b/bRt4kJ1erapxbnawhuLxOAp+EM1tmycRDVbVvYPqPaepiNWyumNAvic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720771698; c=relaxed/simple;
	bh=YFCaCbuDdnR5xY907cplHnDQQhE28XOuztb6zDOzfzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lgi+OvAKcHCT1Zou8VxDHsNPwGWqzRdSdQEBq3zg5mmC+tlTp2gzH9qhAENnGc2kviI7bKtJ6cucdWBJ8bNVBmtA+Ny+uSBf/X7XWJUK4pZmM1KcYtX9oTjaifrmj0EUTDZgrpEHo3dBLOcJpSKGdCT+SGFW3SNyLgmd1zllwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dI4SRoVZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dI4SRoVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720771696; x=1752307696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YFCaCbuDdnR5xY907cplHnDQQhE28XOuztb6zDOzfzg=;
  b=dI4SRoVZLDcQdWq+7w8CDrdGkTEOEwwcDydajDoS5GWIEEEaeasoPrcq
   uWQOwehUGFR0hZZfBz2hEkJL0weJTHtq0lR/eeBoZJlAxCSbpxkqT+CCG
   eROBFw20wZ8ES+lMxsFEIDDaewFPuOxG79VLS4WLH/+zRDUkvvmliXlk8
   qQCXZ8BPdujDT+6Hi1PNjIQkdnILeMRIJbhewijtM2Qd5N/fQybo845ZJ
   8CnjQa5Y7/5ZGaUBnCbKoBG6rA7wQCjb325nZ9WyzH64xu5St+AIotahZ
   WpOvCJWdyNlMjxNafUlaJz+HETwQNBFkbL9VcOGrUCU0sEARwwuJ03Fn1
   Q==;
X-CSE-ConnectionGUID: rz67wlEQRbedzCDIMqaG0g==
X-CSE-MsgGUID: F3n0GFjnRZiYwgV3Px95EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21959223"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="21959223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 01:08:15 -0700
X-CSE-ConnectionGUID: cFFVQiZ1RPKV5WRWw/NviQ==
X-CSE-MsgGUID: XD7TAd8ZQZeKmMNOdXlj1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="54029387"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2024 01:08:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSBK8-000aWl-1s;
	Fri, 12 Jul 2024 08:08:12 +0000
Date: Fri, 12 Jul 2024 16:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/8] arch/s390: Teach
 arch_get_unmapped_area{_topdown} to handle hugetlb mappings
Message-ID: <202407121517.z2TFcGoE-lkp@intel.com>
References: <20240710105042.30165-3-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710105042.30165-3-osalvador@suse.de>

Hi Oscar,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on s390/features powerpc/next powerpc/fixes deller-parisc/for-next linus/master v6.10-rc7 next-20240711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-mmap-Teach-generic_get_unmapped_area-_topdown-to-handle-hugetlb-mappings/20240710-233828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240710105042.30165-3-osalvador%40suse.de
patch subject: [RFC PATCH 2/8] arch/s390: Teach arch_get_unmapped_area{_topdown} to handle hugetlb mappings
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240712/202407121517.z2TFcGoE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121517.z2TFcGoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121517.z2TFcGoE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/mm/mmap.c:13:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/s390/mm/mmap.c:76:14: error: call to undeclared function 'is_file_hugepages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      76 |         if (filp && is_file_hugepages(filp))
         |                     ^
>> arch/s390/mm/mmap.c:77:10: error: call to undeclared function 'huge_page_mask_align'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |                 return huge_page_mask_align(filp);
         |                        ^
   arch/s390/mm/mmap.c:111:16: error: call to undeclared function 'is_file_hugepages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |         if (!(file && is_file_hugepages(filp))
         |                       ^
>> arch/s390/mm/mmap.c:111:8: error: use of undeclared identifier 'file'; did you mean 'filp'?
     111 |         if (!(file && is_file_hugepages(filp))
         |               ^~~~
         |               filp
   arch/s390/mm/mmap.c:85:51: note: 'filp' declared here
      85 | unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
         |                                                   ^
>> arch/s390/mm/mmap.c:112:3: error: expected ')'
     112 |                 info.align_offset = pgoff << PAGE_SHIFT;
         |                 ^
   arch/s390/mm/mmap.c:111:5: note: to match this '('
     111 |         if (!(file && is_file_hugepages(filp))
         |            ^
   arch/s390/mm/mmap.c:150:16: error: call to undeclared function 'is_file_hugepages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     150 |         if (!(file && is_file_hugepages(filp))
         |                       ^
   arch/s390/mm/mmap.c:150:8: error: use of undeclared identifier 'file'; did you mean 'filp'?
     150 |         if (!(file && is_file_hugepages(filp))
         |               ^~~~
         |               filp
   arch/s390/mm/mmap.c:121:59: note: 'filp' declared here
     121 | unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
         |                                                           ^
   arch/s390/mm/mmap.c:151:3: error: expected ')'
     151 |                 info.align_offset = pgoff << PAGE_SHIFT;
         |                 ^
   arch/s390/mm/mmap.c:150:5: note: to match this '('
     150 |         if (!(file && is_file_hugepages(filp))
         |            ^
   1 warning and 8 errors generated.


vim +/is_file_hugepages +76 arch/s390/mm/mmap.c

    73	
    74	static int get_align_mask(struct file *filp, unsigned long flags)
    75	{
  > 76		if (filp && is_file_hugepages(filp))
  > 77			return huge_page_mask_align(filp);
    78		if (!(current->flags & PF_RANDOMIZE))
    79			return 0;
    80		if (filp || (flags & MAP_SHARED))
    81			return MMAP_ALIGN_MASK << PAGE_SHIFT;
    82		return 0;
    83	}
    84	
    85	unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
    86					     unsigned long len, unsigned long pgoff,
    87					     unsigned long flags)
    88	{
    89		struct mm_struct *mm = current->mm;
    90		struct vm_area_struct *vma;
    91		struct vm_unmapped_area_info info = {};
    92	
    93		if (len > TASK_SIZE - mmap_min_addr)
    94			return -ENOMEM;
    95	
    96		if (flags & MAP_FIXED)
    97			goto check_asce_limit;
    98	
    99		if (addr) {
   100			addr = PAGE_ALIGN(addr);
   101			vma = find_vma(mm, addr);
   102			if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
   103			    (!vma || addr + len <= vm_start_gap(vma)))
   104				goto check_asce_limit;
   105		}
   106	
   107		info.length = len;
   108		info.low_limit = mm->mmap_base;
   109		info.high_limit = TASK_SIZE;
   110		info.align_mask = get_align_mask(filp, flags);
 > 111		if (!(file && is_file_hugepages(filp))
 > 112			info.align_offset = pgoff << PAGE_SHIFT;
   113		addr = vm_unmapped_area(&info);
   114		if (offset_in_page(addr))
   115			return addr;
   116	
   117	check_asce_limit:
   118		return check_asce_limit(mm, addr, len);
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
