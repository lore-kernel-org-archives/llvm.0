Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED7342C8E;
	Tue, 10 Feb 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717976; cv=none; b=YWdR0eG5GKQ89UJCNBZ4DpHLYLUjsNq6dYhgBVyWQveHUs/jKPNKBf9/wt3CXS2D6mlRqoSGWGRZS2ignMNWixNcKStbxPwZsB01zPl8Kk278oqeLdhkIvruYtOJuXTdD/sEgDonG+pv3rnTFdT7K6NNvB2+ETLMFD/wHWzBaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717976; c=relaxed/simple;
	bh=pMUlj+I3r+8ptGO6cf4cj9SZRwUiGcoGumlMsLvNtb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XIFJ0or2FnN3sxAPMBI7NtTOQQ+Q4cfggz6BkEpXSD/9kDKa3Jh2dS+5uV3fNQXBZCz0lvQYYte9GntRPIfvNB9uMlKvdTYZspG8gSW54IvgupuYQ6whK8tln7f2OQ0ha0eNnsNYX0fM2rwCQPe+uy2eXv3SUtOoZd4tBGv3IZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAJOK0hB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAJOK0hB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770717974; x=1802253974;
  h=date:from:to:cc:subject:message-id;
  bh=pMUlj+I3r+8ptGO6cf4cj9SZRwUiGcoGumlMsLvNtb8=;
  b=MAJOK0hBADDwnLTj9Js4rSG1BhljrXzq8+lKsOf3ALp3ujzPod3MQj85
   /jETiVV0wRwaC8HJeBb45xp9ySChc+b2dn7iLEE5oigEQUBbYNC2xZk7Z
   fc6dhHRbHawu0DvP67/WcrVv91mzc52GVsS7RJsrSdWhX48mP/gcRpAy4
   LjdqIZMFugtHKpI+oBp7kBrHIsaZCtJjSzNnPG/LyaHt0jIB16akSbhQM
   Z7rk29J9Hf46aoaYFkpI8B3ZCtQ6Q2gTK5WKSyIF0ZWtcsA2iYykFG1w3
   g/Z1fA8GUX7kaCIJEASUNeWsDXA2D0Grkzv2eKZ+LV6Xt41QgEFnbdxNN
   w==;
X-CSE-ConnectionGUID: wShxijbWR+uu/22xwxs1+Q==
X-CSE-MsgGUID: v+pHheC2SZmZfzEsYLxKfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71912145"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71912145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 02:06:14 -0800
X-CSE-ConnectionGUID: vP1gnIWcQfSC3goAfYWh6Q==
X-CSE-MsgGUID: zzeSh2xKSvCJbRl6/NVgdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216389597"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2026 02:06:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpkdG-000000000lH-0y2D;
	Tue, 10 Feb 2026 10:06:10 +0000
Date: Tue, 10 Feb 2026 11:05:13 +0100
From: kernel test robot <lkp@intel.com>
To: Josh Hunt <johunt@akamai.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/md/raid10.c:1257:25: error: too few arguments to
 function call, expected 2, have 1
Message-ID: <202602101139.2LbolIlB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Josh-Hunt/md-raid10-fix-deadlock-with-check-operation-and-nowait-requests/20260210-135305
head:   4e9814d1943b0e9942e8804b8a4021b9f8897bff
commit: 4e9814d1943b0e9942e8804b8a4021b9f8897bff md/raid10: fix deadlock with check operation and nowait requests
date:   4 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260210/202602101139.2LbolIlB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101139.2LbolIlB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101139.2LbolIlB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/raid10.c:1257:25: error: too few arguments to function call, expected 2, have 1
    1257 |         raid_end_bio_io(r10_bio);
         |         ~~~~~~~~~~~~~~~        ^
   drivers/md/raid10.c:321:13: note: 'raid_end_bio_io' declared here
     321 | static void raid_end_bio_io(struct r10bio *r10_bio, bool adjust_pending)
         |             ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:1540:25: error: too few arguments to function call, expected 2, have 1
    1540 |         raid_end_bio_io(r10_bio);
         |         ~~~~~~~~~~~~~~~        ^
   drivers/md/raid10.c:321:13: note: 'raid_end_bio_io' declared here
     321 | static void raid_end_bio_io(struct r10bio *r10_bio, bool adjust_pending)
         |             ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1257 drivers/md/raid10.c

caea3c47ad5152 Guoqing Jiang     2018-12-07  1161  
bb5f1ed70bc3bb Robert LeBlanc    2016-12-05  1162  static void raid10_read_request(struct mddev *mddev, struct bio *bio,
820455238366a7 Yu Kuai           2023-06-22  1163  				struct r10bio *r10_bio, bool io_accounting)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1164  {
e879a8793f915a NeilBrown         2011-10-11  1165  	struct r10conf *conf = mddev->private;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1166  	struct bio *read_bio;
d4432c23be957f NeilBrown         2011-07-28  1167  	int max_sectors;
bb5f1ed70bc3bb Robert LeBlanc    2016-12-05  1168  	struct md_rdev *rdev;
545250f2480911 NeilBrown         2017-04-05  1169  	char b[BDEVNAME_SIZE];
545250f2480911 NeilBrown         2017-04-05  1170  	int slot = r10_bio->read_slot;
545250f2480911 NeilBrown         2017-04-05  1171  	struct md_rdev *err_rdev = NULL;
545250f2480911 NeilBrown         2017-04-05  1172  	gfp_t gfp = GFP_NOIO;
9b622e2bbcf049 Tomasz Majchrzak  2016-07-28  1173  
93decc563637c4 Kevin Vigor       2020-11-06  1174  	if (slot >= 0 && r10_bio->devs[slot].rdev) {
545250f2480911 NeilBrown         2017-04-05  1175  		/*
545250f2480911 NeilBrown         2017-04-05  1176  		 * This is an error retry, but we cannot
545250f2480911 NeilBrown         2017-04-05  1177  		 * safely dereference the rdev in the r10_bio,
545250f2480911 NeilBrown         2017-04-05  1178  		 * we must use the one in conf.
545250f2480911 NeilBrown         2017-04-05  1179  		 * If it has already been disconnected (unlikely)
545250f2480911 NeilBrown         2017-04-05  1180  		 * we lose the device name in error messages.
545250f2480911 NeilBrown         2017-04-05  1181  		 */
545250f2480911 NeilBrown         2017-04-05  1182  		int disk;
545250f2480911 NeilBrown         2017-04-05  1183  		/*
545250f2480911 NeilBrown         2017-04-05  1184  		 * As we are blocking raid10, it is a little safer to
545250f2480911 NeilBrown         2017-04-05  1185  		 * use __GFP_HIGH.
545250f2480911 NeilBrown         2017-04-05  1186  		 */
545250f2480911 NeilBrown         2017-04-05  1187  		gfp = GFP_NOIO | __GFP_HIGH;
545250f2480911 NeilBrown         2017-04-05  1188  
545250f2480911 NeilBrown         2017-04-05  1189  		disk = r10_bio->devs[slot].devnum;
a448af25becf4b Yu Kuai           2023-11-25  1190  		err_rdev = conf->mirrors[disk].rdev;
545250f2480911 NeilBrown         2017-04-05  1191  		if (err_rdev)
900d156bac2bc4 Christoph Hellwig 2022-07-13  1192  			snprintf(b, sizeof(b), "%pg", err_rdev->bdev);
545250f2480911 NeilBrown         2017-04-05  1193  		else {
545250f2480911 NeilBrown         2017-04-05  1194  			strcpy(b, "???");
545250f2480911 NeilBrown         2017-04-05  1195  			/* This never gets dereferenced */
545250f2480911 NeilBrown         2017-04-05  1196  			err_rdev = r10_bio->devs[slot].rdev;
545250f2480911 NeilBrown         2017-04-05  1197  		}
545250f2480911 NeilBrown         2017-04-05  1198  	}
856e08e23762df NeilBrown         2011-07-28  1199  
43806c3d5b9bb7 Nigel Croxon      2025-07-03  1200  	if (!regular_request_wait(mddev, conf, bio, r10_bio->sectors)) {
4e9814d1943b0e Josh Hunt         2026-02-10  1201  		raid_end_bio_io(r10_bio, false);
c9aa889b035fca Vishal Verma      2021-12-21  1202  		return;
43806c3d5b9bb7 Nigel Croxon      2025-07-03  1203  	}
43806c3d5b9bb7 Nigel Croxon      2025-07-03  1204  
96c3fd1f380237 NeilBrown         2011-12-23  1205  	rdev = read_balance(conf, r10_bio, &max_sectors);
96c3fd1f380237 NeilBrown         2011-12-23  1206  	if (!rdev) {
545250f2480911 NeilBrown         2017-04-05  1207  		if (err_rdev) {
545250f2480911 NeilBrown         2017-04-05  1208  			pr_crit_ratelimited("md/raid10:%s: %s: unrecoverable I/O read error for block %llu\n",
545250f2480911 NeilBrown         2017-04-05  1209  					    mdname(mddev), b,
545250f2480911 NeilBrown         2017-04-05  1210  					    (unsigned long long)r10_bio->sector);
545250f2480911 NeilBrown         2017-04-05  1211  		}
4e9814d1943b0e Josh Hunt         2026-02-10  1212  		raid_end_bio_io(r10_bio, true);
5a7bbad27a4103 Christoph Hellwig 2011-09-12  1213  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1214  	}
545250f2480911 NeilBrown         2017-04-05  1215  	if (err_rdev)
913cce5a1e588e Christoph Hellwig 2022-05-12  1216  		pr_err_ratelimited("md/raid10:%s: %pg: redirecting sector %llu to another mirror\n",
545250f2480911 NeilBrown         2017-04-05  1217  				   mdname(mddev),
913cce5a1e588e Christoph Hellwig 2022-05-12  1218  				   rdev->bdev,
545250f2480911 NeilBrown         2017-04-05  1219  				   (unsigned long long)r10_bio->sector);
fc9977dd069e4f NeilBrown         2017-04-05  1220  	if (max_sectors < bio_sectors(bio)) {
e820d55cb99dd9 Guoqing Jiang     2018-12-19  1221  		allow_barrier(conf);
6fc07785d9b892 Yu Kuai           2025-09-10  1222  		bio = bio_submit_split_bioset(bio, max_sectors,
6fc07785d9b892 Yu Kuai           2025-09-10  1223  					      &conf->bio_split);
c9aa889b035fca Vishal Verma      2021-12-21  1224  		wait_barrier(conf, false);
6fc07785d9b892 Yu Kuai           2025-09-10  1225  		if (!bio) {
6fc07785d9b892 Yu Kuai           2025-09-10  1226  			set_bit(R10BIO_Returned, &r10_bio->state);
4cf58d95290973 John Garry        2024-11-11  1227  			goto err_handle;
4cf58d95290973 John Garry        2024-11-11  1228  		}
22f166218f7313 Yu Kuai           2025-09-10  1229  
fc9977dd069e4f NeilBrown         2017-04-05  1230  		r10_bio->master_bio = bio;
fc9977dd069e4f NeilBrown         2017-04-05  1231  		r10_bio->sectors = max_sectors;
fc9977dd069e4f NeilBrown         2017-04-05  1232  	}
96c3fd1f380237 NeilBrown         2011-12-23  1233  	slot = r10_bio->read_slot;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1234  
820455238366a7 Yu Kuai           2023-06-22  1235  	if (io_accounting) {
820455238366a7 Yu Kuai           2023-06-22  1236  		md_account_bio(mddev, &bio);
820455238366a7 Yu Kuai           2023-06-22  1237  		r10_bio->master_bio = bio;
820455238366a7 Yu Kuai           2023-06-22  1238  	}
abfc426d1b2fb2 Christoph Hellwig 2022-02-02  1239  	read_bio = bio_alloc_clone(rdev->bdev, bio, gfp, &mddev->bio_set);
5fa31c49928139 Zheng Qixing      2025-07-02  1240  	read_bio->bi_opf &= ~REQ_NOWAIT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1241  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1242  	r10_bio->devs[slot].bio = read_bio;
abbf098e6e1e23 NeilBrown         2011-12-23  1243  	r10_bio->devs[slot].rdev = rdev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1244  
4f024f3797c43c Kent Overstreet   2013-10-11  1245  	read_bio->bi_iter.bi_sector = r10_bio->devs[slot].addr +
f8c9e74ff0832f NeilBrown         2012-05-21  1246  		choose_data_offset(r10_bio, rdev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1247  	read_bio->bi_end_io = raid10_end_read_request;
8d3ca83dcf9ca3 NeilBrown         2016-11-18  1248  	if (test_bit(FailFast, &rdev->flags) &&
8d3ca83dcf9ca3 NeilBrown         2016-11-18  1249  	    test_bit(R10BIO_FailFast, &r10_bio->state))
8d3ca83dcf9ca3 NeilBrown         2016-11-18  1250  	        read_bio->bi_opf |= MD_FAILFAST;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1251  	read_bio->bi_private = r10_bio;
c396b90e502691 Christoph Hellwig 2024-03-03  1252  	mddev_trace_remap(mddev, read_bio, r10_bio->sector);
ed00aabd5eb9fb Christoph Hellwig 2020-07-01  1253  	submit_bio_noacct(read_bio);
5a7bbad27a4103 Christoph Hellwig 2011-09-12  1254  	return;
4cf58d95290973 John Garry        2024-11-11  1255  err_handle:
4cf58d95290973 John Garry        2024-11-11  1256  	atomic_dec(&rdev->nr_pending);
4cf58d95290973 John Garry        2024-11-11 @1257  	raid_end_bio_io(r10_bio);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1258  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
