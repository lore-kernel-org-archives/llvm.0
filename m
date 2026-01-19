Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DACB145B27;
	Mon, 19 Jan 2026 00:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768783773; cv=none; b=AsziiMe5woK5QLCNTf55O9EILhXnAZJpJewEhtUekMJ3Vovz8ky78X27f2VxZDuczIwoOOzHLPhsS18oGio+J1Mx+0HUMdwgUC2CDYUyL0w6B+t82GDF/pcWTaqBCBjra/Agv5EBconAomnyx4M7LPDlNX0CO9a6HGCjKEjFVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768783773; c=relaxed/simple;
	bh=LiuPwV/cXY8mJCf538mkDp3wVL1nwc7H/UfTrIju16c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fb8W8E1jyjQlGFte7u2Ugf3oMJGyAX7B77ybCCGOx1uwByakqAhc6yJwbRaJTG/eYCwBp7VK8CTEp7bRp6e9sWFEFD/xhDd3XUrxSQ6ZMX1vocnKOuZUFGXGRr3rX6dZxUd+gKFUuZlBqMQZc/O9zqvynojY0bgZD472dPiHQUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjbPnijA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjbPnijA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768783772; x=1800319772;
  h=date:from:to:cc:subject:message-id;
  bh=LiuPwV/cXY8mJCf538mkDp3wVL1nwc7H/UfTrIju16c=;
  b=UjbPnijAOSdxEIZZ/tQ7xaNOWQ8vcV2bQc/smXwY6EtDXvJDUrSIH/BH
   s27abY1CIJiQhsr/vv3LlS9o7dDnuSns0yD68iifB/cuvgCXHTpA5cl7l
   DtISaTvzRoDYEFskVFFvjcZPPAxEbO9j8Vgli2RFiBMpXeT0fFcgqU+qR
   /XhP4a4BZTYYJB5KKCqKRbEtieObM9gDL2L+FNWC4bM4Sxb9oy7tbK95t
   VrMCGrZgk/vOQvxYjDL7uh8FQQT3L/ZiV50/cLAztsANtclgS+2KRU219
   Re2UYo16IfeoUmr0kIlLteJ4mXT3SLVTj53RxDcJx5ucRhP73+HT+WlV8
   g==;
X-CSE-ConnectionGUID: uTG1jeEzTc6LUSRpHcWMbw==
X-CSE-MsgGUID: sjigOFLOQsCcMqxd47PMCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81109987"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="81109987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 16:49:31 -0800
X-CSE-ConnectionGUID: O0/1aj0MQ1m8w6SgQOy5Rg==
X-CSE-MsgGUID: vAd/KFgJRyqJNthYSVrgQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="205630511"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jan 2026 16:49:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhdSR-00000000NJt-1IgN;
	Mon, 19 Jan 2026 00:49:27 +0000
Date: Mon, 19 Jan 2026 08:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:uffd/refactor/v0.2 8/11] mm/userfaultfd.c:589:7:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202601190850.lPsTWmiG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/refactor/v0.2
head:   2db3a86a6de3247449e068d998305d26481c5522
commit: 629131e835ff52775f59108aa49795ce35e442d4 [8/11] userfaultfd, shmem: use a VMA callback to handle UFFDIO_CONTINUE
config: x86_64-randconfig-016-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190850.lPsTWmiG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190850.lPsTWmiG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190850.lPsTWmiG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/userfaultfd.c:589:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     589 |                 if (ret == -ENOENT || !folio)
         |                     ^~~
   mm/userfaultfd.c:581:9: note: initialize the variable 'ret' to silence this warning
     581 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +589 mm/userfaultfd.c

   568	
   569	/* Handles UFFDIO_CONTINUE for all shmem VMAs (shared or private). */
   570	static int mfill_atomic_pte_continue(struct mfill_state *state)
   571	{
   572		struct vm_area_struct *dst_vma = state->vma;
   573		const struct vm_uffd_ops *ops = vma_uffd_ops(dst_vma);
   574		unsigned long dst_addr = state->dst_addr;
   575		pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
   576		struct inode *inode = file_inode(dst_vma->vm_file);
   577		uffd_flags_t flags = state->flags;
   578		pmd_t *dst_pmd = state->pmd;
   579		struct folio *folio;
   580		struct page *page;
   581		int ret;
   582	
   583		if (!ops)
   584			return -EOPNOTSUPP;
   585	
   586		folio = ops->get_folio_noalloc(inode, pgoff);
   587		/* Our caller expects us to return -EFAULT if we failed to find folio */
   588		if (IS_ERR_OR_NULL(folio)) {
 > 589			if (ret == -ENOENT || !folio)
   590				ret = -EFAULT;
   591			return -EFAULT;
   592		}
   593	
   594		page = folio_file_page(folio, pgoff);
   595		if (PageHWPoison(page)) {
   596			ret = -EIO;
   597			goto out_release;
   598		}
   599	
   600		ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
   601					       page, false, flags);
   602		if (ret)
   603			goto out_release;
   604	
   605		folio_unlock(folio);
   606		return 0;
   607	
   608	out_release:
   609		folio_unlock(folio);
   610		folio_put(folio);
   611		return ret;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
