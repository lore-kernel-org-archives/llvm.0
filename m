Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78511803D;
	Tue, 14 May 2024 05:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715664323; cv=none; b=q6mh/+743FFBmrvgBqOJ4USPL6hSiWJJ5w8kDZETFrml72h45wIrFoN7JANNahc6zY42fOuLdPCDvUeU6GfDvSkQUXetrVFGOWMF930zAMYxD9J+C/VOezYxQ6s+K9bsHKmHTv+Q10MlwGqt2b/vLNPqeQzr/jB70/htOB+YaMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715664323; c=relaxed/simple;
	bh=byt6kIYZ/oquyiPx3MjISQctyQo+X9rbvWDAJ6WxGQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZCUdK6kmz/oUl+/7xaThgjYx3oIXPustzAq3BkypKa4TzytnQ/p/TQkp0Fc0RkY/8vv/RLTjIlYtqB1q2D1LzVdGZxgkChXP5EHPmAcwrXv8FkK+n1sz9Fpb7virx2TB/4nwHwYvsnsSoN5cmYvw5Giz4XT+FcWtV72fM1eXesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpDoNBHM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpDoNBHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715664321; x=1747200321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=byt6kIYZ/oquyiPx3MjISQctyQo+X9rbvWDAJ6WxGQQ=;
  b=QpDoNBHMUms0Y4wXmEaVVBLJvsWVKvR2HSI+JS+EUljYNz8prov5+mSj
   ojjvhrpjOwJF88+uhOHUNaMJkPnAwZoN7qxmRqI9KHZdrqmU9BwpFrsBU
   Qwp+matKttbAdnt8FT1iGnOpNJUB6n5tCzUZ0AtxXpjSZDqbZdnDXbqiN
   v34+4ssgFxb4CL7Vg8hg0XuKYqNtArfRlZzzPXJmQo9MFcJ5CfjregRQQ
   EwW6nnCkI1v7d7Zw6iosmMP5SU6rJtPUNKbyA0LRi7YHBcSSliWV63WRI
   XIfFQFG0SgIA9AgNYEpISX0gzqEodsMqgR1Nt7W8S6VjZzHMhV/TGriVb
   A==;
X-CSE-ConnectionGUID: 7y1OoBsyTNCnKaOzJxMJIQ==
X-CSE-MsgGUID: c7tgUEYsQSm5DqdNyYVj3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11483671"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11483671"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 22:25:20 -0700
X-CSE-ConnectionGUID: olZ9F7qQQkmqdx23yP3+Vg==
X-CSE-MsgGUID: StjEdz+qQZakear07gbCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="61392664"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 May 2024 22:25:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6kf6-000B74-01;
	Tue, 14 May 2024 05:25:16 +0000
Date: Tue, 14 May 2024 13:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:iomap.1 20/21] fs/btrfs/file.c:1380:37: error: use of
 undeclared identifier 'num_pages'
Message-ID: <202405141351.2ett3VIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux iomap.1
head:   18dabc17c9eeef85c6c8addf9fec377cfa3d685c
commit: 45eacf0a5df755882983e869171c18304be7dbfd [20/21] btrfs: carve out btrfs_buffered_iomap_begin from write path
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240514/202405141351.2ett3VIX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141351.2ett3VIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141351.2ett3VIX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/file.c:7:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/btrfs/file.c:1380:37: error: use of undeclared identifier 'num_pages'
    1380 |                         btrfs_drop_pages(fs_info, pages, num_pages, pos, copied);
         |                                                          ^
   fs/btrfs/file.c:1388:36: error: use of undeclared identifier 'num_pages'
    1388 |                 btrfs_drop_pages(fs_info, pages, num_pages, pos, copied);
         |                                                  ^
   1 warning and 2 errors generated.


vim +/num_pages +1380 fs/btrfs/file.c

45eacf0a5df755 Goldwyn Rodrigues  2024-05-10  1253  
e4af400a9c5081 Goldwyn Rodrigues  2018-06-17  1254  static noinline ssize_t btrfs_buffered_write(struct kiocb *iocb,
e4af400a9c5081 Goldwyn Rodrigues  2018-06-17  1255  					       struct iov_iter *i)
39279cc3d2704c Chris Mason        2007-06-12  1256  {
e4af400a9c5081 Goldwyn Rodrigues  2018-06-17  1257  	struct file *file = iocb->ki_filp;
c352370633400d Goldwyn Rodrigues  2020-09-24  1258  	loff_t pos;
496ad9aa8ef448 Al Viro            2013-01-23  1259  	struct inode *inode = file_inode(file);
41044b41ad2c8c David Sterba       2023-09-14  1260  	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
11c65dccf70be9 Josef Bacik        2010-05-23  1261  	struct page **pages = NULL;
7ee9e4405f264e Josef Bacik        2013-06-21  1262  	u64 release_bytes = 0;
d0215f3e5ebb58 Josef Bacik        2011-01-25  1263  	size_t num_written = 0;
d0215f3e5ebb58 Josef Bacik        2011-01-25  1264  	int nrptrs;
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1265  	int ret;
5e8b9ef30392bb Goldwyn Rodrigues  2020-09-24  1266  	loff_t old_isize = i_size_read(inode);
c352370633400d Goldwyn Rodrigues  2020-09-24  1267  	unsigned int ilock_flags = 0;
304e45acdb8f68 Stefan Roesch      2022-09-12  1268  	const bool nowait = (iocb->ki_flags & IOCB_NOWAIT);
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1269  	struct btrfs_iomap *bi = NULL;
c352370633400d Goldwyn Rodrigues  2020-09-24  1270  
304e45acdb8f68 Stefan Roesch      2022-09-12  1271  	if (nowait)
c352370633400d Goldwyn Rodrigues  2020-09-24  1272  		ilock_flags |= BTRFS_ILOCK_TRY;
c352370633400d Goldwyn Rodrigues  2020-09-24  1273  
29b6352b1494bd David Sterba       2022-10-27  1274  	ret = btrfs_inode_lock(BTRFS_I(inode), ilock_flags);
c352370633400d Goldwyn Rodrigues  2020-09-24  1275  	if (ret < 0)
c352370633400d Goldwyn Rodrigues  2020-09-24  1276  		return ret;
4b46fce23349bf Josef Bacik        2010-05-23  1277  
c352370633400d Goldwyn Rodrigues  2020-09-24  1278  	ret = generic_write_checks(iocb, i);
c352370633400d Goldwyn Rodrigues  2020-09-24  1279  	if (ret <= 0)
c352370633400d Goldwyn Rodrigues  2020-09-24  1280  		goto out;
c352370633400d Goldwyn Rodrigues  2020-09-24  1281  
c352370633400d Goldwyn Rodrigues  2020-09-24  1282  	ret = btrfs_write_check(iocb, i, ret);
c352370633400d Goldwyn Rodrigues  2020-09-24  1283  	if (ret < 0)
c352370633400d Goldwyn Rodrigues  2020-09-24  1284  		goto out;
c352370633400d Goldwyn Rodrigues  2020-09-24  1285  
c352370633400d Goldwyn Rodrigues  2020-09-24  1286  	pos = iocb->ki_pos;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1287  	nrptrs = min(DIV_ROUND_UP(iov_iter_count(i), PAGE_SIZE),
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1288  			PAGE_SIZE / (sizeof(struct page *)));
142349f541d0bb Wu Fengguang       2011-12-16  1289  	nrptrs = min(nrptrs, current->nr_dirtied_pause - current->nr_dirtied);
142349f541d0bb Wu Fengguang       2011-12-16  1290  	nrptrs = max(nrptrs, 8);
31e818fe7375d6 David Sterba       2015-02-20  1291  	pages = kmalloc_array(nrptrs, sizeof(struct page *), GFP_KERNEL);
c352370633400d Goldwyn Rodrigues  2020-09-24  1292  	if (!pages) {
c352370633400d Goldwyn Rodrigues  2020-09-24  1293  		ret = -ENOMEM;
c352370633400d Goldwyn Rodrigues  2020-09-24  1294  		goto out;
c352370633400d Goldwyn Rodrigues  2020-09-24  1295  	}
ab93dbecfba72b Chris Mason        2009-10-01  1296  
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1297  	bi = kzalloc(sizeof(struct btrfs_iomap), GFP_NOFS);
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1298  	if (!bi) {
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1299  		ret = -ENOMEM;
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1300  		goto out;
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1301  	}
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1302  
d0215f3e5ebb58 Josef Bacik        2011-01-25  1303  	while (iov_iter_count(i) > 0) {
7073017aeb98db Johannes Thumshirn 2018-12-05  1304  		size_t offset = offset_in_page(pos);
45eacf0a5df755 Goldwyn Rodrigues  2024-05-10  1305  		size_t sector_offset = pos & (fs_info->sectorsize - 1);
d0215f3e5ebb58 Josef Bacik        2011-01-25  1306  		size_t write_bytes = min(iov_iter_count(i),
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1307  					 nrptrs * (size_t)PAGE_SIZE -
8c2383c3dd2cb5 Chris Mason        2007-06-18  1308  					 offset);
d0215f3e5ebb58 Josef Bacik        2011-01-25  1309  		size_t dirty_pages;
d0215f3e5ebb58 Josef Bacik        2011-01-25  1310  		size_t copied;
2e78c927d79333 Chandan Rajendra   2016-01-21  1311  		size_t dirty_sectors;
2e78c927d79333 Chandan Rajendra   2016-01-21  1312  		size_t num_sectors;
39279cc3d2704c Chris Mason        2007-06-12  1313  
45eacf0a5df755 Goldwyn Rodrigues  2024-05-10  1314  		ret = btrfs_buffered_iomap_begin(inode, pos, write_bytes, bi);
45eacf0a5df755 Goldwyn Rodrigues  2024-05-10  1315  		if (ret < 0)
45eacf0a5df755 Goldwyn Rodrigues  2024-05-10  1316  			goto out;
376cc685cb3b43 Miao Xie           2013-12-10  1317  
ee22f0c4ec428e Zhao Lei           2016-01-06  1318  		copied = btrfs_copy_from_user(pos, write_bytes, pages, i);
b1bf862e9dad43 Chris Mason        2011-02-28  1319  
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1320  		num_sectors = BTRFS_BYTES_TO_BLKS(fs_info, bi->reserved_bytes);
56244ef151c3cd Chris Mason        2016-05-16  1321  		dirty_sectors = round_up(copied + sector_offset,
0b246afa62b0cf Jeff Mahoney       2016-06-22  1322  					fs_info->sectorsize);
0b246afa62b0cf Jeff Mahoney       2016-06-22  1323  		dirty_sectors = BTRFS_BYTES_TO_BLKS(fs_info, dirty_sectors);
56244ef151c3cd Chris Mason        2016-05-16  1324  
b1bf862e9dad43 Chris Mason        2011-02-28  1325  		/*
b1bf862e9dad43 Chris Mason        2011-02-28  1326  		 * if we have trouble faulting in the pages, fall
b1bf862e9dad43 Chris Mason        2011-02-28  1327  		 * back to one page at a time
b1bf862e9dad43 Chris Mason        2011-02-28  1328  		 */
b1bf862e9dad43 Chris Mason        2011-02-28  1329  		if (copied < write_bytes)
b1bf862e9dad43 Chris Mason        2011-02-28  1330  			nrptrs = 1;
b1bf862e9dad43 Chris Mason        2011-02-28  1331  
b6316429af7f36 Josef Bacik        2011-09-30  1332  		if (copied == 0) {
56244ef151c3cd Chris Mason        2016-05-16  1333  			dirty_sectors = 0;
b1bf862e9dad43 Chris Mason        2011-02-28  1334  			dirty_pages = 0;
b6316429af7f36 Josef Bacik        2011-09-30  1335  		} else {
ed6078f70335f1 David Sterba       2014-06-05  1336  			dirty_pages = DIV_ROUND_UP(copied + offset,
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1337  						   PAGE_SIZE);
b6316429af7f36 Josef Bacik        2011-09-30  1338  		}
914ee295af418e Xin Zhong          2010-12-09  1339  
2e78c927d79333 Chandan Rajendra   2016-01-21  1340  		if (num_sectors > dirty_sectors) {
8b8b08cbfb9021 Chris Mason        2016-07-19  1341  			/* release everything except the sectors we dirtied */
265fdfa6ce0a79 David Sterba       2020-07-01  1342  			release_bytes -= dirty_sectors << fs_info->sectorsize_bits;
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1343  			if (bi->metadata_only) {
691fa059673b3b Nikolay Borisov    2017-02-20  1344  				btrfs_delalloc_release_metadata(BTRFS_I(inode),
43b18595d6603c Qu Wenruo          2017-12-12  1345  							release_bytes, true);
485290a734f142 Qu Wenruo          2015-10-29  1346  			} else {
485290a734f142 Qu Wenruo          2015-10-29  1347  				u64 __pos;
485290a734f142 Qu Wenruo          2015-10-29  1348  
da17066c40472c Jeff Mahoney       2016-06-15  1349  				__pos = round_down(pos,
0b246afa62b0cf Jeff Mahoney       2016-06-22  1350  						   fs_info->sectorsize) +
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1351  					(dirty_pages << PAGE_SHIFT);
86d52921a2ba51 Nikolay Borisov    2020-06-03  1352  				btrfs_delalloc_release_space(BTRFS_I(inode),
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1353  						bi->data_reserved, __pos,
43b18595d6603c Qu Wenruo          2017-12-12  1354  						release_bytes, true);
914ee295af418e Xin Zhong          2010-12-09  1355  			}
485290a734f142 Qu Wenruo          2015-10-29  1356  		}
914ee295af418e Xin Zhong          2010-12-09  1357  
2e78c927d79333 Chandan Rajendra   2016-01-21  1358  		release_bytes = round_up(copied + sector_offset,
0b246afa62b0cf Jeff Mahoney       2016-06-22  1359  					fs_info->sectorsize);
376cc685cb3b43 Miao Xie           2013-12-10  1360  
088545f6e44260 Nikolay Borisov    2020-06-03  1361  		ret = btrfs_dirty_pages(BTRFS_I(inode), pages,
088545f6e44260 Nikolay Borisov    2020-06-03  1362  					dirty_pages, pos, copied,
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1363  					&bi->cached_state, bi->metadata_only);
c67d970f0ea8dc Filipe Manana      2019-09-30  1364  
c67d970f0ea8dc Filipe Manana      2019-09-30  1365  		/*
c67d970f0ea8dc Filipe Manana      2019-09-30  1366  		 * If we have not locked the extent range, because the range's
c67d970f0ea8dc Filipe Manana      2019-09-30  1367  		 * start offset is >= i_size, we might still have a non-NULL
c67d970f0ea8dc Filipe Manana      2019-09-30  1368  		 * cached extent state, acquired while marking the extent range
c67d970f0ea8dc Filipe Manana      2019-09-30  1369  		 * as delalloc through btrfs_dirty_pages(). Therefore free any
c67d970f0ea8dc Filipe Manana      2019-09-30  1370  		 * possible cached extent state to avoid a memory leak.
c67d970f0ea8dc Filipe Manana      2019-09-30  1371  		 */
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1372  		if (bi->extents_locked)
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1373  			unlock_extent(&BTRFS_I(inode)->io_tree, bi->lockstart,
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1374  				      bi->lockend, &bi->cached_state);
c67d970f0ea8dc Filipe Manana      2019-09-30  1375  		else
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1376  			free_extent_state(bi->cached_state);
c67d970f0ea8dc Filipe Manana      2019-09-30  1377  
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1378  		btrfs_delalloc_release_extents(BTRFS_I(inode), bi->reserved_bytes);
f1de968376340c Miao Xie           2014-01-09  1379  		if (ret) {
e4f9434749d85a Qu Wenruo          2021-09-27 @1380  			btrfs_drop_pages(fs_info, pages, num_pages, pos, copied);
d0215f3e5ebb58 Josef Bacik        2011-01-25  1381  			break;
f1de968376340c Miao Xie           2014-01-09  1382  		}
39279cc3d2704c Chris Mason        2007-06-12  1383  
7ee9e4405f264e Josef Bacik        2013-06-21  1384  		release_bytes = 0;
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1385  		if (bi->metadata_only)
38d37aa9c32938 Qu Wenruo          2020-06-24  1386  			btrfs_check_nocow_unlock(BTRFS_I(inode));
8257b2dc3c1a10 Miao Xie           2014-03-06  1387  
e4f9434749d85a Qu Wenruo          2021-09-27  1388  		btrfs_drop_pages(fs_info, pages, num_pages, pos, copied);
f1de968376340c Miao Xie           2014-01-09  1389  
d0215f3e5ebb58 Josef Bacik        2011-01-25  1390  		cond_resched();
d0215f3e5ebb58 Josef Bacik        2011-01-25  1391  
914ee295af418e Xin Zhong          2010-12-09  1392  		pos += copied;
914ee295af418e Xin Zhong          2010-12-09  1393  		num_written += copied;
d0215f3e5ebb58 Josef Bacik        2011-01-25  1394  	}
39279cc3d2704c Chris Mason        2007-06-12  1395  
d0215f3e5ebb58 Josef Bacik        2011-01-25  1396  	kfree(pages);
d0215f3e5ebb58 Josef Bacik        2011-01-25  1397  
7ee9e4405f264e Josef Bacik        2013-06-21  1398  	if (release_bytes) {
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1399  		if (bi->metadata_only) {
38d37aa9c32938 Qu Wenruo          2020-06-24  1400  			btrfs_check_nocow_unlock(BTRFS_I(inode));
691fa059673b3b Nikolay Borisov    2017-02-20  1401  			btrfs_delalloc_release_metadata(BTRFS_I(inode),
43b18595d6603c Qu Wenruo          2017-12-12  1402  					release_bytes, true);
8257b2dc3c1a10 Miao Xie           2014-03-06  1403  		} else {
86d52921a2ba51 Nikolay Borisov    2020-06-03  1404  			btrfs_delalloc_release_space(BTRFS_I(inode),
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1405  					bi->data_reserved,
0b246afa62b0cf Jeff Mahoney       2016-06-22  1406  					round_down(pos, fs_info->sectorsize),
43b18595d6603c Qu Wenruo          2017-12-12  1407  					release_bytes, true);
7ee9e4405f264e Josef Bacik        2013-06-21  1408  		}
8257b2dc3c1a10 Miao Xie           2014-03-06  1409  	}
7ee9e4405f264e Josef Bacik        2013-06-21  1410  
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1411  	extent_changeset_free(bi->data_reserved);
2c0968f203d8e3 Goldwyn Rodrigues  2020-10-02  1412  	kfree(bi);
5e8b9ef30392bb Goldwyn Rodrigues  2020-09-24  1413  	if (num_written > 0) {
5e8b9ef30392bb Goldwyn Rodrigues  2020-09-24  1414  		pagecache_isize_extended(inode, old_isize, iocb->ki_pos);
5e8b9ef30392bb Goldwyn Rodrigues  2020-09-24  1415  		iocb->ki_pos += num_written;
5e8b9ef30392bb Goldwyn Rodrigues  2020-09-24  1416  	}
c352370633400d Goldwyn Rodrigues  2020-09-24  1417  out:
c76b47a7f03831 Goldwyn Rodrigues  2023-01-24  1418  	kfree(bi);
e5d4d75bd3241d David Sterba       2022-10-27  1419  	btrfs_inode_unlock(BTRFS_I(inode), ilock_flags);
d0215f3e5ebb58 Josef Bacik        2011-01-25  1420  	return num_written ? num_written : ret;
39279cc3d2704c Chris Mason        2007-06-12  1421  }
d0215f3e5ebb58 Josef Bacik        2011-01-25  1422  

:::::: The code at line 1380 was first introduced by commit
:::::: e4f9434749d85aa99e7e58edce2e003951d8e8e1 btrfs: subpage: add bitmap for PageChecked flag

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
