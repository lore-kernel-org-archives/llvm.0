Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8339311C07;
	Fri, 16 Jan 2026 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768602927; cv=none; b=Nswodad6f3NyeR18H0TpnwO0dNrP0z+BK7Nc7ju9QncL8epHn0hfldk8jdHIfGoUmHVanMnEXUrP9oy3vjBakxpUmFUZ249E+5tgWfGvKdFC0wrG+Bd2Yr1U1zrRkfNJZs9HGmyOOUA7YdEwkH/wGWYf8VLhQzBT02NreaCg/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768602927; c=relaxed/simple;
	bh=t+TfOvLaP0sZosWUu8D5eH4N8s6/Tcdc3O8Dsj5Gih4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GzxlwW6tJmfmHewYiX9zZMHhLchxXTG5zlnmmcDjvHTWIVYZjDyQX1PxCRKx8K7gHk45cJD6Ek4Eh2HasTBEE5pftoPeFbCGqWbSJuF2Vx/HHqhECmgU9tGHpznZxCnyV9JfzEwxyZNYA0IVcTdfRfbvdPCh8tCLEgYg5yxZM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaSa8ciH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaSa8ciH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768602926; x=1800138926;
  h=date:from:to:cc:subject:message-id;
  bh=t+TfOvLaP0sZosWUu8D5eH4N8s6/Tcdc3O8Dsj5Gih4=;
  b=jaSa8ciH52W2A2z5Bs5/QSj3zVdvqDpTLPUXfwxKztE7ut+Rxxh8WsKP
   KX5yZALe8S8buiavNitf6P2STeBHZZdcYnRsHxhZaCl09zsmagGHfCSR6
   /2XPHkuXPjqQiNzIh6bhhD+R3uGsm6Tc+R5edIv+ltahRwrDYevTWhqrZ
   0Lo7TGfxoHhKO8QAjjAGon5yE3x1Py7dGLtDcdNEf9BODVloxf/9Sf5zp
   HQhwVQrI8As0WWrg606lIXXFk3aSW09cPPqc0AdNNeb8RRLrEB8/QskvJ
   FDY2G42BvrtkkqiTsOlkNYLxKd5YmwYJTn5Dy2ze8RI80EPPDyotBHCEq
   g==;
X-CSE-ConnectionGUID: /oIzLUURSialMHvusy04fQ==
X-CSE-MsgGUID: zPAwGHrfRiWengBf6Qia8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69971939"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69971939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:35:25 -0800
X-CSE-ConnectionGUID: ufFekzMqS/iP6sDvjPTWIQ==
X-CSE-MsgGUID: m3Egce2LQHGzzuCoIdeBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205777156"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 14:35:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsPZ-00000000LJU-3Iox;
	Fri, 16 Jan 2026 22:35:21 +0000
Date: Sat, 17 Jan 2026 06:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 167/214]
 fs/bcachefs/data/reconcile.c:1888:25: warning: stack frame size (1040)
 exceeds limit (1024) in 'do_reconcile_phys_thread'
Message-ID: <202601170657.uiPMHmY7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   321d6b2ede8c135ad00646b40ada16f17ab3eb1b
commit: 7533247ef4e07f309908aa5c50053cfc1b700d33 [167/214] fixup! bcachefs: Multithreaded processing of reconcile_phys
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260117/202601170657.uiPMHmY7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170657.uiPMHmY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170657.uiPMHmY7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/reconcile.c:1888:25: warning: stack frame size (1040) exceeds limit (1024) in 'do_reconcile_phys_thread' [-Wframe-larger-than]
    1888 | static CLOSURE_CALLBACK(do_reconcile_phys_thread)
         |                         ^
   1 warning generated.


vim +/do_reconcile_phys_thread +1888 fs/bcachefs/data/reconcile.c

6efb894685bad7 Kent Overstreet 2026-01-06  1887  
6efb894685bad7 Kent Overstreet 2026-01-06 @1888  static CLOSURE_CALLBACK(do_reconcile_phys_thread)
6efb894685bad7 Kent Overstreet 2026-01-06  1889  {
6efb894685bad7 Kent Overstreet 2026-01-06  1890  	closure_type(thr, reconcile_phys_thr, cl);
6efb894685bad7 Kent Overstreet 2026-01-06  1891  	struct bch_fs *c = thr->c;
6efb894685bad7 Kent Overstreet 2026-01-06  1892  
6efb894685bad7 Kent Overstreet 2026-01-06  1893  	struct moving_context ctxt __cleanup(bch2_moving_ctxt_exit);
6efb894685bad7 Kent Overstreet 2026-01-06  1894  	bch2_moving_ctxt_init(&ctxt, c, NULL, &thr->stats,
6efb894685bad7 Kent Overstreet 2026-01-06  1895  			      writepoint_ptr(&c->allocator.reconcile_write_point),
6efb894685bad7 Kent Overstreet 2026-01-06  1896  			      true);
6efb894685bad7 Kent Overstreet 2026-01-06  1897  
6efb894685bad7 Kent Overstreet 2026-01-06  1898  	struct btree_trans *trans = ctxt.trans;
6efb894685bad7 Kent Overstreet 2026-01-06  1899  
6efb894685bad7 Kent Overstreet 2026-01-06  1900  	CLASS(darray_reconcile_work, work)();
6efb894685bad7 Kent Overstreet 2026-01-06  1901  	darray_make_room(&work, REBALANCE_WORK_BUF_NR);
6efb894685bad7 Kent Overstreet 2026-01-06  1902  	if (!work.size) {
6efb894685bad7 Kent Overstreet 2026-01-06  1903  		bch_err(c, "%s: unable to allocate memory", __func__);
7533247ef4e07f Kent Overstreet 2026-01-08  1904  		closure_return(cl);
7533247ef4e07f Kent Overstreet 2026-01-08  1905  		return;
6efb894685bad7 Kent Overstreet 2026-01-06  1906  	}
6efb894685bad7 Kent Overstreet 2026-01-06  1907  
6efb894685bad7 Kent Overstreet 2026-01-06  1908  	CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
6efb894685bad7 Kent Overstreet 2026-01-06  1909  
6efb894685bad7 Kent Overstreet 2026-01-06  1910  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
6efb894685bad7 Kent Overstreet 2026-01-06  1911  	wb_maybe_flush_init(&last_flushed);
6efb894685bad7 Kent Overstreet 2026-01-06  1912  
6efb894685bad7 Kent Overstreet 2026-01-06  1913  	struct bbpos work_pos = BBPOS(thr->btree, POS(thr->dev, 0));
6efb894685bad7 Kent Overstreet 2026-01-06  1914  
6efb894685bad7 Kent Overstreet 2026-01-06  1915  	while (!bch2_move_ratelimit(&ctxt)) {
6efb894685bad7 Kent Overstreet 2026-01-06  1916  		if (!bch2_reconcile_enabled(c))
6efb894685bad7 Kent Overstreet 2026-01-06  1917  			break;
6efb894685bad7 Kent Overstreet 2026-01-06  1918  
6efb894685bad7 Kent Overstreet 2026-01-06  1919  		bch2_trans_begin(trans);
6efb894685bad7 Kent Overstreet 2026-01-06  1920  
6efb894685bad7 Kent Overstreet 2026-01-06  1921  		struct bkey_s_c k = next_reconcile_entry(trans, &work, thr->btree, &work_pos.pos);
6efb894685bad7 Kent Overstreet 2026-01-06  1922  		if (bkey_err(k) ||
6efb894685bad7 Kent Overstreet 2026-01-06  1923  		    !k.k ||
6efb894685bad7 Kent Overstreet 2026-01-06  1924  		    k.k->p.inode != thr->dev)
6efb894685bad7 Kent Overstreet 2026-01-06  1925  			break;
6efb894685bad7 Kent Overstreet 2026-01-06  1926  
6efb894685bad7 Kent Overstreet 2026-01-06  1927  		int ret = lockrestart_do(trans,
6efb894685bad7 Kent Overstreet 2026-01-06  1928  			do_reconcile_extent_phys(&ctxt, &snapshot_io_opts, work_pos, &last_flushed));
6efb894685bad7 Kent Overstreet 2026-01-06  1929  		if (ret)
6efb894685bad7 Kent Overstreet 2026-01-06  1930  			break;
6efb894685bad7 Kent Overstreet 2026-01-06  1931  	}
7533247ef4e07f Kent Overstreet 2026-01-08  1932  
6efb894685bad7 Kent Overstreet 2026-01-06  1933  	closure_return(cl);
6efb894685bad7 Kent Overstreet 2026-01-06  1934  }
6efb894685bad7 Kent Overstreet 2026-01-06  1935  

:::::: The code at line 1888 was first introduced by commit
:::::: 6efb894685bad7b9d57fc51a8bfef4707572382f bcachefs: Multithreaded processing of reconcile_phys

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
