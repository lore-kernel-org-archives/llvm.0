Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C47B
	for <llvm@lists.linux.dev>; Sat,  3 Sep 2022 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662189360; x=1693725360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPrVnASu88cCMtGFNXg+Y8s2TjuNyPsviRzBTbDLTvs=;
  b=g9kvzzVwR3TUCs6KCwWKjD5bvgenbRWH5w8jG2JE1RgU/b+42eU/lFmS
   DmoCCnQp+sCX6HcqIYkmQ/3+qhQNEb07Qeofo9WgRDyGaZT1+w7rOwiIz
   HCgSQuOZAH8bi9BlRXXz82wF+qBWFeSJ9tvcrz16oihxAcbOw+hETyzLL
   HA46bWpAa4MiHGm2GQkMnNQSjvCCFc7fo50g/0U8gugNr4v8aBK2aMBF8
   JQTPaGaZVIhAYQtTSYxxhKHkAtLigXZGpxa1d4mjUOM/fCG8HFG4MlhEr
   0QqgqTCJA2BTTleQucVQzKe9y2omiJuW8Q6UtW0Qg6tI4/3xrRiUb/HUB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="322301199"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="322301199"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 00:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="564201828"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Sep 2022 00:15:58 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUNNl-0001EY-1J;
	Sat, 03 Sep 2022 07:15:57 +0000
Date: Sat, 3 Sep 2022 15:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4598/4736] mm/khugepaged.c:2056:38: error:
 incompatible pointer types passing 'struct khugepaged_mm_slot *' to
 parameter of type 'struct mm_slot *'
Message-ID: <202209031510.aqFb4p9V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: 36362cd669dfbb6f8c640f5c7dfdd7269660362c [4598/4736] mm: thp: convert to use common struct mm_slot
config: s390-buildonly-randconfig-r002-20220901 (https://download.01.org/0day-ci/archive/20220903/202209031510.aqFb4p9V-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=36362cd669dfbb6f8c640f5c7dfdd7269660362c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 36362cd669dfbb6f8c640f5c7dfdd7269660362c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/khugepaged.c:2056:38: error: incompatible pointer types passing 'struct khugepaged_mm_slot *' to parameter of type 'struct mm_slot *' [-Werror,-Wincompatible-pointer-types]
           khugepaged_collapse_pte_mapped_thps(mm_slot);
                                               ^~~~~~~
   mm/khugepaged.c:2023:65: note: passing argument to parameter 'mm_slot' here
   static void khugepaged_collapse_pte_mapped_thps(struct mm_slot *mm_slot)
                                                                   ^
   1 error generated.


vim +2056 mm/khugepaged.c

f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2027  
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2028  static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
61f9da0fad933f Zach O'Keefe            2022-07-06  2029  					    struct collapse_control *cc)
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2030  	__releases(&khugepaged_mm_lock)
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2031  	__acquires(&khugepaged_mm_lock)
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2032  {
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2033) 	struct vma_iterator vmi;
36362cd669dfbb Qi Zheng                2022-08-31  2034  	struct khugepaged_mm_slot *mm_slot;
36362cd669dfbb Qi Zheng                2022-08-31  2035  	struct mm_slot *slot;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2036  	struct mm_struct *mm;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2037  	struct vm_area_struct *vma;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2038  	int progress = 0;
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2039) 	unsigned long address;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2040  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2041  	VM_BUG_ON(!pages);
35f3aa39f243e8 Lance Roy               2018-10-04  2042  	lockdep_assert_held(&khugepaged_mm_lock);
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2043  	*result = SCAN_FAIL;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2044  
36362cd669dfbb Qi Zheng                2022-08-31  2045  	if (khugepaged_scan.mm_slot) {
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2046  		mm_slot = khugepaged_scan.mm_slot;
36362cd669dfbb Qi Zheng                2022-08-31  2047  		slot = &mm_slot->slot;
36362cd669dfbb Qi Zheng                2022-08-31  2048  	} else {
36362cd669dfbb Qi Zheng                2022-08-31  2049  		slot = list_entry(khugepaged_scan.mm_head.next,
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2050  				     struct mm_slot, mm_node);
36362cd669dfbb Qi Zheng                2022-08-31  2051  		mm_slot = mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2052  		khugepaged_scan.address = 0;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2053  		khugepaged_scan.mm_slot = mm_slot;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2054  	}
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2055  	spin_unlock(&khugepaged_mm_lock);
27e1f8273113ad Song Liu                2019-09-23 @2056  	khugepaged_collapse_pte_mapped_thps(mm_slot);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2057  
36362cd669dfbb Qi Zheng                2022-08-31  2058  	mm = slot->mm;
3b454ad35043df Yang Shi                2018-01-31  2059  	/*
3b454ad35043df Yang Shi                2018-01-31  2060  	 * Don't wait for semaphore (to avoid long wait times).  Just move to
3b454ad35043df Yang Shi                2018-01-31  2061  	 * the next mm on the list.
3b454ad35043df Yang Shi                2018-01-31  2062  	 */
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2063  	vma = NULL;
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  2064  	if (unlikely(!mmap_read_trylock(mm)))
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  2065  		goto breakouterloop_mmap_lock;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2066  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2067  	progress++;
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2068) 	if (unlikely(hpage_collapse_test_exit(mm)))
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2069) 		goto breakouterloop;
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2070) 
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2071) 	address = khugepaged_scan.address;
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2072) 	vma_iter_init(&vmi, mm, address);
2ae6a2ed2d4ca1 Matthew Wilcox (Oracle  2022-08-22  2073) 	for_each_vma(vmi, vma) {
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2074  		unsigned long hstart, hend;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2075  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2076  		cond_resched();
2b792d84bf5a38 Zach O'Keefe            2022-07-06  2077  		if (unlikely(hpage_collapse_test_exit(mm))) {
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2078  			progress++;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2079  			break;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2080  		}
e79e8095d317dd Zach O'Keefe            2022-07-06  2081  		if (!hugepage_vma_check(vma, vma->vm_flags, false, false, true)) {
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2082  skip:
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2083  			progress++;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2084  			continue;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2085  		}
4fa6893faeaaea Yang Shi                2022-06-16  2086  		hstart = round_up(vma->vm_start, HPAGE_PMD_SIZE);
4fa6893faeaaea Yang Shi                2022-06-16  2087  		hend = round_down(vma->vm_end, HPAGE_PMD_SIZE);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2088  		if (khugepaged_scan.address > hend)
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2089  			goto skip;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2090  		if (khugepaged_scan.address < hstart)
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2091  			khugepaged_scan.address = hstart;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2092  		VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2093  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2094  		while (khugepaged_scan.address < hend) {
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2095  			bool mmap_locked = true;
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2096  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2097  			cond_resched();
2b792d84bf5a38 Zach O'Keefe            2022-07-06  2098  			if (unlikely(hpage_collapse_test_exit(mm)))
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2099  				goto breakouterloop;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2100  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2101  			VM_BUG_ON(khugepaged_scan.address < hstart ||
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2102  				  khugepaged_scan.address + HPAGE_PMD_SIZE >
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2103  				  hend);
99cb0dbd47a15d Song Liu                2019-09-23  2104  			if (IS_ENABLED(CONFIG_SHMEM) && vma->vm_file) {
396bcc5299c281 Matthew Wilcox (Oracle  2020-04-06  2105) 				struct file *file = get_file(vma->vm_file);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2106  				pgoff_t pgoff = linear_page_index(vma,
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2107  						khugepaged_scan.address);
99cb0dbd47a15d Song Liu                2019-09-23  2108  
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  2109  				mmap_read_unlock(mm);
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2110  				*result = khugepaged_scan_file(mm, file, pgoff,
61f9da0fad933f Zach O'Keefe            2022-07-06  2111  							       cc);
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2112  				mmap_locked = false;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2113  				fput(file);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2114  			} else {
2b792d84bf5a38 Zach O'Keefe            2022-07-06  2115  				*result = hpage_collapse_scan_pmd(mm, vma,
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2116  								  khugepaged_scan.address,
2b792d84bf5a38 Zach O'Keefe            2022-07-06  2117  								  &mmap_locked,
2b792d84bf5a38 Zach O'Keefe            2022-07-06  2118  								  cc);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2119  			}
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2120  			if (*result == SCAN_SUCCEED)
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2121  				++khugepaged_pages_collapsed;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2122  			/* move to next address */
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2123  			khugepaged_scan.address += HPAGE_PMD_SIZE;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2124  			progress += HPAGE_PMD_NR;
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2125  			if (!mmap_locked)
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2126  				/*
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2127  				 * We released mmap_lock so break loop.  Note
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2128  				 * that we drop mmap_lock before all hugepage
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2129  				 * allocations, so if allocation fails, we are
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2130  				 * guaranteed to break here and report the
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2131  				 * correct result back to caller.
47c73ca9cc0b20 Zach O'Keefe            2022-07-06  2132  				 */
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  2133  				goto breakouterloop_mmap_lock;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2134  			if (progress >= pages)
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2135  				goto breakouterloop;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2136  		}
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2137  	}
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2138  breakouterloop:
d8ed45c5dcd455 Michel Lespinasse       2020-06-08  2139  	mmap_read_unlock(mm); /* exit_mmap will destroy ptes after this */
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  2140  breakouterloop_mmap_lock:
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2141  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2142  	spin_lock(&khugepaged_mm_lock);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2143  	VM_BUG_ON(khugepaged_scan.mm_slot != mm_slot);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2144  	/*
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2145  	 * Release the current mm_slot if this mm is about to die, or
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2146  	 * if we scanned all vmas of this mm.
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2147  	 */
2b792d84bf5a38 Zach O'Keefe            2022-07-06  2148  	if (hpage_collapse_test_exit(mm) || !vma) {
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2149  		/*
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2150  		 * Make sure that if mm_users is reaching zero while
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2151  		 * khugepaged runs here, khugepaged_exit will find
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2152  		 * mm_slot not pointing to the exiting mm.
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2153  		 */
36362cd669dfbb Qi Zheng                2022-08-31  2154  		if (slot->mm_node.next != &khugepaged_scan.mm_head) {
36362cd669dfbb Qi Zheng                2022-08-31  2155  			slot = list_entry(slot->mm_node.next,
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2156  					  struct mm_slot, mm_node);
36362cd669dfbb Qi Zheng                2022-08-31  2157  			khugepaged_scan.mm_slot =
36362cd669dfbb Qi Zheng                2022-08-31  2158  				mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2159  			khugepaged_scan.address = 0;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2160  		} else {
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2161  			khugepaged_scan.mm_slot = NULL;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2162  			khugepaged_full_scans++;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2163  		}
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2164  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2165  		collect_mm_slot(mm_slot);
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2166  	}
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2167  
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2168  	return progress;
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2169  }
b46e756f5e4703 Kirill A. Shutemov      2016-07-26  2170  

:::::: The code at line 2056 was first introduced by commit
:::::: 27e1f8273113adec0e98bf513e4091636b27cc2a khugepaged: enable collapse pmd for pte-mapped THP

:::::: TO: Song Liu <songliubraving@fb.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
