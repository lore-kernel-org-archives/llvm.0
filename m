Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A591361657;
	Mon, 23 Feb 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846516; cv=none; b=L/Vwo88BKlBXm2zR/9DszbutlamVP8nKvgE32X+24gwfsb6SNNy8OqLUNjEMjT3+TogedRkxob+7KrQRX8QinBdS8rIeYvRiYo/EIWuAW3KKMWq8ORQ3+Kvad5PSoBgjG4+nngrnAUnXjHFcD6Oibu65T+eAhHR1QHdnfdRMwSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846516; c=relaxed/simple;
	bh=ICz0afP5ji4BKrZjXpgroSP7S7wJVIlslIzE9ouTAFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kvsr2Ifg+nn3B3mbbrKFZb8DRW6Evg3wly/fK51m8ITcT0RIGwwwDeomVMiMhF7se9ENKqsSt2kCuHtxmV/IX4by6jGzwQFvaRJVwWr4h9MUVaBSoy1TgnwnCjpQahbe49zb67xfIPzCKEYTe7w5zLTucaWrP+LS/+4DiJi9AHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7MCBGhI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7MCBGhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771846515; x=1803382515;
  h=date:from:to:cc:subject:message-id;
  bh=ICz0afP5ji4BKrZjXpgroSP7S7wJVIlslIzE9ouTAFQ=;
  b=c7MCBGhIus688hhbTQgvavvaUDuaJYQEmrb0+KDBgR/ONYnJB8pOd9rl
   xA2f8V+b9burvmhD95JnxtyD/oZbIO80ujVM9FNr/azDEl4ey1UWlr72T
   IifdDCgSbcLx0319eZbD/B/2yp7E5QK52scs1wjgx+M39cVs87HK30dR6
   Ftx9IqYAJ338j9gwcN1ntOqQPbddvS8b6gj3hIGnQ58DvLT14GMHmnCEs
   lW9aWhOZ6Sd//eDm6tA4T/qRia8bzpvTerzkzskB3NMG6VRHWm4F+lkGE
   OsdRDbtGLbQXxZ3hZM0h3Bov9yv48inPVR3/aPqOROHs4V3w3cWnTP4+F
   w==;
X-CSE-ConnectionGUID: qH17qb0PTp+ZqByuG7MPwQ==
X-CSE-MsgGUID: uAJC9OfsS56PpPyt4bsN6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="73014605"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="73014605"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:35:14 -0800
X-CSE-ConnectionGUID: JxXkvKVfRne37NkfBLw9/A==
X-CSE-MsgGUID: JsMCCzvRQ7Gn6nJgM3r4dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213491422"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 03:35:09 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuUDS-000000000Ez-3v2o;
	Mon, 23 Feb 2026 11:35:06 +0000
Date: Mon, 23 Feb 2026 19:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>
Subject: [rppt:uffd+guestmemfd/v1 12/15] mm/memory.c:5340:23: error:
 no member named 'uffd_ops' in 'struct vm_operations_struct'
Message-ID: <202602231909.bkr3QXJq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/v1
head:   ea5af993d28d129d273453041a5ad6b3a1a9e31a
commit: 40ced64186624690248a72f77202a245eb1717e3 [12/15] mm: generalize handling of userfaults in __do_fault()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260223/202602231909.bkr3QXJq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602231909.bkr3QXJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602231909.bkr3QXJq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:5340:23: error: no member named 'uffd_ops' in 'struct vm_operations_struct'
    5340 |         folio = vma->vm_ops->uffd_ops->get_folio_noalloc(inode, vmf->pgoff);
         |                 ~~~~~~~~~~~  ^
   1 error generated.


vim +5340 mm/memory.c

  5330	
  5331	static vm_fault_t __do_userfault(struct vm_fault *vmf)
  5332	{
  5333		struct vm_area_struct *vma = vmf->vma;
  5334		struct inode *inode = file_inode(vma->vm_file);
  5335		struct folio *folio;
  5336	
  5337		if (!(userfaultfd_missing(vma) || userfaultfd_minor(vma)))
  5338			return 0;
  5339	
> 5340		folio = vma->vm_ops->uffd_ops->get_folio_noalloc(inode, vmf->pgoff);
  5341		if (!IS_ERR_OR_NULL(folio)) {
  5342			/*
  5343			 * TODO: provide a flag for get_folio_noalloc() to avoid
  5344			 * locking (or even the extra reference?)
  5345			 */
  5346			folio_unlock(folio);
  5347			folio_put(folio);
  5348			if (userfaultfd_minor(vma))
  5349				return handle_userfault(vmf, VM_UFFD_MINOR);
  5350		} else {
  5351			if (userfaultfd_missing(vma))
  5352				return handle_userfault(vmf, VM_UFFD_MISSING);
  5353		}
  5354	
  5355		return 0;
  5356	}
  5357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
