Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402701;
	b=eJj19tL+ZiQo+ZNPyHtXwPYC9RPWlxqVwWuzmlFqqAVRbp17NGxYk4ZSFT0EnF7fL0kn
	 bVAcUBlRkJvUsbC5eXrZZbAjskIea6cHpsmPvdW5013snC7yMPb27O35c48IJs9XkxWsj
	 QTtNC/4hNngQzNNSD4SyGYKITuWzINrHOGhvRRM42GFI3U4fj6bYFgUmjQRlbB7K2cb22
	 Mvb48y5lshX9BTDXNAnH3KKyZzcBumXTyvV1OMtfZIX7Fm4UL/ZneuDATNex1Vlqjo4nz
	 75xaMjDgzlEln7KmqxL/BpRvDYf6oXQueIwZd5x2SSoXwNkMustBPvO2qIM871TZNSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402701;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4DNSVni+TDFeu44AM3HKbYFCTamnPvyreoAGzoU3pik=;
	b=hHE44IQNQcG1WeWynOzkG9ndx4a9K3w9Y79+BjpKuSt7qHdTxb49ck6QDK9pI+ZIf4IY
	 AK8vuT9WBh/cXMAXlP67zxIOHf1mLvRQOJkyQXEPPN2caMfih7jWmQh45JUcGJ0lAuhSg
	 +txStSoKq6vI4lpp1TCc9FUIu9xEFIfJ8VIusW+xxrpap4xEFGFG2ukBVbi4I6XzEEcUx
	 Se31vHzbRJbrRPENeP2pouNSazaMNSoZkuDa4dFSzTn6xQvtQTO8KSkXNagpOS3V2p+E0
	 53pj13zRIZ08D7YPkdC6XNcDVRyTkDtf+Hvp8poZqDyj+e7xXmjqfv40yRJq0hI/gmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YC8vLdr2;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE128606A331;
	Wed, 11 Nov 2026 13:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE128606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YC8vLdr2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794402701; x=1825938701;
  h=date:from:to:cc:subject:message-id;
  bh=gW2VlSUI3Hd1C7wm/LqyZm0fhN0CYsVs0huxiWQpaLU=;
  b=YC8vLdr2CEUZXwSsdU9awSV5BZpHyyoFGczhBnzFBh4d1M+Z58wbk3qn
   p1NITdvgEByj4AtzgkX+IKG2Qhrul282XIiOp0HA10zCTdxS23tiBX2RP
   6rDReOs55rQ2jcnHHBfzrCkIAs/b7AZD0tupQaaKv3wQeDAlVKaOoyWKK
   Zqk4zN9qTN57fReG3/HNR2msAziGotmNMmcnWTGVmRONPXnWKgjcnNF3g
   04ZzXo2JJ8MJkO/fBqyanRF0HLPZvXg3cW9i84OhvqludqXJvUIo1XJ3D
   2zIPjHFKAbfruwY+CmLWlJyORHgZr+VyVfIph1Gv+LJqmv7B9NA0K5b4e
   g==;
X-CSE-ConnectionGUID: eg6hP8MRTaqOOLCmnKuutg==
X-CSE-MsgGUID: 9/bz8emNRPmYdKWoEXXDTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3178829"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3178829"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:11:40 -0800
X-CSE-ConnectionGUID: 14wdTuZ5Qa+MCZ6ndGp5GA==
X-CSE-MsgGUID: 0DWFN5pPRdejsTf50jqJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8279803"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2026 05:11:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR86x-00000000yuR-1jH5;
	Wed, 11 Nov 2026 13:11:35 +0000
Date: Wed, 11 Nov 2026 21:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jan Kara <jack@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [linux-next:master 3495/6082] mm/shmem.c:1330:13: warning:
 stack frame size (1056) exceeds limit (1024) in 'shmem_undo_range'
Message-ID: <202611112032.TMyPU6Rm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
commit: b97fbd541ecba5d6640077618e9dfec6f5e71132 [3495/6082] mm/shmem: remove truncated folios from the page cache in batches
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20261111/202611112032.TMyPU6Rm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e73e336290028f26553b46c9fba844c13da38c9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611112032.TMyPU6Rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611112032.TMyPU6Rm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:1330:13: warning: stack frame size (1056) exceeds limit (1024) in 'shmem_undo_range' [-Wframe-larger-than]
    1330 | static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
         |             ^
   1 warning generated.


vim +/shmem_undo_range +1330 mm/shmem.c

71725ed10c4069 Hugh Dickins            2020-04-06  1325  
7a5d0fbb29936f Hugh Dickins            2011-08-03  1326  /*
7f4446eefe9fbb Matthew Wilcox          2017-12-04  1327   * Remove range of pages and swap entries from page cache, and free them.
1635f6a74152f1 Hugh Dickins            2012-05-29  1328   * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
7a5d0fbb29936f Hugh Dickins            2011-08-03  1329   */
37d369fa97cc07 Matthew Wilcox (Oracle  2025-11-23 @1330) static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
1635f6a74152f1 Hugh Dickins            2012-05-29  1331  								 bool unfalloc)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1332  {
285b2c4fdd69ea Hugh Dickins            2011-08-03  1333  	struct address_space *mapping = inode->i_mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1334  	struct shmem_inode_info *info = SHMEM_I(inode);
09cbfeaf1a5a67 Kiryl Shutsemau         2016-04-01  1335  	pgoff_t start = (lstart + PAGE_SIZE - 1) >> PAGE_SHIFT;
09cbfeaf1a5a67 Kiryl Shutsemau         2016-04-01  1336  	pgoff_t end = (lend + 1) >> PAGE_SHIFT;
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1337) 	struct folio_batch fbatch;
511f04aac469a3 Tal Zussman             2026-02-25  1338  	pgoff_t indices[FOLIO_BATCH_SIZE];
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1339) 	struct folio *folio;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1340) 	bool same_folio;
7a5d0fbb29936f Hugh Dickins            2011-08-03  1341  	long nr_swaps_freed = 0;
285b2c4fdd69ea Hugh Dickins            2011-08-03  1342  	pgoff_t index;
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1343  	int i;
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1344  
83e4fa9c16e4af Hugh Dickins            2012-05-29  1345  	if (lend == -1)
83e4fa9c16e4af Hugh Dickins            2012-05-29  1346  		end = -1;	/* unsigned, so actually very big */
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1347  
d144bf6205342a Hugh Dickins            2021-09-02  1348  	if (info->fallocend > start && info->fallocend <= end && !unfalloc)
d144bf6205342a Hugh Dickins            2021-09-02  1349  		info->fallocend = start;
d144bf6205342a Hugh Dickins            2021-09-02  1350  
51dcbdac28d4dd Matthew Wilcox (Oracle  2021-12-07  1351) 	folio_batch_init(&fbatch);
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1352  	index = start;
3392ca121872dd Vishal Moola (Oracle    2022-10-17  1353) 	while (index < end && find_lock_entries(mapping, &index, end - 1,
51dcbdac28d4dd Matthew Wilcox (Oracle  2021-12-07  1354) 			&fbatch, indices)) {
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1355  		struct folio_batch remove;
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1356  
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1357  		folio_batch_init(&remove);
51dcbdac28d4dd Matthew Wilcox (Oracle  2021-12-07  1358) 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1359) 			folio = fbatch.folios[i];
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1360  
7b774aab7941e1 Matthew Wilcox (Oracle  2021-12-03  1361) 			if (xa_is_value(folio)) {
1635f6a74152f1 Hugh Dickins            2012-05-29  1362  				if (unfalloc)
1635f6a74152f1 Hugh Dickins            2012-05-29  1363  					continue;
8a1968bd997f45 Kairui Song             2026-01-20  1364  				nr_swaps_freed += shmem_free_swap(mapping, indices[i],
8a1968bd997f45 Kairui Song             2026-01-20  1365  								  end - 1, folio);
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1366  				continue;
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1367  			}
7a5d0fbb29936f Hugh Dickins            2011-08-03  1368  
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1369  			if (!unfalloc || !folio_test_uptodate(folio)) {
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1370  				truncate_cleanup_folio(folio);
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1371  				folio_batch_add(&remove, folio);
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1372  			}
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1373  		}
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1374  		delete_from_page_cache_batch(mapping, &remove);
51dcbdac28d4dd Matthew Wilcox (Oracle  2021-12-07  1375) 		folio_batch_remove_exceptionals(&fbatch);
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1376  		for (i = 0; i < folio_batch_count(&fbatch); i++)
b97fbd541ecba5 Qiliang Yuan            2026-11-05  1377  			folio_unlock(fbatch.folios[i]);
51dcbdac28d4dd Matthew Wilcox (Oracle  2021-12-07  1378) 		folio_batch_release(&fbatch);
ebd1a08c192109 Breno Leitao            2026-09-18  1379  		cond_resched_tasks_rcu_qs();
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1380  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1381  
44bcabd70cf142 Hugh Dickins            2022-12-04  1382  	/*
44bcabd70cf142 Hugh Dickins            2022-12-04  1383  	 * When undoing a failed fallocate, we want none of the partial folio
44bcabd70cf142 Hugh Dickins            2022-12-04  1384  	 * zeroing and splitting below, but shall want to truncate the whole
44bcabd70cf142 Hugh Dickins            2022-12-04  1385  	 * folio when !uptodate indicates that it was added by this fallocate,
44bcabd70cf142 Hugh Dickins            2022-12-04  1386  	 * even when [lstart, lend] covers only a part of the folio.
44bcabd70cf142 Hugh Dickins            2022-12-04  1387  	 */
44bcabd70cf142 Hugh Dickins            2022-12-04  1388  	if (unfalloc)
44bcabd70cf142 Hugh Dickins            2022-12-04  1389  		goto whole_folios;
44bcabd70cf142 Hugh Dickins            2022-12-04  1390  
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1391) 	same_folio = (lstart >> PAGE_SHIFT) == (lend >> PAGE_SHIFT);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1392) 	folio = shmem_get_partial_folio(inode, lstart >> PAGE_SHIFT);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1393) 	if (folio) {
60a70e61430b2d Matthew Wilcox (Oracle  2025-10-24  1394) 		same_folio = lend < folio_next_pos(folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1395) 		folio_mark_dirty(folio);
ad274797936827 Zhang Yi                2026-09-28  1396  		truncate_inode_partial_folio(folio, lstart, lend, &start,
ad274797936827 Zhang Yi                2026-09-28  1397  					     same_folio ? &end : NULL);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1398) 		folio_unlock(folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1399) 		folio_put(folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1400) 		folio = NULL;
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1401  	}
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1402) 
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1403) 	if (!same_folio)
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1404) 		folio = shmem_get_partial_folio(inode, lend >> PAGE_SHIFT);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1405) 	if (folio) {
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1406) 		folio_mark_dirty(folio);
ad274797936827 Zhang Yi                2026-09-28  1407  		truncate_inode_partial_folio(folio, lstart, lend, NULL, &end);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1408) 		folio_unlock(folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1409) 		folio_put(folio);
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1410  	}
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1411  
44bcabd70cf142 Hugh Dickins            2022-12-04  1412  whole_folios:
44bcabd70cf142 Hugh Dickins            2022-12-04  1413  
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1414  	index = start;
b1a366500bd537 Hugh Dickins            2014-07-23  1415  	while (index < end) {
ebd1a08c192109 Breno Leitao            2026-09-18  1416  		cond_resched_tasks_rcu_qs();
0cd6144aadd2af Johannes Weiner         2014-04-03  1417  
9fb6beea79c6e7 Vishal Moola (Oracle    2022-10-17  1418) 		if (!find_get_entries(mapping, &index, end - 1, &fbatch,
cf2039af1a2eee Matthew Wilcox (Oracle  2021-02-25  1419) 				indices)) {
b1a366500bd537 Hugh Dickins            2014-07-23  1420  			/* If all gone or hole-punch or unfalloc, we're done */
b1a366500bd537 Hugh Dickins            2014-07-23  1421  			if (index == start || end != -1)
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1422  				break;
b1a366500bd537 Hugh Dickins            2014-07-23  1423  			/* But if truncating, restart to make sure all gone */
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1424  			index = start;
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1425  			continue;
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1426  		}
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1427) 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  1428) 			folio = fbatch.folios[i];
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1429  
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1430) 			if (xa_is_value(folio)) {
8a1968bd997f45 Kairui Song             2026-01-20  1431  				int order;
6ea0d1ccb11038 Daniel Gomez            2024-08-12  1432  				long swaps_freed;
6ea0d1ccb11038 Daniel Gomez            2024-08-12  1433  
1635f6a74152f1 Hugh Dickins            2012-05-29  1434  				if (unfalloc)
1635f6a74152f1 Hugh Dickins            2012-05-29  1435  					continue;
8a1968bd997f45 Kairui Song             2026-01-20  1436  				swaps_freed = shmem_free_swap(mapping, indices[i],
8a1968bd997f45 Kairui Song             2026-01-20  1437  							      end - 1, folio);
6ea0d1ccb11038 Daniel Gomez            2024-08-12  1438  				if (!swaps_freed) {
2030dddf95451b Kairui Song             2026-01-29  1439  					pgoff_t base = indices[i];
2030dddf95451b Kairui Song             2026-01-29  1440  
8a1968bd997f45 Kairui Song             2026-01-20  1441  					order = shmem_confirm_swap(mapping, indices[i],
8a1968bd997f45 Kairui Song             2026-01-20  1442  								   radix_to_swp_entry(folio));
2030dddf95451b Kairui Song             2026-01-29  1443  					/*
2030dddf95451b Kairui Song             2026-01-29  1444  					 * If found a large swap entry cross the end or start
2030dddf95451b Kairui Song             2026-01-29  1445  					 * border, skip it as the truncate_inode_partial_folio
2030dddf95451b Kairui Song             2026-01-29  1446  					 * above should have at least zerod its content once.
2030dddf95451b Kairui Song             2026-01-29  1447  					 */
2030dddf95451b Kairui Song             2026-01-29  1448  					if (order > 0) {
2030dddf95451b Kairui Song             2026-01-29  1449  						base = round_down(base, 1 << order);
2030dddf95451b Kairui Song             2026-01-29  1450  						if (base < start || base + (1 << order) > end)
8a1968bd997f45 Kairui Song             2026-01-20  1451  							continue;
2030dddf95451b Kairui Song             2026-01-29  1452  					}
2030dddf95451b Kairui Song             2026-01-29  1453  					/* Swap was replaced by page or extended, retry */
2030dddf95451b Kairui Song             2026-01-29  1454  					index = base;
b1a366500bd537 Hugh Dickins            2014-07-23  1455  					break;
b1a366500bd537 Hugh Dickins            2014-07-23  1456  				}
6ea0d1ccb11038 Daniel Gomez            2024-08-12  1457  				nr_swaps_freed += swaps_freed;
7a5d0fbb29936f Hugh Dickins            2011-08-03  1458  				continue;
7a5d0fbb29936f Hugh Dickins            2011-08-03  1459  			}
7a5d0fbb29936f Hugh Dickins            2011-08-03  1460  
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1461) 			folio_lock(folio);
800d8c63b2e989 Kiryl Shutsemau         2016-07-26  1462  
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1463) 			if (!unfalloc || !folio_test_uptodate(folio)) {
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1464) 				if (folio_mapping(folio) != mapping) {
b1a366500bd537 Hugh Dickins            2014-07-23  1465  					/* Page was replaced by swap: retry */
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1466) 					folio_unlock(folio);
9fb6beea79c6e7 Vishal Moola (Oracle    2022-10-17  1467) 					index = indices[i];
b1a366500bd537 Hugh Dickins            2014-07-23  1468  					break;
7a5d0fbb29936f Hugh Dickins            2011-08-03  1469  				}
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1470) 				VM_BUG_ON_FOLIO(folio_test_writeback(folio),
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1471) 						folio);
55ac8bbe358bdd David Stevens           2023-04-18  1472  
55ac8bbe358bdd David Stevens           2023-04-18  1473  				if (!folio_test_large(folio)) {
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1474) 					truncate_inode_folio(mapping, folio);
ad274797936827 Zhang Yi                2026-09-28  1475  				} else if (truncate_inode_partial_folio(folio,
ad274797936827 Zhang Yi                2026-09-28  1476  						lstart, lend, NULL, NULL)) {
55ac8bbe358bdd David Stevens           2023-04-18  1477  					/*
55ac8bbe358bdd David Stevens           2023-04-18  1478  					 * If we split a page, reset the loop so
55ac8bbe358bdd David Stevens           2023-04-18  1479  					 * that we pick up the new sub pages.
55ac8bbe358bdd David Stevens           2023-04-18  1480  					 * Otherwise the THP was entirely
55ac8bbe358bdd David Stevens           2023-04-18  1481  					 * dropped or the target range was
55ac8bbe358bdd David Stevens           2023-04-18  1482  					 * zeroed, so just continue the loop as
55ac8bbe358bdd David Stevens           2023-04-18  1483  					 * is.
55ac8bbe358bdd David Stevens           2023-04-18  1484  					 */
55ac8bbe358bdd David Stevens           2023-04-18  1485  					if (!folio_test_large(folio)) {
55ac8bbe358bdd David Stevens           2023-04-18  1486  						folio_unlock(folio);
55ac8bbe358bdd David Stevens           2023-04-18  1487  						index = start;
55ac8bbe358bdd David Stevens           2023-04-18  1488  						break;
55ac8bbe358bdd David Stevens           2023-04-18  1489  					}
55ac8bbe358bdd David Stevens           2023-04-18  1490  				}
1635f6a74152f1 Hugh Dickins            2012-05-29  1491  			}
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1492) 			folio_unlock(folio);
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1493  		}
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1494) 		folio_batch_remove_exceptionals(&fbatch);
0e499ed3d7a216 Matthew Wilcox (Oracle  2020-09-01  1495) 		folio_batch_release(&fbatch);
bda97eab0cc9c6 Hugh Dickins            2011-08-03  1496  	}
94c1e62df4494b Hugh Dickins            2011-06-27  1497  
3c1b7528d8969a Hugh Dickins            2023-08-03  1498  	shmem_recalc_inode(inode, 0, -nr_swaps_freed);
1635f6a74152f1 Hugh Dickins            2012-05-29  1499  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1500  

:::::: The code at line 1330 was first introduced by commit
:::::: 37d369fa97cc0774ea4eab726d16bcb5fbe3a104 fs: Add uoff_t

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
