Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA63016E0;
	Sat,  7 Mar 2026 04:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772856348; cv=none; b=N4QenYDsH5PQ3KE0eJDeoEMxJ16Joky8NUrdNYPqgid4nNR4xFJHJsoYZ2B6vOM9BV4pm2WWJ5Lqxg5cgGvrmYPfZw5I00vY4nx3JIT4ieSPmYvueZhEn3HpybXKpnCda+C3gAEktkmLaiWiROlnVFHkWFAMCBERKv+DzeRCYOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772856348; c=relaxed/simple;
	bh=dF5amXua2iK/Qs7c+TgqaoVGmwfmgrUCxP1NrcCKbCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dRx4POY56E/S/rrRgxZ+81vKGRstRxo05Pe/t1NqnsqDjoxDz2Ec7jwZZb3WeSuF87tCzGCqBCnfyBidg3treng9fC1w19ROj8DKGaxdoG8pFQg2Qe4lK0zg/GybyjW94xscXwtiGI4HrJoVAUKc406lJjOOlnPuK+XOD1Jv1Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuZNPyDF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuZNPyDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772856348; x=1804392348;
  h=date:from:to:cc:subject:message-id;
  bh=dF5amXua2iK/Qs7c+TgqaoVGmwfmgrUCxP1NrcCKbCo=;
  b=kuZNPyDFLQSiVwAkQkk5liOrjeOlcbY7D6J7n0WmsFtuIr8vLcbvZCK8
   qjIRubstssusg7ONSweRedzvMDDjLgSi0di1PdH3mfJu9zDir2Nh4G8re
   pVprcUt3uHQxXc3dSC9WlNlSpfVBVnkiUAVG9Xmm6n+dQOMKzxEeDbNEw
   FXJqD8SPmpDBGxMUNOX9jeOe+gdhxDjJTse2AROFdzBYvyIJm6DvfDbzR
   G6gBu4nLhUC8S1h6X6i9F6VsszK82eqdfYIZsKHI5n7u4AZ/BoMbOobsd
   y/kq9AIXM5cdLPNMby2NDAtNBrI7Eso+yXyPnkdXnkF6FtQw1mDbmmPuU
   w==;
X-CSE-ConnectionGUID: QvV5rRu/TMqJg4I3vAP5zA==
X-CSE-MsgGUID: HZA1r4KqQbedBSJw4ggPEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77814843"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="77814843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 20:05:47 -0800
X-CSE-ConnectionGUID: YSYIdRfcT/yCBxERlj8N8Q==
X-CSE-MsgGUID: 2SPV/+/qTJW3vATg0pffng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224151077"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 20:05:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyiv3-000000001ff-0kbE;
	Sat, 07 Mar 2026 04:05:37 +0000
Date: Sat, 07 Mar 2026 12:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhui Zhou <jianhuizzzzz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 34/207] include/linux/hugetlb.h:1214:9:
 error: call to undeclared function 'linear_page_index'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202603071118.PmcGAhcg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   49cb736d092aaa856283e33b78ec3afb3964d82f
commit: cd9119a9480d9d93fdf06792f8f9917cc4f9999c [34/207] mm/userfaultfd: fix hugetlb fault mutex hash calculation
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603071118.PmcGAhcg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071118.PmcGAhcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071118.PmcGAhcg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/show_mem.c:12:
>> include/linux/hugetlb.h:1214:9: error: call to undeclared function 'linear_page_index'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1214 |         return linear_page_index(vma, address);
         |                ^
   In file included from mm/show_mem.c:15:
   In file included from include/linux/swap.h:13:
>> include/linux/pagemap.h:1079:23: error: conflicting types for 'linear_page_index'
    1079 | static inline pgoff_t linear_page_index(const struct vm_area_struct *vma,
         |                       ^
   include/linux/hugetlb.h:1214:9: note: previous implicit declaration is here
    1214 |         return linear_page_index(vma, address);
         |                ^
   2 errors generated.
--
   In file included from mm/vma_init.c:8:
   In file included from mm/vma_internal.h:20:
>> include/linux/hugetlb.h:1214:9: error: call to undeclared function 'linear_page_index'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1214 |         return linear_page_index(vma, address);
         |                ^
   In file included from mm/vma_init.c:8:
   In file included from mm/vma_internal.h:23:
   In file included from include/linux/ksm.h:13:
>> include/linux/pagemap.h:1079:23: error: conflicting types for 'linear_page_index'
    1079 | static inline pgoff_t linear_page_index(const struct vm_area_struct *vma,
         |                       ^
   include/linux/hugetlb.h:1214:9: note: previous implicit declaration is here
    1214 |         return linear_page_index(vma, address);
         |                ^
   In file included from mm/vma_init.c:8:
   In file included from mm/vma_internal.h:31:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from mm/mprotect.c:13:
>> include/linux/hugetlb.h:1214:9: error: call to undeclared function 'linear_page_index'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1214 |         return linear_page_index(vma, address);
         |                ^
   In file included from mm/mprotect.c:15:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   In file included from mm/mprotect.c:19:
   In file included from include/linux/mempolicy.h:16:
>> include/linux/pagemap.h:1079:23: error: conflicting types for 'linear_page_index'
    1079 | static inline pgoff_t linear_page_index(const struct vm_area_struct *vma,
         |                       ^
   include/linux/hugetlb.h:1214:9: note: previous implicit declaration is here
    1214 |         return linear_page_index(vma, address);
         |                ^
   1 warning and 2 errors generated.


vim +/linear_page_index +1214 include/linux/hugetlb.h

  1210	
  1211	static inline pgoff_t vma_hugecache_offset(struct hstate *h,
  1212			struct vm_area_struct *vma, unsigned long address)
  1213	{
> 1214		return linear_page_index(vma, address);
  1215	}
  1216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
