Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C546F4ED;
	Sun, 17 Nov 2024 03:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731815991; cv=none; b=L/19lfpXOr/MkoGOksK9b9Whx5o0Ap9dq1u395B5stWqPp1PSjxWslb3w2Xoc0INLWW+oDm9dSmRUAsTseMlYTJkk9oDLESu/8TenxAy9y2guVehWfNz/KlX+FrROgFLXATl+/MUQFHlyjhvbbxeWrOilm56JS2ldbRYnTfGT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731815991; c=relaxed/simple;
	bh=pLoFUd+VbCek9WRh6MR5/dQ6LFp4Pb4ntA3+Pu/TNwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TD8GIOsCdPFpWf6q9R49stp6MCMnhm0acAUs9t1bFDZ5/fOqSIbnXhve2lRTiLevt1mrgeZ0aXmvMWiE9S67Eu2oqJkcvKCV7wOyJ4Db4E8toU91sO95SeM9chy8yvX2IReBeEtAo+RchHPgWMWjRT1Ik1lqjfq+DoLhVB+bilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxBfyFRX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxBfyFRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731815990; x=1763351990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pLoFUd+VbCek9WRh6MR5/dQ6LFp4Pb4ntA3+Pu/TNwc=;
  b=OxBfyFRXO+FnRL7ibXdHWt2JxJrdIpxe4z3ryYl3bt+Q301v0E0O9R4y
   6lWxhGS34BcmfCVmUsdkiEoAIue5qS8nbc2GaJ7RvlYkCSPQFSEHlbeEC
   sJOeaZ2ARPu2cqZji7kNKfCbvZ7dj7dUq0SyNQ588uuVh8EHAA+SjlD2g
   JW5aR++ms23OqYUY38DrcJC94Apr8MegenCsbZ+uTr3FZ5JykcpeTMnBa
   I36PLLvc9BY5FTjzjXBCMqMLc/4S00LLWHEkSlSwnq6YwjE2yiOcNh8GB
   b7bXNqQeuTZhV/gyi5kxQR7WoX0zkWZtd5rRy5UgMJKi/gNlNStQA1hTd
   w==;
X-CSE-ConnectionGUID: X02YId6EQDGMBdwe9s3MGg==
X-CSE-MsgGUID: SoIgvDeqQtKzX/drokkP3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35711737"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35711737"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 19:59:47 -0800
X-CSE-ConnectionGUID: o0+TWamFScebBjIKO4v8cg==
X-CSE-MsgGUID: E7UYYrsRQ/qJrfqVMKvXrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88483448"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2024 19:59:46 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWRr-0001Om-1o;
	Sun, 17 Nov 2024 03:59:43 +0000
Date: Sun, 17 Nov 2024 11:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 112/119] fs/bcachefs/move.c:814:36:
 warning: variable 'dirty_sectors' is uninitialized when used here
Message-ID: <202411171154.RatlgkMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   21a5aa40972310f58b352b602a010f3a1c61f57e
commit: 86a494c8eef94a7dc21f26b5c85cb10c5040f04c [112/119] bcachefs: Kill bch2_get_next_backpointer()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411171154.RatlgkMz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171154.RatlgkMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171154.RatlgkMz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/move.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/move.c:814:36: warning: variable 'dirty_sectors' is uninitialized when used here [-Wuninitialized]
     814 |         trace_evacuate_bucket(c, &bucket, dirty_sectors, bucket_size, fragmentation, ret);
         |                                           ^~~~~~~~~~~~~
   fs/bcachefs/move.c:677:24: note: initialize the variable 'dirty_sectors' to silence this warning
     677 |         unsigned dirty_sectors, bucket_size;
         |                               ^
         |                                = 0
>> fs/bcachefs/move.c:814:51: warning: variable 'bucket_size' is uninitialized when used here [-Wuninitialized]
     814 |         trace_evacuate_bucket(c, &bucket, dirty_sectors, bucket_size, fragmentation, ret);
         |                                                          ^~~~~~~~~~~
   fs/bcachefs/move.c:677:37: note: initialize the variable 'bucket_size' to silence this warning
     677 |         unsigned dirty_sectors, bucket_size;
         |                                            ^
         |                                             = 0
>> fs/bcachefs/move.c:814:64: warning: variable 'fragmentation' is uninitialized when used here [-Wuninitialized]
     814 |         trace_evacuate_bucket(c, &bucket, dirty_sectors, bucket_size, fragmentation, ret);
         |                                                                       ^~~~~~~~~~~~~
   fs/bcachefs/move.c:678:19: note: initialize the variable 'fragmentation' to silence this warning
     678 |         u64 fragmentation;
         |                          ^
         |                           = 0
   7 warnings generated.


vim +/dirty_sectors +814 fs/bcachefs/move.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  663  
74529338805d514 Daniel Hill     2023-11-26  664  int bch2_evacuate_bucket(struct moving_context *ctxt,
8fcdf81418f16ef Kent Overstreet 2023-02-27  665  			   struct move_bucket_in_flight *bucket_in_flight,
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  666  			   struct bpos bucket, int gen,
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  667  			   struct data_update_opts _data_opts)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  668  {
633169035a7ccdf Kent Overstreet 2023-10-20  669  	struct btree_trans *trans = ctxt->trans;
633169035a7ccdf Kent Overstreet 2023-10-20  670  	struct bch_fs *c = trans->c;
415e5107b0dce0e Kent Overstreet 2023-11-28  671  	bool is_kthread = current->flags & PF_KTHREAD;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  672  	struct bch_io_opts io_opts = bch2_opts_to_inode_opts(c->opts);
86a494c8eef94a7 Kent Overstreet 2024-11-14  673  	struct btree_iter iter = {}, bp_iter = {};
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  674  	struct bkey_buf sk;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  675  	struct bkey_s_c k;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  676  	struct data_update_opts data_opts;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  677  	unsigned dirty_sectors, bucket_size;
80c330857836566 Kent Overstreet 2022-12-05  678  	u64 fragmentation;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  679  	int ret = 0;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  680  
cb4d340a10295fc Kent Overstreet 2024-04-30  681  	struct bch_dev *ca = bch2_dev_tryget(c, bucket.inode);
cb4d340a10295fc Kent Overstreet 2024-04-30  682  	if (!ca)
cb4d340a10295fc Kent Overstreet 2024-04-30  683  		return 0;
cb4d340a10295fc Kent Overstreet 2024-04-30  684  
5a21764db13877e Kent Overstreet 2023-04-20  685  	trace_bucket_evacuate(c, &bucket);
5a21764db13877e Kent Overstreet 2023-04-20  686  
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  687  	bch2_bkey_buf_init(&sk);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  688  
3e36e572f14bfa2 Kent Overstreet 2023-03-19  689  	/*
3e36e572f14bfa2 Kent Overstreet 2023-03-19  690  	 * We're not run in a context that handles transaction restarts:
3e36e572f14bfa2 Kent Overstreet 2023-03-19  691  	 */
3e36e572f14bfa2 Kent Overstreet 2023-03-19  692  	bch2_trans_begin(trans);
3e36e572f14bfa2 Kent Overstreet 2023-03-19  693  
86a494c8eef94a7 Kent Overstreet 2024-11-14  694  	bch2_trans_iter_init(trans, &bp_iter, BTREE_ID_backpointers,
86a494c8eef94a7 Kent Overstreet 2024-11-14  695  			     bucket_pos_to_bp(ca, bucket, 0), 0);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  696  
1bb3c2a9747c404 Kent Overstreet 2023-06-20  697  	bch_err_msg(c, ret, "looking up alloc key");
cf904c8d964fa47 Kent Overstreet 2023-12-16  698  	if (ret)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  699  		goto err;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  700  
cb13f471390ce64 Kent Overstreet 2023-11-02  701  	ret = bch2_btree_write_buffer_tryflush(trans);
1bb3c2a9747c404 Kent Overstreet 2023-06-20  702  	bch_err_msg(c, ret, "flushing btree write buffer");
cb13f471390ce64 Kent Overstreet 2023-11-02  703  	if (ret)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  704  		goto err;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  705  
633169035a7ccdf Kent Overstreet 2023-10-20  706  	while (!(ret = bch2_move_ratelimit(ctxt))) {
415e5107b0dce0e Kent Overstreet 2023-11-28  707  		if (is_kthread && kthread_should_stop())
415e5107b0dce0e Kent Overstreet 2023-11-28  708  			break;
415e5107b0dce0e Kent Overstreet 2023-11-28  709  
80c330857836566 Kent Overstreet 2022-12-05  710  		bch2_trans_begin(trans);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  711  
86a494c8eef94a7 Kent Overstreet 2024-11-14  712  		k = bch2_btree_iter_peek(&bp_iter);
86a494c8eef94a7 Kent Overstreet 2024-11-14  713  		ret = bkey_err(k);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  714  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  715  			continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  716  		if (ret)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  717  			goto err;
86a494c8eef94a7 Kent Overstreet 2024-11-14  718  
86a494c8eef94a7 Kent Overstreet 2024-11-14  719  		if (!k.k ||
86a494c8eef94a7 Kent Overstreet 2024-11-14  720  		    bkey_ge(k.k->p, bucket_pos_to_bp(ca, bpos_nosnap_successor(bucket), 0)))
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  721  			break;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  722  
86a494c8eef94a7 Kent Overstreet 2024-11-14  723  		if (k.k->type != KEY_TYPE_backpointer)
86a494c8eef94a7 Kent Overstreet 2024-11-14  724  			goto next;
86a494c8eef94a7 Kent Overstreet 2024-11-14  725  
86a494c8eef94a7 Kent Overstreet 2024-11-14  726  		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(k);
86a494c8eef94a7 Kent Overstreet 2024-11-14  727  
86a494c8eef94a7 Kent Overstreet 2024-11-14  728  		if (!bp.v->level) {
86a494c8eef94a7 Kent Overstreet 2024-11-14  729  			k = bch2_backpointer_get_key(trans, bp, &iter, 0);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  730  			ret = bkey_err(k);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  731  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  732  				continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  733  			if (ret)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  734  				goto err;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  735  			if (!k.k)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  736  				goto next;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  737  
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  738  			bch2_bkey_buf_reassemble(&sk, c, k);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  739  			k = bkey_i_to_s_c(sk.k);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  740  
54bfe068fe00507 Kent Overstreet 2024-10-19  741  			ret = bch2_move_get_io_opts_one(trans, &io_opts, &iter, k);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  742  			if (ret) {
80c330857836566 Kent Overstreet 2022-12-05  743  				bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  744  				continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  745  			}
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  746  
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  747  			data_opts = _data_opts;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  748  			data_opts.target	= io_opts.background_target;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  749  			data_opts.rewrite_ptrs = 0;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  750  
0beebd92457c322 Kent Overstreet 2023-12-21  751  			unsigned i = 0;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  752  			bkey_for_each_ptr(bch2_bkey_ptrs_c(k), ptr) {
3f5d3fb4025a719 Kent Overstreet 2023-03-10  753  				if (ptr->dev == bucket.inode) {
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  754  					data_opts.rewrite_ptrs |= 1U << i;
3f5d3fb4025a719 Kent Overstreet 2023-03-10  755  					if (ptr->cached) {
3f5d3fb4025a719 Kent Overstreet 2023-03-10  756  						bch2_trans_iter_exit(trans, &iter);
3f5d3fb4025a719 Kent Overstreet 2023-03-10  757  						goto next;
3f5d3fb4025a719 Kent Overstreet 2023-03-10  758  					}
3f5d3fb4025a719 Kent Overstreet 2023-03-10  759  				}
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  760  				i++;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  761  			}
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  762  
633169035a7ccdf Kent Overstreet 2023-10-20  763  			ret = bch2_move_extent(ctxt, bucket_in_flight,
633169035a7ccdf Kent Overstreet 2023-10-20  764  					       &iter, k, io_opts, data_opts);
80c330857836566 Kent Overstreet 2022-12-05  765  			bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  766  
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  767  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  768  				continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  769  			if (ret == -ENOMEM) {
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  770  				/* memory allocation failure, wait for some IO to finish */
633169035a7ccdf Kent Overstreet 2023-10-20  771  				bch2_move_ctxt_wait_for_io(ctxt);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  772  				continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  773  			}
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  774  			if (ret)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  775  				goto err;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  776  
2f528663c5abf10 Kent Overstreet 2023-03-04  777  			if (ctxt->stats)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  778  				atomic64_add(k.k->size, &ctxt->stats->sectors_seen);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  779  		} else {
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  780  			struct btree *b;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  781  
86a494c8eef94a7 Kent Overstreet 2024-11-14  782  			b = bch2_backpointer_get_node(trans, bp, &iter);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  783  			ret = PTR_ERR_OR_ZERO(b);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  784  			if (ret == -BCH_ERR_backpointer_to_overwritten_btree_node)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  785  				continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  786  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  787  				continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  788  			if (ret)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  789  				goto err;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  790  			if (!b)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  791  				goto next;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  792  
652bc7fabc28294 Kent Overstreet 2024-05-24  793  			unsigned sectors = btree_ptr_sectors_written(bkey_i_to_s_c(&b->key));
ec4edd7b9d2038a Kent Overstreet 2024-01-16  794  
80c330857836566 Kent Overstreet 2022-12-05  795  			ret = bch2_btree_node_rewrite(trans, &iter, b, 0);
80c330857836566 Kent Overstreet 2022-12-05  796  			bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  797  
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  798  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  799  				continue;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  800  			if (ret)
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  801  				goto err;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  802  
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  803  			if (ctxt->rate)
ec4edd7b9d2038a Kent Overstreet 2024-01-16  804  				bch2_ratelimit_increment(ctxt->rate, sectors);
2f528663c5abf10 Kent Overstreet 2023-03-04  805  			if (ctxt->stats) {
ec4edd7b9d2038a Kent Overstreet 2024-01-16  806  				atomic64_add(sectors, &ctxt->stats->sectors_seen);
ec4edd7b9d2038a Kent Overstreet 2024-01-16  807  				atomic64_add(sectors, &ctxt->stats->sectors_moved);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  808  			}
2f528663c5abf10 Kent Overstreet 2023-03-04  809  		}
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  810  next:
86a494c8eef94a7 Kent Overstreet 2024-11-14  811  		bch2_btree_iter_advance(&bp_iter);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  812  	}
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  813  
80c330857836566 Kent Overstreet 2022-12-05 @814  	trace_evacuate_bucket(c, &bucket, dirty_sectors, bucket_size, fragmentation, ret);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  815  err:
86a494c8eef94a7 Kent Overstreet 2024-11-14  816  	bch2_trans_iter_exit(trans, &bp_iter);
cb4d340a10295fc Kent Overstreet 2024-04-30  817  	bch2_dev_put(ca);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  818  	bch2_bkey_buf_exit(&sk, c);
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  819  	return ret;
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  820  }
8e3f913e2ab6ac2 Kent Overstreet 2022-03-18  821  

:::::: The code at line 814 was first introduced by commit
:::::: 80c33085783656617d0d07e1bc9fba70a592ce5c bcachefs: Fragmentation LRU

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
