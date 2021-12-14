Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F662CA4
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639521873; x=1671057873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GW/SSDdr+LZI92c100MpvFXwfai5DI0O9sfaixyElZM=;
  b=MJOCKoCpZ72DVfoX/KUXCyUiauwmn9V/N0FKPUW+11jbwaIkW77WGwn3
   W4uE021CUCVn35o9PxYdOt+deZhUtDE4vXeXfnFM1O+KcxkFsF3Z/jocI
   18X++y+lcDtf431YEn5rz/bR5e1Kypn4k/QLpUrlxTsJdeCJ+21DBhEcM
   H8Um8xRypGFY7Z03Nr8JB+15ONpHP+dJo/hcBJ7mDkPHXl0DiqdrTAS8V
   gV5nQqEhF9h3/+wZR/7DCsUAfAUr0GqFcJD1kr/bkvVAx+2PqwFmnB1rX
   iXM3RPsHza/DPDegUMrz92BG7h1s73CkrisvheX4923HVqabC3AenVw7s
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219115475"
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="219115475"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 14:44:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="465286664"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Dec 2021 14:44:31 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxGX8-0000s3-GF; Tue, 14 Dec 2021 22:44:30 +0000
Date: Wed, 15 Dec 2021 06:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 36/43] x86: kmsan: sync metadata pages on page fault
Message-ID: <202112150621.jBfij0NA-lkp@intel.com>
References: <20211214162050.660953-37-glider@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214162050.660953-37-glider@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alexander,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/x86/mm]
[also build test WARNING on linus/master v5.16-rc5]
[cannot apply to tip/x86/core hnaz-mm/master next-20211213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20211215-003033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 35fa745286ac44ee26ed100c2bd2553368ad193b
config: i386-randconfig-r015-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150621.jBfij0NA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b9eff579426967ca933560818b165769b449377b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20211215-003033
        git checkout b9eff579426967ca933560818b165769b449377b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.c:263:6: warning: no previous prototype for function '__arch_sync_kernel_mappings' [-Wmissing-prototypes]
   void __arch_sync_kernel_mappings(unsigned long start, unsigned long end)
        ^
   arch/x86/mm/fault.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __arch_sync_kernel_mappings(unsigned long start, unsigned long end)
   ^
   static 
   arch/x86/mm/fault.c:299:28: error: use of undeclared identifier 'KMSAN_VMALLOC_SHADOW_START'
                           start - VMALLOC_START + KMSAN_VMALLOC_SHADOW_START,
                                                   ^
   arch/x86/mm/fault.c:300:26: error: use of undeclared identifier 'KMSAN_VMALLOC_SHADOW_START'
                           end - VMALLOC_START + KMSAN_VMALLOC_SHADOW_START);
                                                 ^
   arch/x86/mm/fault.c:302:28: error: use of undeclared identifier 'KMSAN_VMALLOC_ORIGIN_START'
                           start - VMALLOC_START + KMSAN_VMALLOC_ORIGIN_START,
                                                   ^
   arch/x86/mm/fault.c:303:26: error: use of undeclared identifier 'KMSAN_VMALLOC_ORIGIN_START'
                           end - VMALLOC_START + KMSAN_VMALLOC_ORIGIN_START);
                                                 ^
   1 warning and 4 errors generated.


vim +/__arch_sync_kernel_mappings +263 arch/x86/mm/fault.c

   262	
 > 263	void __arch_sync_kernel_mappings(unsigned long start, unsigned long end)
   264	{
   265		unsigned long addr;
   266	
   267		for (addr = start & PMD_MASK;
   268		     addr >= TASK_SIZE_MAX && addr < VMALLOC_END;
   269		     addr += PMD_SIZE) {
   270			struct page *page;
   271	
   272			spin_lock(&pgd_lock);
   273			list_for_each_entry(page, &pgd_list, lru) {
   274				spinlock_t *pgt_lock;
   275	
   276				/* the pgt_lock only for Xen */
   277				pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
   278	
   279				spin_lock(pgt_lock);
   280				vmalloc_sync_one(page_address(page), addr);
   281				spin_unlock(pgt_lock);
   282			}
   283			spin_unlock(&pgd_lock);
   284		}
   285	}
   286	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
