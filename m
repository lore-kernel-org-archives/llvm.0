Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE915494;
	Mon, 25 Sep 2023 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695674459; x=1727210459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VlUjdyltOZyETgHH9ITiS2d/gAV4ljty/uBGboprFLU=;
  b=SQTJeyQuL/xnXyGnbK58UPnrjDIvfTNJS+Q7WGrNwdp/XQxhgu1mNI8j
   qpftvBOCCsMdjwc+N7AAzClAS2e+a02+vMk7pNEp2dsJnzYNF/xBvBmzZ
   ElpOShYwpv5IPMKbLtIgrLoZ6bWKawa41B6kY6moLhwHc+tPL51xU+iCs
   zp4o0EY4OdQj3hXYsz97eNVhK9Tw6yK6ljYjY78N2X5Khwq5z1jK6V3TH
   Z+uSm3S8v1s2l9IdSlDw8is4yUnzRS4oKB0JqJ25N1CbAXZBpEvnisGKE
   YaVQYo8+OfMfo5eyA+bljnMEjObD+oOWU1MuvnL2IYL9BozeCmSFe+4en
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360761986"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="360761986"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 13:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742046325"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="742046325"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Sep 2023 13:40:52 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qksNt-00020R-2m;
	Mon, 25 Sep 2023 20:40:49 +0000
Date: Tue, 26 Sep 2023 04:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/6] shmem: add large folios support to the write path
Message-ID: <202309260433.1Ai6wzDe-lkp@intel.com>
References: <20230919135536.2165715-7-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919135536.2165715-7-da.gomez@samsung.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc3 next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/shmem-drop-BLOCKS_PER_PAGE-macro/20230920-005146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230919135536.2165715-7-da.gomez%40samsung.com
patch subject: [PATCH v2 6/6] shmem: add large folios support to the write path
config: arm-spear3xx_defconfig (https://download.01.org/0day-ci/archive/20230926/202309260433.1Ai6wzDe-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260433.1Ai6wzDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260433.1Ai6wzDe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shmem.c:1734:15: error: call to '__compiletime_assert_307' declared with 'error' attribute: BUILD_BUG failed
           if (order == HPAGE_PMD_ORDER)
                        ^
   include/linux/huge_mm.h:67:26: note: expanded from macro 'HPAGE_PMD_ORDER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:257:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:413:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:406:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:52:1: note: expanded from here
   __compiletime_assert_307
   ^
   1 error generated.


vim +1734 mm/shmem.c

  1722	
  1723	static struct folio *shmem_alloc_and_acct_folio(gfp_t gfp, struct inode *inode,
  1724			pgoff_t index, unsigned int order)
  1725	{
  1726		struct shmem_inode_info *info = SHMEM_I(inode);
  1727		struct folio *folio;
  1728		int nr = 1U << order;
  1729		int err = shmem_inode_acct_block(inode, nr);
  1730	
  1731		if (err)
  1732			goto failed;
  1733	
> 1734		if (order == HPAGE_PMD_ORDER)
  1735			folio = shmem_alloc_hugefolio(gfp, info, index);
  1736		else
  1737			folio = shmem_alloc_folio(gfp, info, index, order);
  1738		if (folio) {
  1739			__folio_set_locked(folio);
  1740			__folio_set_swapbacked(folio);
  1741			return folio;
  1742		}
  1743	
  1744		err = -ENOMEM;
  1745		shmem_inode_unacct_blocks(inode, nr);
  1746	failed:
  1747		return ERR_PTR(err);
  1748	}
  1749	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
