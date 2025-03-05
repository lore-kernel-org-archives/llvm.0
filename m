Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3231C84B4;
	Wed,  5 Mar 2025 05:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151833; cv=none; b=jnrYSrPTknBFQIJ3ta4x4jnlWyj04SsaaJF7YApZfM2x5LTtbv7KQopL4LJV/kwzleTxfI27TtQbB9o5o3OQsPAh6l0Dfhh9WZSlZj4g4H4L5/5cXMZsIXeeeKzJkFtncC5akDb7gbF5JkBYsfXWI1sYZJBhlym9dTAI6rJp/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151833; c=relaxed/simple;
	bh=tN7f97WS/3gnaezF50q5JBtx3zDEhwTL3jP0gollSJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxm09m6zPQNmlmdx4TDVxZ49zxTAjyQlfoumkeF6l13QCXun1+0wWCxlrAzpxYLQ4LxZLFoVCP1PWmG/7C2Vrwr622QywszcXXOVAQAGmCqaeal14UDo2nSB1gEPp5Z0pYRMUKY9mhpC0pncrp+hr97EI/m3QUyVkGDREx1h0TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cfn9nGxP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cfn9nGxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741151831; x=1772687831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tN7f97WS/3gnaezF50q5JBtx3zDEhwTL3jP0gollSJ8=;
  b=Cfn9nGxPJ8Xxpzy8uEd3IK7fStql2ARb9JCMKvHQZmapRSDaHBkHEj04
   p9ULcJ206In/pZccnVGwVll0H+uDCboOi3pz+TDcpU94mBhrsRbQh0oHL
   TYqEm8gwBKGCxvI6CaqwSfYAQ8LCWE5LQt0gvqDL7ZSoT+qI0bI9g9ssD
   D4xIpcJzzypNubd3LJBVJo5o4Dk5SbIf2t0mumILd0cGlW0plo4FqoWvN
   oV1fHqs2aBdcsnVf0IonFhxghB3G/FrHr95nYjMTePwj/yNu9KNL5yiim
   xVPj55RMpxmRhmvH2KukN7q/e6F4VoltRxiQxjj4y/Xq4m77xmp3BEwim
   Q==;
X-CSE-ConnectionGUID: yMZ2nbKSTHyGbEkFZmy0ww==
X-CSE-MsgGUID: Asm/kiAHQtW3ZbDhQcOQCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42296647"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="42296647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 21:17:10 -0800
X-CSE-ConnectionGUID: NUYqIOtTTOG4T75CFXQmRg==
X-CSE-MsgGUID: G676SmsdRVWfj/XllJkoIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="141830819"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2025 21:16:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tph7o-000Kcs-29;
	Wed, 05 Mar 2025 05:16:56 +0000
Date: Wed, 5 Mar 2025 13:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 400/415] mm/mremap.c:908:7: warning: variable
 'err' is used uninitialized whenever 'if' condition is false
Message-ID: <202503051356.jJQQ0DoR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7b6c5895bb9ac3aadddd51108b7bb3bb1c7f3110
commit: 3129f7896afb86e411c0b59a553fbb4053db4012 [400/415] mm/mremap: initial refactor of move_vma()
config: i386-buildonly-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051356.jJQQ0DoR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051356.jJQQ0DoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051356.jJQQ0DoR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mremap.c:11:
   In file included from include/linux/mm.h:2321:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/mremap.c:12:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/mremap.c:908:7: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     908 |                 if (vma->vm_start != old_addr)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mremap.c:910:8: note: uninitialized use occurs here
     910 |                 if (!err && vma->vm_end != old_addr + old_len)
         |                      ^~~
   mm/mremap.c:908:3: note: remove the 'if' if its condition is always true
     908 |                 if (vma->vm_start != old_addr)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     909 |                         err = vma->vm_ops->may_split(vma, old_addr);
   mm/mremap.c:895:19: note: initialize the variable 'err' to silence this warning
     895 |         unsigned long err;
         |                          ^
         |                           = 0
   4 warnings generated.


vim +908 mm/mremap.c

3129f7896afb86 Lorenzo Stoakes 2025-03-03  887  
3129f7896afb86 Lorenzo Stoakes 2025-03-03  888  /*
3129f7896afb86 Lorenzo Stoakes 2025-03-03  889   * Perform checks  before attempting to write a VMA prior to it being
3129f7896afb86 Lorenzo Stoakes 2025-03-03  890   * moved.
3129f7896afb86 Lorenzo Stoakes 2025-03-03  891   */
3129f7896afb86 Lorenzo Stoakes 2025-03-03  892  static unsigned long prep_move_vma(struct vma_remap_struct *vrm,
3129f7896afb86 Lorenzo Stoakes 2025-03-03  893  				   unsigned long *vm_flags_ptr)
3129f7896afb86 Lorenzo Stoakes 2025-03-03  894  {
3129f7896afb86 Lorenzo Stoakes 2025-03-03  895  	unsigned long err;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  896  	struct vm_area_struct *vma = vrm->vma;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  897  	unsigned long old_addr = vrm->addr;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  898  	unsigned long old_len = vrm->old_len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  899  
^1da177e4c3f41 Linus Torvalds  2005-04-16  900  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  901  	 * We'd prefer to avoid failure later on in do_munmap:
^1da177e4c3f41 Linus Torvalds  2005-04-16  902  	 * which may split one vma into three before unmapping.
^1da177e4c3f41 Linus Torvalds  2005-04-16  903  	 */
3129f7896afb86 Lorenzo Stoakes 2025-03-03  904  	if (current->mm->map_count >= sysctl_max_map_count - 3)
^1da177e4c3f41 Linus Torvalds  2005-04-16  905  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  906  
73d5e06299195f Dmitry Safonov  2020-12-14  907  	if (vma->vm_ops && vma->vm_ops->may_split) {
73d5e06299195f Dmitry Safonov  2020-12-14 @908  		if (vma->vm_start != old_addr)
73d5e06299195f Dmitry Safonov  2020-12-14  909  			err = vma->vm_ops->may_split(vma, old_addr);
73d5e06299195f Dmitry Safonov  2020-12-14  910  		if (!err && vma->vm_end != old_addr + old_len)
73d5e06299195f Dmitry Safonov  2020-12-14  911  			err = vma->vm_ops->may_split(vma, old_addr + old_len);
73d5e06299195f Dmitry Safonov  2020-12-14  912  		if (err)
73d5e06299195f Dmitry Safonov  2020-12-14  913  			return err;
73d5e06299195f Dmitry Safonov  2020-12-14  914  	}
73d5e06299195f Dmitry Safonov  2020-12-14  915  
1ff82995731667 Hugh Dickins    2009-09-21  916  	/*
1ff82995731667 Hugh Dickins    2009-09-21  917  	 * Advise KSM to break any KSM pages in the area to be moved:
1ff82995731667 Hugh Dickins    2009-09-21  918  	 * it would be confusing if they were to turn up at the new
1ff82995731667 Hugh Dickins    2009-09-21  919  	 * location, where they happen to coincide with different KSM
1ff82995731667 Hugh Dickins    2009-09-21  920  	 * pages recently unmapped.  But leave vma->vm_flags as it was,
1ff82995731667 Hugh Dickins    2009-09-21  921  	 * so KSM can come around to merge on vma and new_vma afterwards.
1ff82995731667 Hugh Dickins    2009-09-21  922  	 */
7103ad323b1ae3 Hugh Dickins    2009-09-21  923  	err = ksm_madvise(vma, old_addr, old_addr + old_len,
3129f7896afb86 Lorenzo Stoakes 2025-03-03  924  			  MADV_UNMERGEABLE, vm_flags_ptr);
7103ad323b1ae3 Hugh Dickins    2009-09-21  925  	if (err)
7103ad323b1ae3 Hugh Dickins    2009-09-21  926  		return err;
1ff82995731667 Hugh Dickins    2009-09-21  927  
3129f7896afb86 Lorenzo Stoakes 2025-03-03  928  	return 0;
ad8ee77ea9db1f Dmitry Safonov  2020-12-14  929  }
ad8ee77ea9db1f Dmitry Safonov  2020-12-14  930  

:::::: The code at line 908 was first introduced by commit
:::::: 73d5e06299195f4df82832cfc4a3a0c574c1e473 mremap: check if it's possible to split original vma

:::::: TO: Dmitry Safonov <dima@arista.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
