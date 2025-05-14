Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDB81805B;
	Wed, 14 May 2025 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747182792; cv=none; b=mftsKOV3rkxIZzuom5ksV57djA3hXUQMKItxdtCc+lzFeWcNBoBkmmNCXyRKftm/LgugwOcqFPX920JeC4TP+XmENYryEG89vnbpuqcWqGIDJLqFOjmfRMwh5I4GadBBqVodt13o1ehCk4Ev97hzypA+jxrQ1IAg7gp8+oOwL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747182792; c=relaxed/simple;
	bh=1vJvmLvi+mxlYx8WJgBTZ5zuIG9H+L1BmUSpkDVN5vc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPVgppXBA36MQfjfFIdYUbAL6iEOYpi15QLGHFbpL64TQOIx5mmZlvuwp9ERfQcMScDeL3XIurNnBMyUYfLvfWs/0LhNzJcBw9PGPUmOxuFD+ulojtcHSxtCwdZ3XRKdjb9dTvru9ZwAWXh6HIdHMS1qbS8V+2yEeVwXpzdOEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExIClnRY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExIClnRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747182789; x=1778718789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1vJvmLvi+mxlYx8WJgBTZ5zuIG9H+L1BmUSpkDVN5vc=;
  b=ExIClnRYzdmI09BCauC7JmxFla40APObUhzDAKFwDkSvLj0Vqks55iX+
   QxPyGrsXIl6ZSyJVc2PJZIoVvcjqupAapXaW6Iu17H4gWgie60r1+4kE9
   1MrZQSMgGkGaXOrBJ7bSLZq5CZIqR9ldng36P/ymUngCn02aOCxGzVS7J
   GgDrtphlqt0y/fSK/z8WWiYaa32NWSBaLh3AzA8MewkvTg850djmD7qU7
   VSOUYBwWHuwxf0qtybME9zWvo7Egg3BS3NqBKR/ueTD+yfKmjB4FF+PZH
   ivH1vij7+fVqCSxcshD/EIap6lvw2W6OUlilt3Fn8zgkTWPsi7Z6J1xZ8
   g==;
X-CSE-ConnectionGUID: v7iBMfWKSOWtVt/kml8neA==
X-CSE-MsgGUID: WxUCEa72Sw+pkYVx95079Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49129746"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="49129746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 17:33:08 -0700
X-CSE-ConnectionGUID: wCKlU88zRiSN0m9dKT4f/g==
X-CSE-MsgGUID: xV0xB62ASK+JA40ho1M0Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138387890"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2025 17:33:06 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF03U-00014M-10;
	Wed, 14 May 2025 00:33:04 +0000
Date: Wed, 14 May 2025 08:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Xiao Ni <xni@redhat.com>
Subject: [mdraid:md-6.16 9/9] drivers/md/raid10.c:2440:7: warning: variable
 'd' set but not used
Message-ID: <202505140829.IBSUJ1wx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mdraid/linux md-6.16
head:   752d0464b78a5b28682256ed7a057106119e1d1a
commit: 752d0464b78a5b28682256ed7a057106119e1d1a [9/9] md: clean up accounting for issued sync IO
config: mips-randconfig-2004-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140829.IBSUJ1wx-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140829.IBSUJ1wx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140829.IBSUJ1wx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/raid10.c:2440:7: warning: variable 'd' set but not used [-Wunused-but-set-variable]
    2440 |                 int d;
         |                     ^
   1 warning generated.


vim +/d +2440 drivers/md/raid10.c

5e5702898e93ee NeilBrown         2011-07-28  2325  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2326  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  2327   * Note: sync and recover and handled very differently for raid10
^1da177e4c3f41 Linus Torvalds    2005-04-16  2328   * This code is for resync.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2329   * For resync, we read through virtual addresses and read all blocks.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2330   * If there is any error, we schedule a write.  The lowest numbered
^1da177e4c3f41 Linus Torvalds    2005-04-16  2331   * drive is authoritative.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2332   * However requests come for physical address, so we need to map.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2333   * For every physical address there are raid_disks/copies virtual addresses,
^1da177e4c3f41 Linus Torvalds    2005-04-16  2334   * which is always are least one, but is not necessarly an integer.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2335   * This means that a physical address can span multiple chunks, so we may
^1da177e4c3f41 Linus Torvalds    2005-04-16  2336   * have to submit multiple io requests for a single sync request.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2337   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2338  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  2339   * We check if all blocks are in-sync and only write to blocks that
^1da177e4c3f41 Linus Torvalds    2005-04-16  2340   * aren't in sync
^1da177e4c3f41 Linus Torvalds    2005-04-16  2341   */
9f2c9d12bcc53f NeilBrown         2011-10-11  2342  static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2343  {
e879a8793f915a NeilBrown         2011-10-11  2344  	struct r10conf *conf = mddev->private;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2345  	int i, first;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2346  	struct bio *tbio, *fbio;
f4380a915823db majianpeng        2012-04-12  2347  	int vcnt;
cdb76be3156860 Ming Lei          2017-03-17  2348  	struct page **tpages, **fpages;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2349  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2350  	atomic_set(&r10_bio->remaining, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2351  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2352  	/* find the first device with a block */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2353  	for (i=0; i<conf->copies; i++)
4e4cbee93d5613 Christoph Hellwig 2017-06-03  2354  		if (!r10_bio->devs[i].bio->bi_status)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2355  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2356  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2357  	if (i == conf->copies)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2358  		goto done;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2359  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2360  	first = i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2361  	fbio = r10_bio->devs[i].bio;
cc57858831e3e9 Artur Paszkiewicz 2015-12-18  2362  	fbio->bi_iter.bi_size = r10_bio->sectors << 9;
cc57858831e3e9 Artur Paszkiewicz 2015-12-18  2363  	fbio->bi_iter.bi_idx = 0;
cdb76be3156860 Ming Lei          2017-03-17  2364  	fpages = get_resync_pages(fbio)->pages;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2365  
f4380a915823db majianpeng        2012-04-12  2366  	vcnt = (r10_bio->sectors + (PAGE_SIZE >> 9) - 1) >> (PAGE_SHIFT - 9);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2367  	/* now find blocks with errors */
0eb3ff12aa8a12 NeilBrown         2006-01-06  2368  	for (i=0 ; i < conf->copies ; i++) {
0eb3ff12aa8a12 NeilBrown         2006-01-06  2369  		int  j, d;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2370  		struct md_rdev *rdev;
f0250618361db1 Ming Lei          2017-03-17  2371  		struct resync_pages *rp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2372  
0eb3ff12aa8a12 NeilBrown         2006-01-06  2373  		tbio = r10_bio->devs[i].bio;
0eb3ff12aa8a12 NeilBrown         2006-01-06  2374  
0eb3ff12aa8a12 NeilBrown         2006-01-06  2375  		if (tbio->bi_end_io != end_sync_read)
0eb3ff12aa8a12 NeilBrown         2006-01-06  2376  			continue;
0eb3ff12aa8a12 NeilBrown         2006-01-06  2377  		if (i == first)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2378  			continue;
cdb76be3156860 Ming Lei          2017-03-17  2379  
cdb76be3156860 Ming Lei          2017-03-17  2380  		tpages = get_resync_pages(tbio)->pages;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2381  		d = r10_bio->devs[i].devnum;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2382  		rdev = conf->mirrors[d].rdev;
4e4cbee93d5613 Christoph Hellwig 2017-06-03  2383  		if (!r10_bio->devs[i].bio->bi_status) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2384  			/* We know that the bi_io_vec layout is the same for
^1da177e4c3f41 Linus Torvalds    2005-04-16  2385  			 * both 'first' and 'i', so we just compare them.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2386  			 * All vec entries are PAGE_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2387  			 */
7bb23c4934059c NeilBrown         2013-07-16  2388  			int sectors = r10_bio->sectors;
7bb23c4934059c NeilBrown         2013-07-16  2389  			for (j = 0; j < vcnt; j++) {
7bb23c4934059c NeilBrown         2013-07-16  2390  				int len = PAGE_SIZE;
7bb23c4934059c NeilBrown         2013-07-16  2391  				if (sectors < (len / 512))
7bb23c4934059c NeilBrown         2013-07-16  2392  					len = sectors * 512;
cdb76be3156860 Ming Lei          2017-03-17  2393  				if (memcmp(page_address(fpages[j]),
cdb76be3156860 Ming Lei          2017-03-17  2394  					   page_address(tpages[j]),
7bb23c4934059c NeilBrown         2013-07-16  2395  					   len))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2396  					break;
7bb23c4934059c NeilBrown         2013-07-16  2397  				sectors -= len/512;
7bb23c4934059c NeilBrown         2013-07-16  2398  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2399  			if (j == vcnt)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2400  				continue;
7f7583d420231b Jianpeng Ma       2012-10-11  2401  			atomic64_add(r10_bio->sectors, &mddev->resync_mismatches);
18f08819f42b64 NeilBrown         2006-01-06  2402  			if (test_bit(MD_RECOVERY_CHECK, &mddev->recovery))
18f08819f42b64 NeilBrown         2006-01-06  2403  				/* Don't fix anything. */
18f08819f42b64 NeilBrown         2006-01-06  2404  				continue;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2405  		} else if (test_bit(FailFast, &rdev->flags)) {
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2406  			/* Just give up on this device */
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2407  			md_error(rdev->mddev, rdev);
8d3ca83dcf9ca3 NeilBrown         2016-11-18  2408  			continue;
f84ee364dd15af NeilBrown         2011-07-28  2409  		}
f84ee364dd15af NeilBrown         2011-07-28  2410  		/* Ok, we need to write this bio, either to correct an
f84ee364dd15af NeilBrown         2011-07-28  2411  		 * inconsistency or to correct an unreadable block.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2412  		 * First we need to fixup bv_offset, bv_len and
^1da177e4c3f41 Linus Torvalds    2005-04-16  2413  		 * bi_vecs, as the read request might have corrupted these
^1da177e4c3f41 Linus Torvalds    2005-04-16  2414  		 */
f0250618361db1 Ming Lei          2017-03-17  2415  		rp = get_resync_pages(tbio);
a7c50c940477ba Christoph Hellwig 2022-01-24  2416  		bio_reset(tbio, conf->mirrors[d].rdev->bdev, REQ_OP_WRITE);
8be185f2c9d54d Kent Overstreet   2012-09-06  2417  
fb0eb5df093076 Ming Lei          2017-07-14  2418  		md_bio_reset_resync_pages(tbio, rp, fbio->bi_iter.bi_size);
fb0eb5df093076 Ming Lei          2017-07-14  2419  
f0250618361db1 Ming Lei          2017-03-17  2420  		rp->raid_bio = r10_bio;
f0250618361db1 Ming Lei          2017-03-17  2421  		tbio->bi_private = rp;
4f024f3797c43c Kent Overstreet   2013-10-11  2422  		tbio->bi_iter.bi_sector = r10_bio->devs[i].addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2423  		tbio->bi_end_io = end_sync_write;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2424  
c31df25f20e35a Kent Overstreet   2015-05-06  2425  		bio_copy_data(tbio, fbio);
c31df25f20e35a Kent Overstreet   2015-05-06  2426  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2427  		atomic_inc(&conf->mirrors[d].rdev->nr_pending);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2428  		atomic_inc(&r10_bio->remaining);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2429  
1919cbb23bf1b3 NeilBrown         2016-11-18  2430  		if (test_bit(FailFast, &conf->mirrors[d].rdev->flags))
1919cbb23bf1b3 NeilBrown         2016-11-18  2431  			tbio->bi_opf |= MD_FAILFAST;
4f024f3797c43c Kent Overstreet   2013-10-11  2432  		tbio->bi_iter.bi_sector += conf->mirrors[d].rdev->data_offset;
ed00aabd5eb9fb Christoph Hellwig 2020-07-01  2433  		submit_bio_noacct(tbio);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2434  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2435  
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2436  	/* Now write out to any replacement devices
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2437  	 * that are active
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2438  	 */
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2439  	for (i = 0; i < conf->copies; i++) {
c31df25f20e35a Kent Overstreet   2015-05-06 @2440  		int d;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2441  
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2442  		tbio = r10_bio->devs[i].repl_bio;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2443  		if (!tbio || !tbio->bi_end_io)
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2444  			continue;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2445  		if (r10_bio->devs[i].bio->bi_end_io != end_sync_write
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2446  		    && r10_bio->devs[i].bio != fbio)
c31df25f20e35a Kent Overstreet   2015-05-06  2447  			bio_copy_data(tbio, fbio);
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2448  		d = r10_bio->devs[i].devnum;
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2449  		atomic_inc(&r10_bio->remaining);
ed00aabd5eb9fb Christoph Hellwig 2020-07-01  2450  		submit_bio_noacct(tbio);
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2451  	}
9ad1aefc8ae8d2 NeilBrown         2011-12-23  2452  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2453  done:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2454  	if (atomic_dec_and_test(&r10_bio->remaining)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2455  		md_done_sync(mddev, r10_bio->sectors, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2456  		put_buf(r10_bio);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2457  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2458  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  2459  

:::::: The code at line 2440 was first introduced by commit
:::::: c31df25f20e35add6a453328c61eca15434fae18 md/raid10: make sync_request_write() call bio_copy_data()

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: NeilBrown <neilb@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
