Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF22FE59C;
	Fri, 24 Oct 2025 21:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761341865; cv=none; b=firFXgeNQbbk6zonzWOk1XQ2Yfa7JawFud1E1TILGz9v+AK1w3SQXSSxuY4nKwRd1NPUSEZYjZwCW43J0p5ZW0BTSQvh9lmeyN28g0qOyRoEpQrQTo0z6EE5dT1CzoV0py4L69B3O2UpGpTkFBI4ZCFLLyADIroatQUuGqRsOjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761341865; c=relaxed/simple;
	bh=d8hI0cKtnOZi54IvNbaaLpRPuAMI41uxcVs7KCWl4yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o24SV1Rl4WTNw/QF6XTCbkHjIa0PjMXUs9UVdCsfzamhvUA4Fznet8V23DYtxUi+MgN7I5L7K5pqmKkDPPiQiZ8zdBsiTPOwDrH85w52A25Jybnv1RRO92ewPfJiuAhdPDqObGLzu8P9fdKo0inIn4Y0jJVElt8RK+nQhyxro04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0HnQ5vl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0HnQ5vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761341863; x=1792877863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d8hI0cKtnOZi54IvNbaaLpRPuAMI41uxcVs7KCWl4yU=;
  b=b0HnQ5vlMpahwqXSGL0gSJRVWvZRfpk48zs9+srEtBCL8pFtGeD8FFDI
   GPtKQfd3fwly4XkSTdamo+WYeL0+qyrZQFmFjMvdIJ01NWQaSghYxdcn4
   SWwCNUvDW+e0W3ca6A6ZYnZChrPaERUl8TPvmLSk6y9ERUeac6IfIfQX6
   EjSmsqW6pheL1KgwuNHiU5ZeYwq8tLr2+p6U3bFWY9HAngZsAFjDNnZuS
   LYitlEBgBroyQRbXtic08d4eXDzzBgBs+d6hIRMjziUNswWMtvbl26Ltb
   Ac4uWa8/sR1Ejh+BYl78M8SzalkXVle+4rpCEx5gLouLVU4wNc+adPs1a
   Q==;
X-CSE-ConnectionGUID: DGZ8zntiT8aMhGdnaRpX5g==
X-CSE-MsgGUID: 1sDaJB12Tf+K1nboWWaAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73815916"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="73815916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 14:37:43 -0700
X-CSE-ConnectionGUID: 0alqO660RKCiO7aeVr1O9A==
X-CSE-MsgGUID: B7AuRjLdRgyhn7Gf5I52uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184431561"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 14:37:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCPT7-000Eu9-0U;
	Fri, 24 Oct 2025 21:37:33 +0000
Date: Sat, 25 Oct 2025 05:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 632/679] fs/bcachefs/data/write.c:1681:3:
 error: call to undeclared function '__WARN'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510250511.QN48YQ7j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3b847aabfc3a80d9be9eba56cf51c34628a47e1d
commit: 1ac51de3b5327ce2d597e30a39ff7e6809349a93 [632/679] bcachefs: Warn on misaligned write
config: powerpc-randconfig-003-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250511.QN48YQ7j-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250511.QN48YQ7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250511.QN48YQ7j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/data/write.c:1681:3: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1681 |                 __WARN();
         |                 ^
   1 error generated.


vim +/__WARN +1681 fs/bcachefs/data/write.c

  1638	
  1639	/**
  1640	 * bch2_write() - handle a write to a cache device or flash only volume
  1641	 * @cl:		&bch_write_op->cl
  1642	 *
  1643	 * This is the starting point for any data to end up in a cache device; it could
  1644	 * be from a normal write, or a writeback write, or a write to a flash only
  1645	 * volume - it's also used by the moving garbage collector to compact data in
  1646	 * mostly empty buckets.
  1647	 *
  1648	 * It first writes the data to the cache, creating a list of keys to be inserted
  1649	 * (if the data won't fit in a single open bucket, there will be multiple keys);
  1650	 * after the data is written it calls bch_journal, and after the keys have been
  1651	 * added to the next journal write they're inserted into the btree.
  1652	 *
  1653	 * If op->discard is true, instead of inserting the data it invalidates the
  1654	 * region of the cache represented by op->bio and op->inode.
  1655	 */
  1656	CLOSURE_CALLBACK(bch2_write)
  1657	{
  1658		closure_type(op, struct bch_write_op, cl);
  1659		struct bio *bio = &op->wbio.bio;
  1660		struct bch_fs *c = op->c;
  1661		unsigned data_len;
  1662	
  1663		EBUG_ON(op->cl.parent);
  1664		BUG_ON(!op->nr_replicas);
  1665		BUG_ON(!op->write_point.v);
  1666		BUG_ON(bkey_eq(op->pos, POS_MAX));
  1667	
  1668		async_object_list_add(c, write_op, op, &op->list_idx);
  1669	
  1670		if (op->flags & BCH_WRITE_only_specified_devs)
  1671			op->flags |= BCH_WRITE_alloc_nowait;
  1672	
  1673		op->nr_replicas_required = min_t(unsigned, op->nr_replicas_required, op->nr_replicas);
  1674		op->start_time = local_clock();
  1675		bch2_keylist_init(&op->insert_keys, op->inline_keys);
  1676		wbio_init(bio)->put_bio = false;
  1677	
  1678		if (unlikely(bio->bi_iter.bi_size & (c->opts.block_size - 1))) {
  1679			bch2_write_op_error(op, op->pos.offset, "misaligned write");
  1680			op->error = bch_err_throw(c, data_write_misaligned);
> 1681			__WARN();
  1682			goto err;
  1683		}
  1684	
  1685		if (c->opts.nochanges) {
  1686			op->error = bch_err_throw(c, erofs_no_writes);
  1687			goto err;
  1688		}
  1689	
  1690		if (!(op->flags & BCH_WRITE_move) &&
  1691		    !enumerated_ref_tryget(&c->writes, BCH_WRITE_REF_write)) {
  1692			op->error = bch_err_throw(c, erofs_no_writes);
  1693			goto err;
  1694		}
  1695	
  1696		if (!(op->flags & BCH_WRITE_move))
  1697			this_cpu_add(c->counters[BCH_COUNTER_io_write], bio_sectors(bio));
  1698		bch2_increment_clock(c, bio_sectors(bio), WRITE);
  1699	
  1700		data_len = min_t(u64, bio->bi_iter.bi_size,
  1701				 op->new_i_size - (op->pos.offset << 9));
  1702	
  1703		if (c->opts.inline_data &&
  1704		    data_len <= min(block_bytes(c) / 2, 1024U)) {
  1705			bch2_write_data_inline(op, data_len);
  1706			return;
  1707		}
  1708	
  1709		__bch2_write(op);
  1710		return;
  1711	err:
  1712		bch2_disk_reservation_put(c, &op->res);
  1713	
  1714		closure_debug_destroy(&op->cl);
  1715		async_object_list_del(c, write_op, op->list_idx);
  1716		if (op->end_io)
  1717			op->end_io(op);
  1718	}
  1719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
