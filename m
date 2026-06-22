Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340C0347FE1;
	Mon, 22 Jun 2026 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782155424; cv=none; b=Qn2/GNsQZtqw9oLR5KKOmHLWGyyMoDHthFFvKRJk/yCqZpKFz16v4VuYU/aqSEXA8KhXdm6SsVGrolct5rVXUAgcN69wasmIqGFGViTxJCJUxkpR50NOp86UZ7SH7fx6/1v5lY5o5pHQPKLTv/JJHGjhqBVxt11Ojgr/Qs1fKU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782155424; c=relaxed/simple;
	bh=ha12m4rnfFj/AHMBzd2t7JsNYf4oxH86G7DDPIEynHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JExBFJ7P8tvHqEjha9p1g8K6hmRY6lsge/FKX3DhnKnhElUT+Xqc+q+NejUgqSgkkmCZUMdFfu8a5jKVbHKLv93+EpwsrtoHE9dWZKMKaohyzRJzGrVbvGExJxyiTakEaWedw7lQILWWLlNjDbukBdO6GTNS+JFBVSqYtE7uQPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLXc9FJE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLXc9FJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782155422; x=1813691422;
  h=date:from:to:cc:subject:message-id;
  bh=ha12m4rnfFj/AHMBzd2t7JsNYf4oxH86G7DDPIEynHE=;
  b=QLXc9FJERbXH0Uel5QEujNnAHMDxJfFFjmTB8hfGuiQLKoCVVMO5r8uL
   vBWDcZm6WJB4NH+PS2OQJhEHPviicUwLp+GtSkAz2kngug5Ll+zA4Fzl/
   4jweYWjmXlpkBJI2bbIPXgAo3dZppBMqL2V2rr1JzDsIHHkkTnlKyzxi9
   drJoJ3GRb2RBZwglmszexdZO8EyYCZtGAUVDGAUFwPZsMCzV7NuIVxVOn
   V1ssUKIhothBYePVQAuKaWPhLNOTrYg6+SIoNFmXEFSYsjWrWJ2t76Fhz
   PiY5CyUis8D2YQXNw+O0nNnTTLI2eWXWe0jt/zIVL87iRxi/DYbudS1Vc
   Q==;
X-CSE-ConnectionGUID: WK/qohyhRSCUI3k1qvcflg==
X-CSE-MsgGUID: +knrAP81RTSVezbBN95+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93550571"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93550571"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 12:10:22 -0700
X-CSE-ConnectionGUID: 8m2STgp2T6ClRPRgAoBpGw==
X-CSE-MsgGUID: 6IpxT73xToOsbmoyzfz8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273000573"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jun 2026 12:10:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbk2A-000000001l9-04Pr;
	Mon, 22 Jun 2026 19:10:14 +0000
Date: Tue, 23 Jun 2026 03:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 230/332]
 fs/bcachefs/data/reconcile/work.c:964:25: warning: stack frame size (1048)
 exceeds limit (1024) in 'do_reconcile_phys_thread'
Message-ID: <202606230247.OoUSKV5v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 70476991ac7cf35891fc0cf6cb249cda734ad7e8 [230/332] bcachefs: reconcile: plumb reconcile_phase.end
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230247.OoUSKV5v-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230247.OoUSKV5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230247.OoUSKV5v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/reconcile/work.c:964:25: warning: stack frame size (1048) exceeds limit (1024) in 'do_reconcile_phys_thread' [-Wframe-larger-than]
     964 | static CLOSURE_CALLBACK(do_reconcile_phys_thread)
         |                         ^
   1 warning generated.


vim +/do_reconcile_phys_thread +964 fs/bcachefs/data/reconcile/work.c

de374d7b729620 Kent Overstreet 2026-01-19   963  
de374d7b729620 Kent Overstreet 2026-01-19  @964  static CLOSURE_CALLBACK(do_reconcile_phys_thread)
de374d7b729620 Kent Overstreet 2026-01-19   965  {
de374d7b729620 Kent Overstreet 2026-01-19   966  	closure_type(thr, reconcile_phys_thr, cl);
de374d7b729620 Kent Overstreet 2026-01-19   967  	struct bch_fs *c = thr->c;
de374d7b729620 Kent Overstreet 2026-01-19   968  
de374d7b729620 Kent Overstreet 2026-01-19   969  	struct moving_context ctxt __cleanup(bch2_moving_ctxt_exit);
de374d7b729620 Kent Overstreet 2026-01-19   970  	bch2_moving_ctxt_init(&ctxt, c, NULL, &thr->stats,
de374d7b729620 Kent Overstreet 2026-01-19   971  			      writepoint_ptr(&c->allocator.reconcile_write_point),
de374d7b729620 Kent Overstreet 2026-01-19   972  			      true);
de374d7b729620 Kent Overstreet 2026-01-19   973  
de374d7b729620 Kent Overstreet 2026-01-19   974  	struct btree_trans *trans = ctxt.trans;
de374d7b729620 Kent Overstreet 2026-01-19   975  
de374d7b729620 Kent Overstreet 2026-01-19   976  	CLASS(darray_reconcile_work, work)();
de374d7b729620 Kent Overstreet 2026-01-19   977  	darray_make_room(&work, REBALANCE_WORK_BUF_NR);
de374d7b729620 Kent Overstreet 2026-01-19   978  	if (!work.size) {
de374d7b729620 Kent Overstreet 2026-01-19   979  		bch_err(c, "%s: unable to allocate memory", __func__);
de374d7b729620 Kent Overstreet 2026-01-19   980  		closure_return(cl);
de374d7b729620 Kent Overstreet 2026-01-19   981  		return;
de374d7b729620 Kent Overstreet 2026-01-19   982  	}
de374d7b729620 Kent Overstreet 2026-01-19   983  
de374d7b729620 Kent Overstreet 2026-01-19   984  	CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
de374d7b729620 Kent Overstreet 2026-01-19   985  
de374d7b729620 Kent Overstreet 2026-01-19   986  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
de374d7b729620 Kent Overstreet 2026-01-19   987  	wb_maybe_flush_init(&last_flushed);
de374d7b729620 Kent Overstreet 2026-01-19   988  
70476991ac7cf3 Kent Overstreet 2026-01-20   989  	struct bbpos work_pos = BBPOS(reconcile_phases[thr->reconcile_phase].btree,
70476991ac7cf3 Kent Overstreet 2026-01-20   990  				      POS(thr->dev, 0));
de374d7b729620 Kent Overstreet 2026-01-19   991  
de374d7b729620 Kent Overstreet 2026-01-19   992  	while (!bch2_move_ratelimit(&ctxt)) {
de374d7b729620 Kent Overstreet 2026-01-19   993  		if (!bch2_reconcile_enabled(c))
de374d7b729620 Kent Overstreet 2026-01-19   994  			break;
de374d7b729620 Kent Overstreet 2026-01-19   995  
de374d7b729620 Kent Overstreet 2026-01-19   996  		bch2_trans_begin(trans);
de374d7b729620 Kent Overstreet 2026-01-19   997  
70476991ac7cf3 Kent Overstreet 2026-01-20   998  		struct bkey_s_c k = next_reconcile_entry(trans, &work, &work_pos, POS(thr->dev, U64_MAX));
de374d7b729620 Kent Overstreet 2026-01-19   999  		if (bkey_err(k) ||
de374d7b729620 Kent Overstreet 2026-01-19  1000  		    !k.k ||
de374d7b729620 Kent Overstreet 2026-01-19  1001  		    k.k->p.inode != thr->dev)
de374d7b729620 Kent Overstreet 2026-01-19  1002  			break;
de374d7b729620 Kent Overstreet 2026-01-19  1003  
de374d7b729620 Kent Overstreet 2026-01-19  1004  		int ret = lockrestart_do(trans,
de374d7b729620 Kent Overstreet 2026-01-19  1005  			do_reconcile_extent_phys(&ctxt, &snapshot_io_opts, work_pos, &last_flushed));
de374d7b729620 Kent Overstreet 2026-01-19  1006  		if (ret)
de374d7b729620 Kent Overstreet 2026-01-19  1007  			break;
de374d7b729620 Kent Overstreet 2026-01-19  1008  	}
de374d7b729620 Kent Overstreet 2026-01-19  1009  
de374d7b729620 Kent Overstreet 2026-01-19  1010  	closure_return(cl);
de374d7b729620 Kent Overstreet 2026-01-19  1011  }
de374d7b729620 Kent Overstreet 2026-01-19  1012  

:::::: The code at line 964 was first introduced by commit
:::::: de374d7b7296203619ba70f976867051cebaf41b bcachefs: Break up reconcile.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
