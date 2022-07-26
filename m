Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AC801
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 23:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658877805; x=1690413805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c8laaHoeywT0Ul4WF8lRkfq92Z+MP9QMmynNhR9N5mY=;
  b=Y4IGAPWX66nw5ebDYv1r6ljs/daq68jt4us4k80urW0uKlF7UdU8F6IH
   DwF9up3CaDkHp1NF1l4UBYFaVj6GcZJ2GYCi2zqh9ZiPieiOfAF4OVq0T
   uwpFPZc78nXouZrvZzLBZBmpmstINxqf6wdCbuubK/c5OkdNhf2huD2mM
   hKIPIeDnuxm2ADw4kbythIGuZAhCDMSNUsMlmV8yPWBF+k61bHp2LzjT2
   PduC3Ox1o313T983BfcMXo//IhFb2hycAvyEtSUTQbuAjt6PnhgfFoTON
   FbX/XF8AQfNy3ZWWOk9l58vSMEP9UGwKGl7kG4qgOcdT3zM1zbpB1fVzF
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="288106912"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="288106912"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 16:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="689644554"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2022 16:23:22 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGTtZ-0007yK-2j;
	Tue, 26 Jul 2022 23:23:21 +0000
Date: Wed, 27 Jul 2022 07:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Zixian <liuzixian4@huawei.com>, hughd@google.com,
	akpm@linux-foundation.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linfeilong@huawei.com,
	liuzixian4@huawei.com, willy@infradead.org
Subject: Re: [PATCH v2] shmem: support huge_fault to avoid pmd split
Message-ID: <202207270709.lDgcRjnd-lkp@intel.com>
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
[also build test ERROR on linus/master v5.19-rc8 next-20220726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Zixian/shmem-support-huge_fault-to-avoid-pmd-split/20220726-212946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r045-20220724 (https://download.01.org/0day-ci/archive/20220727/202207270709.lDgcRjnd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 83882606dbd7ffb0bdd3460356202d97705809c8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/40060ce82c97d38c8e2d71f9d0e4ee818596bb14
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liu-Zixian/shmem-support-huge_fault-to-avoid-pmd-split/20220726-212946
        git checkout 40060ce82c97d38c8e2d71f9d0e4ee818596bb14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/shmem.c:2164:2: error: call to undeclared function 'copy_user_huge_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           copy_user_huge_page(new_page, old_page, haddr, vmf->vma, HPAGE_PMD_NR);
           ^
   mm/shmem.c:2164:2: note: did you mean 'copy_user_highpage'?
   include/linux/highmem.h:307:20: note: 'copy_user_highpage' declared here
   static inline void copy_user_highpage(struct page *to, struct page *from,
                      ^
   1 error generated.


vim +/copy_user_huge_page +2164 mm/shmem.c

  2132	
  2133	static vm_fault_t shmem_huge_fault(struct vm_fault *vmf, enum page_entry_size pe_size)
  2134	{
  2135		vm_fault_t ret = VM_FAULT_FALLBACK;
  2136		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
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
> 2164		copy_user_huge_page(new_page, old_page, haddr, vmf->vma, HPAGE_PMD_NR);
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
