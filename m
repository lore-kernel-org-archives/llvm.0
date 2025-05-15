Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EBD19F489;
	Thu, 15 May 2025 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317898; cv=none; b=rA+ZgGWkmm4a4WkEzMOSutsVqk7gw9HLJAsXIVxzkjphXKUCtmTVE2f2NU3dDCfAQF4wFbpyGTHSVMzaFwkyJhlVHjNdHRvTLZiGN+hhVkuAOsPlv+ucmD2ZpC4Q5xXh9+o+fj4D/V5cHwoq3qSyYjvtAswdwlkrgQ/GC+GVfVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317898; c=relaxed/simple;
	bh=N7JBnvlrdQGWI1GARLEMy5Z/AsY19CCZrv7XvRv7nOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMePdA0z/IfBlxuiraCVWPaZAQEYxWhipExeCZAuHvaBiVfK0AISndHB7wFRGVSVB7ZbAPdUb9Hh4P6YeQ1V97Bxx+9nHBDtVCXF9YJ5kN9NXc49fyJGAxhIB/rzpL2qm6ZflDiJtCEheWO0X1CDgYnQ7HjM1/vABG0znvBP+j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHliKuck; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHliKuck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317896; x=1778853896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7JBnvlrdQGWI1GARLEMy5Z/AsY19CCZrv7XvRv7nOY=;
  b=cHliKuckrj8ZRo4caZZ6ke83SsekauQItfs0Otd5FfAShIY4sltolOdZ
   vzvBMGW8hc/PwxcE1KyttvBy6PVbnpguacv/5fLjNd33CFcz/JAvd1DI+
   C+4qFDk6NAIzsQv3GTHk1cBKcyM47PoUxFGk3tF4uDEnjvcmEhCX+ehuZ
   zKT9q+Z4+Kjglmm/loBnf3ZMpPTazLc3iRVhIBwd4qrsgyZ4GUno46IOd
   31HdTdDSFS/i27/O/o58kMRCs/3exLy5/bZr+ce1EFFlSjmqL+gRb9rJu
   u/mWrg3zqOk3SDRmUgpMtPwAufI/72hQxDG7NMJ6ojyiLfN349tL4irn0
   Q==;
X-CSE-ConnectionGUID: u7tp2mDfTaKu/Fv+XMqKHg==
X-CSE-MsgGUID: kUJtrrLfQ0aVVhZdAXQptA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943634"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:52 -0700
X-CSE-ConnectionGUID: B6Ndztz6QEa4RVrSrR1Wgg==
X-CSE-MsgGUID: 480Kz9KYQt+H968m+a8sNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778838"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000Ev-1E;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3729/4329] fs/bcachefs/move.c:681:11: warning: variable 'sectors_moved' set
 but not used
Message-ID: <202505142232.U2LkFpS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   9d5f0863e401cb64a69c27af17034edd01e989b3
commit: c99d2a7282e4f576475d97ab8f3984346214c471 [3729/4329] bcachefs: bch2_move_data_phys()
config: arm64-randconfig-2001-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142232.U2LkFpS4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142232.U2LkFpS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142232.U2LkFpS4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/move.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2224:
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
>> fs/bcachefs/move.c:681:11: warning: variable 'sectors_moved' set but not used [-Wunused-but-set-variable]
     681 |         unsigned sectors_moved = 0;
         |                  ^
   3 warnings generated.


vim +/sectors_moved +681 fs/bcachefs/move.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  666  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  667  static int __bch2_move_data_phys(struct moving_context *ctxt,
8fcdf81418f16e Kent Overstreet 2023-02-27  668  			struct move_bucket_in_flight *bucket_in_flight,
c99d2a7282e4f5 Kent Overstreet 2024-12-28  669  			unsigned dev,
c99d2a7282e4f5 Kent Overstreet 2024-12-28  670  			u64 bucket_start,
c99d2a7282e4f5 Kent Overstreet 2024-12-28  671  			u64 bucket_end,
c99d2a7282e4f5 Kent Overstreet 2024-12-28  672  			move_pred_fn pred, void *arg)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  673  {
633169035a7ccd Kent Overstreet 2023-10-20  674  	struct btree_trans *trans = ctxt->trans;
633169035a7ccd Kent Overstreet 2023-10-20  675  	struct bch_fs *c = trans->c;
415e5107b0dce0 Kent Overstreet 2023-11-28  676  	bool is_kthread = current->flags & PF_KTHREAD;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  677  	struct bch_io_opts io_opts = bch2_opts_to_inode_opts(c->opts);
9e92d6e9efb02c Kent Overstreet 2024-11-14  678  	struct btree_iter iter = {}, bp_iter = {};
8e3f913e2ab6ac Kent Overstreet 2022-03-18  679  	struct bkey_buf sk;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  680  	struct bkey_s_c k;
4de2c24aa94535 Kent Overstreet 2024-12-09 @681  	unsigned sectors_moved = 0;
056cae1c00b977 Kent Overstreet 2024-11-14  682  	struct bkey_buf last_flushed;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  683  	int ret = 0;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  684  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  685  	struct bch_dev *ca = bch2_dev_tryget(c, dev);
cb4d340a10295f Kent Overstreet 2024-04-30  686  	if (!ca)
cb4d340a10295f Kent Overstreet 2024-04-30  687  		return 0;
cb4d340a10295f Kent Overstreet 2024-04-30  688  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  689  	bucket_end = min(bucket_end, ca->mi.nbuckets);
c99d2a7282e4f5 Kent Overstreet 2024-12-28  690  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  691  	struct bpos bp_start	= bucket_pos_to_bp_start(ca, POS(dev, bucket_start));
c99d2a7282e4f5 Kent Overstreet 2024-12-28  692  	struct bpos bp_end	= bucket_pos_to_bp_end(ca, POS(dev, bucket_end));
c99d2a7282e4f5 Kent Overstreet 2024-12-28  693  	bch2_dev_put(ca);
c99d2a7282e4f5 Kent Overstreet 2024-12-28  694  	ca = NULL;
5a21764db13877 Kent Overstreet 2023-04-20  695  
056cae1c00b977 Kent Overstreet 2024-11-14  696  	bch2_bkey_buf_init(&last_flushed);
056cae1c00b977 Kent Overstreet 2024-11-14  697  	bkey_init(&last_flushed.k->k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  698  	bch2_bkey_buf_init(&sk);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  699  
3e36e572f14bfa Kent Overstreet 2023-03-19  700  	/*
3e36e572f14bfa Kent Overstreet 2023-03-19  701  	 * We're not run in a context that handles transaction restarts:
3e36e572f14bfa Kent Overstreet 2023-03-19  702  	 */
3e36e572f14bfa Kent Overstreet 2023-03-19  703  	bch2_trans_begin(trans);
3e36e572f14bfa Kent Overstreet 2023-03-19  704  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  705  	bch2_trans_iter_init(trans, &bp_iter, BTREE_ID_backpointers, bp_start, 0);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  706  
1bb3c2a9747c40 Kent Overstreet 2023-06-20  707  	bch_err_msg(c, ret, "looking up alloc key");
cf904c8d964fa4 Kent Overstreet 2023-12-16  708  	if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  709  		goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  710  
cb13f471390ce6 Kent Overstreet 2023-11-02  711  	ret = bch2_btree_write_buffer_tryflush(trans);
1bb3c2a9747c40 Kent Overstreet 2023-06-20  712  	bch_err_msg(c, ret, "flushing btree write buffer");
cb13f471390ce6 Kent Overstreet 2023-11-02  713  	if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  714  		goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  715  
633169035a7ccd Kent Overstreet 2023-10-20  716  	while (!(ret = bch2_move_ratelimit(ctxt))) {
415e5107b0dce0 Kent Overstreet 2023-11-28  717  		if (is_kthread && kthread_should_stop())
415e5107b0dce0 Kent Overstreet 2023-11-28  718  			break;
415e5107b0dce0 Kent Overstreet 2023-11-28  719  
80c33085783656 Kent Overstreet 2022-12-05  720  		bch2_trans_begin(trans);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  721  
9e92d6e9efb02c Kent Overstreet 2024-11-14  722  		k = bch2_btree_iter_peek(&bp_iter);
9e92d6e9efb02c Kent Overstreet 2024-11-14  723  		ret = bkey_err(k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  724  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  725  			continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  726  		if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  727  			goto err;
9e92d6e9efb02c Kent Overstreet 2024-11-14  728  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  729  		if (!k.k || bkey_gt(k.k->p, bp_end))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  730  			break;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  731  
9e92d6e9efb02c Kent Overstreet 2024-11-14  732  		if (k.k->type != KEY_TYPE_backpointer)
9e92d6e9efb02c Kent Overstreet 2024-11-14  733  			goto next;
9e92d6e9efb02c Kent Overstreet 2024-11-14  734  
9e92d6e9efb02c Kent Overstreet 2024-11-14  735  		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(k);
9e92d6e9efb02c Kent Overstreet 2024-11-14  736  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  737  		if (ctxt->stats)
c99d2a7282e4f5 Kent Overstreet 2024-12-28  738  			ctxt->stats->offset =
c99d2a7282e4f5 Kent Overstreet 2024-12-28  739  				bp.k->p.offset >> MAX_EXTENT_COMPRESS_RATIO_SHIFT;
c99d2a7282e4f5 Kent Overstreet 2024-12-28  740  
9e92d6e9efb02c Kent Overstreet 2024-11-14  741  		if (!bp.v->level) {
056cae1c00b977 Kent Overstreet 2024-11-14  742  			k = bch2_backpointer_get_key(trans, bp, &iter, 0, &last_flushed);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  743  			ret = bkey_err(k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  744  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  745  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  746  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  747  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  748  			if (!k.k)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  749  				goto next;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  750  
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  751  			ret = bch2_move_get_io_opts_one(trans, &io_opts, &iter, k);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  752  			if (ret) {
80c33085783656 Kent Overstreet 2022-12-05  753  				bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  754  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  755  			}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  756  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  757  			struct data_update_opts data_opts = {};
c99d2a7282e4f5 Kent Overstreet 2024-12-28  758  			if (!pred(c, arg, k, &io_opts, &data_opts)) {
3f5d3fb4025a71 Kent Overstreet 2023-03-10  759  				bch2_trans_iter_exit(trans, &iter);
3f5d3fb4025a71 Kent Overstreet 2023-03-10  760  				goto next;
3f5d3fb4025a71 Kent Overstreet 2023-03-10  761  			}
c99d2a7282e4f5 Kent Overstreet 2024-12-28  762  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  763  			bch2_bkey_buf_reassemble(&sk, c, k);
c99d2a7282e4f5 Kent Overstreet 2024-12-28  764  			k = bkey_i_to_s_c(sk.k);
c99d2a7282e4f5 Kent Overstreet 2024-12-28  765  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  766  			unsigned sectors = bp.v->bucket_len; /* move_extent will drop locks */
8e3f913e2ab6ac Kent Overstreet 2022-03-18  767  
633169035a7ccd Kent Overstreet 2023-10-20  768  			ret = bch2_move_extent(ctxt, bucket_in_flight,
633169035a7ccd Kent Overstreet 2023-10-20  769  					       &iter, k, io_opts, data_opts);
80c33085783656 Kent Overstreet 2022-12-05  770  			bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  771  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  772  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  773  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  774  			if (ret == -ENOMEM) {
8e3f913e2ab6ac Kent Overstreet 2022-03-18  775  				/* memory allocation failure, wait for some IO to finish */
633169035a7ccd Kent Overstreet 2023-10-20  776  				bch2_move_ctxt_wait_for_io(ctxt);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  777  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  778  			}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  779  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  780  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  781  
2f528663c5abf1 Kent Overstreet 2023-03-04  782  			if (ctxt->stats)
4de2c24aa94535 Kent Overstreet 2024-12-09  783  				atomic64_add(sectors, &ctxt->stats->sectors_seen);
4de2c24aa94535 Kent Overstreet 2024-12-09  784  			sectors_moved += sectors;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  785  		} else {
8e3f913e2ab6ac Kent Overstreet 2022-03-18  786  			struct btree *b;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  787  
056cae1c00b977 Kent Overstreet 2024-11-14  788  			b = bch2_backpointer_get_node(trans, bp, &iter, &last_flushed);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  789  			ret = PTR_ERR_OR_ZERO(b);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  790  			if (ret == -BCH_ERR_backpointer_to_overwritten_btree_node)
e3474394eb1a0e Kent Overstreet 2024-12-04  791  				goto next;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  792  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  793  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  794  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  795  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  796  			if (!b)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  797  				goto next;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  798  
c99d2a7282e4f5 Kent Overstreet 2024-12-28  799  			struct data_update_opts data_opts = {};
c99d2a7282e4f5 Kent Overstreet 2024-12-28  800  			if (!pred(c, arg, bkey_i_to_s_c(&b->key), &io_opts, &data_opts)) {
c99d2a7282e4f5 Kent Overstreet 2024-12-28  801  				bch2_trans_iter_exit(trans, &iter);
c99d2a7282e4f5 Kent Overstreet 2024-12-28  802  				goto next;
c99d2a7282e4f5 Kent Overstreet 2024-12-28  803  			}
c99d2a7282e4f5 Kent Overstreet 2024-12-28  804  
652bc7fabc2829 Kent Overstreet 2024-05-24  805  			unsigned sectors = btree_ptr_sectors_written(bkey_i_to_s_c(&b->key));
ec4edd7b9d2038 Kent Overstreet 2024-01-16  806  
80c33085783656 Kent Overstreet 2022-12-05  807  			ret = bch2_btree_node_rewrite(trans, &iter, b, 0);
80c33085783656 Kent Overstreet 2022-12-05  808  			bch2_trans_iter_exit(trans, &iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  809  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  810  			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8e3f913e2ab6ac Kent Overstreet 2022-03-18  811  				continue;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  812  			if (ret)
8e3f913e2ab6ac Kent Overstreet 2022-03-18  813  				goto err;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  814  
8e3f913e2ab6ac Kent Overstreet 2022-03-18  815  			if (ctxt->rate)
ec4edd7b9d2038 Kent Overstreet 2024-01-16  816  				bch2_ratelimit_increment(ctxt->rate, sectors);
2f528663c5abf1 Kent Overstreet 2023-03-04  817  			if (ctxt->stats) {
ec4edd7b9d2038 Kent Overstreet 2024-01-16  818  				atomic64_add(sectors, &ctxt->stats->sectors_seen);
ec4edd7b9d2038 Kent Overstreet 2024-01-16  819  				atomic64_add(sectors, &ctxt->stats->sectors_moved);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  820  			}
c99d2a7282e4f5 Kent Overstreet 2024-12-28  821  			sectors_moved += sectors;
2f528663c5abf1 Kent Overstreet 2023-03-04  822  		}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  823  next:
9e92d6e9efb02c Kent Overstreet 2024-11-14  824  		bch2_btree_iter_advance(&bp_iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  825  	}
8e3f913e2ab6ac Kent Overstreet 2022-03-18  826  err:
9e92d6e9efb02c Kent Overstreet 2024-11-14  827  	bch2_trans_iter_exit(trans, &bp_iter);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  828  	bch2_bkey_buf_exit(&sk, c);
056cae1c00b977 Kent Overstreet 2024-11-14  829  	bch2_bkey_buf_exit(&last_flushed, c);
8e3f913e2ab6ac Kent Overstreet 2022-03-18  830  	return ret;
8e3f913e2ab6ac Kent Overstreet 2022-03-18  831  }
8e3f913e2ab6ac Kent Overstreet 2022-03-18  832  

:::::: The code at line 681 was first introduced by commit
:::::: 4de2c24aa9453564ceb285039e2816bd22fa4ac6 bcachefs: Fix evacuate_bucket tracepoint

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
