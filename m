Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931F7275870;
	Mon, 26 Jan 2026 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408585; cv=none; b=Rw4ANGljMwo4WvBHDkOMdiCqoizsgcSodIdhKjO/x6fBrmYFbpgpMVcX07VAIOXqw650TqvLdCOLDFf1LpfeXEys1wacPd2S2+CQr/T8jPLRtgIEfrXWanbyj0uHxjQPvBq6deJRnfIVDC2MTqWmFbkfuvvwxLcShv4bfCCMisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408585; c=relaxed/simple;
	bh=yesCRLnpUW0N4UlyhL4kJihQyTkRYs29NeTzs4HOwBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MDU3KEp4jf5Z+V3YZI7sqOH+eGk0nwZfZ74ZYxzipjgyetRw+F7LexOHM+wHc+/Fd2jONwM0po5WYe8enl6o+Rq4shSLNiToMGo8mZY6tqApmPGf4nFR8DPerHLrLsnu6sF5Zc6JGdags8fxc3teCJEbueh9HZBoEeZ3V0drkEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0HVNoG1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0HVNoG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769408583; x=1800944583;
  h=date:from:to:cc:subject:message-id;
  bh=yesCRLnpUW0N4UlyhL4kJihQyTkRYs29NeTzs4HOwBo=;
  b=R0HVNoG1GB0k5sSmcEMtjAG4GXNfRAXBlttUsQkFe7d8sYiVko1T45ml
   h3RePV+IubTrg94rPrAGHqYme0XuF3l6Ks1stKOe2l3Yadb+aI/+F1aHE
   JOU6r3pMqu8jNQeZGguNtp+rcN6hzT+hIc8d6/ZlJJR0i/rI+ntczazQQ
   AzdPhvyfe6tczpPdLdcLLDdx6n+AjL0gzxDQIqQbvj797YKhGUgvep4Ik
   TvNmycCjeltbh11Nln16xUEXX7AS2BAfPYHRVdZOQMSubJYysq8OWU9VR
   ac84/r9kXio9BGKFCqHX9GFwW7V9sSx0oV6iKtDEzuLUnY+lwM7VHKkR3
   w==;
X-CSE-ConnectionGUID: Ra5VjI9PR3Kd2OOys0iu0Q==
X-CSE-MsgGUID: 9SCscv4VTwOJLuCZJxq8Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="58158192"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="58158192"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:23:03 -0800
X-CSE-ConnectionGUID: idoQUuAdTzuHUoLzFlViKg==
X-CSE-MsgGUID: OEJaApueT+eO5zwBRXB31Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207406807"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jan 2026 22:23:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkG02-00000000X06-3u43;
	Mon, 26 Jan 2026 06:22:58 +0000
Date: Mon, 26 Jan 2026 14:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 262/262]
 fs/bcachefs/data/reconcile/work.c:1205:12: warning: stack frame size (1080)
 exceeds limit (1024) in 'bch2_reconcile_thread'
Message-ID: <202601261444.aUW4nj6U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   802455d452518d185b7c66ed871468d77e4d9ef1
commit: 802455d452518d185b7c66ed871468d77e4d9ef1 [262/262] bcachefs: Fix use-after-unlock in reconcile tracepoints
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260126/202601261444.aUW4nj6U-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261444.aUW4nj6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261444.aUW4nj6U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/reconcile/work.c:1205:12: warning: stack frame size (1080) exceeds limit (1024) in 'bch2_reconcile_thread' [-Wframe-larger-than]
    1205 | static int bch2_reconcile_thread(void *arg)
         |            ^
   fs/bcachefs/data/reconcile/work.c:980:25: warning: stack frame size (1216) exceeds limit (1024) in 'do_reconcile_phys_thread' [-Wframe-larger-than]
     980 | static CLOSURE_CALLBACK(do_reconcile_phys_thread)
         |                         ^
   2 warnings generated.


vim +/bch2_reconcile_thread +1205 fs/bcachefs/data/reconcile/work.c

de374d7b729620 Kent Overstreet 2026-01-19  1204  
de374d7b729620 Kent Overstreet 2026-01-19 @1205  static int bch2_reconcile_thread(void *arg)
de374d7b729620 Kent Overstreet 2026-01-19  1206  {
de374d7b729620 Kent Overstreet 2026-01-19  1207  	struct bch_fs *c = arg;
de374d7b729620 Kent Overstreet 2026-01-19  1208  	struct bch_fs_reconcile *r = &c->reconcile;
de374d7b729620 Kent Overstreet 2026-01-19  1209  
de374d7b729620 Kent Overstreet 2026-01-19  1210  	set_freezable();
de374d7b729620 Kent Overstreet 2026-01-19  1211  
de374d7b729620 Kent Overstreet 2026-01-19  1212  	/*
de374d7b729620 Kent Overstreet 2026-01-19  1213  	 * Data move operations can't run until after check_snapshots has
de374d7b729620 Kent Overstreet 2026-01-19  1214  	 * completed, and bch2_snapshot_is_ancestor() is available.
de374d7b729620 Kent Overstreet 2026-01-19  1215  	 */
de374d7b729620 Kent Overstreet 2026-01-19  1216  	kthread_wait_freezable(c->recovery.pass_done > BCH_RECOVERY_PASS_check_snapshots ||
de374d7b729620 Kent Overstreet 2026-01-19  1217  			       kthread_should_stop());
de374d7b729620 Kent Overstreet 2026-01-19  1218  	if (kthread_should_stop())
de374d7b729620 Kent Overstreet 2026-01-19  1219  		return 0;
de374d7b729620 Kent Overstreet 2026-01-19  1220  
de374d7b729620 Kent Overstreet 2026-01-19  1221  	struct moving_context ctxt __cleanup(bch2_moving_ctxt_exit);
de374d7b729620 Kent Overstreet 2026-01-19  1222  	bch2_moving_ctxt_init(&ctxt, c, NULL, &r->work_stats,
de374d7b729620 Kent Overstreet 2026-01-19  1223  			      writepoint_ptr(&c->allocator.reconcile_write_point),
de374d7b729620 Kent Overstreet 2026-01-19  1224  			      true);
de374d7b729620 Kent Overstreet 2026-01-19  1225  
de374d7b729620 Kent Overstreet 2026-01-19  1226  	while (!kthread_should_stop() && !do_reconcile(&ctxt))
de374d7b729620 Kent Overstreet 2026-01-19  1227  		;
de374d7b729620 Kent Overstreet 2026-01-19  1228  
de374d7b729620 Kent Overstreet 2026-01-19  1229  	return 0;
de374d7b729620 Kent Overstreet 2026-01-19  1230  }
de374d7b729620 Kent Overstreet 2026-01-19  1231  

:::::: The code at line 1205 was first introduced by commit
:::::: de374d7b7296203619ba70f976867051cebaf41b bcachefs: Break up reconcile.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
