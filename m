Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0123EA8A;
	Fri,  1 May 2026 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777636852; cv=none; b=ZhvRdgTV60q/7uI+fIHdSq4e+XFOgC2vdcPT7VP7ewK5B26KCnJXg0vTxolt+OYj54Tnwfe5ASZ+Uvusf5nZT61+9N+PllC4+JYxaUmm30Bd4JVkmspkEWfNXESSdJl6sNbPyqdSL6jmBVfiKEKirD3pZ5d7LULycscH4FLW/80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777636852; c=relaxed/simple;
	bh=kBJYaRHKJggk4WI92BX4FApuwhwB6qJmyfoLBqxQJvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bACGBVZ7oX3k+siRpvukQOsMUuE8GkmBfCg8EYQesvnhHDQIu971AKZnTbaoseoZESKvOkz7LWKVZC+DdfjExSzNpZwrgMwAwRhhGYCppCxmOKw061UBaunfrx3OUanlkFynjAobD9vznJJchsOl+wLt92g4s/PKh5ImeVjIMUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dO4G3WZx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dO4G3WZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777636851; x=1809172851;
  h=date:from:to:cc:subject:message-id;
  bh=kBJYaRHKJggk4WI92BX4FApuwhwB6qJmyfoLBqxQJvg=;
  b=dO4G3WZxNQ1b3Pzwne1hatYJZysQn7SZyOKnScI0s3eFUfZ4v+zGNdob
   p1Lhq/vQLwBdgWUTIMtpCR8wuLXe8yFJypkbmaBNa0NEvkM5UDaQGXYZO
   z4eByZb3D11kLrc7c8IgIZQTvxfGVDpTrL0Z54caSjqR3pr1WT34FNn24
   L2CaNg+/ny7ziShfHNwtKlCsZctMD0WhHgV1gC8Gwie44XRQlqBTzgbFv
   oxISUOL8WhuS8j4Mcg9VDKJviEcRsAegkx598F1KyfjqpbKsP97bj7DLG
   gQ662NR7hWPocW6zckTw5zJ3CryjbeXNwTlDisbGIQr5aF7nvwvdHttuE
   Q==;
X-CSE-ConnectionGUID: Zxd9MHDpS+GBhJHUA+Jcpg==
X-CSE-MsgGUID: otJUTxN/T32PXcezKeENPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66128810"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="66128810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 05:00:51 -0700
X-CSE-ConnectionGUID: /G4e3XtVT16MxeGuZ1esIA==
X-CSE-MsgGUID: jJhWVUh8Tx2cJHs+2p3pwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="230259378"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 May 2026 05:00:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wImY2-0000000052f-402z;
	Fri, 01 May 2026 12:00:46 +0000
Date: Fri, 01 May 2026 14:00:33 +0200
From: kernel test robot <lkp@intel.com>
To: Li kunyu <likunyu10@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: block/blk-merge.c:159:17: error: use of undeclared
 identifier 'split'
Message-ID: <202605011345.UrnDrlLs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Li-kunyu/block-blk-iolatency-Add-the-processing-flow-of-the-chained-bio-in-the-QoS-and-define-the-related-types-to-solve-the-prob/20260501-153918
head:   90baba948a48e0504a128c4068cbdcfd0bf4f61e
commit: 90baba948a48e0504a128c4068cbdcfd0bf4f61e block/blk-iolatency: Add the processing flow of the chained bio in the QoS and define the related types to solve the problem of incorrect inflight processing in the QoS. The usage of the done_split_bio abstract function in the blk-iolatency project.
date:   4 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260501/202605011345.UrnDrlLs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011345.UrnDrlLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011345.UrnDrlLs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-merge.c:159:17: error: use of undeclared identifier 'split'
     159 |                         bio_set_flag(split, BIO_QOS_CHAIN_CHILD);
         |                                      ^
>> block/blk-merge.c:168:1: error: function definition is not allowed here
     168 | {
         | ^
   block/blk-merge.c:203:1: error: function definition is not allowed here
     203 | {
         | ^
   block/blk-merge.c:216:1: error: function definition is not allowed here
     216 | {
         | ^
   block/blk-merge.c:237:1: error: function definition is not allowed here
     237 | {
         | ^
   block/blk-merge.c:291:1: error: function definition is not allowed here
     291 | {
         | ^
   block/blk-merge.c:316:1: error: function definition is not allowed here
     316 | {
         | ^
   block/blk-merge.c:324:1: error: function definition is not allowed here
     324 | {
         | ^
   block/blk-merge.c:343:1: error: function definition is not allowed here
     343 | {
         | ^
   block/blk-merge.c:429:1: error: function definition is not allowed here
     429 | {
         | ^
   block/blk-merge.c:444:1: error: function definition is not allowed here
     444 | {
         | ^
   block/blk-merge.c:456:1: error: function definition is not allowed here
     456 | {
         | ^
   block/blk-merge.c:486:1: error: function definition is not allowed here
     486 | {
         | ^
   block/blk-merge.c:494:1: error: function definition is not allowed here
     494 | {
         | ^
   block/blk-merge.c:528:1: error: function definition is not allowed here
     528 | {
         | ^
   block/blk-merge.c:550:1: error: function definition is not allowed here
     550 | {
         | ^
   block/blk-merge.c:580:1: error: function definition is not allowed here
     580 | {
         | ^
   block/blk-merge.c:599:1: error: function definition is not allowed here
     599 | {
         | ^
   block/blk-merge.c:618:1: error: function definition is not allowed here
     618 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/split +159 block/blk-merge.c

   142	
   143	static struct bio *bio_submit_split(struct bio *bio, int split_sectors)
   144	{
   145		if (unlikely(split_sectors < 0)) {
   146			bio->bi_status = errno_to_blk_status(split_sectors);
   147			bio_endio(bio);
   148			return NULL;
   149		}
   150	
   151		if (split_sectors) {
   152			bio = bio_submit_split_bioset(bio, split_sectors,
   153					&bio->bi_bdev->bd_disk->bio_split);
   154			if (bio) {
   155				bio->bi_opf |= REQ_NOMERGE;
   156				/* Fix the issue where the inflight statistics
   157				 * of the chained bio in the QoS are incorrect.
   158				 */
 > 159				bio_set_flag(split, BIO_QOS_CHAIN_CHILD);
   160		}
   161	
   162		return bio;
   163	}
   164	
   165	static struct bio *__bio_split_discard(struct bio *bio,
   166			const struct queue_limits *lim, unsigned *nsegs,
   167			unsigned int max_sectors)
 > 168	{
   169		unsigned int max_discard_sectors, granularity;
   170		sector_t tmp;
   171		unsigned split_sectors;
   172	
   173		*nsegs = 1;
   174	
   175		granularity = max(lim->discard_granularity >> 9, 1U);
   176	
   177		max_discard_sectors = min(max_sectors, bio_allowed_max_sectors(lim));
   178		max_discard_sectors -= max_discard_sectors % granularity;
   179		if (unlikely(!max_discard_sectors))
   180			return bio;
   181	
   182		if (bio_sectors(bio) <= max_discard_sectors)
   183			return bio;
   184	
   185		split_sectors = max_discard_sectors;
   186	
   187		/*
   188		 * If the next starting sector would be misaligned, stop the discard at
   189		 * the previous aligned sector.
   190		 */
   191		tmp = bio->bi_iter.bi_sector + split_sectors -
   192			((lim->discard_alignment >> 9) % granularity);
   193		tmp = sector_div(tmp, granularity);
   194	
   195		if (split_sectors > tmp)
   196			split_sectors -= tmp;
   197	
   198		return bio_submit_split(bio, split_sectors);
   199	}
   200	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
