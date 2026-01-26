Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D1923B61E;
	Mon, 26 Jan 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453372; cv=none; b=cr/wSGvNbn2aDs4+7r3/Q77X+KWOtQe26LrK5P99fUsiCXfEQMIX/Jj0S6k6FU8Uav2d7sIaI5CAk/hJkDWrMTgHPUMBUAYyiFa8sh0XmYRH/rsFR1GNx0J3GW1rjazVJUPJa1bTIEp/PpHftemLGTvh6WMQx4D0ub3CUo0hga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453372; c=relaxed/simple;
	bh=SXbUQi/mPjILsJLm7/839nCdVVFUVngbGnAYOD7YVNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOyg0RLX1Rxc/e2QqF6cMuavomMLe2QXQ9HtJC/66IwQrKM6ef9z1NpcP7+pJz6RjTQOS3C30l575uLLcXhM0fnkHUQ5vjPUZd5a67ZWPjgKsMTTTstaOiaQJ++/7LdBQktkqB+8TqooQcyqIaeQZAR6Lwv6m/DEbnMbq+27fXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I66o3Oqy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I66o3Oqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769453371; x=1800989371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SXbUQi/mPjILsJLm7/839nCdVVFUVngbGnAYOD7YVNs=;
  b=I66o3OqyNuu4FgDCirBWHu/AauTPt4OE5Q/h2kmWL1rpLqzdRJPuwf4w
   hmD9zKJzkC74Vmc/D2xZe/IkOCH76E50Ezr/U5aSiI7ch/5nldN0090nD
   wjaT9TkAbtEVKc+aQXjVnI0znuZGO/wiemo/e3hMxJmDyDjwYim0TN9XA
   CxikphaWDvDmXMJJOye+o24JGyIA8SATVruas/E4gf7xskKiC1DRE5zOs
   ov65+yzp8Ajcy8Dg9pMCJ3GDnsSIWM2O3g+Kh5TOGzhaomVY/6DspsFbt
   z7mZOv5Vz+fPgJepwKwiEnLFJ7MAy1AzM/Mi8f2dSPR0qO8OUc6ac1K4K
   g==;
X-CSE-ConnectionGUID: JvwJCsTyS8W/SX+PcDB9qA==
X-CSE-MsgGUID: 21LsQqYLRXKdDoOSbT5n6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96100248"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="96100248"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 10:49:28 -0800
X-CSE-ConnectionGUID: Ec9Xcv1mReqcQU5/+wEU7g==
X-CSE-MsgGUID: RY3/mLDzQ1Smoy4+ign3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207361135"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2026 10:49:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkReM-00000000Xaw-3Vju;
	Mon, 26 Jan 2026 18:49:22 +0000
Date: Tue, 27 Jan 2026 02:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601270202.cL2IcE86-lkp@intel.com>
References: <20260126111939.1332983-2-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126111939.1332983-2-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260126-192236
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260126111939.1332983-2-mpenttil%40redhat.com
patch subject: [PATCH v3 1/3] mm: unified hmm fault and migrate device pagewalk paths
config: x86_64-randconfig-013-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270202.cL2IcE86-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270202.cL2IcE86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270202.cL2IcE86-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hmm.c:927:31: error: no member named 'owner' in 'struct mmu_notifier_range'
     927 |         if (!hmm_vma_walk->mmu_range.owner) {
         |              ~~~~~~~~~~~~~~~~~~~~~~~ ^
   mm/hmm.c:1343:24: error: call to undeclared function 'mmu_interval_check_retry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1343 |                 if (is_fault_path && mmu_interval_check_retry(range->notifier,
         |                                      ^
   mm/hmm.c:1361:29: error: no member named 'owner' in 'struct mmu_notifier_range'
    1361 |             hmm_vma_walk.mmu_range.owner) {
         |             ~~~~~~~~~~~~~~~~~~~~~~ ^
   3 errors generated.


vim +927 mm/hmm.c

   906	
   907	static int hmm_vma_capture_migrate_range(unsigned long start,
   908						 unsigned long end,
   909						 struct mm_walk *walk)
   910	{
   911		struct hmm_vma_walk *hmm_vma_walk = walk->private;
   912		struct hmm_range *range = hmm_vma_walk->range;
   913	
   914		if (!hmm_select_migrate(range))
   915			return 0;
   916	
   917		if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))
   918			return -ERANGE;
   919	
   920		hmm_vma_walk->vma = walk->vma;
   921		hmm_vma_walk->start = start;
   922		hmm_vma_walk->end = end;
   923	
   924		if (end - start > range->end - range->start)
   925			return -ERANGE;
   926	
 > 927		if (!hmm_vma_walk->mmu_range.owner) {
   928			mmu_notifier_range_init_owner(&hmm_vma_walk->mmu_range, MMU_NOTIFY_MIGRATE, 0,
   929						      walk->vma->vm_mm, start, end,
   930						      range->dev_private_owner);
   931			mmu_notifier_invalidate_range_start(&hmm_vma_walk->mmu_range);
   932		}
   933	
   934		return 0;
   935	}
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
