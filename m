Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED91849;
	Sun, 17 Dec 2023 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITfO+x+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702800536; x=1734336536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PeMftIcy4VLy/GRMCLCBKT44xNK0RSQZFJmA2MFYSx0=;
  b=ITfO+x+KNAFnYebaX1mZIGNM5rKOG6V620g+SWJ+Nc2kcBdZZy+DtQvU
   QrGauvOGaX7DVPCOfIaucxZFnyL9NBaBmgDF937LKIsZ/whvKxRkeqClZ
   ev3buN3vYPN8EICwrOK4qv/+s0wB16HZD6TplN0Vy/Px/OITj9Kxr5zVi
   9sf5pkT26KeRV/FzxlQBHljO+VWqsLSHNNXS/3REZ4cXH+C6/E1yq6Sw5
   JXdWWPgUGwxyUVCOBbTWr/Y2sR9SMBWNiLGA8BibNMhBWr8SFA+ID4gMt
   tgL6Q2UdMF6FSaHAnTPP192IIrJIYWGNDkffGdqxnPI7XF/Bcfftcj96N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2231026"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2231026"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 00:08:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="948423880"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="948423880"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Dec 2023 00:08:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEmCS-0002qI-1n;
	Sun, 17 Dec 2023 08:08:37 +0000
Date: Sun, 17 Dec 2023 16:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:bcachefs-testing 158/159]
 fs/bcachefs/btree_trans_commit.c:1049:7: warning: variable 'errored_at' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202312171605.CZuefTDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   607dc0adb1799e564ac1a2610c138e90d3c9a094
commit: 4e067d25983a698bfa62be21422df70d603b189e [158/159] bcachefs: trans_for_each_update() now declares loop iter
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171605.CZuefTDt-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171605.CZuefTDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171605.CZuefTDt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.c:1049:7: warning: variable 'errored_at' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (ret)
                       ^~~
   fs/bcachefs/btree_trans_commit.c:1077:46: note: uninitialized use occurs here
           ret = bch2_trans_commit_error(trans, flags, errored_at, ret, _RET_IP_);
                                                       ^~~~~~~~~~
   fs/bcachefs/btree_trans_commit.c:1049:3: note: remove the 'if' if its condition is always false
                   if (ret)
                   ^~~~~~~~
   fs/bcachefs/btree_trans_commit.c:1057:2: note: variable 'errored_at' is declared here
           struct btree_insert_entry *errored_at = NULL;
           ^
   1 warning generated.


vim +1049 fs/bcachefs/btree_trans_commit.c

78c8fe20be12d0 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19   969  
30ca6ece88f2d1 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2023-02-09   970  int __bch2_trans_commit(struct btree_trans *trans, unsigned flags)
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16   971  {
fb64f3fdac7171 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-12-31   972  	struct bch_fs *c = trans->c;
dc3b63dc33e1b6 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-03-21   973  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16   974  
9f1833cadda7bb fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-07-10   975  	if (!trans->nr_updates &&
bcff915594c28c fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10   976  	    !trans->journal_entries_u64s)
b7cf4bd7fe6895 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-01-21   977  		goto out_reset;
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16   978  
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19   979  	ret = bch2_trans_commit_run_triggers(trans);
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19   980  	if (ret)
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19   981  		goto out_reset;
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19   982  
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   983  	trans_for_each_update(trans, i) {
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   984  		struct printbuf buf = PRINTBUF;
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   985  		enum bkey_invalid_flags invalid_flags = 0;
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   986  
1d7fa317a6f8d4 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-11   987  		if (!(flags & BCH_TRANS_COMMIT_no_journal_res))
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   988  			invalid_flags |= BKEY_INVALID_WRITE|BKEY_INVALID_COMMIT;
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   989  
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   990  		if (unlikely(bch2_bkey_invalid(c, bkey_i_to_s_c(i->k),
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   991  					       i->bkey_type, invalid_flags, &buf)))
50a38ca1baace3 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-10-20   992  			ret = bch2_trans_commit_bkey_invalid(trans, invalid_flags, i, &buf);
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   993  		btree_insert_entry_checks(trans, i);
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   994  		printbuf_exit(&buf);
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   995  
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   996  		if (ret)
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   997  			return ret;
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   998  	}
cc07773f158331 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-22   999  
68eb0b85170f6a fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-26  1000  	if (unlikely(!test_bit(BCH_FS_may_go_rw, &c->flags))) {
78c8fe20be12d0 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1001  		ret = do_bch2_trans_commit_to_journal_replay(trans);
78c8fe20be12d0 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1002  		goto out_reset;
78c8fe20be12d0 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1003  	}
78c8fe20be12d0 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1004  
1d7fa317a6f8d4 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-11  1005  	if (!(flags & BCH_TRANS_COMMIT_no_check_rw) &&
d94189ad568f6c fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2023-02-09  1006  	    unlikely(!bch2_write_ref_tryget(c, BCH_WRITE_REF_trans))) {
30ca6ece88f2d1 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2023-02-09  1007  		ret = bch2_trans_commit_get_rw_cold(trans, flags);
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1008  		if (ret)
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1009  			goto out_reset;
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1010  	}
06a98c966f9ae5 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-02-19  1011  
68eb0b85170f6a fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-26  1012  	EBUG_ON(test_bit(BCH_FS_clean_shutdown, &c->flags));
c0960603e2d42d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-04-17  1013  
bcff915594c28c fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  1014  	trans->journal_u64s		= trans->journal_entries_u64s;
fb64f3fdac7171 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-12-31  1015  	trans->journal_transaction_names = READ_ONCE(c->opts.journal_transaction_names);
fb64f3fdac7171 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-12-31  1016  	if (trans->journal_transaction_names)
43ddf4483491b3 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1017  		trans->journal_u64s += jset_u64s(JSET_ENTRY_LOG_U64s);
fb64f3fdac7171 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-12-31  1018  
24326cd12aa03e fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-12-31  1019  	trans_for_each_update(trans, i) {
56288971a77fb1 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  1020  		struct btree_path *path = trans->paths + i->path;
56288971a77fb1 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  1021  
56288971a77fb1 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  1022  		EBUG_ON(!path->should_be_locked);
9f631dc14325df fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-03-09  1023  
56288971a77fb1 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  1024  		ret = bch2_btree_path_upgrade(trans, path, i->level + 1);
367d72dd5fd5b9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-09-17  1025  		if (unlikely(ret))
6333bd2f133459 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-02-20  1026  			goto out;
6333bd2f133459 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-02-20  1027  
56288971a77fb1 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  1028  		EBUG_ON(!btree_node_intent_locked(path, i->level));
5c1d808ad8b806 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-03-31  1029  
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1030  		if (i->key_cache_already_flushed)
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1031  			continue;
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1032  
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1033  		if (i->flags & BTREE_UPDATE_NOJOURNAL)
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1034  			continue;
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1035  
006ccc3090e2f3 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-04  1036  		/* we're going to journal the key being updated: */
006ccc3090e2f3 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-04  1037  		trans->journal_u64s += jset_u64s(i->k->k.u64s);
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1038  
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1039  		/* and we're also going to log the overwrite: */
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1040  		if (trans->journal_transaction_names)
cb685ce72cc7e9 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-06-05  1041  			trans->journal_u64s += jset_u64s(i->old_k.u64s);
8b3bbe2c34759a fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-12-24  1042  	}
a49e9a0589d182 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-06-12  1043  
d6820de73ed5a2 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-11  1044  	if (trans->extra_disk_res) {
fb64f3fdac7171 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-12-31  1045  		ret = bch2_disk_reservation_add(c, trans->disk_res,
d6820de73ed5a2 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-11  1046  				trans->extra_disk_res,
1d7fa317a6f8d4 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-11  1047  				(flags & BCH_TRANS_COMMIT_no_enospc)
a49e9a0589d182 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-06-12  1048  				? BCH_DISK_RESERVATION_NOFAIL : 0);
a49e9a0589d182 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-06-12 @1049  		if (ret)

:::::: The code at line 1049 was first introduced by commit
:::::: a49e9a0589d1828af787bacf0a1e18eca7facb88 bcachefs: Fix null ptr deref when splitting compressed extents

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
