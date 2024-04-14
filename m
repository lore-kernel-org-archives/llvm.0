Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507844384;
	Sun, 14 Apr 2024 20:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713128180; cv=none; b=UxKjtiaeEEi9dD9Cs8pI2Ka2YOZnV3Is/e2r3rrzV77KJ2haHhcjB/kpn518NR0//o4yLjZ+L/HJZKnzqOmRws818QY/hTeDz9ykiCom/oAtReigAqmsfzLh+qncXSoib2uUC8RCeUF+gx3zggZb6LP4cDjpCK74K+yeBoHCB7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713128180; c=relaxed/simple;
	bh=G6ZTaK5I6EnbMtE7exrluesraRN3icbG5hLbzTlIygo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKB9zW3JOZySqAofZryewhaXy2NE97jziU6riQOA1P94zs1uvu8of74zEiFZXTH4cWQCfUI/0RqZce0JBoTLmsDnhhnL5jpFV1GHa7Ve1SeYkYiLxnslkDSQH0K9CgBSlX/q4tCqTRV4m3SnslCgWLDoUxb6RCMedAVwWzCIwCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIGaDa4S; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIGaDa4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713128178; x=1744664178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6ZTaK5I6EnbMtE7exrluesraRN3icbG5hLbzTlIygo=;
  b=ZIGaDa4SN8Rp0se/IK/9vOzcAp6CYGAIOlTeWfWX7Fj/VvEvsE3Bv5oq
   U0go9ZQMxu6hKyvW/ErB5Es74RIm7AqWit3Oep0y3f7buQdtv9QnUdjwF
   eSCyDxSOkBDym969emvIdXzE/vB7lfzTo5UXUcyWa1T+X3PW07kF5JL7e
   cR0pTq3NCUUoon5sFmNeY+/BpJEMdPgltk/vp2Y/fgbMzc7Y/RfTsRplo
   ohPmQYzmGrtlbSW/JyLlGuTkXqjP6geOVaxR421nE58WnUXMr+1r1gr+1
   N/jDc3sRWj7sGiLthRJJiQDZMQDSArxDBB/b4B+6CDFCEEiGVRWuxrLpE
   g==;
X-CSE-ConnectionGUID: z69MtFzhTr62I9YNzM7iMA==
X-CSE-MsgGUID: FQLoVU0ASO2BlOOnCYXHBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8679726"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="8679726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 13:56:17 -0700
X-CSE-ConnectionGUID: ehPHQ2YQQN2iyPN1Mb7wcg==
X-CSE-MsgGUID: UTUz1emQTdeSAvEBndTVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="26398267"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Apr 2024 13:56:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw6tZ-0003oe-0N;
	Sun, 14 Apr 2024 20:56:13 +0000
Date: Mon, 15 Apr 2024 04:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Heinz Mauelshagen <heinzm@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:dm-buffered 7/17] drivers/md/dm-buffered-target.c:453:2:
 warning: label at end of compound statement is a C2x extension
Message-ID: <202404150402.CMiozTNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git dm-buffered
head:   28cac58f710bee429b166b4afb5a6450f88ba036
commit: 92101d4f7a11082735b25b2f473fb6804f519460 [7/17] dm buffered: test target buffering all I/O through dm-bufio
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240415/202404150402.CMiozTNP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404150402.CMiozTNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404150402.CMiozTNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-buffered-target.c:453:2: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
     453 |         }
         |         ^
   1 warning generated.


vim +453 drivers/md/dm-buffered-target.c

   408	
   409	/* Process I/O on a bio prefetching buffers on a single @bio in a worker. */
   410	static void _process_bio(struct work_struct *work)
   411	{
   412		struct buffered_c *bc = container_of(work, struct buffered_c, buffered_ws);
   413		struct bio *bio;
   414		bool queue, write;
   415		sector_t blocks, sectors, start, end;
   416	
   417		spin_lock(&bc->lock);
   418		bio = bio_list_pop(&bc->bios);
   419		spin_unlock(&bc->lock);
   420	
   421		if (!bio)
   422			return;
   423	
   424		write = false;
   425		start = _to_block(bc, bio->bi_iter.bi_sector);
   426	
   427		/* Prefetch read and partial write buffers */
   428		switch (bio_op(bio)) {
   429		case REQ_OP_READ:
   430			sectors = bio_end_sector(bio) - _to_sector(bc, start);
   431			blocks = _to_block(bc, sectors) + _sector_mod(bc, sectors) ? 1 : 0;
   432			dm_bufio_prefetch(bc->bufio, start, blocks);
   433			break;
   434		case REQ_OP_WRITE:
   435			write = true;
   436			/* Beware of partial block updates. */
   437			if (_sector_mod(bc, bio->bi_iter.bi_sector)) {
   438				dm_bufio_prefetch(bc->bufio, start, 1);
   439				atomic_inc(&bc->stats[S_PREFETCHED_WRITES]);
   440			}
   441			if (_sector_mod(bc, bio_end_sector(bio))) {
   442				end = _to_block(bc, bio_end_sector(bio));
   443				if (start != end) {
   444					dm_bufio_prefetch(bc->bufio, start, 1);
   445					atomic_inc(&bc->stats[S_PREFETCHED_WRITES]);
   446				}
   447			}
   448			break;
   449		case REQ_OP_WRITE_ZEROES:
   450			write = true;
   451			break;
   452		default:
 > 453		}
   454	
   455		__process_bio(bc, bio);
   456	
   457		/* Use spinlock here also as in map function to avoid any memory access reordering issues. */
   458		spin_lock(&bc->lock);
   459		queue = !bio_list_empty(&bc->bios);
   460		spin_unlock(&bc->lock);
   461	
   462		if (queue)
   463			queue_work(bc->buffered_wq, &bc->buffered_ws);
   464	
   465		/* Reschedule the flush thread in case of new write(s). */
   466		if (write)
   467			schedule_delayed_work(&bc->buffered_flush_ws, 2 * HZ);
   468	
   469		cond_resched();
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
