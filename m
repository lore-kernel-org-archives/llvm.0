Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A23DB65F;
	Fri, 10 Apr 2026 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838363; cv=none; b=rSK/4SjavNyV+nsY6dsc0VzUAB2EV+Q7mDHsKxQKfNUhj7ir8E9KFOTE94oP48j+NkxzoFsgeMv0+UsZsNNB2I9XO6gKv8vxEC8bhnhzLVpPk12HHoI+IkKJFJ42/4G1BexCFuNNOSbbyd+G7SYzIPFXTWqfmGbxIBwIcItVMWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838363; c=relaxed/simple;
	bh=UwexDfhmObYXV6xXhwfHG/cgLQHT64NCYWTYrTgkiRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=npuk63zyzjWZ5JV3lshOAvEfugm8JA06Ye60nf+yAXh0k3mL85DU5O+eOzZj+H1hltrVX8aoqX/b9MIjTEju7grF2hbQ53Ot/B68BAfWkSNxkv3nkI7xszyqDdk7dbNaWu+mg3D2HwW4UDm71jH0lFfnRhmCNYuCtu24IMgiTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHxskh10; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHxskh10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838361; x=1807374361;
  h=date:from:to:cc:subject:message-id;
  bh=UwexDfhmObYXV6xXhwfHG/cgLQHT64NCYWTYrTgkiRg=;
  b=JHxskh109Q3Cu15fq+MDd2zDLVncX2bHz59esWOPTxwEjZTdC0D/srHF
   M3r3914vXLvN+JCOIM/qftccFymkaVvog6CQfufgcsx9PDCOxhtAP3tpj
   w1D2nTizsMYWkgtSohOj1ZoiXpDdhu3uLqv2+ohEFqCPiep8uFlLYl51f
   JgHRQYkp+O/aIjN4OsWQTawFJ2TVUDh1bnKez60Zxj+oiDthdJ3DhOU+K
   PDAmCab+Wz4niCkOS46no6oG3+13RxDBcvyElaUsZ4U3gyC0xdHefD1kN
   dDLSLxcFsERvvzn2IT09f4qMV5O29gQbyV27/Dpe8mhdHZsJiFrUDoJKZ
   g==;
X-CSE-ConnectionGUID: xblF51QRQzW8iyMsD4qJNA==
X-CSE-MsgGUID: P/9fk6E8Rs6TtNlcjmjhkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88245699"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="88245699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:26:01 -0700
X-CSE-ConnectionGUID: UIfXu8OBSz+ew7D+jy4V0w==
X-CSE-MsgGUID: 0ZiOQZ/5SFW+qF4ZnRKC8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230845162"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 09:25:59 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBEg8-000000003yJ-3a9G;
	Fri, 10 Apr 2026 16:25:56 +0000
Date: Sat, 11 Apr 2026 00:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 249/332]
 fs/bcachefs/data/reconcile/work.c:1205:12: warning: stack frame size (1080)
 exceeds limit (1024) in 'bch2_reconcile_thread'
Message-ID: <202604110002.CsxNT0D9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 2df58c8935f572f91c66956583e5b764203df420 [249/332] bcachefs: Fix use-after-unlock in reconcile tracepoints
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604110002.CsxNT0D9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110002.CsxNT0D9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110002.CsxNT0D9-lkp@intel.com/

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
