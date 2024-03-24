Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E233A19E;
	Sun, 24 Mar 2024 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711238607; cv=none; b=UNnKVhZbh9qbXQ0anjl3aTjbXZHHKE2mUIdCLlzTrn2kR4DMmJ7F5J70SB+pxXL7iu2ieh/tX4MNCrSWr/xxt/E2ztNmbAscggeePwkfVlx2y1Lnw8NXIKCZF/25Y2CZT3/W6mB5d0GsgyzeDK+FiGSD5npucE4CdV2Dx14ug+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711238607; c=relaxed/simple;
	bh=7dUjayPnLm+OrF7kkuivprJ7BF+CDLMLKnEx3998yV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTuCMqRW6fKzMhcrQt9PdN7Lxw8ZjxjCLNoK44IDSJEJmg6XpJaUA4x4tInlI+6ta+uLtdFaKBSfIFzKC6QnuueRoiG5hrl0QRmHdgEaxPBwXS8z9l4l8/L1tK1BtcoegwxLpCYrvHQG5C9FiOlva4Bok9I3lhQZOCMBTjYBG7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl4DfAUC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl4DfAUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711238605; x=1742774605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7dUjayPnLm+OrF7kkuivprJ7BF+CDLMLKnEx3998yV0=;
  b=Hl4DfAUCMr7rglgG7Q6xhZZYzpFrOgeyvD6Z3dayYk03sOstFe5yIdXp
   Q5nJRJQc02V51tA77NpQcva6OD/7BYeT7098f3oNS4FMoXzzBXQcioFev
   Q89LMtqs+eO/cDbIwuglaMypnrTv84ITyCUxi3wcN2oyL8irjXIKpJlAD
   D4twpPM2s310cw89hwQWlFuT/g5urs7ZP0Y7eMIFc6KDfDG821iXHDYNm
   cRG8DS50Xn//1ecQOqrJSkYHYzLY2CR090UjSOLGOevsCTldcaw6LJndp
   Jgq15mUHY1lC2Y/CMZxZZ/k6CxzDUfUWudywrv8DaXZ7j/Lm/aa4WF0ik
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6390517"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6390517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 17:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="19806576"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Mar 2024 17:03:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roBKY-000LYN-2e;
	Sun, 24 Mar 2024 00:03:18 +0000
Date: Sun, 24 Mar 2024 08:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
	david@redhat.com, shr@devkernel.io, hannes@cmpxchg.org,
	riel@surriel.com, wangkefeng.wang@huawei.com, sunnanyong@huawei.com,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tujinjiang@huawei.com
Subject: Re: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
Message-ID: <202403240716.8B7CiDbr-lkp@intel.com>
References: <20240322060947.3254967-2-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322060947.3254967-2-tujinjiang@huawei.com>

Hi Jinjiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjiang-Tu/mm-ksm-fix-ksm-exec-support-for-prctl/20240322-141317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240322060947.3254967-2-tujinjiang%40huawei.com
patch subject: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240324/202403240716.8B7CiDbr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240716.8B7CiDbr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240716.8B7CiDbr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/exec.c:30:
   In file included from include/linux/mm.h:2211:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/exec.c:275:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     275 |         if (ksm_execve(mm))
         |             ^~~~~~~~~~~~~~
   fs/exec.c:305:9: note: uninitialized use occurs here
     305 |         return err;
         |                ^~~
   fs/exec.c:275:2: note: remove the 'if' if its condition is always false
     275 |         if (ksm_execve(mm))
         |         ^~~~~~~~~~~~~~~~~~~
     276 |                 goto err_ksm;
         |                 ~~~~~~~~~~~~
   fs/exec.c:257:9: note: initialize the variable 'err' to silence this warning
     257 |         int err;
         |                ^
         |                 = 0
   2 warnings generated.


vim +275 fs/exec.c

   254	
   255	static int __bprm_mm_init(struct linux_binprm *bprm)
   256	{
   257		int err;
   258		struct vm_area_struct *vma = NULL;
   259		struct mm_struct *mm = bprm->mm;
   260	
   261		bprm->vma = vma = vm_area_alloc(mm);
   262		if (!vma)
   263			return -ENOMEM;
   264		vma_set_anonymous(vma);
   265	
   266		if (mmap_write_lock_killable(mm)) {
   267			err = -EINTR;
   268			goto err_free;
   269		}
   270	
   271		/*
   272		 * Need to be called with mmap write lock
   273		 * held, to avoid race with ksmd.
   274		*/
 > 275		if (ksm_execve(mm))
   276			goto err_ksm;
   277	
   278		/*
   279		 * Place the stack at the largest stack address the architecture
   280		 * supports. Later, we'll move this to an appropriate place. We don't
   281		 * use STACK_TOP because that can depend on attributes which aren't
   282		 * configured yet.
   283		 */
   284		BUILD_BUG_ON(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
   285		vma->vm_end = STACK_TOP_MAX;
   286		vma->vm_start = vma->vm_end - PAGE_SIZE;
   287		vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
   288		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
   289	
   290		err = insert_vm_struct(mm, vma);
   291		if (err)
   292			goto err;
   293	
   294		mm->stack_vm = mm->total_vm = 1;
   295		mmap_write_unlock(mm);
   296		bprm->p = vma->vm_end - sizeof(void *);
   297		return 0;
   298	err:
   299		ksm_exit(mm);
   300	err_ksm:
   301		mmap_write_unlock(mm);
   302	err_free:
   303		bprm->vma = NULL;
   304		vm_area_free(vma);
   305		return err;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
