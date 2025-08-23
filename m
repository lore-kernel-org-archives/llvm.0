Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215A817555;
	Sat, 23 Aug 2025 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755956626; cv=none; b=VlngYCdNpGoYMQ4JxVWhI/Aq/3X71gxNaxQ3fOjx31EFSFKPLYggjoTEugvxmsvNQ3Akq4aDI9TQ0Z+O7lUcJkgkoy7AasN2StrM7oGVNhbMkGsOOg4DWXiqjoKcuJGTWbtG8fo0eYlr6CL1Kp5gxpVgB3JZe8cn9u1DbXYhewY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755956626; c=relaxed/simple;
	bh=SYKe5CulOhjzGY27kdF2knpr1wIg8AMU2aTe6y/qo2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s34OD/BT6ucpMOTYZjmxNu9w2SlkTj+KFrOg6v+lVDe5EplV7u28GHRF1lDoXKj1Hs1OT8RKyML6kGa8YzlAEgcbMXbSjcUzKaDOSn515GIq33EvQLodxvOmVlG6oYomNLsW2+X/JNBygYqGwTY6VtgewJdDdoYhsMcNYmKWWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7YTC6Hw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7YTC6Hw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755956624; x=1787492624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SYKe5CulOhjzGY27kdF2knpr1wIg8AMU2aTe6y/qo2Q=;
  b=i7YTC6HwV4nT/YhtNQaQoGpDemAZ9TY2mbquej49vOJ3uV7vcLkZfh35
   7jSTVT168adKN7SuSb3q9M77ZmJGV4tmvjJQqMogvSAMjAUqoQzhGyNJ0
   xMauLwBwWWd9UWwJNpCI4oU3/Lp5pA6/OVixeJ+1ZvV8nNujx5GP9deF2
   Lp/euPbthQb8d0PNePpXUPMa1wd0+kaLbqOWa8KBoG5qhPBgBvziw1cSe
   Z+8UrlVPrTJfiB2Ncz7/GCwZ7SlIszHDr+ejKHZb2A8CEX4DXrd6gm0o5
   /2nIyDVfn8hIFs2eXxaLtfWlRBoFc+A0iLq9VvBMop0rhuYewBW4Ai+q8
   Q==;
X-CSE-ConnectionGUID: qRWJLvKlQXiPCiu1fcblnw==
X-CSE-MsgGUID: xSKG4GOBTqqCPFaDMcKqrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="69674082"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69674082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 06:43:44 -0700
X-CSE-ConnectionGUID: lR+NW7hMSP2RsX2TRruhIg==
X-CSE-MsgGUID: RlFVeZHwRFu9xoLNogRMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169275987"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Aug 2025 06:43:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upoWx-000MK7-0t;
	Sat, 23 Aug 2025 13:43:39 +0000
Date: Sat, 23 Aug 2025 21:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance 336/336]
 fs/bcachefs/rebalance.c:598:3: error: initializer element is not a
 compile-time constant
Message-ID: <202508232149.WXCTVTwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance
head:   20ae3d99d2755617d23d984971def2fb3fba21e5
commit: 20ae3d99d2755617d23d984971def2fb3fba21e5 [336/336] more rebalance work NOTES
config: x86_64-buildonly-randconfig-003-20250823 (https://download.01.org/0day-ci/archive/20250823/202508232149.WXCTVTwc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508232149.WXCTVTwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508232149.WXCTVTwc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/rebalance.c:598:3: error: initializer element is not a compile-time constant
     598 |                 bch2_bkey_needs_rebalance(c, k, io_opts, &move_ptrs, &compress_ptrs, &csum_ptrs, false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> fs/bcachefs/io_write.c:362:41: error: use of undeclared identifier 'op'
     362 |                 bch2_bkey_set_needs_rebalance(trans, &op->opts, k,
         |                                                       ^
   1 error generated.


vim +598 fs/bcachefs/rebalance.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  565  
fb3f57bb1177ae Kent Overstreet 2023-10-20  566  static struct bkey_s_c next_rebalance_extent(struct btree_trans *trans,
063bc61f55098f Kent Overstreet 2025-08-20  567  			struct per_snapshot_io_opts *snapshot_io_opts,
fb3f57bb1177ae Kent Overstreet 2023-10-20  568  			struct bpos work_pos,
fb3f57bb1177ae Kent Overstreet 2023-10-20  569  			struct btree_iter *extent_iter,
063bc61f55098f Kent Overstreet 2025-08-20  570  			struct bch_io_opts **io_opts_ret,
fb3f57bb1177ae Kent Overstreet 2023-10-20  571  			struct data_update_opts *data_opts)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  572  {
fb3f57bb1177ae Kent Overstreet 2023-10-20  573  	struct bch_fs *c = trans->c;
fb3f57bb1177ae Kent Overstreet 2023-10-20  574  
951d23507b08c2 Kent Overstreet 2025-07-30  575  	bch2_trans_iter_exit(extent_iter);
fb3f57bb1177ae Kent Overstreet 2023-10-20  576  	bch2_trans_iter_init(trans, extent_iter,
fb3f57bb1177ae Kent Overstreet 2023-10-20  577  			     work_pos.inode ? BTREE_ID_extents : BTREE_ID_reflink,
fb3f57bb1177ae Kent Overstreet 2023-10-20  578  			     work_pos,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  579  			     BTREE_ITER_all_snapshots);
25201eae7abed7 Kent Overstreet 2025-07-30  580  	struct bkey_s_c k = bch2_btree_iter_peek_slot(extent_iter);
fb3f57bb1177ae Kent Overstreet 2023-10-20  581  	if (bkey_err(k))
fb3f57bb1177ae Kent Overstreet 2023-10-20  582  		return k;
fb3f57bb1177ae Kent Overstreet 2023-10-20  583  
063bc61f55098f Kent Overstreet 2025-08-20  584  	struct bch_io_opts *io_opts =
063bc61f55098f Kent Overstreet 2025-08-20  585  		bch2_extent_get_apply_io_opts(trans, snapshot_io_opts,
5fb2bccc7dfb8c Kent Overstreet 2025-08-20  586  					      extent_iter->pos, extent_iter, k,
5fb2bccc7dfb8c Kent Overstreet 2025-08-20  587  					      SET_NEEDS_REBALANCE_other);
063bc61f55098f Kent Overstreet 2025-08-20  588  	int ret = PTR_ERR_OR_ZERO(io_opts);
3de8b72731dbb4 Kent Overstreet 2024-10-19  589  	if (ret)
3de8b72731dbb4 Kent Overstreet 2024-10-19  590  		return bkey_s_c_err(ret);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  591  
063bc61f55098f Kent Overstreet 2025-08-20  592  	*io_opts_ret = io_opts;
063bc61f55098f Kent Overstreet 2025-08-20  593  
e525fb25001600 Kent Overstreet 2025-08-20  594  	unsigned move_ptrs	= 0;
e525fb25001600 Kent Overstreet 2025-08-20  595  	unsigned compress_ptrs	= 0;
e525fb25001600 Kent Overstreet 2025-08-20  596  	unsigned csum_ptrs	= 0;
20ae3d99d27556 Kent Overstreet 2025-08-20  597  	static struct bch_extent_rebalance r =
e525fb25001600 Kent Overstreet 2025-08-20 @598  		bch2_bkey_needs_rebalance(c, k, io_opts, &move_ptrs, &compress_ptrs, &csum_ptrs, false);
e525fb25001600 Kent Overstreet 2025-08-20  599  
fb3f57bb1177ae Kent Overstreet 2023-10-20  600  	memset(data_opts, 0, sizeof(*data_opts));
e525fb25001600 Kent Overstreet 2025-08-20  601  	data_opts->rewrite_ptrs		= move_ptrs|compress_ptrs|csum_ptrs;
3de8b72731dbb4 Kent Overstreet 2024-10-19  602  	data_opts->target		= io_opts->background_target;
14e2523fc59d16 Kent Overstreet 2025-01-19  603  	data_opts->write_flags		|= BCH_WRITE_only_specified_devs;
fb3f57bb1177ae Kent Overstreet 2023-10-20  604  
20ae3d99d27556 Kent Overstreet 2025-08-20  605  	if (r.need_rb & BIT(BCH_REBALANCE_erasure_code)) {
20ae3d99d27556 Kent Overstreet 2025-08-20  606  	}
20ae3d99d27556 Kent Overstreet 2025-08-20  607  
20ae3d99d27556 Kent Overstreet 2025-08-20  608  	if (r.need_rb & BIT(BCH_REBALANCE_data_replicas)) {
20ae3d99d27556 Kent Overstreet 2025-08-20  609  	}
20ae3d99d27556 Kent Overstreet 2025-08-20  610  
e525fb25001600 Kent Overstreet 2025-08-20  611  	/* XXX: handle ec, increase/decrease replicas */
e525fb25001600 Kent Overstreet 2025-08-20  612  
20ae3d99d27556 Kent Overstreet 2025-08-20  613  	/* XXX: can we handle metadata? */
20ae3d99d27556 Kent Overstreet 2025-08-20  614  
20ae3d99d27556 Kent Overstreet 2025-08-20  615  	/* XXX: device scan cookies */
20ae3d99d27556 Kent Overstreet 2025-08-20  616  
fb3f57bb1177ae Kent Overstreet 2023-10-20  617  	if (!data_opts->rewrite_ptrs) {
fb3f57bb1177ae Kent Overstreet 2023-10-20  618  		/*
fb3f57bb1177ae Kent Overstreet 2023-10-20  619  		 * device we would want to write to offline? devices in target
fb3f57bb1177ae Kent Overstreet 2023-10-20  620  		 * changed?
fb3f57bb1177ae Kent Overstreet 2023-10-20  621  		 *
fb3f57bb1177ae Kent Overstreet 2023-10-20  622  		 * We'll now need a full scan before this extent is picked up
fb3f57bb1177ae Kent Overstreet 2023-10-20  623  		 * again:
fb3f57bb1177ae Kent Overstreet 2023-10-20  624  		 */
fb3f57bb1177ae Kent Overstreet 2023-10-20  625  		int ret = bch2_bkey_clear_needs_rebalance(trans, extent_iter, k);
fb3f57bb1177ae Kent Overstreet 2023-10-20  626  		if (ret)
fb3f57bb1177ae Kent Overstreet 2023-10-20  627  			return bkey_s_c_err(ret);
fb3f57bb1177ae Kent Overstreet 2023-10-20  628  		return bkey_s_c_null;
182084e3dc5f55 Kent Overstreet 2020-01-20  629  	}
fb3f57bb1177ae Kent Overstreet 2023-10-20  630  
25d1e39df0e284 Kent Overstreet 2023-11-24  631  	if (trace_rebalance_extent_enabled()) {
fb021e8ae7db85 Kent Overstreet 2025-07-14  632  		CLASS(printbuf, buf)();
25d1e39df0e284 Kent Overstreet 2023-11-24  633  
a652c56590a912 Kent Overstreet 2024-10-26  634  		bch2_bkey_val_to_text(&buf, c, k);
a652c56590a912 Kent Overstreet 2024-10-26  635  		prt_newline(&buf);
a652c56590a912 Kent Overstreet 2024-10-26  636  
de1d7af8f987a9 Kent Overstreet 2025-08-20  637  		if (move_ptrs) {
de1d7af8f987a9 Kent Overstreet 2025-08-20  638  			prt_str(&buf, "move=");
de1d7af8f987a9 Kent Overstreet 2025-08-20  639  			bch2_target_to_text(&buf, c, io_opts->background_target);
25d1e39df0e284 Kent Overstreet 2023-11-24  640  			prt_str(&buf, " ");
de1d7af8f987a9 Kent Overstreet 2025-08-20  641  			bch2_prt_u64_base2(&buf, move_ptrs);
a652c56590a912 Kent Overstreet 2024-10-26  642  			prt_newline(&buf);
a652c56590a912 Kent Overstreet 2024-10-26  643  		}
a652c56590a912 Kent Overstreet 2024-10-26  644  
de1d7af8f987a9 Kent Overstreet 2025-08-20  645  		if (compress_ptrs) {
de1d7af8f987a9 Kent Overstreet 2025-08-20  646  			prt_str(&buf, "compression=");
de1d7af8f987a9 Kent Overstreet 2025-08-20  647  			bch2_compression_opt_to_text(&buf, io_opts->background_compression);
a652c56590a912 Kent Overstreet 2024-10-26  648  			prt_str(&buf, " ");
de1d7af8f987a9 Kent Overstreet 2025-08-20  649  			bch2_prt_u64_base2(&buf, compress_ptrs);
a652c56590a912 Kent Overstreet 2024-10-26  650  			prt_newline(&buf);
a652c56590a912 Kent Overstreet 2024-10-26  651  		}
25d1e39df0e284 Kent Overstreet 2023-11-24  652  
567173c1b644eb Kent Overstreet 2025-08-20  653  		if (csum_ptrs) {
567173c1b644eb Kent Overstreet 2025-08-20  654  			prt_str(&buf, "csum=");
567173c1b644eb Kent Overstreet 2025-08-20  655  			bch2_prt_csum_opt(&buf, io_opts->data_checksum);
567173c1b644eb Kent Overstreet 2025-08-20  656  			prt_str(&buf, " ");
567173c1b644eb Kent Overstreet 2025-08-20  657  			bch2_prt_u64_base2(&buf, csum_ptrs);
567173c1b644eb Kent Overstreet 2025-08-20  658  			prt_newline(&buf);
567173c1b644eb Kent Overstreet 2025-08-20  659  		}
567173c1b644eb Kent Overstreet 2025-08-20  660  
25d1e39df0e284 Kent Overstreet 2023-11-24  661  		trace_rebalance_extent(c, buf.buf);
25d1e39df0e284 Kent Overstreet 2023-11-24  662  	}
f1f242e7d6d5d3 Kent Overstreet 2025-08-18  663  	count_event(c, rebalance_extent);
25d1e39df0e284 Kent Overstreet 2023-11-24  664  
fb3f57bb1177ae Kent Overstreet 2023-10-20  665  	return k;
182084e3dc5f55 Kent Overstreet 2020-01-20  666  }
182084e3dc5f55 Kent Overstreet 2020-01-20  667  

:::::: The code at line 598 was first introduced by commit
:::::: e525fb250016003c7d1aef9e0a1074261973b5df more rebalance work

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
