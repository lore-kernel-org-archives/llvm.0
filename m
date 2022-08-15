Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684867E
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 02:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660530271; x=1692066271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=15akVnLmqGB2LRmtpYXPewEWH5UBdRqrgqSU2eW3ORg=;
  b=ZAdHvO8P0sip8v3xCbtE6YwWMmTWchLfGA7aGuRB6wXRGb2QQGZRtXax
   i2g/sO7AXlgU81kdsg8pFvkMutAb3HoLvg6XGcmgA7apY+FXWY3FBcel/
   vrwLZqUT6BM68mcd377tTK2ZTObwE6fZdiLLlw1RGGGFUeNcAq/oYoUGX
   YzUAbu71O8hihUUiz92mlTKYJ5sp/J4cnvyc4PTfrfl1cRv0IS2EmgxPG
   lZDsY2dq5q34+iFnjXqkVvLTZgx/ErXPKPXPqMryefLntwZHy1GeNKpY4
   2lwWPbJFgNYFDxAJjn57yDTq7zqp5g3M5GdytyXtd31bWwx7KwGN8LyNQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="290628373"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
   d="scan'208";a="290628373"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 19:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
   d="scan'208";a="606507615"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Aug 2022 19:24:25 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNPmC-0000iM-1R;
	Mon, 15 Aug 2022 02:24:24 +0000
Date: Mon, 15 Aug 2022 10:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zach O'Keefe <zokeefe@google.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-api@vger.kernel.org,
	Axel Rasmussen <axelrasmussen@google.com>,
	James Houghton <jthoughton@google.com>,
	Hugh Dickins <hughd@google.com>, Yang Shi <shy828301@gmail.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Rongwei Wang <rongwei.wang@linux.alibaba.com>,
	SeongJae Park <sj@kernel.org>, Song Liu <songliubraving@fb.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Chris Kennelly <ckennelly@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Minchan Kim <minchan@kernel.org>, Patrick Xia <patrickx@google.com>,
	Zach O'Keefe <zokeefe@google.com>
Subject: Re: [PATCH mm-unstable 3/9] mm/madvise: add file and shmem support
 to MADV_COLLAPSE
Message-ID: <202208151032.dIQzLJma-lkp@intel.com>
References: <20220812012843.3948330-4-zokeefe@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812012843.3948330-4-zokeefe@google.com>

Hi Zach,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-add-file-shmem-support-to-MADV_COLLAPSE/20220812-093122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r045-20220812 (https://download.01.org/0day-ci/archive/20220815/202208151032.dIQzLJma-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dff08746d6f7b9387b94360b66bd9db644542991
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zach-O-Keefe/mm-add-file-shmem-support-to-MADV_COLLAPSE/20220812-093122
        git checkout dff08746d6f7b9387b94360b66bd9db644542991
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:86:
>> include/linux/khugepaged.h:53:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   kernel/fork.c:163:13: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
   void __weak arch_release_task_struct(struct task_struct *tsk)
               ^
   kernel/fork.c:163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_release_task_struct(struct task_struct *tsk)
   ^
   static 
   kernel/fork.c:852:20: warning: no previous prototype for function 'arch_task_cache_init' [-Wmissing-prototypes]
   void __init __weak arch_task_cache_init(void) { }
                      ^
   kernel/fork.c:852:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_task_cache_init(void) { }
   ^
   static 
   kernel/fork.c:947:12: warning: no previous prototype for function 'arch_dup_task_struct' [-Wmissing-prototypes]
   int __weak arch_dup_task_struct(struct task_struct *dst,
              ^
   kernel/fork.c:947:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_dup_task_struct(struct task_struct *dst,
   ^
   static 
   3 warnings and 1 error generated.
--
   In file included from mm/mmap.c:40:
>> include/linux/khugepaged.h:53:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +53 include/linux/khugepaged.h

ba76149f47d8c9 Andrea Arcangeli  2011-01-13  33  
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  34  static inline void khugepaged_exit(struct mm_struct *mm)
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  35  {
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  36  	if (test_bit(MMF_VM_HUGEPAGE, &mm->flags))
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  37  		__khugepaged_exit(mm);
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  38  }
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  39  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
d2081b2bf8195b Yang Shi          2022-05-19  40  static inline void khugepaged_fork(struct mm_struct *mm, struct mm_struct *oldmm)
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  41  {
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  42  }
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  43  static inline void khugepaged_exit(struct mm_struct *mm)
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  44  {
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  45  }
c791576c60288c Yang Shi          2022-05-19  46  static inline void khugepaged_enter_vma(struct vm_area_struct *vma,
6d50e60cd2edb5 David Rientjes    2014-10-29  47  					unsigned long vm_flags)
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  48  {
ba76149f47d8c9 Andrea Arcangeli  2011-01-13  49  }
dff08746d6f7b9 Zach O'Keefe      2022-08-11  50  static inline int collapse_pte_mapped_thp(struct mm_struct *mm,
dff08746d6f7b9 Zach O'Keefe      2022-08-11  51  					  unsigned long addr, bool install_pmd)
27e1f8273113ad Song Liu          2019-09-23  52  {
27e1f8273113ad Song Liu          2019-09-23 @53  }
4aab2be0983031 Vijay Balakrishna 2020-10-10  54  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
