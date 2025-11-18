Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08E34A76F;
	Tue, 18 Nov 2025 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763461402; cv=none; b=kzFuAPfO4Hq/+PQkGOHj3Kem00Ejpj/GKxfIwPEgma7OL71uJDyNlH+UiLecEANUMN6eoU7V7FcM1oQllHtbFGT3sMbMXpfIOb9u8/rBf8LnyYn/Qq2Jv9Q/YojReMg6lRG/CW6SAiCPfqArQNxfOLJsAvqv5HsuDpsliscwAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763461402; c=relaxed/simple;
	bh=PLikIlX78X/3R3HeImgh6vrpIPfNlF4ctV3dPZO3h+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJweuS6wiie3xwE2mbWw0mAlUy7dWsh+gpt2GyOr5poAXuOjA49nnXn6IuT+rrwvWnN1IsnIGc3GsvD++VmRuKE6+bvMKVgIgJRyLb4/8UjQtMOd1bu0xnFlsCZYO2EOXDnIMShfJm6rklZqpCIpth1N4VMn/9cZiWO79NsjBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyQLSvBG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyQLSvBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763461396; x=1794997396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PLikIlX78X/3R3HeImgh6vrpIPfNlF4ctV3dPZO3h+I=;
  b=gyQLSvBGkzOCnOJVGMwY7Kf9w+1WNnUvr/89lsNNux9x6MQOYyjjRSoe
   op/levXwWBah3RoL3dv12yWlh3JN7mmwYzAzOlWdKh6DWfakRgBneia8U
   r5PsNJMVdKSVbBwp4RmQYH89oeJ6O75XBdoYyFGvX7QdBcS4MNNqulx61
   sdzLvStfxL57KHyh4cVXZDldEabPHb2amqYUqOhYxg3CGGIx1v7C6SZ+Z
   xFcxXStcmqd6sDpHWdYy/GPO4eGQSc88J1ULL6nM9lFkvw+0Ia2yesnQi
   FInEbV7Zx0JB541jqO40dEHYEY1EE+s/bRAQkwuBVY75uofdYAA2nQ+zH
   w==;
X-CSE-ConnectionGUID: 3OAtOLApRo+FLtK0ZABdGA==
X-CSE-MsgGUID: geHu5YvZTfSFQdwaSMSkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65520827"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65520827"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:23:14 -0800
X-CSE-ConnectionGUID: MaCUlIjTTtet2WLVQ5VOog==
X-CSE-MsgGUID: hnn2AZAbTJeKy0MVbUF6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190516353"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2025 02:23:13 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLIre-0001c3-2h;
	Tue, 18 Nov 2025 10:23:10 +0000
Date: Tue, 18 Nov 2025 18:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] block: change __blkdev_issue_discard() return type
 to void
Message-ID: <202511181802.T5QRN7xv-lkp@intel.com>
References: <20251118074243.636812-1-ckulkarnilinux@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118074243.636812-1-ckulkarnilinux@gmail.com>

Hi Chaitanya,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on device-mapper-dm/for-next jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev xfs-linux/for-next linus/master v6.18-rc6 next-20251118]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaitanya-Kulkarni/block-change-__blkdev_issue_discard-return-type-to-void/20251118-154435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20251118074243.636812-1-ckulkarnilinux%40gmail.com
patch subject: [RFC PATCH] block: change __blkdev_issue_discard() return type to void
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511181802.T5QRN7xv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181802.T5QRN7xv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181802.T5QRN7xv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-lib.c:93:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      93 |         if (bio) {
         |             ^~~
   block/blk-lib.c:101:9: note: uninitialized use occurs here
     101 |         return ret;
         |                ^~~
   block/blk-lib.c:93:2: note: remove the 'if' if its condition is always true
      93 |         if (bio) {
         |         ^~~~~~~~
   block/blk-lib.c:89:9: note: initialize the variable 'ret' to silence this warning
      89 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +93 block/blk-lib.c

    73	
    74	/**
    75	 * blkdev_issue_discard - queue a discard
    76	 * @bdev:	blockdev to issue discard for
    77	 * @sector:	start sector
    78	 * @nr_sects:	number of sectors to discard
    79	 * @gfp_mask:	memory allocation flags (for bio_alloc)
    80	 *
    81	 * Description:
    82	 *    Issue a discard request for the sectors in question.
    83	 */
    84	int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
    85			sector_t nr_sects, gfp_t gfp_mask)
    86	{
    87		struct bio *bio = NULL;
    88		struct blk_plug plug;
    89		int ret;
    90	
    91		blk_start_plug(&plug);
    92		__blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
  > 93		if (bio) {
    94			ret = submit_bio_wait(bio);
    95			if (ret == -EOPNOTSUPP)
    96				ret = 0;
    97			bio_put(bio);
    98		}
    99		blk_finish_plug(&plug);
   100	
   101		return ret;
   102	}
   103	EXPORT_SYMBOL(blkdev_issue_discard);
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
