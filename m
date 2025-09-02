Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2E23B0;
	Tue,  2 Sep 2025 03:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756782149; cv=none; b=CHjmwflhXXcG+j92ZPm4VOa4qXJbtRfJeJGZqq9O1Fz9EFaKx/Qz1DL18e1bb81RUs3WyAyPRmR1KV0zn3h9qL6/J7hHwMzaV2vDfYBcV+xCoK80s8ethbDBwjf5SCu9xVCj+OrLjMGSWylPAQCrqLl4ChYHVPDxRGwfk1j2e2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756782149; c=relaxed/simple;
	bh=1Gh4BqMKqszZroZ6M2m0kcCxrk3b/eSwMhjntGGwUtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2NCyyB3ryNq3dm38QGafa3oCSQtHrZksJWRlwo7sVH2HtBgGyAYGREiQdgw3DNIIyFVEXZ85ZlTcxQKxJCqeLc5n8yPOfFtUUyPGfFqSawC4VXgn6zaTKu5plNmYSND3+3CsdWpkmUBtQ+1XFvkNbzJF+Rl+3w27zruOhxkUJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MO+f1OVG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MO+f1OVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756782147; x=1788318147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Gh4BqMKqszZroZ6M2m0kcCxrk3b/eSwMhjntGGwUtw=;
  b=MO+f1OVGh6T69jok9amrdlK5B1KyPSeAuIi6drtWTwxAIwkk9OyjGCnf
   QQSwst5jxcx8Z+pXMe2Usyg4B3uTjhauNbeKjm491mVKRAHMzkp/BDUAh
   uHcO8IzEkCw/Ke39Va4qfM6KMO7c0txD4TBnfv/bEEfB/Zww1L5M8UuDa
   keNrzR9PcKTJTp9IlIECKWuBpz7Yd81zBV7NZtt8ufU4pL/sa2ZButWdY
   kmZXURq4LVyBkxYKr2c7BF7rlmkxbnVy8aCtShT2fgQFZhYeGUVQ4lC8m
   CvvzCw/eyj/B/+L5ao1yMZs5XiegqTdskOXffKg8ol+5ygJVLALESuqrA
   w==;
X-CSE-ConnectionGUID: KRNOZM/AQ/K/coFf50Q9og==
X-CSE-MsgGUID: UDtItDogQUuoPm8giMCP2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58894613"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58894613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 20:02:26 -0700
X-CSE-ConnectionGUID: NTeTGezGRzW8J2udFwWO2w==
X-CSE-MsgGUID: dIH/17HRQsa3Uq9uWbJ+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202075857"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2025 20:02:25 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utHHc-0001Nj-0q;
	Tue, 02 Sep 2025 03:02:11 +0000
Date: Tue, 2 Sep 2025 11:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 11/15] md/md-linear: convert to use
 bio_submit_split_bioset()
Message-ID: <202509021006.fXvkxKHg-lkp@intel.com>
References: <20250901033220.42982-12-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901033220.42982-12-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/block-cleanup-bio_issue/20250901-114701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250901033220.42982-12-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC v3 11/15] md/md-linear: convert to use bio_submit_split_bioset()
config: i386-buildonly-randconfig-004-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021006.fXvkxKHg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021006.fXvkxKHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021006.fXvkxKHg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/md-linear.c:260:22: error: too many arguments to function call, expected 3, have 4
     259 |                 bio = bio_submit_split_bioset(bio, end_sector - bio_sector,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~
     260 |                                               GFP_NOIO, &mddev->bio_set);
         |                                                         ^~~~~~~~~~~~~~~
   include/linux/blkdev.h:1003:13: note: 'bio_submit_split_bioset' declared here
    1003 | struct bio *bio_submit_split_bioset(struct bio *bio, unsigned int split_sectors,
         |             ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1004 |                                     struct bio_set *bs);
         |                                     ~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +260 drivers/md/md-linear.c

127186cfb184ea Yu Kuai 2025-01-02  231  
127186cfb184ea Yu Kuai 2025-01-02  232  static bool linear_make_request(struct mddev *mddev, struct bio *bio)
127186cfb184ea Yu Kuai 2025-01-02  233  {
127186cfb184ea Yu Kuai 2025-01-02  234  	struct dev_info *tmp_dev;
127186cfb184ea Yu Kuai 2025-01-02  235  	sector_t start_sector, end_sector, data_offset;
127186cfb184ea Yu Kuai 2025-01-02  236  	sector_t bio_sector = bio->bi_iter.bi_sector;
127186cfb184ea Yu Kuai 2025-01-02  237  
127186cfb184ea Yu Kuai 2025-01-02  238  	if (unlikely(bio->bi_opf & REQ_PREFLUSH)
127186cfb184ea Yu Kuai 2025-01-02  239  	    && md_flush_request(mddev, bio))
127186cfb184ea Yu Kuai 2025-01-02  240  		return true;
127186cfb184ea Yu Kuai 2025-01-02  241  
127186cfb184ea Yu Kuai 2025-01-02  242  	tmp_dev = which_dev(mddev, bio_sector);
127186cfb184ea Yu Kuai 2025-01-02  243  	start_sector = tmp_dev->end_sector - tmp_dev->rdev->sectors;
127186cfb184ea Yu Kuai 2025-01-02  244  	end_sector = tmp_dev->end_sector;
127186cfb184ea Yu Kuai 2025-01-02  245  	data_offset = tmp_dev->rdev->data_offset;
127186cfb184ea Yu Kuai 2025-01-02  246  
127186cfb184ea Yu Kuai 2025-01-02  247  	if (unlikely(bio_sector >= end_sector ||
127186cfb184ea Yu Kuai 2025-01-02  248  		     bio_sector < start_sector))
127186cfb184ea Yu Kuai 2025-01-02  249  		goto out_of_bounds;
127186cfb184ea Yu Kuai 2025-01-02  250  
127186cfb184ea Yu Kuai 2025-01-02  251  	if (unlikely(is_rdev_broken(tmp_dev->rdev))) {
127186cfb184ea Yu Kuai 2025-01-02  252  		md_error(mddev, tmp_dev->rdev);
127186cfb184ea Yu Kuai 2025-01-02  253  		bio_io_error(bio);
127186cfb184ea Yu Kuai 2025-01-02  254  		return true;
127186cfb184ea Yu Kuai 2025-01-02  255  	}
127186cfb184ea Yu Kuai 2025-01-02  256  
127186cfb184ea Yu Kuai 2025-01-02  257  	if (unlikely(bio_end_sector(bio) > end_sector)) {
127186cfb184ea Yu Kuai 2025-01-02  258  		/* This bio crosses a device boundary, so we have to split it */
bb50131f159ad3 Yu Kuai 2025-09-01  259  		bio = bio_submit_split_bioset(bio, end_sector - bio_sector,
127186cfb184ea Yu Kuai 2025-01-02 @260  					      GFP_NOIO, &mddev->bio_set);
bb50131f159ad3 Yu Kuai 2025-09-01  261  		if (!bio) {
127186cfb184ea Yu Kuai 2025-01-02  262  			return true;
127186cfb184ea Yu Kuai 2025-01-02  263  		}
127186cfb184ea Yu Kuai 2025-01-02  264  	}
127186cfb184ea Yu Kuai 2025-01-02  265  
127186cfb184ea Yu Kuai 2025-01-02  266  	md_account_bio(mddev, &bio);
127186cfb184ea Yu Kuai 2025-01-02  267  	bio_set_dev(bio, tmp_dev->rdev->bdev);
127186cfb184ea Yu Kuai 2025-01-02  268  	bio->bi_iter.bi_sector = bio->bi_iter.bi_sector -
127186cfb184ea Yu Kuai 2025-01-02  269  		start_sector + data_offset;
127186cfb184ea Yu Kuai 2025-01-02  270  
127186cfb184ea Yu Kuai 2025-01-02  271  	if (unlikely((bio_op(bio) == REQ_OP_DISCARD) &&
127186cfb184ea Yu Kuai 2025-01-02  272  		     !bdev_max_discard_sectors(bio->bi_bdev))) {
127186cfb184ea Yu Kuai 2025-01-02  273  		/* Just ignore it */
127186cfb184ea Yu Kuai 2025-01-02  274  		bio_endio(bio);
127186cfb184ea Yu Kuai 2025-01-02  275  	} else {
127186cfb184ea Yu Kuai 2025-01-02  276  		if (mddev->gendisk)
127186cfb184ea Yu Kuai 2025-01-02  277  			trace_block_bio_remap(bio, disk_devt(mddev->gendisk),
127186cfb184ea Yu Kuai 2025-01-02  278  					      bio_sector);
127186cfb184ea Yu Kuai 2025-01-02  279  		mddev_check_write_zeroes(mddev, bio);
127186cfb184ea Yu Kuai 2025-01-02  280  		submit_bio_noacct(bio);
127186cfb184ea Yu Kuai 2025-01-02  281  	}
127186cfb184ea Yu Kuai 2025-01-02  282  	return true;
127186cfb184ea Yu Kuai 2025-01-02  283  
127186cfb184ea Yu Kuai 2025-01-02  284  out_of_bounds:
127186cfb184ea Yu Kuai 2025-01-02  285  	pr_err("md/linear:%s: make_request: Sector %llu out of bounds on dev %pg: %llu sectors, offset %llu\n",
127186cfb184ea Yu Kuai 2025-01-02  286  	       mdname(mddev),
127186cfb184ea Yu Kuai 2025-01-02  287  	       (unsigned long long)bio->bi_iter.bi_sector,
127186cfb184ea Yu Kuai 2025-01-02  288  	       tmp_dev->rdev->bdev,
127186cfb184ea Yu Kuai 2025-01-02  289  	       (unsigned long long)tmp_dev->rdev->sectors,
127186cfb184ea Yu Kuai 2025-01-02  290  	       (unsigned long long)start_sector);
127186cfb184ea Yu Kuai 2025-01-02  291  	bio_io_error(bio);
127186cfb184ea Yu Kuai 2025-01-02  292  	return true;
127186cfb184ea Yu Kuai 2025-01-02  293  }
127186cfb184ea Yu Kuai 2025-01-02  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
