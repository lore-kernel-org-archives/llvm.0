Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D005BFBE;
	Mon, 18 Dec 2023 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+0BAugT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702915655; x=1734451655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWLzx5NW4r06kIV4xDr3qPvWDu/nR6Sy07HNHq0oZcI=;
  b=E+0BAugT33qDdMz/UZoQVVoFQFRwckTRQt9sPP8jZDFGb1hNgiqXx45X
   KDSlh6z/qbaOez4Vt2b+cVwafS69KcFxPo+j/CZokNmdnzMVyP5NGr02L
   hxzYDltv4lJ5O1xziVF/pJqYBqAZ5l3F9K+PzyeS5oM+upjMMOkh+99YM
   qBcTVyDxJM5Ut7kxwH0Up5AS68Y6JTVxMH894aPlYUyjENvaxLT/NKEJc
   Uh+aFd7Ysip5/QmeBpxFuO+klZHDxMeY4EymeSpOaMyE44dK8O98ut1N5
   J4kIMtHf8jB34+6uF8QcmskZ+jLG83TamfGozrxE/6sFQ+mlvyVW8D4hh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="426660157"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="426660157"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 08:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="845992548"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="845992548"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2023 08:07:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFG9T-0004Hj-05;
	Mon, 18 Dec 2023 16:07:31 +0000
Date: Tue, 19 Dec 2023 00:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:mq-deadline 4/4] block/mq-deadline.c:222:16: error: call
 to undeclared function 'blk_rq_zone_no'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202312190011.JYlG3HVC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux mq-deadline
head:   f1201b17a2fec011e8cdd6be24a413a5693941b7
commit: f1201b17a2fec011e8cdd6be24a413a5693941b7 [4/4] block/mq-deadline: Prevent zoned write reordering due to I/O prioritization
config: i386-randconfig-016-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190011.JYlG3HVC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190011.JYlG3HVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190011.JYlG3HVC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/mq-deadline.c:222:16: error: call to undeclared function 'blk_rq_zone_no'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   while (rq && blk_rq_zone_no(rq) == zno) {
                                ^
   1 error generated.


vim +/blk_rq_zone_no +222 block/mq-deadline.c

   204	
   205	/*
   206	 * If any sequential write requests are pending for the zone containing @pos,
   207	 * return the I/O priority for these write requests.
   208	 */
   209	static enum dd_prio dd_zone_prio(struct deadline_data *dd,
   210					 struct block_device *bdev, sector_t pos)
   211	{
   212		struct gendisk *disk = bdev->bd_disk;
   213		const unsigned int zno = disk_zone_no(disk, pos);
   214		enum dd_prio prio;
   215	
   216		pos -= bdev_offset_from_zone_start(bdev, pos);
   217		for (prio = DD_PRIO_MIN; prio <= DD_PRIO_MAX; prio++) {
   218			struct dd_per_prio *per_prio = &dd->per_prio[prio];
   219			struct request *rq;
   220	
   221			rq = deadline_first_rq_past_pos(per_prio, DD_WRITE, pos);
 > 222			while (rq && blk_rq_zone_no(rq) == zno) {
   223				struct rb_node *node;
   224	
   225				if (blk_rq_is_seq_zoned_write(rq))
   226					return prio;
   227				node = rb_next(&rq->rb_node);
   228				if (!node)
   229					break;
   230				rq = rb_entry_rq(node);
   231			}
   232		}
   233		return DD_INVALID_PRIO;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
