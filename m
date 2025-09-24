Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD321FF4C;
	Wed, 24 Sep 2025 05:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758693095; cv=none; b=NOMf8FDEiMPgtnHtJ3SkuJksrJdageJ4iu0Q05VlaoBT+U5aNogoqISUPHJ/tKr5m34Qrcm22gVvN0cAQsH2OQkD9C2NwG+yiWJaPT3qSMPXq3F3EqerADmw9FV0WpM+nKmEJ3XpM6bHCpV/5h5l37crzw28kbNGn6T5I0ZnrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758693095; c=relaxed/simple;
	bh=w5Xfqf27AIAAhQlkylTrTFpPv+iYYYRYa4BV3F7nSmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M10YV5m2tc3FUvirEzNTCTHgpufOC8kIasBasZ7R4bRWcEOJyWUgMWkfn0k5eNGXG5vvFS/4XZoWTp5F7BVzpPFYVt9SjAdzUk0KpNRQp6atTYXQ20pi3Bf3upbuaAwbKjHtSP8QmIQkVG5F0B5McE3i2/QQZjOHGnTvtyfkfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lykct3h1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lykct3h1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758693093; x=1790229093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5Xfqf27AIAAhQlkylTrTFpPv+iYYYRYa4BV3F7nSmw=;
  b=Lykct3h1Lu3HF7vuVV4yp1M/wC6yssn4l8blZO/vE/IZbsq540C3TST9
   lSmMBdq26NXKLEu7d7houGa3MUUOoCzfa8tU/m2/pvAS39W/uRjmdYHto
   1KCJbobGDz4VGfScZGJ0SoVbv04u+gto34uTpuZRIc655uE9XOji+/nEP
   XZSElSyvyKUEIFf8zSaYTLPm47jDsy0CppWtimWXS96fa1ID4PXqec+C9
   7rf7I1vYMeDWp1+/M2+65JILFdze1FgFVG9MFhfrrlWL/WhD1SYRyUaSs
   474nd67PpNC7988wSMzIml/4x3WI5C6rELMKCJq+WYVINHDSxPno5WDtC
   Q==;
X-CSE-ConnectionGUID: FgkeEXy+QHSE1cNiPZzFUA==
X-CSE-MsgGUID: Juw/LnrfRrKCpObPywdm1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61038308"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="61038308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 22:51:32 -0700
X-CSE-ConnectionGUID: PXdhI2fLSG+u9C3NDk88qg==
X-CSE-MsgGUID: ofw7SBkDSkWVWfU35IPzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="207693797"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Sep 2025 22:51:31 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1IPY-0003pV-2v;
	Wed, 24 Sep 2025 05:51:28 +0000
Date: Wed, 24 Sep 2025 13:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 429/433] fs/bcachefs/io_write.c:1489:2:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202509241306.zU4uqYc1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9fe3a2677d2a70ce10552ca90628e89cc8377ad4
commit: 085a52995cf05e5c012d377efd5d9edcb609f8e3 [429/433] bcachefs: Convert nocow write path to new nocow locking helpers
config: x86_64-buildonly-randconfig-003-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241306.zU4uqYc1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241306.zU4uqYc1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241306.zU4uqYc1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/io_write.c:1489:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1489 |         CLASS(printbuf, buf)();
         |         ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:102:1: note: expanded from here
     102 | class_printbuf_t
         | ^
   1 warning generated.


vim +1489 fs/bcachefs/io_write.c

a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1345  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1346  static void bch2_nocow_write(struct bch_write_op *op)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1347  {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1348  	struct bch_fs *c = op->c;
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1349  	struct btree_trans *trans;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1350  	struct btree_iter iter;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1351  	struct bkey_s_c k;
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1352  	struct bkey_ptrs_c ptrs;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1353  	u32 snapshot;
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1354  	const struct bch_extent_ptr *stale_at;
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1355  	int stale, ret;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1356  
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1357  	if (op->flags & BCH_WRITE_move)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1358  		return;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1359  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1360  	trans = bch2_trans_get(c);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1361  retry:
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1362  	bch2_trans_begin(trans);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1363  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1364  	ret = bch2_subvolume_get_snapshot(trans, op->subvol, &snapshot);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1365  	if (unlikely(ret))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1366  		goto err;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1367  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1368  	bch2_trans_iter_init(trans, &iter, BTREE_ID_extents,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1369  			     SPOS(op->pos.inode, op->pos.offset, snapshot),
5dd8c60e1e0448 fs/bcachefs/io_write.c Kent Overstreet 2024-04-07  1370  			     BTREE_ITER_slots);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1371  	while (1) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1372  		struct bio *bio = &op->wbio.bio;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1373  
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1374  		ret = bch2_trans_relock(trans);
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1375  		if (ret)
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1376  			break;
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1377  
f68e453b6c94c5 fs/bcachefs/io_write.c Kent Overstreet 2025-07-30  1378  		k = bch2_btree_iter_peek_slot(&iter);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1379  		ret = bkey_err(k);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1380  		if (ret)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1381  			break;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1382  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1383  		/* fall back to normal cow write path? */
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1384  		if (unlikely(k.k->p.snapshot != snapshot ||
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1385  			     !bch2_extent_is_writeable(op, k)))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1386  			break;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1387  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1388  		if (bch2_keylist_realloc(&op->insert_keys,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1389  					 op->inline_keys,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1390  					 ARRAY_SIZE(op->inline_keys),
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1391  					 k.k->u64s))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1392  			break;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1393  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1394  		/* Get iorefs before dropping btree locks: */
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1395  		ptrs = bch2_bkey_ptrs_c(k);
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1396  		if (!bkey_get_dev_iorefs(c, ptrs))
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1397  			goto out;
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  1398  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1399  		/* Unlock before taking nocow locks, doing IO: */
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1400  		bkey_reassemble(op->insert_keys.top, k);
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1401  		k = bkey_i_to_s_c(op->insert_keys.top);
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1402  		ptrs = bch2_bkey_ptrs_c(k);
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1403  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1404  		bch2_trans_unlock(trans);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1405  
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1406  		bch2_bkey_nocow_lock(c, ptrs, BUCKET_NOCOW_LOCK_UPDATE);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1407  
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1408  		/*
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1409  		 * This could be handled better: If we're able to trylock the
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1410  		 * nocow locks with btree locks held we know dirty pointers
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1411  		 * can't be stale
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1412  		 */
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1413  		bkey_for_each_ptr(ptrs, ptr) {
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1414  			struct bch_dev *ca = bch2_dev_have_ref(c, ptr->dev);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1415  
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1416  			int gen = bucket_gen_get(ca, PTR_BUCKET_NR(ca, ptr));
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1417  			stale = gen < 0 ? gen : gen_after(gen, ptr->gen);
d9534cc9fc4552 fs/bcachefs/io_write.c Kent Overstreet 2023-12-30  1418  			if (unlikely(stale)) {
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1419  				stale_at = ptr;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1420  				goto err_bucket_stale;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1421  			}
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1422  
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1423  			if (ptr->unwritten)
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1424  				op->flags |= BCH_WRITE_convert_unwritten;
d9534cc9fc4552 fs/bcachefs/io_write.c Kent Overstreet 2023-12-30  1425  		}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1426  
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1427  		bch2_cut_front(op->pos, op->insert_keys.top);
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1428  		if (op->flags & BCH_WRITE_convert_unwritten)
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1429  			bch2_cut_back(POS(op->pos.inode, op->pos.offset + bio_sectors(bio)), op->insert_keys.top);
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1430  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1431  		bio = &op->wbio.bio;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1432  		if (k.k->p.offset < op->pos.offset + bio_sectors(bio)) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1433  			bio = bio_split(bio, k.k->p.offset - op->pos.offset,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1434  					GFP_KERNEL, &c->bio_write);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1435  			wbio_init(bio)->put_bio = true;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1436  			bio->bi_opf = op->wbio.bio.bi_opf;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1437  		} else {
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1438  			op->flags |= BCH_WRITE_submitted;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1439  		}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1440  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1441  		op->pos.offset += bio_sectors(bio);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1442  		op->written += bio_sectors(bio);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1443  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1444  		bio->bi_end_io	= bch2_write_endio;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1445  		bio->bi_private	= &op->cl;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1446  		bio->bi_opf |= REQ_OP_WRITE;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1447  		closure_get(&op->cl);
5a06cb8000addb fs/bcachefs/io_write.c Kent Overstreet 2025-03-08  1448  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1449  		bch2_submit_wbio_replicas(to_wbio(bio), c, BCH_DATA_user,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1450  					  op->insert_keys.top, true);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1451  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1452  		bch2_keylist_push(&op->insert_keys);
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1453  		if (op->flags & BCH_WRITE_submitted)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1454  			break;
f68e453b6c94c5 fs/bcachefs/io_write.c Kent Overstreet 2025-07-30  1455  		bch2_btree_iter_advance(&iter);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1456  	}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1457  out:
363832bfd5fd98 fs/bcachefs/io_write.c Kent Overstreet 2025-07-30  1458  	bch2_trans_iter_exit(&iter);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1459  err:
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1460  	if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1461  		goto retry;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1462  
097cc9d0d60a36 fs/bcachefs/io_write.c Kent Overstreet 2024-11-13  1463  	bch2_trans_put(trans);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1464  	if (ret) {
2fe208303a1140 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  1465  		bch2_write_op_error(op, op->pos.offset,
1ccbcd32057727 fs/bcachefs/io_write.c Kent Overstreet 2025-02-10  1466  				    "%s(): btree lookup error: %s", __func__, bch2_err_str(ret));
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1467  		op->error = ret;
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1468  		op->flags |= BCH_WRITE_submitted;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1469  	}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1470  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1471  	/* fallback to cow write path? */
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1472  	if (!(op->flags & BCH_WRITE_submitted)) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1473  		closure_sync(&op->cl);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1474  		__bch2_nocow_write_done(op);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1475  		op->insert_keys.top = op->insert_keys.keys;
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1476  	} else if (op->flags & BCH_WRITE_sync) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1477  		closure_sync(&op->cl);
d4e3b928ab487a fs/bcachefs/io_write.c Kent Overstreet 2023-11-17  1478  		bch2_nocow_write_done(&op->cl.work);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1479  	} else {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1480  		/*
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1481  		 * XXX
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1482  		 * needs to run out of process context because ei_quota_lock is
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1483  		 * a mutex
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1484  		 */
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1485  		continue_at(&op->cl, bch2_nocow_write_done, index_update_wq(op));
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1486  	}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1487  	return;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1488  err_bucket_stale:
eb957f411913ae fs/bcachefs/io_write.c Kent Overstreet 2025-07-14 @1489  	CLASS(printbuf, buf)();
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1490  	if (bch2_fs_inconsistent_on(stale < 0, c,
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1491  				    "pointer to invalid bucket in nocow path on device %u\n  %s",
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1492  				    stale_at->dev,
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1493  				    (bch2_bkey_val_to_text(&buf, c, k), buf.buf))) {
09b9c72bd4b77a fs/bcachefs/io_write.c Kent Overstreet 2025-05-28  1494  		ret = bch_err_throw(c, data_write_invalid_ptr);
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1495  	} else {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1496  		/* We can retry this: */
09b9c72bd4b77a fs/bcachefs/io_write.c Kent Overstreet 2025-05-28  1497  		ret = bch_err_throw(c, transaction_restart);
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1498  	}
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1499  
085a52995cf05e fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1500  	bch2_bkey_nocow_unlock(c, k, BUCKET_NOCOW_LOCK_UPDATE);
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1501  	bkey_for_each_ptr(ptrs, ptr)
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1502  		enumerated_ref_put(&bch2_dev_have_ref(c, ptr->dev)->io_ref[WRITE],
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1503  				   BCH_DEV_WRITE_REF_io_write);
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1504  
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1505  	/* Fall back to COW path: */
a14e2f089f5d64 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1506  	goto out;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1507  }
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1508  

:::::: The code at line 1489 was first introduced by commit
:::::: eb957f411913ae99722b1abd265038ed280a2b1b bcachefs: convert io_write.c to CLASS/guards

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
