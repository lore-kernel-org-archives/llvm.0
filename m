Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4510A2F7449;
	Sat, 10 Jan 2026 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768039550; cv=none; b=t0WSynmTQpqTejJHmVpVNE/B0krPEZFHwYGpZNRXsuTmyRNSX9T+TpjY6hWEC9QtrGiXm0KinyBw2z8I51X0x5X3xdbjc15gWbzt7IUumrVEHxUOxhRU6Oe8nawwehGRi4rZgTN6DehArJ1t9OPPkyeQsKCF85rYtcZ3JM2sJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768039550; c=relaxed/simple;
	bh=60cJyv7Y+c+EwrCoWCkfDPLrJaOUxtRh3GzNcTNjyD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ck0jHYRDsE2G9eEOl0XLwfBUzmbue0ff37lmrgnUsfMtO1SePhz2Yb7EC9xPAK6WEeFFUylW4umbMaOPkxyBi7aZxtA7ECe9FpEIlBrIO0yfIe++sGa+OEtZmmIoF7COOdoVl8QMESq1J7JHf6ejchoDSbNvlWk9G4q3NeDLBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvTVRy30; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvTVRy30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768039548; x=1799575548;
  h=date:from:to:cc:subject:message-id;
  bh=60cJyv7Y+c+EwrCoWCkfDPLrJaOUxtRh3GzNcTNjyD0=;
  b=bvTVRy30lin52YrsDzADlRz4V/ncaOu3Wfo/J8b1s/KN6x+IjIIa+xcr
   U1ZbsTw7u0wL87Apf+hi3JVN/Dn+zb0wGr8n6JKHlYxegiA+tu1ZjGZaP
   Ipa5Avv6PUlJLm13OFgQVXzt5SiIaPtQjR7aqk8PHTa17+ak99cJjPKdU
   1y2a9sFYwLCeK750eclo0PhHiE2fEaHx7WHX2PJvJP+nF80uHR78KhBSR
   S7SEZerZtOWijNU0dLYPTueOA0Nxbl4zjRovvMGzmRp/qdRHyH2LKEFNc
   c9fvoL8QG6NTnIh9dY62kjWJWOmBNOvyUc49DgHGRALSlwDMKzXkqJTo4
   g==;
X-CSE-ConnectionGUID: odxThwYjQyqVpVqk40Hnbg==
X-CSE-MsgGUID: sW63koDNT1CwX3LadfTzpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73256147"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="73256147"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 02:05:47 -0800
X-CSE-ConnectionGUID: VhgQ9F77RuiQEHEjd/emKg==
X-CSE-MsgGUID: q4QjCLnIQsKBcx/HdGxUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203961784"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jan 2026 02:05:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veVqp-000000008W8-26SS;
	Sat, 10 Jan 2026 10:05:43 +0000
Date: Sat, 10 Jan 2026 18:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 6/7] fs/f2fs/gc.c:1308:24: warning:
 unused variable 'mapping'
Message-ID: <202601101738.3ciVDvYY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   261bd0007c481171f11979ad38d62af7725d56df
commit: 09c857dcd4a0d1eced1e7caaaf0797e3579afd91 [6/7] f2fs: fix to avoid grabbing large folio in move_data_block()
config: s390-randconfig-002-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101738.3ciVDvYY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101738.3ciVDvYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101738.3ciVDvYY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/gc.c:1308:24: warning: unused variable 'mapping' [-Wunused-variable]
    1308 |         struct address_space *mapping = f2fs_is_cow_file(inode) ?
         |                               ^~~~~~~
   1 warning generated.
--
>> fs/f2fs/data.c:1274:24: warning: unused variable 'mapping' [-Wunused-variable]
    1274 |         struct address_space *mapping = inode->i_mapping;
         |                               ^~~~~~~
   1 warning generated.


vim +/mapping +1308 fs/f2fs/gc.c

6aa58d8ad20a33 Chao Yu                 2018-08-14  1300  
d4c759ee5faa51 Jaegeuk Kim             2017-09-05  1301  /*
d4c759ee5faa51 Jaegeuk Kim             2017-09-05  1302   * Move data block via META_MAPPING while keeping locked data page.
d4c759ee5faa51 Jaegeuk Kim             2017-09-05  1303   * This can be used to move blocks, aka LBAs, directly on disk.
d4c759ee5faa51 Jaegeuk Kim             2017-09-05  1304   */
48018b4cfd07dd Chao Yu                 2018-09-13  1305  static int move_data_block(struct inode *inode, block_t bidx,
2ef79ecb5e906d Chao Yu                 2018-05-07  1306  				int gc_type, unsigned int segno, int off)
4375a33664de17 Jaegeuk Kim             2015-04-23  1307  {
f18d0076933689 Sunmin Jeong            2024-07-10 @1308  	struct address_space *mapping = f2fs_is_cow_file(inode) ?
f18d0076933689 Sunmin Jeong            2024-07-10  1309  				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
4375a33664de17 Jaegeuk Kim             2015-04-23  1310  	struct f2fs_io_info fio = {
4375a33664de17 Jaegeuk Kim             2015-04-23  1311  		.sbi = F2FS_I_SB(inode),
39d787bec4f792 Chao Yu                 2017-09-29  1312  		.ino = inode->i_ino,
4375a33664de17 Jaegeuk Kim             2015-04-23  1313  		.type = DATA,
a912b54d3aaa01 Jaegeuk Kim             2017-05-10  1314  		.temp = COLD,
04d328defd0625 Mike Christie           2016-06-05  1315  		.op = REQ_OP_READ,
70fd76140a6cb6 Christoph Hellwig       2016-11-01  1316  		.op_flags = 0,
4375a33664de17 Jaegeuk Kim             2015-04-23  1317  		.encrypted_page = NULL,
2eae077e6e46f9 Chao Yu                 2023-02-02  1318  		.in_list = 0,
4375a33664de17 Jaegeuk Kim             2015-04-23  1319  	};
4375a33664de17 Jaegeuk Kim             2015-04-23  1320  	struct dnode_of_data dn;
4375a33664de17 Jaegeuk Kim             2015-04-23  1321  	struct f2fs_summary sum;
4375a33664de17 Jaegeuk Kim             2015-04-23  1322  	struct node_info ni;
e0b89d00ea9f84 Chao Yu                 2025-10-14  1323  	struct folio *folio, *mfolio, *efolio;
4356e48e64374c Chao Yu                 2016-02-23  1324  	block_t newaddr;
48018b4cfd07dd Chao Yu                 2018-09-13  1325  	int err = 0;
b0332a0f957ca8 Chao Yu                 2020-02-14  1326  	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
ac2d750b2043cb Weichao Guo             2021-03-17  1327  	int type = fio.sbi->am.atgc_enabled && (gc_type == BG_GC) &&
ac2d750b2043cb Weichao Guo             2021-03-17  1328  				(fio.sbi->gc_mode != GC_URGENT_HIGH) ?
093749e296e29a Chao Yu                 2020-08-04  1329  				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
4375a33664de17 Jaegeuk Kim             2015-04-23  1330  
4375a33664de17 Jaegeuk Kim             2015-04-23  1331  	/* do not read out */
09c857dcd4a0d1 Chao Yu                 2026-01-09  1332  	folio = f2fs_grab_non_large_folio(inode, bidx, false);
2a96ddcb4a5908 Matthew Wilcox (Oracle  2025-03-31  1333) 	if (IS_ERR(folio))
2a96ddcb4a5908 Matthew Wilcox (Oracle  2025-03-31  1334) 		return PTR_ERR(folio);
4375a33664de17 Jaegeuk Kim             2015-04-23  1335  
48018b4cfd07dd Chao Yu                 2018-09-13  1336  	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
48018b4cfd07dd Chao Yu                 2018-09-13  1337  		err = -ENOENT;
20614711286041 Yunlei He               2016-11-07  1338  		goto out;
48018b4cfd07dd Chao Yu                 2018-09-13  1339  	}
20614711286041 Yunlei He               2016-11-07  1340  
71419129625a50 Chao Yu                 2022-05-06  1341  	err = f2fs_gc_pinned_control(inode, gc_type, segno);
71419129625a50 Chao Yu                 2022-05-06  1342  	if (err)
1ad71a27124caf Jaegeuk Kim             2017-12-07  1343  		goto out;
1ad71a27124caf Jaegeuk Kim             2017-12-07  1344  
4375a33664de17 Jaegeuk Kim             2015-04-23  1345  	set_new_dnode(&dn, inode, NULL, NULL, 0);
4d57b86dd86404 Chao Yu                 2018-05-30  1346  	err = f2fs_get_dnode_of_data(&dn, bidx, LOOKUP_NODE);
4375a33664de17 Jaegeuk Kim             2015-04-23  1347  	if (err)
4375a33664de17 Jaegeuk Kim             2015-04-23  1348  		goto out;
4375a33664de17 Jaegeuk Kim             2015-04-23  1349  
08b39fbd597817 Chao Yu                 2015-10-08  1350  	if (unlikely(dn.data_blkaddr == NULL_ADDR)) {
2a96ddcb4a5908 Matthew Wilcox (Oracle  2025-03-31  1351) 		folio_clear_uptodate(folio);
48018b4cfd07dd Chao Yu                 2018-09-13  1352  		err = -ENOENT;
4375a33664de17 Jaegeuk Kim             2015-04-23  1353  		goto put_out;
08b39fbd597817 Chao Yu                 2015-10-08  1354  	}
08b39fbd597817 Chao Yu                 2015-10-08  1355  
08b39fbd597817 Chao Yu                 2015-10-08  1356  	/*
08b39fbd597817 Chao Yu                 2015-10-08  1357  	 * don't cache encrypted data into meta inode until previous dirty
08b39fbd597817 Chao Yu                 2015-10-08  1358  	 * data were writebacked to avoid racing between GC and flush.
08b39fbd597817 Chao Yu                 2015-10-08  1359  	 */
2a96ddcb4a5908 Matthew Wilcox (Oracle  2025-03-31  1360) 	f2fs_folio_wait_writeback(folio, DATA, true, true);
4375a33664de17 Jaegeuk Kim             2015-04-23  1361  
9bf1a3f7392749 Yunlong Song            2018-09-18  1362  	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
9bf1a3f7392749 Yunlong Song            2018-09-18  1363  
a9419b63bf4147 Jaegeuk Kim             2021-12-13  1364  	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni, false);
7735730d39d75e Chao Yu                 2018-07-17  1365  	if (err)
7735730d39d75e Chao Yu                 2018-07-17  1366  		goto put_out;
7735730d39d75e Chao Yu                 2018-07-17  1367  
4375a33664de17 Jaegeuk Kim             2015-04-23  1368  	/* read page */
d342b7adad71e5 Matthew Wilcox (Oracle  2025-07-08  1369) 	fio.folio = folio;
7a9d75481b85d5 Chao Yu                 2016-02-22  1370  	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
4375a33664de17 Jaegeuk Kim             2015-04-23  1371  
107a805de87ec0 Chao Yu                 2018-05-26  1372  	if (lfs_mode)
e4544b63a7ee49 Tim Murray              2022-01-07  1373  		f2fs_down_write(&fio.sbi->io_order_lock);
107a805de87ec0 Chao Yu                 2018-05-26  1374  
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1375) 	mfolio = f2fs_grab_cache_folio(META_MAPPING(fio.sbi),
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1376  					fio.old_blkaddr, false);
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1377) 	if (IS_ERR(mfolio)) {
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1378) 		err = PTR_ERR(mfolio);
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1379  		goto up_out;
d7cd3702ca95b1 Chao Yu                 2020-07-01  1380  	}
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1381  
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1382) 	fio.encrypted_page = folio_file_page(mfolio, fio.old_blkaddr);
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1383  
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1384) 	/* read source block in mfolio */
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1385) 	if (!folio_test_uptodate(mfolio)) {
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1386  		err = f2fs_submit_page_bio(&fio);
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1387  		if (err) {
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1388) 			f2fs_folio_put(mfolio, true);
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1389  			goto up_out;
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1390  		}
8b83ac81f4283a Chao Yu                 2020-04-16  1391  
34a23525601a16 Chao Yu                 2022-08-20  1392  		f2fs_update_iostat(fio.sbi, inode, FS_DATA_READ_IO,
34a23525601a16 Chao Yu                 2022-08-20  1393  							F2FS_BLKSIZE);
34a23525601a16 Chao Yu                 2022-08-20  1394  		f2fs_update_iostat(fio.sbi, NULL, FS_GDATA_READ_IO,
34a23525601a16 Chao Yu                 2022-08-20  1395  							F2FS_BLKSIZE);
8b83ac81f4283a Chao Yu                 2020-04-16  1396  
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1397) 		folio_lock(mfolio);
019a8912425e23 Chao Yu                 2025-05-23  1398  		if (unlikely(!is_meta_folio(mfolio) ||
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1399) 			     !folio_test_uptodate(mfolio))) {
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1400  			err = -EIO;
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1401) 			f2fs_folio_put(mfolio, true);
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1402  			goto up_out;
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1403  		}
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1404  	}
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1405  
cf7404036019fa Chao Yu                 2020-12-30  1406  	set_summary(&sum, dn.nid, dn.ofs_in_node, ni.version);
cf7404036019fa Chao Yu                 2020-12-30  1407  
cf7404036019fa Chao Yu                 2020-12-30  1408  	/* allocate block address */
7d009e048d7cfc Chao Yu                 2024-02-22  1409  	err = f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
093749e296e29a Chao Yu                 2020-08-04  1410  				&sum, type, NULL);
7d009e048d7cfc Chao Yu                 2024-02-22  1411  	if (err) {
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1412) 		f2fs_folio_put(mfolio, true);
7d009e048d7cfc Chao Yu                 2024-02-22  1413  		/* filesystem should shutdown, no need to recovery block */
7d009e048d7cfc Chao Yu                 2024-02-22  1414  		goto up_out;
7d009e048d7cfc Chao Yu                 2024-02-22  1415  	}
4356e48e64374c Chao Yu                 2016-02-23  1416  
e0b89d00ea9f84 Chao Yu                 2025-10-14  1417  	efolio = f2fs_filemap_get_folio(META_MAPPING(fio.sbi), newaddr,
e0b89d00ea9f84 Chao Yu                 2025-10-14  1418  					FGP_LOCK | FGP_CREAT, GFP_NOFS);
e0b89d00ea9f84 Chao Yu                 2025-10-14  1419  	if (IS_ERR(efolio)) {
e0b89d00ea9f84 Chao Yu                 2025-10-14  1420  		err = PTR_ERR(efolio);
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1421) 		f2fs_folio_put(mfolio, true);
4356e48e64374c Chao Yu                 2016-02-23  1422  		goto recover_block;
4356e48e64374c Chao Yu                 2016-02-23  1423  	}
4375a33664de17 Jaegeuk Kim             2015-04-23  1424  
e0b89d00ea9f84 Chao Yu                 2025-10-14  1425  	fio.encrypted_page = &efolio->page;
e0b89d00ea9f84 Chao Yu                 2025-10-14  1426  
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1427  	/* write target block */
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1428  	f2fs_wait_on_page_writeback(fio.encrypted_page, DATA, true, true);
6aa58d8ad20a33 Chao Yu                 2018-08-14  1429  	memcpy(page_address(fio.encrypted_page),
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1430) 				folio_address(mfolio), PAGE_SIZE);
c14b4562bc9bd7 Matthew Wilcox (Oracle  2025-03-31  1431) 	f2fs_folio_put(mfolio, true);
4e4f1eb9949b10 Chao Yu                 2023-12-10  1432  
d217b5cea488c0 Yi Sun                  2024-11-04  1433  	f2fs_invalidate_internal_cache(fio.sbi, fio.old_blkaddr, 1);
548aedac5128e4 Jaegeuk Kim             2015-07-13  1434  
8d64d365aed355 Chao Yu                 2018-12-12  1435  	set_page_dirty(fio.encrypted_page);
6282adbf932c22 Jaegeuk Kim             2015-07-25  1436  	if (clear_page_dirty_for_io(fio.encrypted_page))
6282adbf932c22 Jaegeuk Kim             2015-07-25  1437  		dec_page_count(fio.sbi, F2FS_DIRTY_META);
6282adbf932c22 Jaegeuk Kim             2015-07-25  1438  
548aedac5128e4 Jaegeuk Kim             2015-07-13  1439  	set_page_writeback(fio.encrypted_page);
4375a33664de17 Jaegeuk Kim             2015-04-23  1440  
04d328defd0625 Mike Christie           2016-06-05  1441  	fio.op = REQ_OP_WRITE;
70fd76140a6cb6 Christoph Hellwig       2016-11-01  1442  	fio.op_flags = REQ_SYNC;
4356e48e64374c Chao Yu                 2016-02-23  1443  	fio.new_blkaddr = newaddr;
fe16efe6a7952f Chao Yu                 2018-05-28  1444  	f2fs_submit_page_write(&fio);
4375a33664de17 Jaegeuk Kim             2015-04-23  1445  
34a23525601a16 Chao Yu                 2022-08-20  1446  	f2fs_update_iostat(fio.sbi, NULL, FS_GC_DATA_IO, F2FS_BLKSIZE);
b0af6d491a6b5f Chao Yu                 2017-08-02  1447  
f28b3434afb8bb Chao Yu                 2016-02-24  1448  	f2fs_update_data_blkaddr(&dn, newaddr);
91942321e4c9f8 Jaegeuk Kim             2016-05-20  1449  	set_inode_flag(inode, FI_APPEND_WRITE);
87161a2b0aed9e Jaegeuk Kim             2024-02-06  1450  
89c16629e3136f Yongpeng Yang           2025-10-27  1451  	f2fs_put_page(fio.encrypted_page, true);
4356e48e64374c Chao Yu                 2016-02-23  1452  recover_block:
4356e48e64374c Chao Yu                 2016-02-23  1453  	if (err)
4d57b86dd86404 Chao Yu                 2018-05-30  1454  		f2fs_do_replace_block(fio.sbi, &sum, newaddr, fio.old_blkaddr,
c5d02785c59dd8 Chao Yu                 2020-08-04  1455  							true, true, true);
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1456  up_out:
543b8c468f55f2 Jaegeuk Kim             2019-07-17  1457  	if (lfs_mode)
e4544b63a7ee49 Tim Murray              2022-01-07  1458  		f2fs_up_write(&fio.sbi->io_order_lock);
4375a33664de17 Jaegeuk Kim             2015-04-23  1459  put_out:
4375a33664de17 Jaegeuk Kim             2015-04-23  1460  	f2fs_put_dnode(&dn);
4375a33664de17 Jaegeuk Kim             2015-04-23  1461  out:
9609dd704725a4 Yongpeng Yang           2025-12-27  1462  	if (!folio_test_uptodate(folio))
9609dd704725a4 Yongpeng Yang           2025-12-27  1463  		__folio_set_dropbehind(folio);
9609dd704725a4 Yongpeng Yang           2025-12-27  1464  	folio_unlock(folio);
9609dd704725a4 Yongpeng Yang           2025-12-27  1465  	folio_end_dropbehind(folio);
9609dd704725a4 Yongpeng Yang           2025-12-27  1466  	folio_put(folio);
48018b4cfd07dd Chao Yu                 2018-09-13  1467  	return err;
4375a33664de17 Jaegeuk Kim             2015-04-23  1468  }
4375a33664de17 Jaegeuk Kim             2015-04-23  1469  

:::::: The code at line 1308 was first introduced by commit
:::::: f18d0076933689775fe7faeeb10ee93ff01be6ab f2fs: use meta inode for GC of COW file

:::::: TO: Sunmin Jeong <s_min.jeong@samsung.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
