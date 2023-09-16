Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DD12B9D;
	Sat, 16 Sep 2023 21:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694899704; x=1726435704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0Mz9/2BfSn0LxD485ah6BpHzE8/4K6YhlSjO8gOTig=;
  b=C8TuJu4Le26V1JjvjYFLSZybu6CKCmJNTeouFdgTlrlfXFJBWsCKmj09
   OyF3PIZImlkIUVEGvFpoun3RKuweWd/9JyD+jerclG0oAly7mFUumvQ7e
   efMLrfWjS4IhSwuleDDVVXuMk+AhKSKVf0Odp4vnrx0n+WPQJ4XWItAim
   RoTRr5pYLiv9e9kjcVsMfuJRUWPqp0mduZvlzIGNcRiuNVNQ+0VY42VZn
   ZRrWs9EqG8lW2LihyphyfTKBNS3lJ++piitiR2/9RvyfH0HnXkIsajWW3
   lKhpd3sNwe3CWiAkqau0PhiURh1UUYxzkw2OIkF3zEo++T+6BXNpoGqOe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359700165"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="359700165"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 14:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="835606076"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="835606076"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2023 14:28:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhcpw-0004f2-24;
	Sat, 16 Sep 2023 21:28:20 +0000
Date: Sun, 17 Sep 2023 05:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4677/5666] fs/bcachefs/io_misc.c:468:6: warning:
 explicitly assigning value of variable of type 'int' to itself
Message-ID: <202309170545.BvBaHv0r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dfa449a58323de195773cf928d99db4130702bf7
commit: eeb8a9793efc9509a131220064eebd7d883278e9 [4677/5666] bcachefs: Log finsert/fcollapse operations
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230917/202309170545.BvBaHv0r-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170545.BvBaHv0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170545.BvBaHv0r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/io_misc.c:468:6: warning: explicitly assigning value of variable of type 'int' to itself [-Wself-assign]
           ret = ret;
           ~~~ ^ ~~~
   1 warning generated.


vim +/int +468 fs/bcachefs/io_misc.c

   341	
   342	static int __bch2_resume_logged_op_finsert(struct btree_trans *trans,
   343						   struct bkey_i *op_k,
   344						   u64 *i_sectors_delta)
   345	{
   346		struct bch_fs *c = trans->c;
   347		struct btree_iter iter;
   348		struct bkey_i_logged_op_finsert *op = bkey_i_to_logged_op_finsert(op_k);
   349		subvol_inum inum = { le32_to_cpu(op->v.subvol), le64_to_cpu(op->v.inum) };
   350		u64 dst_offset = le64_to_cpu(op->v.dst_offset);
   351		u64 src_offset = le64_to_cpu(op->v.src_offset);
   352		s64 shift = dst_offset - src_offset;
   353		u64 len = abs(shift);
   354		u64 pos = le64_to_cpu(op->v.pos);
   355		bool insert = shift > 0;
   356		int ret = 0;
   357	
   358		bch2_trans_iter_init(trans, &iter, BTREE_ID_extents,
   359				     POS(inum.inum, 0),
   360				     BTREE_ITER_INTENT);
   361	
   362		switch (op->v.state) {
   363	case LOGGED_OP_FINSERT_start:
   364		op->v.state = LOGGED_OP_FINSERT_shift_extents;
   365	
   366		if (insert) {
   367			ret = commit_do(trans, NULL, NULL, BTREE_INSERT_NOFAIL,
   368					adjust_i_size(trans, inum, src_offset, len) ?:
   369					bch2_logged_op_update(trans, &op->k_i));
   370			if (ret)
   371				goto err;
   372		} else {
   373			bch2_btree_iter_set_pos(&iter, POS(inum.inum, src_offset));
   374	
   375			ret = bch2_fpunch_at(trans, &iter, inum, src_offset + len, i_sectors_delta);
   376			if (ret && !bch2_err_matches(ret, BCH_ERR_transaction_restart))
   377				goto err;
   378	
   379			ret = commit_do(trans, NULL, NULL, BTREE_INSERT_NOFAIL,
   380					bch2_logged_op_update(trans, &op->k_i));
   381		}
   382	
   383		fallthrough;
   384	case LOGGED_OP_FINSERT_shift_extents:
   385		while (1) {
   386			struct disk_reservation disk_res =
   387				bch2_disk_reservation_init(c, 0);
   388			struct bkey_i delete, *copy;
   389			struct bkey_s_c k;
   390			struct bpos src_pos = POS(inum.inum, src_offset);
   391			u32 snapshot;
   392	
   393			bch2_trans_begin(trans);
   394	
   395			ret = bch2_subvolume_get_snapshot(trans, inum.subvol, &snapshot);
   396			if (ret)
   397				goto btree_err;
   398	
   399			bch2_btree_iter_set_snapshot(&iter, snapshot);
   400			bch2_btree_iter_set_pos(&iter, SPOS(inum.inum, pos, snapshot));
   401	
   402			k = insert
   403				? bch2_btree_iter_peek_prev(&iter)
   404				: bch2_btree_iter_peek_upto(&iter, POS(inum.inum, U64_MAX));
   405			if ((ret = bkey_err(k)))
   406				goto btree_err;
   407	
   408			if (!k.k ||
   409			    k.k->p.inode != inum.inum ||
   410			    bkey_le(k.k->p, POS(inum.inum, src_offset)))
   411				break;
   412	
   413			copy = bch2_bkey_make_mut_noupdate(trans, k);
   414			if ((ret = PTR_ERR_OR_ZERO(copy)))
   415				goto btree_err;
   416	
   417			if (insert &&
   418			    bkey_lt(bkey_start_pos(k.k), src_pos)) {
   419				bch2_cut_front(src_pos, copy);
   420	
   421				/* Splitting compressed extent? */
   422				bch2_disk_reservation_add(c, &disk_res,
   423						copy->k.size *
   424						bch2_bkey_nr_ptrs_allocated(bkey_i_to_s_c(copy)),
   425						BCH_DISK_RESERVATION_NOFAIL);
   426			}
   427	
   428			bkey_init(&delete.k);
   429			delete.k.p = copy->k.p;
   430			delete.k.p.snapshot = snapshot;
   431			delete.k.size = copy->k.size;
   432	
   433			copy->k.p.offset += shift;
   434			copy->k.p.snapshot = snapshot;
   435	
   436			op->v.pos = cpu_to_le64(insert ? bkey_start_offset(&delete.k) : delete.k.p.offset);
   437	
   438			ret =   bch2_btree_insert_trans(trans, BTREE_ID_extents, &delete, 0) ?:
   439				bch2_btree_insert_trans(trans, BTREE_ID_extents, copy, 0) ?:
   440				bch2_logged_op_update(trans, &op->k_i) ?:
   441				bch2_trans_commit(trans, &disk_res, NULL, BTREE_INSERT_NOFAIL);
   442	btree_err:
   443			bch2_disk_reservation_put(c, &disk_res);
   444	
   445			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   446				continue;
   447			if (ret)
   448				goto err;
   449	
   450			pos = le64_to_cpu(op->v.pos);
   451		}
   452	
   453		op->v.state = LOGGED_OP_FINSERT_finish;
   454	
   455		if (!insert) {
   456			ret = commit_do(trans, NULL, NULL, BTREE_INSERT_NOFAIL,
   457					adjust_i_size(trans, inum, src_offset, shift) ?:
   458					bch2_logged_op_update(trans, &op->k_i));
   459		} else {
   460			/* We need an inode update to update bi_journal_seq for fsync: */
   461			ret = commit_do(trans, NULL, NULL, BTREE_INSERT_NOFAIL,
   462					adjust_i_size(trans, inum, 0, 0) ?:
   463					bch2_logged_op_update(trans, &op->k_i));
   464		}
   465	
   466		fallthrough;
   467	case LOGGED_OP_FINSERT_finish:
 > 468		ret = ret;
   469		}
   470	err:
   471		bch2_logged_op_finish(trans, op_k);
   472		bch2_trans_iter_exit(trans, &iter);
   473		return ret;
   474	}
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
