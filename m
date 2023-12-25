Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8451007;
	Mon, 25 Dec 2023 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdCUwGWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703502259; x=1735038259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJQrbuMc5jqqc/TxWrf78j7cYc5Y+x0qFd/lPK8Ls9A=;
  b=NdCUwGWHPKJoK7CN+NfH+lS88gi195xCG4UOPTYvs2r/lVAs7hLfcI1z
   t1nBacvVo1wxuPG4Xb6glrX3cF/dzU/kxZGNm6n7IPjkGVuji6SbxtrZh
   J9ddOPLsaSdInu+I3AkOJlbJHZVEA8/EciJk5ck6PluCFBqzPECvffTsg
   arcRjB7OJJyIjs5bEz+wAho+HklI29QDZlYKGd455mXBbe3ypvc/tk6ck
   VsZWItsEGSvzEdAOPuQghgyUbwzdFCgbDM9Z8e6a6jQVtaIOahyTl74cI
   3SArgj6FtQZxDolLU3yEvl9/Zelc8i+TCqHPjW21Kf0tQVw4WlQjN+n3D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="399067767"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="399067767"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 03:04:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="843632193"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="843632193"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Dec 2023 03:04:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHikh-000DEv-0Q;
	Mon, 25 Dec 2023 11:04:07 +0000
Date: Mon, 25 Dec 2023 19:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] iommu/intel: Use page->refcount to count number of
 entries in IOMMU
Message-ID: <202312251813.JIQrzgR1-lkp@intel.com>
References: <20231221031915.619337-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221031915.619337-2-pasha.tatashin@soleen.com>

Hi Pasha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on joro-iommu/next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/iommu-intel-Use-page-refcount-to-count-number-of-entries-in-IOMMU/20231222-172957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
patch link:    https://lore.kernel.org/r/20231221031915.619337-2-pasha.tatashin%40soleen.com
patch subject: [RFC 1/3] iommu/intel: Use page->refcount to count number of entries in IOMMU
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231225/202312251813.JIQrzgR1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312251813.JIQrzgR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312251813.JIQrzgR1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/intel/dmar.c:33:
>> drivers/iommu/intel/iommu.h:823:15: error: invalid output size for constraint '+q'
           old_pteval = xchg(&pte->val, 0ULL);
                        ^
   include/linux/atomic/atomic-instrumented.h:4716:2: note: expanded from macro 'xchg'
           raw_xchg(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: expanded from macro 'raw_xchg'
   #define raw_xchg arch_xchg
                    ^
   arch/x86/include/asm/cmpxchg.h:78:27: note: expanded from macro 'arch_xchg'
   #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
                                   ^
   arch/x86/include/asm/cmpxchg.h:48:19: note: expanded from macro '__xchg_op'
                                         : "+q" (__ret), "+m" (*(ptr))     \
                                                 ^
   1 error generated.


vim +823 drivers/iommu/intel/iommu.h

   818	
   819	static inline void dma_clear_pte(struct dma_pte *pte)
   820	{
   821		u64 old_pteval;
   822	
 > 823		old_pteval = xchg(&pte->val, 0ULL);
   824		if (DMA_PTEVAL_PRESENT(old_pteval)) {
   825			struct page *pg = virt_to_page(pte);
   826			int rc = page_ref_dec_return(pg);
   827	
   828			WARN_ON_ONCE(rc > 512 || rc < 1);
   829		} else {
   830			/* Ensure that we cleared a valid entry from the page table */
   831			WARN_ON(1);
   832		}
   833	}
   834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
