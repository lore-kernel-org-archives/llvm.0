Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CA136F;
	Sun, 17 Dec 2023 04:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ffpa0knK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702785802; x=1734321802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KleY8wcvjQfwuNOvImxZdQS1g8CX6C1IKValkiUrspA=;
  b=Ffpa0knK2zd7cxCDemIV064xTg46yHKjBDne+nRvM5aLgPCG28jBLDbd
   6Q07N8Q4usRGMJtjg8RhwErDEtkdtimZww/015y8hVLKDWhyW9/kS+jCC
   R0OZzJtwJt2Dio2IZClNvWJjgNtkDSyK+Z6PMOV+7dFL+KJf5oghop2oC
   RSV+RD4SvZKNxBFfHd3dO91TeAczlyrD4jMIXMf8fq3bvpe/H4Ml13V78
   Y1+6L9PaU/I6/jKgUTFljbAy7rO49mdZsxWNj1ikJmAa/xCxPsr8wufBX
   gYFWB7CTHwCMlnFZAeYlh2oKyFT6FbcAbKKRj7siTbkfn+qL1t/Lmds9U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2488746"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2488746"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:03:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="809413340"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="809413340"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2023 20:03:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEiN2-0002bw-03;
	Sun, 17 Dec 2023 04:03:16 +0000
Date: Sun, 17 Dec 2023 12:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:bcachefs-testing 154/159]
 fs/bcachefs/btree_update_interior.c:1670: warning: Function parameter or
 member 'path_idx' not described in 'bch2_btree_insert_node'
Message-ID: <202312171113.xgsVo3VD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   0b69c68c172b67a3d07a7c1cc9c87d158af98827
commit: d85fddfb75eb24146c01c54a313f57635d0c0f48 [154/159] bcachefs: Fix interior update path btree_path uses
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171113.xgsVo3VD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171113.xgsVo3VD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171113.xgsVo3VD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_update_interior.c:1670: warning: Function parameter or member 'path_idx' not described in 'bch2_btree_insert_node'
>> fs/bcachefs/btree_update_interior.c:1670: warning: Excess function parameter 'path' description in 'bch2_btree_insert_node'


vim +1670 fs/bcachefs/btree_update_interior.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  1650  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1651  /**
96dea3d599dbc3 Kent Overstreet 2023-09-12  1652   * bch2_btree_insert_node - insert bkeys into a given btree node
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1653   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  1654   * @as:			btree_update object
96dea3d599dbc3 Kent Overstreet 2023-09-12  1655   * @trans:		btree_trans object
96dea3d599dbc3 Kent Overstreet 2023-09-12  1656   * @path:		path that points to current node
96dea3d599dbc3 Kent Overstreet 2023-09-12  1657   * @b:			node to insert keys into
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1658   * @keys:		list of keys to insert
96dea3d599dbc3 Kent Overstreet 2023-09-12  1659   * @flags:		transaction commit flags
96dea3d599dbc3 Kent Overstreet 2023-09-12  1660   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  1661   * Returns: 0 on success, typically transaction restart error on failure
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1662   *
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1663   * Inserts as many keys as it can into a given btree node, splitting it if full.
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1664   * If a split occurred, this function will return early. This can only happen
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1665   * for leaf nodes -- inserts into interior nodes have to be atomic.
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1666   */
a8eefbd324cd40 Kent Overstreet 2022-10-01  1667  static int bch2_btree_insert_node(struct btree_update *as, struct btree_trans *trans,
d85fddfb75eb24 Kent Overstreet 2023-12-15  1668  				  btree_path_idx_t path_idx, struct btree *b,
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1669  				  struct keylist *keys, unsigned flags)
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @1670  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1671  	struct bch_fs *c = as->c;
d85fddfb75eb24 Kent Overstreet 2023-12-15  1672  	struct btree_path *path = trans->paths + path_idx;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1673  	int old_u64s = le16_to_cpu(btree_bset_last(b)->u64s);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1674  	int old_live_u64s = b->nr.live_u64s;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1675  	int live_u64s_added, u64s_added;
1ff7849f3b2478 Kent Overstreet 2022-10-09  1676  	int ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1677  
e264b2f62a8fdf Kent Overstreet 2021-03-31  1678  	lockdep_assert_held(&c->gc_lock);
1f0f731ffef13b Kent Overstreet 2022-09-27  1679  	BUG_ON(!btree_node_intent_locked(path, b->c.level));
c43a6ef9a0747e Kent Overstreet 2020-06-06  1680  	BUG_ON(!b->c.level);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1681  	BUG_ON(!as || as->b);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1682  	bch2_verify_keylist_sorted(keys);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1683  
1ff7849f3b2478 Kent Overstreet 2022-10-09  1684  	ret = bch2_btree_node_lock_write(trans, path, &b->c);
1ff7849f3b2478 Kent Overstreet 2022-10-09  1685  	if (ret)
1ff7849f3b2478 Kent Overstreet 2022-10-09  1686  		return ret;
1ff7849f3b2478 Kent Overstreet 2022-10-09  1687  
1ff7849f3b2478 Kent Overstreet 2022-10-09  1688  	bch2_btree_node_prep_for_write(trans, path, b);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1689  
00b8ccf7074fdd Kent Overstreet 2020-05-25  1690  	if (!bch2_btree_node_insert_fits(c, b, bch2_keylist_u64s(keys))) {
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1691  		bch2_btree_node_unlock_write(trans, path, b);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1692  		goto split;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1693  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1694  
1c74cec10cc8db Kent Overstreet 2020-11-16  1695  	btree_node_interior_verify(c, b);
1c74cec10cc8db Kent Overstreet 2020-11-16  1696  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1697  	bch2_btree_insert_keys_interior(as, trans, path, b, keys);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1698  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1699  	live_u64s_added = (int) b->nr.live_u64s - old_live_u64s;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1700  	u64s_added = (int) le16_to_cpu(btree_bset_last(b)->u64s) - old_u64s;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1701  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1702  	if (b->sib_u64s[0] != U16_MAX && live_u64s_added < 0)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1703  		b->sib_u64s[0] = max(0, (int) b->sib_u64s[0] + live_u64s_added);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1704  	if (b->sib_u64s[1] != U16_MAX && live_u64s_added < 0)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1705  		b->sib_u64s[1] = max(0, (int) b->sib_u64s[1] + live_u64s_added);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1706  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1707  	if (u64s_added > live_u64s_added &&
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1708  	    bch2_maybe_compact_whiteouts(c, b))
f7a966a3e2546a Kent Overstreet 2021-08-30  1709  		bch2_trans_node_reinit_iter(trans, b);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1710  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1711  	bch2_btree_node_unlock_write(trans, path, b);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1712  
a2b5313a39dfb0 Kent Overstreet 2020-07-21  1713  	btree_node_interior_verify(c, b);
a8eefbd324cd40 Kent Overstreet 2022-10-01  1714  	return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1715  split:
1f0f731ffef13b Kent Overstreet 2022-09-27  1716  	/*
1f0f731ffef13b Kent Overstreet 2022-09-27  1717  	 * We could attempt to avoid the transaction restart, by calling
1f0f731ffef13b Kent Overstreet 2022-09-27  1718  	 * bch2_btree_path_upgrade() and allocating more nodes:
1f0f731ffef13b Kent Overstreet 2022-09-27  1719  	 */
e151580d3072e7 Kent Overstreet 2023-02-20  1720  	if (b->c.level >= as->update_level) {
3d86f13df67b55 Kent Overstreet 2023-03-30  1721  		trace_and_count(c, trans_restart_split_race, trans, _THIS_IP_, b);
1f0f731ffef13b Kent Overstreet 2022-09-27  1722  		return btree_trans_restart(trans, BCH_ERR_transaction_restart_split_race);
e151580d3072e7 Kent Overstreet 2023-02-20  1723  	}
1f0f731ffef13b Kent Overstreet 2022-09-27  1724  
d85fddfb75eb24 Kent Overstreet 2023-12-15  1725  	return btree_split(as, trans, path_idx, b, keys, flags);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1726  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1727  

:::::: The code at line 1670 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
