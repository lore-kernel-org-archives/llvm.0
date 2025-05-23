Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15312236EE;
	Fri, 23 May 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747981762; cv=none; b=JhcpGqpi1pfezjHw0VhLA2xqmMCZC/SL+DPdVaNodVHIUngFJgW8y92nXVYqOFAZ3N2MWK3i9qIQ8XM2FYKsiOdKNBGltMvQ2T0TdvvaHgv9LIVwEXS+LiSrVp9758btvFUbduL917is56LGFZnlcZ2hWta0qStkDYdjjMdBUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747981762; c=relaxed/simple;
	bh=RQ5KrYLB5wM0he00u4vva4Oc9ENN6xE57mG5WU5ptOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTKZRXuK5++VwQ7BZQ7ab900SYSqZ7wA6tvVjK0SUBmmo2wz8mc9oLkbOGC9mkrD5bkcIodgoXdY0VFBR5I4kigEB1MaD+vhzCUUNWE18DAkp/r4TwRQhKx7k59xIus1nfJ0nyZYwBCDT64gUmlTZB2+P288WtCpHwiMjG6tuFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1LYRhbN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1LYRhbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747981760; x=1779517760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RQ5KrYLB5wM0he00u4vva4Oc9ENN6xE57mG5WU5ptOM=;
  b=E1LYRhbNGFrw93BVy2Eb1WlaA/Gw7Fnk30Okrl4E1oyJo4UST+t6iVAi
   SBs6s3UE+BZYHK69OFfc+0SqlP9GSIop6d65BPyfFfHgvFmGSbVdB4Bkr
   t+MMDDUDBzrk9oOrfK+B+5hMHcwdKSmWO4MAfWcHRehIenJGRc+OoHCFa
   YoNoqNhPTZy7c6ZirNETAM1uNY5oZlgslPLanyHPhhbfdlZYU+pzEl1rb
   JtsIgcvXlBwFyrwgU7MKu5mt5WfVVEWcVzXdtMWLWK0aXa8AlAxTHIrQ3
   T2OhEMIXxPZ0neEMwuYA8+aJn6YjI7jkTXBY0qwcQxNWg4coyDL3+YO42
   Q==;
X-CSE-ConnectionGUID: YK1V5391RJuiQxk7piLEiA==
X-CSE-MsgGUID: GZYw6T7ES2GY90lzq1qTug==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49283377"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="49283377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 23:29:19 -0700
X-CSE-ConnectionGUID: ZuuhH2FNQ221X/l7fPSaiA==
X-CSE-MsgGUID: XWpiShhdRhKfi1ufUQi4NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="142034651"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 May 2025 23:29:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uILu7-000Q4y-2t;
	Fri, 23 May 2025 06:29:15 +0000
Date: Fri, 23 May 2025 14:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 2/2] block: use mm_huge_zero_folio in
 __blkdev_issue_zero_pages()
Message-ID: <202505231432.NPt3C4sm-lkp@intel.com>
References: <20250522090243.758943-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522090243.758943-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on f1f6aceb82a55f87d04e2896ac3782162e7859bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/mm-add-THP_HUGE_ZERO_PAGE_ALWAYS-config-option/20250522-170442
base:   f1f6aceb82a55f87d04e2896ac3782162e7859bd
patch link:    https://lore.kernel.org/r/20250522090243.758943-3-p.raghav%40samsung.com
patch subject: [RFC v2 2/2] block: use mm_huge_zero_folio in __blkdev_issue_zero_pages()
config: arm-randconfig-001-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231432.NPt3C4sm-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231432.NPt3C4sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231432.NPt3C4sm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-lib.c:201:15: error: call to undeclared function 'mm_get_huge_zero_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           zero_folio = mm_get_huge_zero_folio(NULL);
                        ^
   block/blk-lib.c:201:15: note: did you mean 'mm_put_huge_zero_folio'?
   include/linux/huge_mm.h:644:20: note: 'mm_put_huge_zero_folio' declared here
   static inline void mm_put_huge_zero_folio(struct mm_struct *mm)
                      ^
>> block/blk-lib.c:201:13: error: incompatible integer to pointer conversion assigning to 'struct folio *' from 'int' [-Wint-conversion]
           zero_folio = mm_get_huge_zero_folio(NULL);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/mm_get_huge_zero_folio +201 block/blk-lib.c

   194	
   195	static void __blkdev_issue_zero_pages(struct block_device *bdev,
   196			sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
   197			struct bio **biop, unsigned int flags)
   198	{
   199		struct folio *zero_folio;
   200	
 > 201		zero_folio = mm_get_huge_zero_folio(NULL);
   202		if (!zero_folio)
   203			zero_folio = page_folio(ZERO_PAGE(0));
   204	
   205		while (nr_sects) {
   206			unsigned int nr_vecs = __blkdev_sectors_to_bio_pages(nr_sects);
   207			struct bio *bio;
   208	
   209			bio = bio_alloc(bdev, nr_vecs, REQ_OP_WRITE, gfp_mask);
   210			bio->bi_iter.bi_sector = sector;
   211	
   212			if ((flags & BLKDEV_ZERO_KILLABLE) &&
   213			    fatal_signal_pending(current))
   214				break;
   215	
   216			do {
   217				unsigned int len, added = 0;
   218	
   219				len = min_t(sector_t, folio_size(zero_folio),
   220					    nr_sects << SECTOR_SHIFT);
   221				if (bio_add_folio(bio, zero_folio, len, 0))
   222					added = len;
   223				if (added < len)
   224					break;
   225				nr_sects -= added >> SECTOR_SHIFT;
   226				sector += added >> SECTOR_SHIFT;
   227			} while (nr_sects);
   228	
   229			*biop = bio_chain_and_submit(*biop, bio);
   230			cond_resched();
   231		}
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
