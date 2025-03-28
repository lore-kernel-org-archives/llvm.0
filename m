Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F051DF986;
	Fri, 28 Mar 2025 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200529; cv=none; b=hPO+QHR6f9JIsINeFTnfUkyZcdDPuW1N7dnW+wocIr8xFyQ1hjB3R8QnLJkf3ApwLK0ebszFMl13dcYLSRKOCYcPUD2ITQBcgL0u9um5KbhIibiMvN6rltSwWasU0IPq4v2vS08loadqKjrMZAFL72wZxv98xNN7Vtt0oJUp4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200529; c=relaxed/simple;
	bh=nULqfs+xM+pSm+ub5JPlyF9cRAxsu0XqJAC5xiS23ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J8xCDoJpbVLPNWZWUgDRNgkAud+Z0vxf11x6hkkizJFTYIVeH/xgZn4cVpxY66pn4sl21UWXfiejNBF5avEmHX0GiFerUgUwF5IUS3TnQIkSgERzYyPgC3MzdU858Tmjfrx+gU6zqMI0VJVVUzm/HwKsa98KJATLxbHkL+onkHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxDlytg+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxDlytg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743200528; x=1774736528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nULqfs+xM+pSm+ub5JPlyF9cRAxsu0XqJAC5xiS23ug=;
  b=LxDlytg+Vai1qsZwPyP450r00Je9moejNeuH1wSwh7ni477E1M4/h1Be
   o6nnWcHn0wsUSGmJQ3bbjH/91fQ2NDmY++D6QRuivE9B2rCWrUgR+2JF4
   NpvrqgRx62noQX6/c2nqer+z+9qPg2hXy9bY9eoEh4Ojvinv8ivzT0UkS
   ROcU4hjawAqXqvHe/YaaFOqP9h5ra/+BRno61t4IJOqs0cV4J3sUNxvYR
   02+ty7D/HWrWZhMJwfWC2NdiCOiWZ0wHrM7QsTggsWx5DWWzyU9iImBg4
   yRDDl8pTt9Wz7FGcdLOba9WUBhXaJT3E8Ud3o5w0uQPZgpB9cGmk+DYwZ
   Q==;
X-CSE-ConnectionGUID: CAOTqxYwSk2J2NdLp3DdaA==
X-CSE-MsgGUID: kPVpoaKGTPekRi49Vn/g2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54771478"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="54771478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 15:22:06 -0700
X-CSE-ConnectionGUID: 6lhu07ZrRpavpIiKur9UEw==
X-CSE-MsgGUID: Ir4Z3XWSSyahdhFmzwHt4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="156553351"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2025 15:22:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyI5R-0007jy-2p;
	Fri, 28 Mar 2025 22:22:01 +0000
Date: Sat, 29 Mar 2025 06:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 219/222] fs/bcachefs/btree_io.c:605:1: warning:
 unused label 'print'
Message-ID: <202503290610.rdG0ecHf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   3720faca3701df3bb8f5cd2a12061664d01ce817
commit: 1e8de9663f8533830bd12df800d14d7a062bec7d [219/222] bcachefs: Better printing of inconsistency errors
config: arm-randconfig-004-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290610.rdG0ecHf-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290610.rdG0ecHf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290610.rdG0ecHf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_io.c:605:1: warning: unused label 'print' [-Wunused-label]
     605 | print:
         | ^~~~~~
   1 warning generated.


vim +/print +605 fs/bcachefs/btree_io.c

   538	
   539	__printf(10, 11)
   540	static int __btree_err(int ret,
   541			       struct bch_fs *c,
   542			       struct bch_dev *ca,
   543			       struct btree *b,
   544			       struct bset *i,
   545			       struct bkey_packed *k,
   546			       int write,
   547			       bool have_retry,
   548			       enum bch_sb_error_id err_type,
   549			       const char *fmt, ...)
   550	{
   551		bool silent = c->curr_recovery_pass == BCH_RECOVERY_PASS_scan_for_btree_nodes;
   552	
   553		if (!have_retry && ret == -BCH_ERR_btree_node_read_err_want_retry)
   554			ret = -BCH_ERR_btree_node_read_err_fixable;
   555		if (!have_retry && ret == -BCH_ERR_btree_node_read_err_must_retry)
   556			ret = -BCH_ERR_btree_node_read_err_bad_node;
   557	
   558		if (!silent && ret != -BCH_ERR_btree_node_read_err_fixable)
   559			bch2_sb_error_count(c, err_type);
   560	
   561		struct printbuf out = PRINTBUF;
   562		if (write != WRITE && ret != -BCH_ERR_btree_node_read_err_fixable) {
   563			printbuf_indent_add_nextline(&out, 2);
   564	#ifdef BCACHEFS_LOG_PREFIX
   565			prt_printf(&out, bch2_log_msg(c, ""));
   566	#endif
   567		}
   568	
   569		btree_err_msg(&out, c, ca, b, i, k, b->written, write);
   570	
   571		va_list args;
   572		va_start(args, fmt);
   573		prt_vprintf(&out, fmt, args);
   574		va_end(args);
   575	
   576		if (write == WRITE) {
   577			prt_str(&out, ", ");
   578			ret = __bch2_inconsistent_error(c, &out)
   579				? -BCH_ERR_fsck_errors_not_fixed
   580				: 0;
   581			silent = false;
   582		}
   583	
   584		switch (ret) {
   585		case -BCH_ERR_btree_node_read_err_fixable:
   586			ret = !silent
   587				? __bch2_fsck_err(c, NULL, FSCK_CAN_FIX, err_type, "%s", out.buf)
   588				: -BCH_ERR_fsck_fix;
   589			if (ret != -BCH_ERR_fsck_fix &&
   590			    ret != -BCH_ERR_fsck_ignore)
   591				goto fsck_err;
   592			ret = -BCH_ERR_fsck_fix;
   593			goto out;
   594		case -BCH_ERR_btree_node_read_err_bad_node:
   595			prt_str(&out, ", ");
   596			ret = __bch2_topology_error(c, &out);
   597			if (ret)
   598				silent = false;
   599			break;
   600		case -BCH_ERR_btree_node_read_err_incompatible:
   601			ret = -BCH_ERR_fsck_errors_not_fixed;
   602			silent = false;
   603			break;
   604		}
 > 605	print:
   606		if (!silent)
   607			bch2_print_string_as_lines(KERN_ERR, out.buf);
   608	out:
   609	fsck_err:
   610		printbuf_exit(&out);
   611		return ret;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
