Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600D2797AE;
	Sat,  6 Sep 2025 04:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757134258; cv=none; b=UUzYINH2EaAV6yFpx9yW69TcewsfHCkVirGVaIT0zc6KiONViG/qyKwdEE49ZEGG7Meaz8hjILzo7w37wmb+S1ObxFkkkzl6di0wA+SiHJaBTjsC89HFMBpBxjZ3fRDDazxG3NL3hP/aTroVe2zVcxIteM8VRHIE6jcbQPbiYl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757134258; c=relaxed/simple;
	bh=DHl0vAyZnoTad7jRVdJdPD0cLY8Ih6FckSMdHa3PgvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uqDLH1qoJcsySOpOLVQWO17iVVbWC2ahLOlrATO59C/OoZHQeTUnxzvgmWAnpZnRumORPiOVGs209/UW3+Z01jSqIDu+UR7H9d8ZP3pCudHa3/tLF8rGvymj0W5uAUeiHGRQaeeLONYBkTVAtPRIDv310hMbeEx0J/dSPRMIADk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHUUVs8b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHUUVs8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757134257; x=1788670257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHl0vAyZnoTad7jRVdJdPD0cLY8Ih6FckSMdHa3PgvE=;
  b=IHUUVs8bi3MpJYzG3M+ggyDOWPpIGnedN/ugxpxStak51U2f+4EvE7u1
   +gaSr+84HQr+qhCNLiDvO6oYElJj6xXFXagt0+Q7F18/iAm1yMaA+00u6
   DrTczzsWeh179u4PIk/IajJ6qqlbKcyhW4G3C2ceYhZmoVJ67LuK5pSxq
   JLemMLmCImG+jBIim59dgSYht/ajUC49BEuwDFNN424O1YaQtN0Wsy8tS
   zkrj3d5px/m/zK1GZ7QjKg0Hmpg7Nx1BvJILeOJ2nHQy9+CWulrJyaDwv
   Jr251dVhKy5xJzeYQnM5SmEW9EDj7SGBlJPR3ScStSBlQzhj+zgV8l3gI
   w==;
X-CSE-ConnectionGUID: e4uM4GKiTkisl76dC9y/wQ==
X-CSE-MsgGUID: 9wtHbssDT9yjniAWI8RqTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="84915069"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="84915069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 21:50:56 -0700
X-CSE-ConnectionGUID: RPZ8JZwqSdWP3K9Nxq1YGw==
X-CSE-MsgGUID: u9KsqsDWTS+DFuVM2iwpkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="172433023"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Sep 2025 21:50:55 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uukt2-0001DD-1p;
	Sat, 06 Sep 2025 04:50:52 +0000
Date: Sat, 6 Sep 2025 12:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 363/365]
 fs/bcachefs/btree_io.c:1445:7: error: use of undeclared identifier
 'bch2_btree_read_corrupt_device'
Message-ID: <202509061251.2BM6rEgC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   149a8691d3f20c0f344f3bbc7f2d037dbf44a122
commit: 14d31858448b773630a36ee5adce6b8f7a660a39 [363/365] bcachefs: btree_read_corrupt_device modparam
config: x86_64-buildonly-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061251.2BM6rEgC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061251.2BM6rEgC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061251.2BM6rEgC-lkp@intel.com/

Note: the koverstreet-bcachefs/bcachefs-testing HEAD 149a8691d3f20c0f344f3bbc7f2d037dbf44a122 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree_io.c:1445:7: error: use of undeclared identifier 'bch2_btree_read_corrupt_device'
    1445 |                 if (bch2_btree_read_corrupt_device == rb->pick.ptr.dev ||
         |                     ^
   fs/bcachefs/btree_io.c:1446:7: error: use of undeclared identifier 'bch2_btree_read_corrupt_device'
    1446 |                     bch2_btree_read_corrupt_device < 0)
         |                     ^
   2 errors generated.


vim +/bch2_btree_read_corrupt_device +1445 fs/bcachefs/btree_io.c

  1389	
  1390	static void btree_node_read_work(struct work_struct *work)
  1391	{
  1392		struct btree_read_bio *rb =
  1393			container_of(work, struct btree_read_bio, work);
  1394		struct bch_fs *c	= rb->c;
  1395		struct bch_dev *ca	= rb->have_ioref ? bch2_dev_have_ref(c, rb->pick.ptr.dev) : NULL;
  1396		struct btree *b		= rb->b;
  1397		struct bio *bio		= &rb->bio;
  1398		struct bch_io_failures failed = { .nr = 0 };
  1399		int ret = 0;
  1400	
  1401		CLASS(printbuf, buf)();
  1402		bch2_log_msg_start(c, &buf);
  1403	
  1404		prt_printf(&buf, "btree node read error at btree ");
  1405		bch2_btree_pos_to_text(&buf, c, b);
  1406		prt_newline(&buf);
  1407	
  1408		goto start;
  1409		while (1) {
  1410			ret = bch2_bkey_pick_read_device(c,
  1411						bkey_i_to_s_c(&b->key),
  1412						&failed, &rb->pick, -1);
  1413			if (ret <= 0)
  1414				break;
  1415	
  1416			ca = bch2_dev_get_ioref(c, rb->pick.ptr.dev, READ, BCH_DEV_READ_REF_btree_node_read);
  1417			rb->have_ioref		= ca != NULL;
  1418			rb->start_time		= local_clock();
  1419			bio_reset(bio, NULL, REQ_OP_READ|REQ_SYNC|REQ_META);
  1420			bio->bi_iter.bi_sector	= rb->pick.ptr.offset;
  1421			bio->bi_iter.bi_size	= btree_buf_bytes(b);
  1422	
  1423			if (rb->have_ioref) {
  1424				bio_set_dev(bio, ca->disk_sb.bdev);
  1425				submit_bio_wait(bio);
  1426			} else {
  1427				bio->bi_status = BLK_STS_REMOVED;
  1428			}
  1429	
  1430			bch2_account_io_completion(ca, BCH_MEMBER_ERROR_read,
  1431						   rb->start_time, !bio->bi_status);
  1432	start:
  1433			if (rb->have_ioref)
  1434				enumerated_ref_put(&ca->io_ref[READ], BCH_DEV_READ_REF_btree_node_read);
  1435			rb->have_ioref = false;
  1436	
  1437			if (bio->bi_status) {
  1438				bch2_mark_io_failure(&failed, &rb->pick, false);
  1439				continue;
  1440			}
  1441	
  1442			memset(&bio->bi_iter, 0, sizeof(bio->bi_iter));
  1443			bio->bi_iter.bi_size	= btree_buf_bytes(b);
  1444	
> 1445			if (bch2_btree_read_corrupt_device == rb->pick.ptr.dev ||
  1446			    bch2_btree_read_corrupt_device < 0)
  1447				bch2_maybe_corrupt_bio(bio, bch2_btree_read_corrupt_ratio);
  1448	
  1449			ret = bch2_btree_node_read_done(c, ca, b, &failed, &buf);
  1450			if (ret != -BCH_ERR_btree_node_read_err_want_retry &&
  1451			    ret != -BCH_ERR_btree_node_read_err_must_retry)
  1452				break;
  1453		}
  1454	
  1455		bch2_io_failures_to_text(&buf, c, &failed);
  1456	
  1457		/*
  1458		 * only print retry success if we read from a replica with no errors
  1459		 */
  1460		if (ret) {
  1461			set_btree_node_read_error(b);
  1462			bch2_btree_lost_data(c, &buf, b->c.btree_id);
  1463			prt_printf(&buf, "ret %s", bch2_err_str(ret));
  1464		} else if (failed.nr) {
  1465			if (!bch2_dev_io_failures(&failed, rb->pick.ptr.dev))
  1466				prt_printf(&buf, "retry success");
  1467			else
  1468				prt_printf(&buf, "repair success");
  1469		}
  1470	
  1471		if ((failed.nr ||
  1472		     btree_node_need_rewrite(b)) &&
  1473		    !btree_node_read_error(b) &&
  1474		    c->recovery.curr_pass != BCH_RECOVERY_PASS_scan_for_btree_nodes) {
  1475			prt_printf(&buf, " (rewriting node)");
  1476			bch2_btree_node_rewrite_async(c, b);
  1477		}
  1478		prt_newline(&buf);
  1479	
  1480		if (ret || failed.nr)
  1481			bch2_print_str_ratelimited(c, KERN_ERR, buf.buf);
  1482	
  1483		async_object_list_del(c, btree_read_bio, rb->list_idx);
  1484		bch2_time_stats_update(&c->times[BCH_TIME_btree_node_read],
  1485				       rb->start_time);
  1486		bio_put(&rb->bio);
  1487		clear_btree_node_read_in_flight(b);
  1488		smp_mb__after_atomic();
  1489		wake_up_bit(&b->flags, BTREE_NODE_read_in_flight);
  1490	}
  1491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
