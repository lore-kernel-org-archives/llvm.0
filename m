Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126122258C;
	Mon, 19 Jan 2026 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830466; cv=none; b=lldMD7k3MkPiAMAzUNeBNNmW1qiEDaNZwNrGqCrvnf5oxhgXugDSWy0EqZzSnGlA1oA345yAb6BTFDN9eHMC93ECNEwiw1my60+ZpIiaBMOd7YocqNY05vhSV6eBZfZDSgW4TpxfsZNAotycYoDjeIYghU7bkhfrKBBuNyQF3hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830466; c=relaxed/simple;
	bh=lViFWE2vH3c+7tvp9AfU8+Ja+ne0lT50d/llk00wuo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lDTh/MEFuWEY1lhDnBJ78nNJa4k2HC2ntOnrP3O8g5fPov/mgvsT4tpB6io9gfMcu0UD2mnN6xoMOnI8X4rXD5AZtNIs5pa/6f7YRWpiFuxVdjYuJDNCAuh2mOGqkOX2EIP0VPr9S+8EebY9t+ZeIfBUEO/guwMvm17wbjYy1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy4LL0Rk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy4LL0Rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768830465; x=1800366465;
  h=date:from:to:cc:subject:message-id;
  bh=lViFWE2vH3c+7tvp9AfU8+Ja+ne0lT50d/llk00wuo8=;
  b=Jy4LL0RkFMm978+rha51C6dkucIINcvAIsxK32GjtzqcN6OoYF5aq9y0
   A177KMHfOXEWvhKE7cx2EqC4q8+SAagdmBPEmqGVdPawYXZvLjLKrZu38
   z1DsC8yJMnhe6QAxHXo2lCIocNAbZyib+t6w32Gx6vnNRWqYeGCmlenaI
   xke0DyP6quh9tKABAXvCzi9TB6YcHw3CqfaB6hJh0SGh05i1gdX1W6f6U
   FyQ/P+KUQrtQiCPSagkhHtzEzmzZI2IYRdqEyJa84Kmgbijfb04y4/chb
   puH80zBARVt+PqHWB1UIeKq0vdlHOl8vTBnm74I3Qidc/YcpwMYmtFrtv
   g==;
X-CSE-ConnectionGUID: s6d6eqj8RBewPW3cI5h6nA==
X-CSE-MsgGUID: R0UbhHKIRX6IORA6qkU/5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73670047"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="73670047"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:47:44 -0800
X-CSE-ConnectionGUID: QOGXDnYlSPCBFlltQ2OxAQ==
X-CSE-MsgGUID: 72O/nBHhR6qM9vzjLizTUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210373030"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2026 05:47:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhpbY-00000000NqX-01r3;
	Mon, 19 Jan 2026 13:47:40 +0000
Date: Mon, 19 Jan 2026 21:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 223/223]
 fs/bcachefs/data/reconcile/work.c:873:25: warning: stack frame size (1040)
 exceeds limit (1024) in 'do_reconcile_phys_thread'
Message-ID: <202601192312.iwZqX4Wo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   1c240e59948ecca320c96b94db4ffae87581d477
commit: 1c240e59948ecca320c96b94db4ffae87581d477 [223/223] bcachefs: Break up reconcile.c
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260119/202601192312.iwZqX4Wo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192312.iwZqX4Wo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601192312.iwZqX4Wo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/reconcile/work.c:873:25: warning: stack frame size (1040) exceeds limit (1024) in 'do_reconcile_phys_thread' [-Wframe-larger-than]
     873 | static CLOSURE_CALLBACK(do_reconcile_phys_thread)
         |                         ^
   1 warning generated.


vim +/do_reconcile_phys_thread +873 fs/bcachefs/data/reconcile/work.c

   872	
 > 873	static CLOSURE_CALLBACK(do_reconcile_phys_thread)
   874	{
   875		closure_type(thr, reconcile_phys_thr, cl);
   876		struct bch_fs *c = thr->c;
   877	
   878		struct moving_context ctxt __cleanup(bch2_moving_ctxt_exit);
   879		bch2_moving_ctxt_init(&ctxt, c, NULL, &thr->stats,
   880				      writepoint_ptr(&c->allocator.reconcile_write_point),
   881				      true);
   882	
   883		struct btree_trans *trans = ctxt.trans;
   884	
   885		CLASS(darray_reconcile_work, work)();
   886		darray_make_room(&work, REBALANCE_WORK_BUF_NR);
   887		if (!work.size) {
   888			bch_err(c, "%s: unable to allocate memory", __func__);
   889			closure_return(cl);
   890			return;
   891		}
   892	
   893		CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
   894	
   895		struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
   896		wb_maybe_flush_init(&last_flushed);
   897	
   898		struct bbpos work_pos = BBPOS(thr->btree, POS(thr->dev, 0));
   899	
   900		while (!bch2_move_ratelimit(&ctxt)) {
   901			if (!bch2_reconcile_enabled(c))
   902				break;
   903	
   904			bch2_trans_begin(trans);
   905	
   906			struct bkey_s_c k = next_reconcile_entry(trans, &work, thr->btree, &work_pos.pos);
   907			if (bkey_err(k) ||
   908			    !k.k ||
   909			    k.k->p.inode != thr->dev)
   910				break;
   911	
   912			int ret = lockrestart_do(trans,
   913				do_reconcile_extent_phys(&ctxt, &snapshot_io_opts, work_pos, &last_flushed));
   914			if (ret)
   915				break;
   916		}
   917	
   918		closure_return(cl);
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
