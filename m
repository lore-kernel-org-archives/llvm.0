Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC217E9
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 07:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651562564; x=1683098564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1N4mAOZLJ/TefMb+ZaQ4QX6E/7JymnrMu6jSQnb8G0s=;
  b=VfmvPsSSYx2zPUd6mkpeQ1riS/QZclFPX33+To5yFCEfgqYhc2+4jYDU
   G3nNaNQPaqikzX8DrzaK1OEoTay3g03RM3gLJ859lDQBJr5SwfxqpqFYc
   W+YGZmuWu4SKKN/AnuKv517dinrOPrz0K2UxtjIQ5cDTQC9lMvuhIIwXp
   Nc61EnwqfWpXyD48fmlCB8i/p7EO8564j4c7tofFkG37baWkCmJ1RtE0/
   GJHzdLugnZBFGsKj/MCzTVsY4H4y6legu1kqxSqq/dOs2vstH3uFbJCdG
   HZvL+xDDD9fIuBTj9kfxrYiJttO4Rc8fs5L5yfQfZxmVGojlE4rdp1aeF
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292603161"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
   d="scan'208";a="292603161"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 00:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
   d="scan'208";a="631412935"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 May 2022 00:22:27 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlmra-000AF4-HX;
	Tue, 03 May 2022 07:22:26 +0000
Date: Tue, 3 May 2022 15:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zach O'Keefe <zokeefe@google.com>,
	Alex Shi <alex.shi@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, SeongJae Park <sj@kernel.org>,
	Song Liu <songliubraving@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
	Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Chris Kennelly <ckennelly@google.com>,
	Chris Zankel <chris@zankel.net>, Helge Deller <deller@gmx.de>,
	Hugh Dickins <hughd@google.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jens Axboe <axboe@kernel.dk>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v4 08/13] mm/madvise: introduce MADV_COLLAPSE sync
 hugepage collapse
Message-ID: <202205031501.6qBJrsPn-lkp@intel.com>
References: <20220502181714.3483177-9-zokeefe@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502181714.3483177-9-zokeefe@google.com>

Hi Zach,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220502]
[cannot apply to hnaz-mm/master rostedt-trace/for-next deller-parisc/for-next arnd-asm-generic/master linus/master v5.18-rc5 v5.18-rc4 v5.18-rc3 v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-khugepaged-record-SCAN_PMD_MAPPED-when-scan_pmd-finds-THP/20220503-031727
base:    9f9b9a2972eb8dcaad09d826c5c6d7488eaca3e6
config: x86_64-randconfig-a011-20220502 (https://download.01.org/0day-ci/archive/20220503/202205031501.6qBJrsPn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9f69946c58d8d53c271a4d75ac477b4a5164a511
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zach-O-Keefe/mm-khugepaged-record-SCAN_PMD_MAPPED-when-scan_pmd-finds-THP/20220503-031727
        git checkout 9f69946c58d8d53c271a4d75ac477b4a5164a511
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:1105:29: warning: incompatible integer to pointer conversion passing 'gfp_t' (aka 'unsigned int') to parameter of type 'struct page **' [-Wint-conversion]
           if (!khugepaged_alloc_page(gfp, node, cc))
                                      ^~~
   mm/khugepaged.c:963:49: note: passing argument to parameter 'hpage' here
   static bool khugepaged_alloc_page(struct page **hpage, gfp_t gfp, int node)
                                                   ^
   mm/khugepaged.c:1105:40: warning: incompatible pointer to integer conversion passing 'struct collapse_control *' to parameter of type 'int' [-Wint-conversion]
           if (!khugepaged_alloc_page(gfp, node, cc))
                                                 ^~
   mm/khugepaged.c:963:71: note: passing argument to parameter 'node' here
   static bool khugepaged_alloc_page(struct page **hpage, gfp_t gfp, int node)
                                                                         ^
>> mm/khugepaged.c:2565:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                   case SCAN_PMD_NULL:
                   ^
   mm/khugepaged.c:2565:3: note: insert 'break;' to avoid fall-through
                   case SCAN_PMD_NULL:
                   ^
                   break; 
   3 warnings generated.


vim +2565 mm/khugepaged.c

  2511	
  2512	int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
  2513			     unsigned long start, unsigned long end)
  2514	{
  2515		struct collapse_control cc = {
  2516			.enforce_pte_scan_limits = false,
  2517			.enforce_young = false,
  2518			.last_target_node = NUMA_NO_NODE,
  2519			.hpage = NULL,
  2520			.alloc_charge_hpage = &madvise_alloc_charge_hpage,
  2521		};
  2522		struct mm_struct *mm = vma->vm_mm;
  2523		unsigned long hstart, hend, addr;
  2524		int thps = 0, nr_hpages = 0, result = SCAN_FAIL;
  2525		bool mmap_locked = true;
  2526	
  2527		BUG_ON(vma->vm_start > start);
  2528		BUG_ON(vma->vm_end < end);
  2529	
  2530		*prev = vma;
  2531	
  2532		if (IS_ENABLED(CONFIG_SHMEM) && vma->vm_file)
  2533			return -EINVAL;
  2534	
  2535		hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
  2536		hend = end & HPAGE_PMD_MASK;
  2537		nr_hpages = (hend - hstart) >> HPAGE_PMD_SHIFT;
  2538	
  2539		if (hstart >= hend || !transparent_hugepage_active(vma))
  2540			return -EINVAL;
  2541	
  2542		mmgrab(mm);
  2543		lru_add_drain();
  2544	
  2545		for (addr = hstart; ; ) {
  2546			mmap_assert_locked(mm);
  2547			cond_resched();
  2548			result = SCAN_FAIL;
  2549	
  2550			if (unlikely(khugepaged_test_exit(mm))) {
  2551				result = SCAN_ANY_PROCESS;
  2552				break;
  2553			}
  2554	
  2555			memset(cc.node_load, 0, sizeof(cc.node_load));
  2556			result = khugepaged_scan_pmd(mm, vma, addr, &mmap_locked, &cc);
  2557			if (!mmap_locked)
  2558				*prev = NULL;  /* tell madvise we dropped mmap_lock */
  2559	
  2560			switch (result) {
  2561			/* Whitelisted set of results where continuing OK */
  2562			case SCAN_SUCCEED:
  2563			case SCAN_PMD_MAPPED:
  2564				++thps;
> 2565			case SCAN_PMD_NULL:

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
