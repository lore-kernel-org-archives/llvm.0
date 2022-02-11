Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007857F
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644620836; x=1676156836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lM+bgZCvXseabCmGbkk74kFfTfJiI3WpBveP7l1AAGo=;
  b=kR3hZ/uppx/4bOzxCTqn/9eeD3h27Nbd+WDTXhft3qSTDDk+2YzW5iyo
   Nyh13A9gx3bRp7pNSKjiOg7GLf4lm4GF/VFIW2wxFVYpRU3O8rKtHe8e7
   878LGV4gRApOhT9O3SfflzWfWHVCRTq866hOoASNl5TxBwaWKyhrGf0wt
   nvdBAlzuqyZ7ehFPSV8uy9mVjPMSUmq0hnKBgOJDJV0q51KmCLkRDxCmN
   aYLGLZP05uF6hKbhjfkfL8MoyyHQ8+n3h67r3A/HtNDvwotpRH24pRBJo
   hQrACzvXOo7bUUoKPrSzSvecvs7WSJRI+Jh9u2L2mrXIMWPufYPOVxdl8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="237229774"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="237229774"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 15:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="634239872"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Feb 2022 15:07:12 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIf0S-0005Jv-Aj; Fri, 11 Feb 2022 23:07:12 +0000
Date: Sat, 12 Feb 2022 07:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <zi.yan@sent.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 3/6] mm: make alloc_contig_range work at pageblock
 granularity
Message-ID: <202202120607.4dI5nqMH-lkp@intel.com>
References: <20220211164135.1803616-4-zi.yan@sent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211164135.1803616-4-zi.yan@sent.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]
[also build test WARNING on powerpc/next linux/master linus/master v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zi-Yan/Use-pageblock_order-for-cma-and-alloc_contig_range-alignment/20220212-004358
base:   https://github.com/hnaz/linux-mm master
config: hexagon-randconfig-r045-20220211 (https://download.01.org/0day-ci/archive/20220212/202202120607.4dI5nqMH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5aacb9dfc8abb1a0610b70226606408a96d0e997
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zi-Yan/Use-pageblock_order-for-cma-and-alloc_contig_range-alignment/20220212-004358
        git checkout 5aacb9dfc8abb1a0610b70226606408a96d0e997
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mm/page_alloc.c:3869:15: warning: no previous prototype for function 'should_fail_alloc_page' [-Wmissing-prototypes]
   noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
                 ^
   mm/page_alloc.c:3869:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
            ^
            static 
>> mm/page_alloc.c:8988:5: warning: no previous prototype for function '__alloc_contig_migrate_range' [-Wmissing-prototypes]
   int __alloc_contig_migrate_range(struct compact_control *cc,
       ^
   mm/page_alloc.c:8988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __alloc_contig_migrate_range(struct compact_control *cc,
   ^
   static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP_GPMC
   Depends on MEMORY && OF_ADDRESS
   Selected by
   - MTD_NAND_OMAP2 && MTD && MTD_RAW_NAND && (ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST && HAS_IOMEM


vim +/__alloc_contig_migrate_range +8988 mm/page_alloc.c

  8986	
  8987	/* [start, end) must belong to a single zone. */
> 8988	int __alloc_contig_migrate_range(struct compact_control *cc,
  8989						unsigned long start, unsigned long end)
  8990	{
  8991		/* This function is based on compact_zone() from compaction.c. */
  8992		unsigned int nr_reclaimed;
  8993		unsigned long pfn = start;
  8994		unsigned int tries = 0;
  8995		int ret = 0;
  8996		struct migration_target_control mtc = {
  8997			.nid = zone_to_nid(cc->zone),
  8998			.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
  8999		};
  9000	
  9001		lru_cache_disable();
  9002	
  9003		while (pfn < end || !list_empty(&cc->migratepages)) {
  9004			if (fatal_signal_pending(current)) {
  9005				ret = -EINTR;
  9006				break;
  9007			}
  9008	
  9009			if (list_empty(&cc->migratepages)) {
  9010				cc->nr_migratepages = 0;
  9011				ret = isolate_migratepages_range(cc, pfn, end);
  9012				if (ret && ret != -EAGAIN)
  9013					break;
  9014				pfn = cc->migrate_pfn;
  9015				tries = 0;
  9016			} else if (++tries == 5) {
  9017				ret = -EBUSY;
  9018				break;
  9019			}
  9020	
  9021			nr_reclaimed = reclaim_clean_pages_from_list(cc->zone,
  9022								&cc->migratepages);
  9023			cc->nr_migratepages -= nr_reclaimed;
  9024	
  9025			ret = migrate_pages(&cc->migratepages, alloc_migration_target,
  9026				NULL, (unsigned long)&mtc, cc->mode, MR_CONTIG_RANGE, NULL);
  9027	
  9028			/*
  9029			 * On -ENOMEM, migrate_pages() bails out right away. It is pointless
  9030			 * to retry again over this error, so do the same here.
  9031			 */
  9032			if (ret == -ENOMEM)
  9033				break;
  9034		}
  9035	
  9036		lru_cache_enable();
  9037		if (ret < 0) {
  9038			if (ret == -EBUSY)
  9039				alloc_contig_dump_pages(&cc->migratepages);
  9040			putback_movable_pages(&cc->migratepages);
  9041			return ret;
  9042		}
  9043		return 0;
  9044	}
  9045	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
