Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533D1D86DC;
	Wed, 12 Feb 2025 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739350654; cv=none; b=taFpurGOOs6k7grg+lSoQTF221exZ2uKY1ZeaEakvVJOIDOPTAjrVYl6IRkswQ9aIIqPCSJozSZ+J5ULaiV0qBvWYf7rEWg2lLRnzl6OQwyt6lEQ1lwd7IxlwrT78gE/smVsiwmhwFaezKcIH+bdjQPlSwiGV0GJ8iPKQIzPKkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739350654; c=relaxed/simple;
	bh=60Ds3mmtincLmSyqyim7hfOXOE7jVraM/KBnfNf8KAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/Dvsf05o4ase2MUiiX7VyWX18UkhYkqmXxdV/tlcVejcTDgbOp7DU1k4ez8fUPudkK7Dg5+bt5yQPZG+o/E4TZjbd5B8P0KPT4UFnJlIs5saU+uYJR+/AqXfVURkL8vSKqCuymKB9FnVtTiFjp8PUeG3JsZF06Nxc06IIo6bF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsDBI4Ma; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsDBI4Ma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739350653; x=1770886653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=60Ds3mmtincLmSyqyim7hfOXOE7jVraM/KBnfNf8KAk=;
  b=QsDBI4MaNapP3QNGTfEIlUReYCXDQEWbOKLzN/x0i6+GHtjeVA/O59Z+
   7c6Yl6GnTpJfpUBu7jgUZF0kX0qt7A1L+BwazyIcbqZVfSgQxxiGrfJ+J
   AUhza+cbi5qnKVR6z9kKkAO6YuwFZnrFuDeF+3sVMgD3iZpRVcl5RV6jz
   MXDhQRsEcBiUNgdKAVts3itu502HAisDplg8aH+9yJoIBWH2lRQ/Ft81o
   Umii3LhJnVEBNw2ppCwi1HMnkfZhi+xLZuvm4/WmzdyTiQ5tE+fmP7srE
   MvkJXF3O+IQRizOpxNFmsX+4rMepKkWxpilY8Kz+mIMF5siI3NKkYvfxv
   A==;
X-CSE-ConnectionGUID: eVm05U1TT6Oy49fw9vlpqw==
X-CSE-MsgGUID: xaN3IdNKQQqEt55RA3S50w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50630737"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50630737"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 00:57:30 -0800
X-CSE-ConnectionGUID: JrrdrIfZS12qDAqjuTHYcw==
X-CSE-MsgGUID: CQtEw75oTCW8qStzpgfTww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="117778389"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 00:57:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti8Yg-0015PA-1K;
	Wed, 12 Feb 2025 08:57:26 +0000
Date: Wed, 12 Feb 2025 16:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alistair Popple <apopple@nvidia.com>
Subject: [davidhildenbrand:device_exclusive 3/18]
 drivers/gpu/drm/nouveau/nouveau_svm.c:612:54: error: use of undeclared
 identifier 'folio'
Message-ID: <202502121601.MBYPtaP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_exclusive
head:   d9a18663f22814d78aeace0bbe852e4f13923d83
commit: 9910bc073e528fac18832a3046b6666ddc06859e [3/18] mm/rmap: convert make_device_exclusive_range() to make_device_exclusive()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250212/202502121601.MBYPtaP8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121601.MBYPtaP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121601.MBYPtaP8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nouveau_svm.c:22:
   In file included from drivers/gpu/drm/nouveau/nouveau_svm.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_svm.c:612:54: error: use of undeclared identifier 'folio'
     612 |                 page = make_device_exclusive(mm, start, drm->dev, &folio);
         |                                                                    ^
   3 warnings and 1 error generated.


vim +/folio +612 drivers/gpu/drm/nouveau/nouveau_svm.c

   584	
   585	static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
   586				       struct nouveau_drm *drm,
   587				       struct nouveau_pfnmap_args *args, u32 size,
   588				       struct svm_notifier *notifier)
   589	{
   590		unsigned long timeout =
   591			jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
   592		struct mm_struct *mm = svmm->notifier.mm;
   593		struct page *page;
   594		unsigned long start = args->p.addr;
   595		unsigned long notifier_seq;
   596		int ret = 0;
   597	
   598		ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
   599						args->p.addr, args->p.size,
   600						&nouveau_svm_mni_ops);
   601		if (ret)
   602			return ret;
   603	
   604		while (true) {
   605			if (time_after(jiffies, timeout)) {
   606				ret = -EBUSY;
   607				goto out;
   608			}
   609	
   610			notifier_seq = mmu_interval_read_begin(&notifier->notifier);
   611			mmap_read_lock(mm);
 > 612			page = make_device_exclusive(mm, start, drm->dev, &folio);
   613			mmap_read_unlock(mm);
   614			if (IS_ERR(page)) {
   615				ret = -EINVAL;
   616				goto out;
   617			}
   618	
   619			mutex_lock(&svmm->mutex);
   620			if (!mmu_interval_read_retry(&notifier->notifier,
   621						     notifier_seq))
   622				break;
   623			mutex_unlock(&svmm->mutex);
   624		}
   625	
   626		/* Map the page on the GPU. */
   627		args->p.page = 12;
   628		args->p.size = PAGE_SIZE;
   629		args->p.addr = start;
   630		args->p.phys[0] = page_to_phys(page) |
   631			NVIF_VMM_PFNMAP_V0_V |
   632			NVIF_VMM_PFNMAP_V0_W |
   633			NVIF_VMM_PFNMAP_V0_A |
   634			NVIF_VMM_PFNMAP_V0_HOST;
   635	
   636		ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
   637		mutex_unlock(&svmm->mutex);
   638	
   639		unlock_page(page);
   640		put_page(page);
   641	
   642	out:
   643		mmu_interval_notifier_remove(&notifier->notifier);
   644		return ret;
   645	}
   646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
