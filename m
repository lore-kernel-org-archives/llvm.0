Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6987BA37;
	Wed, 22 Mar 2023 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679518262; x=1711054262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4d8RxRoyHbM2RBEnIM/cyYocxErAeky3F/PhRTHP3Q=;
  b=nydWdFTcqu0zBEmF+1xaNxS5iMEDvTaRZGj5j3hQvGE99O9WElYzi8wM
   TE5sHnTrfxl0wx0EApDxV8N40P8Tkuu/nOSPcyeFPEuzysUkG0KjsYPdP
   jnz/DrZYitn7JWbqK1NBXlIT2WjaXSjWUzOz/YBMVqhxxOfDS8mJq5acC
   uEShDjRb3MYPISmK9pkt9mcbTOHKcCaUsIh90zPgsrusewg2OGCH+x5xo
   Y8HRkd/8TY8zzxFDoHIdNiIt2IlHUSkrTXydGbclepP2SKjJ+uP9NmtDS
   FmZ6o+Mboj82kJII6O5V+/nHTs+aRdncHV0Yis+HVNEBsP0hSJKx6q4tN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404218047"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="404218047"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 13:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659313985"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="659313985"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 13:50:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf5Q6-000DeM-0B;
	Wed, 22 Mar 2023 20:50:54 +0000
Date: Thu, 23 Mar 2023 04:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 282/290] mm/mmap.c:939:11: warning: variable
 'next' is used uninitialized whenever 'if' condition is false
Message-ID: <202303230412.43XWWGFX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   39aca4f17e02ee4076b6ab327577c9b1be23775d
commit: e887ecae997ebaaad4d9b93e6a01fd5495ec1bc3 [282/290] mm/mmap/vma_merge: set next to NULL if not applicable
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230323/202303230412.43XWWGFX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=e887ecae997ebaaad4d9b93e6a01fd5495ec1bc3
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout e887ecae997ebaaad4d9b93e6a01fd5495ec1bc3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230412.43XWWGFX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmap.c:939:11: warning: variable 'next' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           else if (!curr)
                    ^~~~~
   mm/mmap.c:962:6: note: uninitialized use occurs here
           if (next && mpol_equal(policy, vma_policy(next)) &&
               ^~~~
   mm/mmap.c:939:7: note: remove the 'if' if its condition is always true
           else if (!curr)
                ^~~~~~~~~~
   mm/mmap.c:914:36: note: initialize the variable 'next' to silence this warning
           struct vm_area_struct *curr, *next, *res = NULL;
                                             ^
                                              = NULL
   1 warning generated.


vim +939 mm/mmap.c

   851	
   852	/*
   853	 * Given a mapping request (addr,end,vm_flags,file,pgoff,anon_name),
   854	 * figure out whether that can be merged with its predecessor or its
   855	 * successor.  Or both (it neatly fills a hole).
   856	 *
   857	 * In most cases - when called for mmap, brk or mremap - [addr,end) is
   858	 * certain not to be mapped by the time vma_merge is called; but when
   859	 * called for mprotect, it is certain to be already mapped (either at
   860	 * an offset within prev, or at the start of next), and the flags of
   861	 * this area are about to be changed to vm_flags - and the no-change
   862	 * case has already been eliminated.
   863	 *
   864	 * The following mprotect cases have to be considered, where **** is
   865	 * the area passed down from mprotect_fixup, never extending beyond one
   866	 * vma, PPPP is the previous vma, CCCC is a concurrent vma that starts
   867	 * at the same address as **** and is of the same or larger span, and
   868	 * NNNN the next vma after ****:
   869	 *
   870	 *     ****             ****                   ****
   871	 *    PPPPPPNNNNNN    PPPPPPNNNNNN       PPPPPPCCCCCC
   872	 *    cannot merge    might become       might become
   873	 *                    PPNNNNNNNNNN       PPPPPPPPPPCC
   874	 *    mmap, brk or    case 4 below       case 5 below
   875	 *    mremap move:
   876	 *                        ****               ****
   877	 *                    PPPP    NNNN       PPPPCCCCNNNN
   878	 *                    might become       might become
   879	 *                    PPPPPPPPPPPP 1 or  PPPPPPPPPPPP 6 or
   880	 *                    PPPPPPPPNNNN 2 or  PPPPPPPPNNNN 7 or
   881	 *                    PPPPNNNNNNNN 3     PPPPNNNNNNNN 8
   882	 *
   883	 * It is important for case 8 that the vma CCCC overlapping the
   884	 * region **** is never going to extended over NNNN. Instead NNNN must
   885	 * be extended in region **** and CCCC must be removed. This way in
   886	 * all cases where vma_merge succeeds, the moment vma_merge drops the
   887	 * rmap_locks, the properties of the merged vma will be already
   888	 * correct for the whole merged range. Some of those properties like
   889	 * vm_page_prot/vm_flags may be accessed by rmap_walks and they must
   890	 * be correct for the whole merged range immediately after the
   891	 * rmap_locks are released. Otherwise if NNNN would be removed and
   892	 * CCCC would be extended over the NNNN range, remove_migration_ptes
   893	 * or other rmap walkers (if working on addresses beyond the "end"
   894	 * parameter) may establish ptes with the wrong permissions of CCCC
   895	 * instead of the right permissions of NNNN.
   896	 *
   897	 * In the code below:
   898	 * PPPP is represented by *prev
   899	 * CCCC is represented by *curr or not represented at all (NULL)
   900	 * NNNN is represented by *next or not represented at all (NULL)
   901	 * **** is not represented - it will be merged and the vma containing the
   902	 *      area is returned, or the function will return NULL
   903	 */
   904	struct vm_area_struct *vma_merge(struct vma_iterator *vmi, struct mm_struct *mm,
   905				struct vm_area_struct *prev, unsigned long addr,
   906				unsigned long end, unsigned long vm_flags,
   907				struct anon_vma *anon_vma, struct file *file,
   908				pgoff_t pgoff, struct mempolicy *policy,
   909				struct vm_userfaultfd_ctx vm_userfaultfd_ctx,
   910				struct anon_vma_name *anon_name)
   911	{
   912		pgoff_t pglen = (end - addr) >> PAGE_SHIFT;
   913		pgoff_t vma_pgoff;
   914		struct vm_area_struct *curr, *next, *res = NULL;
   915		struct vm_area_struct *vma, *adjust, *remove, *remove2;
   916		int err = -1;
   917		bool merge_prev = false;
   918		bool merge_next = false;
   919		bool vma_expanded = false;
   920		struct vma_prepare vp;
   921		unsigned long vma_end = end;
   922		long adj_start = 0;
   923		unsigned long vma_start = addr;
   924	
   925		validate_mm(mm);
   926		/*
   927		 * We later require that vma->vm_flags == vm_flags,
   928		 * so this tests vma->vm_flags & VM_SPECIAL, too.
   929		 */
   930		if (vm_flags & VM_SPECIAL)
   931			return NULL;
   932	
   933		/* Does the input range span an existing VMA? (cases 5 - 8) */
   934		curr = find_vma_intersection(mm, prev ? prev->vm_end : 0, end);
   935	
   936		if (curr && end == curr->vm_end)
   937			/* Is there is a VMA immediately adjacent (cases 6 - 8)? */
   938			next = vma_lookup(mm, curr->vm_end);
 > 939		else if (!curr)
   940			/* Is there a VMA next to a hole (case 1 - 3) or prev (4)? */
   941			next = vma_lookup(mm, end);
   942	
   943		/* verify some invariant that must be enforced by the caller */
   944		VM_WARN_ON(prev && addr <= prev->vm_start);
   945		VM_WARN_ON(curr && end > curr->vm_end);
   946		VM_WARN_ON(addr >= end);
   947	
   948		if (prev) {
   949			res = prev;
   950			vma = prev;
   951			vma_start = prev->vm_start;
   952			vma_pgoff = prev->vm_pgoff;
   953			/* Can we merge the predecessor? */
   954			if (prev->vm_end == addr && mpol_equal(vma_policy(prev), policy)
   955			    && can_vma_merge_after(prev, vm_flags, anon_vma, file,
   956					   pgoff, vm_userfaultfd_ctx, anon_name)) {
   957				merge_prev = true;
   958				vma_prev(vmi);
   959			}
   960		}
   961		/* Can we merge the successor? */
   962		if (next && mpol_equal(policy, vma_policy(next)) &&
   963		    can_vma_merge_before(next, vm_flags,
   964					 anon_vma, file, pgoff+pglen,
   965					 vm_userfaultfd_ctx, anon_name)) {
   966			merge_next = true;
   967		}
   968	
   969		remove = remove2 = adjust = NULL;
   970		/* Can we merge both the predecessor and the successor? */
   971		if (merge_prev && merge_next &&
   972		    is_mergeable_anon_vma(prev->anon_vma, next->anon_vma, NULL)) {
   973			remove = next;				/* case 1 */
   974			vma_end = next->vm_end;
   975			err = dup_anon_vma(prev, next);
   976			if (curr) {				/* case 6 */
   977				remove = curr;
   978				remove2 = next;
   979				if (!next->anon_vma)
   980					err = dup_anon_vma(prev, curr);
   981			}
   982		} else if (merge_prev) {
   983			err = 0;				/* case 2 */
   984			if (curr) {
   985				err = dup_anon_vma(prev, curr);
   986				if (end == curr->vm_end) {	/* case 7 */
   987					remove = curr;
   988				} else {			/* case 5 */
   989					adjust = curr;
   990					adj_start = (end - curr->vm_start);
   991				}
   992			}
   993		} else if (merge_next) {
   994			res = next;
   995			if (prev && addr < prev->vm_end) {	/* case 4 */
   996				vma_end = addr;
   997				adjust = next;
   998				adj_start = -(prev->vm_end - addr);
   999				err = dup_anon_vma(next, prev);
  1000			} else {
  1001				vma = next;			/* case 3 */
  1002				vma_start = addr;
  1003				vma_end = next->vm_end;
  1004				vma_pgoff = next->vm_pgoff;
  1005				err = 0;
  1006				if (curr) {			/* case 8 */
  1007					vma_pgoff = curr->vm_pgoff;
  1008					remove = curr;
  1009					err = dup_anon_vma(next, curr);
  1010				}
  1011			}
  1012		}
  1013	
  1014		/* Cannot merge or error in anon_vma clone */
  1015		if (err)
  1016			return NULL;
  1017	
  1018		if (vma_iter_prealloc(vmi))
  1019			return NULL;
  1020	
  1021		init_multi_vma_prep(&vp, vma, adjust, remove, remove2);
  1022		VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
  1023			   vp.anon_vma != adjust->anon_vma);
  1024	
  1025		vma_prepare(&vp);
  1026		vma_adjust_trans_huge(vma, vma_start, vma_end, adj_start);
  1027		if (vma_start < vma->vm_start || vma_end > vma->vm_end)
  1028			vma_expanded = true;
  1029	
  1030		vma->vm_start = vma_start;
  1031		vma->vm_end = vma_end;
  1032		vma->vm_pgoff = vma_pgoff;
  1033	
  1034		if (vma_expanded)
  1035			vma_iter_store(vmi, vma);
  1036	
  1037		if (adj_start) {
  1038			adjust->vm_start += adj_start;
  1039			adjust->vm_pgoff += adj_start >> PAGE_SHIFT;
  1040			if (adj_start < 0) {
  1041				WARN_ON(vma_expanded);
  1042				vma_iter_store(vmi, next);
  1043			}
  1044		}
  1045	
  1046		vma_complete(&vp, vmi, mm);
  1047		vma_iter_free(vmi);
  1048		validate_mm(mm);
  1049		khugepaged_enter_vma(res, vm_flags);
  1050	
  1051		return res;
  1052	}
  1053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
