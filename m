Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196F1FA3;
	Sat, 16 Sep 2023 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694851542; x=1726387542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ZK4C1K5FdoZbXI130OkfOiQfcALCLF7hBqlHbIZw7U=;
  b=UhIgj7ieB0t1eP+1x6QKc4m5GXi59omMUUKji/Kxgg5BRL8z6jcpmTnR
   C4rpqKbdXqPhYKm4VXn+NXvKA/jYoODQe2JYvI6jk0hVyz0mQfQSLeirb
   VSnLVfyV3s94bqSOaFdlH2os5THFcrDsBHJEFvbinIdAZun+FMvdR1QSm
   Wvpyqe+DL8WpErlbAirOPiVarV7LW7iIIhors2JIoodfn6Z1iKziO9f1r
   2x21I16OqItgfYYpIRK33oAmgIDRv7ow0OznVmRBhvuG7v01oO4yR5z7i
   dwbxu0ENxp9uJt1m5zJwGMZRensJH+tJhu86Jj7JtHSx26jCvVBMpPayk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="382128095"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="382128095"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 01:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748444431"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="748444431"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Sep 2023 01:05:40 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhQJ8-00043E-14;
	Sat, 16 Sep 2023 08:05:38 +0000
Date: Sat, 16 Sep 2023 16:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:20230914-shmem 5/6] mm/userfaultfd.c:259:57: error: too
 few arguments to function call, expected 5, have 4
Message-ID: <202309161510.kGNxI7Rf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20230914-shmem
head:   9486b9f36d02819ec82732253049539d1ef3ea47
commit: e9891b0174848e85554332680159e451028619fa [5/6] shmem: add file length in shmem_get_folio path
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230916/202309161510.kGNxI7Rf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161510.kGNxI7Rf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161510.kGNxI7Rf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/userfaultfd.c:259:57: error: too few arguments to function call, expected 5, have 4
           ret = shmem_get_folio(inode, pgoff, &folio, SGP_NOALLOC);
                 ~~~~~~~~~~~~~~~                                  ^
   include/linux/shmem_fs.h:135:5: note: 'shmem_get_folio' declared here
   int shmem_get_folio(struct inode *inode, pgoff_t index, struct folio **foliop,
       ^
   1 error generated.


vim +259 mm/userfaultfd.c

c1a4de99fada21 Andrea Arcangeli        2015-09-04  246  
153132571f0204 Axel Rasmussen          2021-06-30  247  /* Handles UFFDIO_CONTINUE for all shmem VMAs (shared or private). */
61c5004022f56c Axel Rasmussen          2023-03-14  248  static int mfill_atomic_pte_continue(pmd_t *dst_pmd,
153132571f0204 Axel Rasmussen          2021-06-30  249  				     struct vm_area_struct *dst_vma,
153132571f0204 Axel Rasmussen          2021-06-30  250  				     unsigned long dst_addr,
d9712937037e0c Axel Rasmussen          2023-03-14  251  				     uffd_flags_t flags)
153132571f0204 Axel Rasmussen          2021-06-30  252  {
153132571f0204 Axel Rasmussen          2021-06-30  253  	struct inode *inode = file_inode(dst_vma->vm_file);
153132571f0204 Axel Rasmussen          2021-06-30  254  	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  255) 	struct folio *folio;
153132571f0204 Axel Rasmussen          2021-06-30  256  	struct page *page;
153132571f0204 Axel Rasmussen          2021-06-30  257  	int ret;
153132571f0204 Axel Rasmussen          2021-06-30  258  
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02 @259) 	ret = shmem_get_folio(inode, pgoff, &folio, SGP_NOALLOC);
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  260) 	/* Our caller expects us to return -EFAULT if we failed to find folio */
73f37dbcfe1763 Axel Rasmussen          2022-06-10  261  	if (ret == -ENOENT)
73f37dbcfe1763 Axel Rasmussen          2022-06-10  262  		ret = -EFAULT;
153132571f0204 Axel Rasmussen          2021-06-30  263  	if (ret)
153132571f0204 Axel Rasmussen          2021-06-30  264  		goto out;
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  265) 	if (!folio) {
153132571f0204 Axel Rasmussen          2021-06-30  266  		ret = -EFAULT;
153132571f0204 Axel Rasmussen          2021-06-30  267  		goto out;
153132571f0204 Axel Rasmussen          2021-06-30  268  	}
153132571f0204 Axel Rasmussen          2021-06-30  269  
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  270) 	page = folio_file_page(folio, pgoff);
a7605426666196 Yang Shi                2022-01-14  271  	if (PageHWPoison(page)) {
a7605426666196 Yang Shi                2022-01-14  272  		ret = -EIO;
a7605426666196 Yang Shi                2022-01-14  273  		goto out_release;
a7605426666196 Yang Shi                2022-01-14  274  	}
a7605426666196 Yang Shi                2022-01-14  275  
61c5004022f56c Axel Rasmussen          2023-03-14  276  	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
d9712937037e0c Axel Rasmussen          2023-03-14  277  				       page, false, flags);
153132571f0204 Axel Rasmussen          2021-06-30  278  	if (ret)
153132571f0204 Axel Rasmussen          2021-06-30  279  		goto out_release;
153132571f0204 Axel Rasmussen          2021-06-30  280  
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  281) 	folio_unlock(folio);
153132571f0204 Axel Rasmussen          2021-06-30  282  	ret = 0;
153132571f0204 Axel Rasmussen          2021-06-30  283  out:
153132571f0204 Axel Rasmussen          2021-06-30  284  	return ret;
153132571f0204 Axel Rasmussen          2021-06-30  285  out_release:
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  286) 	folio_unlock(folio);
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  287) 	folio_put(folio);
153132571f0204 Axel Rasmussen          2021-06-30  288  	goto out;
153132571f0204 Axel Rasmussen          2021-06-30  289  }
153132571f0204 Axel Rasmussen          2021-06-30  290  

:::::: The code at line 259 was first introduced by commit
:::::: 12acf4fbc4f78b24822317888b9406d56dc9ad2a userfaultfd: convert mcontinue_atomic_pte() to use a folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
