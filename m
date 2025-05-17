Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226BB4B1E72;
	Sat, 17 May 2025 00:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747443348; cv=none; b=ewnhfE501sIKALVqFvKY93eBVEniS0Ti6Gpt415X7+QVsG1C0BcnBYRegCqFTYbVV6DG3YNwWvjPmGb6SRZJTG9t4Bl7VLamZKUbgRcPuNVDl8MS9QowFdWed2VrWyKNYvI+/ZEWUZwaOicCg6qwQ5tGWDRQ1bsKdodJ2szVIJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747443348; c=relaxed/simple;
	bh=RHhuhR+FP5u8M7v03KY8KIM+tNaWIiJTr7ZQW826tfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SM+EDtygjANeTzbA4062MFii3oErlnhrhVua8IlQkv2B0NVrfUmIlo7vAShzj2BZE99u27CsovlSmUHSiGQkWmf8fsAYTRxMfNg+H8IbFFkZ2vd9bHW7gTRYyMjb1wVlrh+Lw0AJoACIqEmYxZEAre+FUi2okpIdGMYEfKo0Ses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLNDxv1R; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLNDxv1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747443347; x=1778979347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHhuhR+FP5u8M7v03KY8KIM+tNaWIiJTr7ZQW826tfg=;
  b=fLNDxv1RVcvLgqpwH8dNKpXeOwwtZY4ZQkBQ30IaYDkwSzoEIoU2Pnxy
   7lFcIV0JTn415CkJmkUh4lOMPKOe9V5BpNC48YBhquzzQLTefyzPK4AlJ
   QFcgCopkWF5z1dq/C3XDCBg1FQi4O6xk7ySauKlGjoOXrqUvryRnbm/J7
   nL0yJBL3rk4iF88d1Au4SfTP2ZdF2X+fyAoMtqkWFtGNNS86wH3XqSYH3
   7abMN/jiFPxq5dx4PhDopxrY7+bP/dVOI+9NQPO8MRfP85JOJLpJBVrqV
   XDQWUgK3eFyUQOOfnJvu+Ep8PFHTn1vUPzVBW8d+FtYbvRDMb2tGV9tVn
   A==;
X-CSE-ConnectionGUID: 5rZGmX+ESKGSC8kz3ylx7g==
X-CSE-MsgGUID: qrA5O1eISteszV9ZOTjpSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49301251"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49301251"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 17:55:46 -0700
X-CSE-ConnectionGUID: mKpPBynuRC2gS4co1ezakg==
X-CSE-MsgGUID: zAys8K5eR/eJ7KGEnAU69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143959535"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 May 2025 17:55:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG5q3-000JpT-0Z;
	Sat, 17 May 2025 00:55:43 +0000
Date: Sat, 17 May 2025 08:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] block: use LARGE_ZERO_PAGE in
 __blkdev_issue_zero_pages()
Message-ID: <202505170820.pZo55E1i-lkp@intel.com>
References: <20250516101054.676046-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516101054.676046-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 9e619cd4fefd19cdce16e169d5827bc64ae01aa1]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/mm-add-large-zero-page-for-efficient-zeroing-of-larger-segments/20250516-181327
base:   9e619cd4fefd19cdce16e169d5827bc64ae01aa1
patch link:    https://lore.kernel.org/r/20250516101054.676046-3-p.raghav%40samsung.com
patch subject: [RFC 2/3] block: use LARGE_ZERO_PAGE in __blkdev_issue_zero_pages()
config: arm-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170820.pZo55E1i-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170820.pZo55E1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170820.pZo55E1i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-lib.c:214:5: error: use of undeclared identifier 'ZERO_LARGE_PAGE_SIZE'
     214 |                                 ZERO_LARGE_PAGE_SIZE, nr_sects << SECTOR_SHIFT);
         |                                 ^
>> block/blk-lib.c:215:30: error: call to undeclared function 'ZERO_LARGE_PAGE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |                         added = bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
         |                                                   ^
>> block/blk-lib.c:215:30: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
     215 |                         added = bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
         |                                                   ^~~~~~~~~~~~~~~~~~
   include/linux/bio.h:412:61: note: passing argument to parameter 'page' here
     412 | int __must_check bio_add_page(struct bio *bio, struct page *page, unsigned len,
         |                                                             ^
   3 errors generated.


vim +/ZERO_LARGE_PAGE_SIZE +214 block/blk-lib.c

   194	
   195	static void __blkdev_issue_zero_pages(struct block_device *bdev,
   196			sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
   197			struct bio **biop, unsigned int flags)
   198	{
   199		while (nr_sects) {
   200			unsigned int nr_vecs = __blkdev_sectors_to_bio_pages(nr_sects);
   201			struct bio *bio;
   202	
   203			bio = bio_alloc(bdev, nr_vecs, REQ_OP_WRITE, gfp_mask);
   204			bio->bi_iter.bi_sector = sector;
   205	
   206			if ((flags & BLKDEV_ZERO_KILLABLE) &&
   207			    fatal_signal_pending(current))
   208				break;
   209	
   210			do {
   211				unsigned int len, added;
   212	
   213				len = min_t(sector_t,
 > 214					ZERO_LARGE_PAGE_SIZE, nr_sects << SECTOR_SHIFT);
 > 215				added = bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
   216				if (added < len)
   217					break;
   218				nr_sects -= added >> SECTOR_SHIFT;
   219				sector += added >> SECTOR_SHIFT;
   220			} while (nr_sects);
   221	
   222			*biop = bio_chain_and_submit(*biop, bio);
   223			cond_resched();
   224		}
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
