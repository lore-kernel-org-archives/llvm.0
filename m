Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076D2331A44;
	Tue, 16 Dec 2025 05:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765861451; cv=none; b=HL8RWMudonQbADDA/h4fvKdfMhf13Js+nlpHA75YJRZrOQcr7AG6HkG0cV7up8qnUV2tk86oqm/nhXdFbLha46kw7ka7bTIkf23ZH+N4PKtfZi610EPakAb+teGkBsBK+PRJwZEigEctTX9lwbGbNhp11xQFoi+Jh+pNKLA3GBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765861451; c=relaxed/simple;
	bh=cdgOM1zNzJWYAFxEAh5KUXxqD0R1ZNnspaoOHRBoaJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PujU/zB9x91GcwCCYMzzJ3XYATqqd5OcqRaVCs/f2OG2mXfpdkIj6A2hlFUXL514nWBUtG+CgSc/rdde77mJxWMpPmyNaMoNEFo2p/uWE30aTcRky7g6uRUOzg9s8fgFBuYHrVmp/IVZ2jEjWqLwwl7T3wN7Ztv8fGiCqoPhK4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOpHWqe/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOpHWqe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765861443; x=1797397443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cdgOM1zNzJWYAFxEAh5KUXxqD0R1ZNnspaoOHRBoaJM=;
  b=fOpHWqe/EBh40/VdQa/z6PtD20ze+hyr66ZxGYA9ydSeNm36lvwXTSep
   DwmTvtCcgt/saZ9E5ft2dl9HankiXSSRaL1mYGQYMaR1yVyMxe/JfP1YA
   /XLaOgIHtrleG994JuIC8hQzyKj5BvBHb/mcOczj6D6mqDKGCFBP2v1NN
   c3u3nudpNhdacpvOWqOkYDykx3jAwjS2wyg5ZRE8gLf5lGQONXUpybJyx
   x6LPzmTS9lgYh/2ewmSg8oy8ijg+h0wUkFiNPeLe0EET48AM1w+ywOhKk
   ZF2FqLVz4Oy19oRXVJI47IevZ2m750k908e3vIljfV88RKisUJgfse03L
   g==;
X-CSE-ConnectionGUID: R6oxE42RQR+hBAEz2zTVLA==
X-CSE-MsgGUID: a8jKikzjQqSgbYgRiCwl1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="90428896"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="90428896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:03:57 -0800
X-CSE-ConnectionGUID: F+kshmvMTpiLqi7gT6xJGA==
X-CSE-MsgGUID: f6Xb8iMlTgCFrbdiRHph5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="198408906"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Dec 2025 21:03:52 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVNDx-000000001B3-1uyR;
	Tue, 16 Dec 2025 05:03:49 +0000
Date: Tue, 16 Dec 2025 13:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Qilong <zhangqilong3@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com, corbet@lwn.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH next 1/2] mm/huge_memory: Implementation of THP COW for
 executable file mmap
Message-ID: <202512161240.Ej5BIvIk-lkp@intel.com>
References: <20251215123407.380813-2-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215123407.380813-2-zhangqilong3@huawei.com>

Hi Zhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251215]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Qilong/mm-huge_memory-Implementation-of-THP-COW-for-executable-file-mmap/20251215-204035
base:   next-20251215
patch link:    https://lore.kernel.org/r/20251215123407.380813-2-zhangqilong3%40huawei.com
patch subject: [PATCH next 1/2] mm/huge_memory: Implementation of THP COW for executable file mmap
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251216/202512161240.Ej5BIvIk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161240.Ej5BIvIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161240.Ej5BIvIk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:6134:7: error: call to undeclared function 'vma_is_special_huge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6134 |                 if (vma_is_special_huge(vma) || vma_is_shmem(vma))
         |                     ^
   1 error generated.


vim +/vma_is_special_huge +6134 mm/memory.c

  6104	
  6105	/* `inline' is required to avoid gcc 4.1.2 build error */
  6106	static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
  6107	{
  6108		struct vm_area_struct *vma = vmf->vma;
  6109		const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
  6110		vm_fault_t ret;
  6111	
  6112		if (vma_is_anonymous(vma)) {
  6113			if (likely(!unshare) &&
  6114			    userfaultfd_huge_pmd_wp(vma, vmf->orig_pmd)) {
  6115				if (userfaultfd_wp_async(vmf->vma))
  6116					goto split;
  6117				return handle_userfault(vmf, VM_UFFD_WP);
  6118			}
  6119			return do_huge_pmd_wp_page(vmf);
  6120		}
  6121	
  6122		if (vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
  6123			if (vma->vm_ops->huge_fault) {
  6124				ret = vma->vm_ops->huge_fault(vmf, PMD_ORDER);
  6125				if (!(ret & VM_FAULT_FALLBACK))
  6126					return ret;
  6127			}
  6128		}
  6129	
  6130	
  6131		if (is_exec_mapping(vma->vm_flags) &&
  6132		    is_cow_mapping(vma->vm_flags)) {
  6133			/* Skip special and shmem */
> 6134			if (vma_is_special_huge(vma) || vma_is_shmem(vma))
  6135				goto split;
  6136	
  6137			ret = do_huge_pmd_exec_cow(vmf);
  6138			if (!(ret & VM_FAULT_FALLBACK))
  6139				return ret;
  6140		}
  6141	
  6142	split:
  6143		/* COW or write-notify handled on pte level: split pmd. */
  6144		__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
  6145	
  6146		return VM_FAULT_FALLBACK;
  6147	}
  6148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
