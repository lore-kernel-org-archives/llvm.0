Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59710F6
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 05:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658984996; x=1690520996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gr4h4VLtM4whcOpJylcO3fdPCwh12PNAfOKGe+1rMK8=;
  b=UKZgoXi16s4im39w2SyxoW9w7Lg7RXZhvALXVW7QrfImofjYYJ1aV2m7
   P7/090eW771ft1GX7Nw7NVacVuNpiCMZHKChVNltvYkgpU60suqdbUw86
   h4d2PMIH/3/SKZoP8RPFFHG4PDEdL94aEhSUtegIoZgyMvSkj0T1VpU7/
   eTkrP+YMX2l9Arnkm7D8p/98JlT++2aOehjJJH57Br8FKcTE0jkMcIK96
   m7ATFkvr/geDdBW5IsXhqtmnt9uVZt60BemEr+oU9dvKIt3e5XiGKlmBB
   p/AVMnEitFcSfGVYdXLGlrfJUEMUWSuLfldjrTNwrGXnhqWBSCSqnuoYm
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285970054"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="285970054"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 22:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="551138662"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2022 22:09:44 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGvmK-0009hq-0h;
	Thu, 28 Jul 2022 05:09:44 +0000
Date: Thu, 28 Jul 2022 13:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Zixian <liuzixian4@huawei.com>, hughd@google.com,
	akpm@linux-foundation.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linfeilong@huawei.com,
	liuzixian4@huawei.com, willy@infradead.org
Subject: Re: [PATCH v2] shmem: support huge_fault to avoid pmd split
Message-ID: <202207281337.AGofErxA-lkp@intel.com>
References: <20220726132751.1639-1-liuzixian4@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726132751.1639-1-liuzixian4@huawei.com>

Hi Liu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v5.19-rc8 next-20220727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Zixian/shmem-support-huge_fault-to-avoid-pmd-split/20220726-212946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220728/202207281337.AGofErxA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/40060ce82c97d38c8e2d71f9d0e4ee818596bb14
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liu-Zixian/shmem-support-huge_fault-to-avoid-pmd-split/20220726-212946
        git checkout 40060ce82c97d38c8e2d71f9d0e4ee818596bb14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/shmem.c:2136:39: error: call to __compiletime_assert_272 declared with 'error' attribute: BUILD_BUG failed
           unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
                                                ^
   include/linux/huge_mm.h:307:27: note: expanded from macro 'HPAGE_PMD_MASK'
   #define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
                             ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:41:1: note: expanded from here
   __compiletime_assert_272
   ^
   1 error generated.


vim +/error +2136 mm/shmem.c

  2132	
  2133	static vm_fault_t shmem_huge_fault(struct vm_fault *vmf, enum page_entry_size pe_size)
  2134	{
  2135		vm_fault_t ret = VM_FAULT_FALLBACK;
> 2136		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
  2137		struct page *old_page, *new_page;
  2138		int gfp_flags = GFP_HIGHUSER_MOVABLE | __GFP_COMP;
  2139	
  2140		/* read or shared fault will not split huge pmd */
  2141		if (!(vmf->flags & FAULT_FLAG_WRITE)
  2142				|| (vmf->vma->vm_flags & VM_SHARED))
  2143			return VM_FAULT_FALLBACK;
  2144		if (pe_size != PE_SIZE_PMD)
  2145			return VM_FAULT_FALLBACK;
  2146	
  2147		if (pmd_none(*vmf->pmd)) {
  2148			if (shmem_fault(vmf) & VM_FAULT_ERROR)
  2149				goto out;
  2150			if (!PageTransHuge(vmf->page))
  2151				goto out;
  2152			old_page = vmf->page;
  2153		} else {
  2154			old_page = pmd_page(*vmf->pmd);
  2155			page_remove_rmap(old_page, vmf->vma, true);
  2156			pmdp_huge_clear_flush(vmf->vma, haddr, vmf->pmd);
  2157			add_mm_counter(vmf->vma->vm_mm, MM_SHMEMPAGES, -HPAGE_PMD_NR);
  2158		}
  2159	
  2160		new_page = &vma_alloc_folio(gfp_flags, HPAGE_PMD_ORDER,
  2161				vmf->vma, haddr, true)->page;
  2162		if (!new_page)
  2163			goto out;
  2164		copy_user_huge_page(new_page, old_page, haddr, vmf->vma, HPAGE_PMD_NR);
  2165		__SetPageUptodate(new_page);
  2166	
  2167		ret = do_set_pmd(vmf, new_page);
  2168	
  2169	out:
  2170		if (vmf->page) {
  2171			unlock_page(vmf->page);
  2172			put_page(vmf->page);
  2173		}
  2174		return ret;
  2175	}
  2176	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
