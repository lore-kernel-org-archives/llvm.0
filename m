Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E3138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652735169; x=1684271169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Mgmt/Wksy0c3drSWVLp5nWq7LE2F/FefL+3qQFgYy4=;
  b=UlE6MV/whCEg4TAuMbeHyymSBO23Du5T0WOB8FYHZneE4nuhXIY0UDem
   rJB+HWBqTEyXTeIDV3xjzAOdOPhbC5Ugj6Ta+sYv387h9lnPlPJOsVZGs
   svxsfemJtoQj3DebSVAhkhNG7UY8H1+Qoz1KNkAda/5ynjKPsa0Cc/vvg
   Z67zalwl9aLhUaRkxUotaXvoIckoGmq76721Tsyurx63GIDy11WIHm4Pt
   2b16Kgb3INx+70LuyMuYGK067Bk2TEOk5sKWUhB8tv6Gd25VO8n/rziMO
   az5DNU07053A7uWjrfRwdiVV9jdHrInsc6oFPqLczOJdjfcZPSbuaRZzQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="331576923"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="331576923"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 14:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="522626224"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 May 2022 14:05:51 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqhuY-0000L7-HQ;
	Mon, 16 May 2022 21:05:50 +0000
Date: Tue, 17 May 2022 05:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub =?utf-8?Q?Mat=C4=9Bna?= <matenajakub@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3 2/6] [PATCH 2/6] mm: add merging after mremap
 resize
Message-ID: <202205170454.MHkN4DQA-lkp@intel.com>
References: <20220516125405.1675-3-matenajakub@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516125405.1675-3-matenajakub@gmail.com>

Hi "Jakub,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/execve]
[also build test ERROR on rostedt-trace/for-next linux/master linus/master v5.18-rc7]
[cannot apply to next-20220516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Mat-na/Removing-limitations-of-merging-anonymous-VMAs/20220516-205637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
config: i386-buildonly-randconfig-r004-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170454.MHkN4DQA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c9b54f61d1a39608c55109ce2c1da21a76e6d482
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jakub-Mat-na/Removing-limitations-of-merging-anonymous-VMAs/20220516-205637
        git checkout c9b54f61d1a39608c55109ce2c1da21a76e6d482
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> mm/mremap.c:1028:47: error: call to undeclared function 'vma_policy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                           vma->vm_pgoff + (old_len >> PAGE_SHIFT), vma_policy(vma),
                                                                                    ^
>> mm/mremap.c:1028:47: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct mempolicy *' [-Wint-conversion]
                                           vma->vm_pgoff + (old_len >> PAGE_SHIFT), vma_policy(vma),
                                                                                    ^~~~~~~~~~~~~~~
   include/linux/mm.h:2628:20: note: passing argument to parameter here
           struct mempolicy *, struct vm_userfaultfd_ctx, struct anon_vma_name *);
                             ^
   1 warning and 1 error generated.


vim +/vma_policy +1028 mm/mremap.c

   885	
   886	/*
   887	 * Expand (or shrink) an existing mapping, potentially moving it at the
   888	 * same time (controlled by the MREMAP_MAYMOVE flag and available VM space)
   889	 *
   890	 * MREMAP_FIXED option added 5-Dec-1999 by Benjamin LaHaise
   891	 * This option implies MREMAP_MAYMOVE.
   892	 */
   893	SYSCALL_DEFINE5(mremap, unsigned long, addr, unsigned long, old_len,
   894			unsigned long, new_len, unsigned long, flags,
   895			unsigned long, new_addr)
   896	{
   897		struct mm_struct *mm = current->mm;
   898		struct vm_area_struct *vma;
   899		unsigned long ret = -EINVAL;
   900		bool locked = false;
   901		bool downgraded = false;
   902		struct vm_userfaultfd_ctx uf = NULL_VM_UFFD_CTX;
   903		LIST_HEAD(uf_unmap_early);
   904		LIST_HEAD(uf_unmap);
   905	
   906		/*
   907		 * There is a deliberate asymmetry here: we strip the pointer tag
   908		 * from the old address but leave the new address alone. This is
   909		 * for consistency with mmap(), where we prevent the creation of
   910		 * aliasing mappings in userspace by leaving the tag bits of the
   911		 * mapping address intact. A non-zero tag will cause the subsequent
   912		 * range checks to reject the address as invalid.
   913		 *
   914		 * See Documentation/arm64/tagged-address-abi.rst for more information.
   915		 */
   916		addr = untagged_addr(addr);
   917	
   918		if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP))
   919			return ret;
   920	
   921		if (flags & MREMAP_FIXED && !(flags & MREMAP_MAYMOVE))
   922			return ret;
   923	
   924		/*
   925		 * MREMAP_DONTUNMAP is always a move and it does not allow resizing
   926		 * in the process.
   927		 */
   928		if (flags & MREMAP_DONTUNMAP &&
   929				(!(flags & MREMAP_MAYMOVE) || old_len != new_len))
   930			return ret;
   931	
   932	
   933		if (offset_in_page(addr))
   934			return ret;
   935	
   936		old_len = PAGE_ALIGN(old_len);
   937		new_len = PAGE_ALIGN(new_len);
   938	
   939		/*
   940		 * We allow a zero old-len as a special case
   941		 * for DOS-emu "duplicate shm area" thing. But
   942		 * a zero new-len is nonsensical.
   943		 */
   944		if (!new_len)
   945			return ret;
   946	
   947		if (mmap_write_lock_killable(current->mm))
   948			return -EINTR;
   949		vma = vma_lookup(mm, addr);
   950		if (!vma) {
   951			ret = EFAULT;
   952			goto out;
   953		}
   954	
   955		if (is_vm_hugetlb_page(vma)) {
   956			struct hstate *h __maybe_unused = hstate_vma(vma);
   957	
   958			old_len = ALIGN(old_len, huge_page_size(h));
   959			new_len = ALIGN(new_len, huge_page_size(h));
   960	
   961			/* addrs must be huge page aligned */
   962			if (addr & ~huge_page_mask(h))
   963				goto out;
   964			if (new_addr & ~huge_page_mask(h))
   965				goto out;
   966	
   967			/*
   968			 * Don't allow remap expansion, because the underlying hugetlb
   969			 * reservation is not yet capable to handle split reservation.
   970			 */
   971			if (new_len > old_len)
   972				goto out;
   973		}
   974	
   975		if (flags & (MREMAP_FIXED | MREMAP_DONTUNMAP)) {
   976			ret = mremap_to(addr, old_len, new_addr, new_len,
   977					&locked, flags, &uf, &uf_unmap_early,
   978					&uf_unmap);
   979			goto out;
   980		}
   981	
   982		/*
   983		 * Always allow a shrinking remap: that just unmaps
   984		 * the unnecessary pages..
   985		 * __do_munmap does all the needed commit accounting, and
   986		 * downgrades mmap_lock to read if so directed.
   987		 */
   988		if (old_len >= new_len) {
   989			int retval;
   990	
   991			retval = __do_munmap(mm, addr+new_len, old_len - new_len,
   992					  &uf_unmap, true);
   993			if (retval < 0 && old_len != new_len) {
   994				ret = retval;
   995				goto out;
   996			/* Returning 1 indicates mmap_lock is downgraded to read. */
   997			} else if (retval == 1)
   998				downgraded = true;
   999			ret = addr;
  1000			goto out;
  1001		}
  1002	
  1003		/*
  1004		 * Ok, we need to grow..
  1005		 */
  1006		vma = vma_to_resize(addr, old_len, new_len, flags);
  1007		if (IS_ERR(vma)) {
  1008			ret = PTR_ERR(vma);
  1009			goto out;
  1010		}
  1011	
  1012		/* old_len exactly to the end of the area..
  1013		 */
  1014		if (old_len == vma->vm_end - addr) {
  1015			/* can we just expand the current mapping? */
  1016			if (vma_expandable(vma, new_len - old_len)) {
  1017				long pages = (new_len - old_len) >> PAGE_SHIFT;
  1018	
  1019				if (vma->vm_flags & VM_ACCOUNT) {
  1020					if (security_vm_enough_memory_mm(mm, pages)) {
  1021						ret = -ENOMEM;
  1022						goto out;
  1023					}
  1024				}
  1025	
  1026				if (!vma_merge(mm, vma, addr + old_len, addr + new_len,
  1027						vma->vm_flags, vma->anon_vma, vma->vm_file,
> 1028						vma->vm_pgoff + (old_len >> PAGE_SHIFT), vma_policy(vma),

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
