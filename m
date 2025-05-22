Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4723496B;
	Thu, 22 May 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908273; cv=none; b=oabsjKefxANrrLSywUQnO3qFtRWElORPqu9sU1pJCHpqCwPt6qY6g3Han5dlTZKLa7uBnJnRSZdc+zFvLV2NMGEemNezWYzzMV/duJFxeNgY3PQeLXQvUuLFZhoRW6W9EZwIBbISgXyfY1VqqhqDI1NeEdv+jH7K5fRUxvwdLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908273; c=relaxed/simple;
	bh=e4q4USOWC4kTCG4oKZoJVELWm/zy32zGiu+uPJ8gBTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGY0lqG/LUQ6Cyg1fCLxr8qX3EW3yX6gDWJxeqbTfEOrz/bra5ZltKwZtiN7ZcFGDXQUjGBcDElmnzVTDpWDP1Tlz/1/QwnW1KILVsA49wjP2nluLG2C6inlZtnVY73XnQ9L6j1u2xhScVmmUI69CDwmknuaXGjQQktohdxV1IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuRWi9br; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuRWi9br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747908272; x=1779444272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e4q4USOWC4kTCG4oKZoJVELWm/zy32zGiu+uPJ8gBTs=;
  b=fuRWi9brYGbmaFN7oWDr0W7WTNq5XnbYIpSIMHjCXbJhYp/ZeKwp5mW1
   EGtmIj/uDW0S3JTlLqCE6iM33SGjzbTKyojACQlYfgDDqLV80TtXqeked
   +GsRrpNu9iKdKwe0RxHOBqGhwrUkfcE0YicwJcRCq9kRRo3SMIQZFo9M9
   xovKPSPx5VCzPejOYy6dzOEHiH2wyjkkOBM4DwTzuE8d0SxyTdXXJ1tqK
   RNjoQiFUTjwLohZzt8nxlHGo7QL9TFVRlA8Wj9PbqW3MWRLvbUIVebYN8
   BseH/y4Fu7S8MPfv5e0PbQGVyIY65U3+DHRJPCbfRHUWVOJXVQgtYc8F6
   w==;
X-CSE-ConnectionGUID: qIwWW+oTTGWSPwMPKf1gHA==
X-CSE-MsgGUID: yuWVfJAHRMOBTii021oe6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="52550905"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="52550905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 03:04:31 -0700
X-CSE-ConnectionGUID: ieyTy/dUQWixKmLebHzikw==
X-CSE-MsgGUID: U1D0mFTwRAiyRLHzWLKeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="177668686"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 May 2025 03:04:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI2mp-000PCW-29;
	Thu, 22 May 2025 10:04:27 +0000
Date: Thu, 22 May 2025 18:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/5] block: add support for copy offload
Message-ID: <202505221702.EcgNFozB-lkp@intel.com>
References: <20250521223107.709131-3-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521223107.709131-3-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20250521]
[cannot apply to linux-nvme/for-next brauner-vfs/vfs.all linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-new-sector-copy-api/20250522-063316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250521223107.709131-3-kbusch%40meta.com
patch subject: [PATCH 2/5] block: add support for copy offload
config: x86_64-buildonly-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221702.EcgNFozB-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221702.EcgNFozB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221702.EcgNFozB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-integrity.c:29:31: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      29 |         struct bio_vec iv, ivprv = { NULL };
         |                                      ^~~~
         |                                      {   }
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   block/blk-integrity.c:69:31: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      69 |         struct bio_vec iv, ivprv = { NULL };
         |                                      ^~~~
         |                                      {   }
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   2 warnings generated.


vim +29 block/blk-integrity.c

7ba1ba12eeef0a Martin K. Petersen 2008-06-30  18  
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  19  /**
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  20   * blk_rq_count_integrity_sg - Count number of integrity scatterlist elements
13f05c8d8e98bb Martin K. Petersen 2010-09-10  21   * @q:		request queue
13f05c8d8e98bb Martin K. Petersen 2010-09-10  22   * @bio:	bio with integrity metadata attached
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  23   *
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  24   * Description: Returns the number of elements required in a
13f05c8d8e98bb Martin K. Petersen 2010-09-10  25   * scatterlist corresponding to the integrity metadata in a bio.
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  26   */
13f05c8d8e98bb Martin K. Petersen 2010-09-10  27  int blk_rq_count_integrity_sg(struct request_queue *q, struct bio *bio)
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  28  {
d57a5f7c6605f1 Kent Overstreet    2013-11-23 @29  	struct bio_vec iv, ivprv = { NULL };
13f05c8d8e98bb Martin K. Petersen 2010-09-10  30  	unsigned int segments = 0;
13f05c8d8e98bb Martin K. Petersen 2010-09-10  31  	unsigned int seg_size = 0;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  32  	struct bvec_iter iter;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  33  	int prev = 0;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  34  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  35  	bio_for_each_integrity_vec(iv, bio, iter) {
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  36  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  37  		if (prev) {
3dccdae54fe836 Christoph Hellwig  2018-09-24  38  			if (!biovec_phys_mergeable(q, &ivprv, &iv))
13f05c8d8e98bb Martin K. Petersen 2010-09-10  39  				goto new_segment;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  40  			if (seg_size + iv.bv_len > queue_max_segment_size(q))
13f05c8d8e98bb Martin K. Petersen 2010-09-10  41  				goto new_segment;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  42  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  43  			seg_size += iv.bv_len;
13f05c8d8e98bb Martin K. Petersen 2010-09-10  44  		} else {
13f05c8d8e98bb Martin K. Petersen 2010-09-10  45  new_segment:
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  46  			segments++;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  47  			seg_size = iv.bv_len;
13f05c8d8e98bb Martin K. Petersen 2010-09-10  48  		}
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  49  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  50  		prev = 1;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  51  		ivprv = iv;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  52  	}
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  53  
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  54  	return segments;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  55  }
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  56  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
