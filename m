Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E32CB5
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 22:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639520614; x=1671056614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ng2PF15wDsbKPd1nfjqc99JLs4NlxItXZ3OxJBk5kZ0=;
  b=BqFroFRnXuHK10nhuPZt8JoBiN1LK5FobXfJcfq1KS9OjMo/JKhbdMaX
   ONJES+JxkSGv3zH2l/t9/l6Iu/IaZUvgwPOGx/pypdKbnap4yLUh9hHRH
   d+QdPKBqUXvKAHQCZWuLe9pxM/GMt4F+DEYlbQhwir5syzJChnIuZMWmO
   KlJ4MaSxWOiZw9oVKqkpvLy9N2YRV9enyzJFvZ/WddtUD+IF45CzeoiWY
   texMrufPSQjpSbAstXHW+PCYw44RHKz+gYAp2fL4KeqRwPRYoCFUwniR0
   Fh7i18zFZlzt9alpVzGE6ayVd3Eoj4PyqjVNgksXGpwzk0I7XXw5IgI/i
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="225955156"
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="225955156"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 14:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="505545163"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2021 14:23:30 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxGCn-0000qT-UZ; Tue, 14 Dec 2021 22:23:29 +0000
Date: Wed, 15 Dec 2021 06:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 13/43] kmsan: add KMSAN runtime core
Message-ID: <202112150609.r62ffy1Q-lkp@intel.com>
References: <20211214162050.660953-14-glider@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214162050.660953-14-glider@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alexander,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on linus/master v5.16-rc5]
[cannot apply to tip/x86/core hnaz-mm/master next-20211213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20211215-003033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 35fa745286ac44ee26ed100c2bd2553368ad193b
config: arm64-randconfig-r024-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150609.r62ffy1Q-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/ddf3096bf6806b512d7bf5489f2100b46add643a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20211215-003033
        git checkout ddf3096bf6806b512d7bf5489f2100b46add643a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:17:
   In file included from include/linux/kmsan.h:17:
   In file included from include/linux/vmalloc.h:13:
   In file included from arch/arm64/include/asm/vmalloc.h:5:
>> arch/arm64/include/asm/pgtable.h:299:19: error: incomplete definition of type 'struct task_struct'
           if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
                     ~~~~~~~^
   arch/arm64/include/asm/current.h:9:8: note: forward declaration of 'struct task_struct'
   struct task_struct;
          ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1198: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +299 arch/arm64/include/asm/pgtable.h

4f04d8f0054511 Catalin Marinas 2012-03-05  270  
2f4b829c625ec3 Catalin Marinas 2015-07-10  271  /*
2f4b829c625ec3 Catalin Marinas 2015-07-10  272   * PTE bits configuration in the presence of hardware Dirty Bit Management
2f4b829c625ec3 Catalin Marinas 2015-07-10  273   * (PTE_WRITE == PTE_DBM):
2f4b829c625ec3 Catalin Marinas 2015-07-10  274   *
2f4b829c625ec3 Catalin Marinas 2015-07-10  275   * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
2f4b829c625ec3 Catalin Marinas 2015-07-10  276   *   0      0      |   1           0          0
2f4b829c625ec3 Catalin Marinas 2015-07-10  277   *   0      1      |   1           1          0
2f4b829c625ec3 Catalin Marinas 2015-07-10  278   *   1      0      |   1           0          1
2f4b829c625ec3 Catalin Marinas 2015-07-10  279   *   1      1      |   0           1          x
2f4b829c625ec3 Catalin Marinas 2015-07-10  280   *
2f4b829c625ec3 Catalin Marinas 2015-07-10  281   * When hardware DBM is not present, the sofware PTE_DIRTY bit is updated via
2f4b829c625ec3 Catalin Marinas 2015-07-10  282   * the page fault mechanism. Checking the dirty status of a pte becomes:
2f4b829c625ec3 Catalin Marinas 2015-07-10  283   *
b847415ce96efe Catalin Marinas 2015-09-11  284   *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
2f4b829c625ec3 Catalin Marinas 2015-07-10  285   */
9b604722059039 Mark Rutland    2019-06-10  286  
9b604722059039 Mark Rutland    2019-06-10  287  static inline void __check_racy_pte_update(struct mm_struct *mm, pte_t *ptep,
9b604722059039 Mark Rutland    2019-06-10  288  					   pte_t pte)
4f04d8f0054511 Catalin Marinas 2012-03-05  289  {
20a004e7b017cc Will Deacon     2018-02-15  290  	pte_t old_pte;
20a004e7b017cc Will Deacon     2018-02-15  291  
9b604722059039 Mark Rutland    2019-06-10  292  	if (!IS_ENABLED(CONFIG_DEBUG_VM))
9b604722059039 Mark Rutland    2019-06-10  293  		return;
9b604722059039 Mark Rutland    2019-06-10  294  
9b604722059039 Mark Rutland    2019-06-10  295  	old_pte = READ_ONCE(*ptep);
9b604722059039 Mark Rutland    2019-06-10  296  
9b604722059039 Mark Rutland    2019-06-10  297  	if (!pte_valid(old_pte) || !pte_valid(pte))
9b604722059039 Mark Rutland    2019-06-10  298  		return;
9b604722059039 Mark Rutland    2019-06-10 @299  	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
9b604722059039 Mark Rutland    2019-06-10  300  		return;
02522463c84748 Will Deacon     2013-01-09  301  
2f4b829c625ec3 Catalin Marinas 2015-07-10  302  	/*
9b604722059039 Mark Rutland    2019-06-10  303  	 * Check for potential race with hardware updates of the pte
9b604722059039 Mark Rutland    2019-06-10  304  	 * (ptep_set_access_flags safely changes valid ptes without going
9b604722059039 Mark Rutland    2019-06-10  305  	 * through an invalid entry).
2f4b829c625ec3 Catalin Marinas 2015-07-10  306  	 */
82d340081b6f71 Catalin Marinas 2015-12-08  307  	VM_WARN_ONCE(!pte_young(pte),
82d340081b6f71 Catalin Marinas 2015-12-08  308  		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
20a004e7b017cc Will Deacon     2018-02-15  309  		     __func__, pte_val(old_pte), pte_val(pte));
20a004e7b017cc Will Deacon     2018-02-15  310  	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
82d340081b6f71 Catalin Marinas 2015-12-08  311  		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
20a004e7b017cc Will Deacon     2018-02-15  312  		     __func__, pte_val(old_pte), pte_val(pte));
2f4b829c625ec3 Catalin Marinas 2015-07-10  313  }
2f4b829c625ec3 Catalin Marinas 2015-07-10  314  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
