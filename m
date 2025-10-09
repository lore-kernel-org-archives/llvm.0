Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060C2C21FA;
	Thu,  9 Oct 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012790; cv=none; b=JpnyPgw5SOOTua5qIYIgBcxkUkDo9Nqs5AcLXG1fsok1Cceqao2/F++9cM6MAsLvI9toETPy89NI9D8ZPHAly/aQJww3FOtmcvClOocYbFYAY3ulBXiv9d3J7zjVav9STgG+8na87/j5w/U3xZwqdcX9qeXeNHKICkiekcX/k2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012790; c=relaxed/simple;
	bh=PwNYCka6VK6f9SVre5w3AUR7bmOfk4kk2ilZiqHHtRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWk1kWjKn2anfuzJnL5BMy4QM42XUdyhNQbYwinQRmyQAOtNlT/imipWtawhRgtIZ1lQyluK64bNgl28yG4Psc1ACXvBJdlINxS8JmRkpbUBDmmo88MqnXAVGGLrr9ZCL0grClc3mhu7Y/LLmpwJNVeTnsoTWrAFLIA+KfKlim0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFTiFroe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFTiFroe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760012789; x=1791548789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwNYCka6VK6f9SVre5w3AUR7bmOfk4kk2ilZiqHHtRg=;
  b=mFTiFroe1+eOkF7qrVD1ROrQmCZvqME5Jk2azDY22ShHssTwgcRISxKI
   eV2L6WquPs03igNuad+se3yWRCPnXugps+wRhUVj0Pm58y/aZDdbFasvA
   kW4WKxxu0HtbI2A6I6IuNbt2ZWjLeWW5Xg6kW1VRVGMtsVmzrAJpzsFkp
   f2JPRffuSdhpC15QC/5ivevLBPMSg1m3A24IIitloP+NEY3pFuKFhKIxQ
   gAbS1eATelNTmOgxf6CJHpPEXNeFu5xR5HyUqRYeZydCjJIvKD2uwv44/
   EqQB04p/3IZ/UXq5hq1gmKw7tbddOwGCK+qXqcigNj/ae5xh3gCKcXzG7
   Q==;
X-CSE-ConnectionGUID: WOgXx+TjQB6GiXsqX9ZRZw==
X-CSE-MsgGUID: k0aku+4xR7KKRppBo5kI/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72901440"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="72901440"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 05:26:28 -0700
X-CSE-ConnectionGUID: f29/VLIbTbqkfNTiHx3NrQ==
X-CSE-MsgGUID: mcCLi9DtRQ6P+O7CfBuwiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="180726200"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2025 05:26:28 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6piy-0000gx-1Y;
	Thu, 09 Oct 2025 12:26:24 +0000
Date: Thu, 9 Oct 2025 20:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 509/541]
 fs/bcachefs/fs/logged_ops.c:45:2: error: cannot jump from this goto
 statement to its label
Message-ID: <202510092019.hrMbrGzH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   844a56feb885b00aaaa93b55a7eb27e6495b3379
commit: e06cf0ce070d016275022eef411ecc5b199c2e29 [509/541] bcachefs; use __cleanup() for bch2_bkey_buf_exit()
config: s390-randconfig-002-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092019.hrMbrGzH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510092019.hrMbrGzH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510092019.hrMbrGzH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/fs/logged_ops.c:45:2: error: cannot jump from this goto statement to its label
      45 |         fsck_err_on(test_bit(BCH_FS_clean_recovery, &c->flags),
         |         ^
   fs/bcachefs/init/error.h:143:2: note: expanded from macro 'fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/init/error.h:130:20: note: expanded from macro '__fsck_err_on'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^
   fs/bcachefs/init/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/init/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/fs/logged_ops.c:51:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
      51 |         struct bkey_buf sk __cleanup(bch2_bkey_buf_exit);
         |                         ^
   1 error generated.


vim +45 fs/bcachefs/fs/logged_ops.c

aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  36  
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  37  static int resume_logged_op(struct btree_trans *trans, struct btree_iter *iter,
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  38  			    struct bkey_s_c k)
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  39  {
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  40  	struct bch_fs *c = trans->c;
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  41  	u32 restart_count = trans->restart_count;
5a95261552e63a fs/bcachefs/logged_ops.c    Kent Overstreet 2025-07-14  42  	CLASS(printbuf, buf)();
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  43  	int ret = 0;
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  44  
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26 @45  	fsck_err_on(test_bit(BCH_FS_clean_recovery, &c->flags),
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  46  		    trans, logged_op_but_clean,
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  47  		    "filesystem marked as clean but have logged op\n%s",
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  48  		    (bch2_bkey_val_to_text(&buf, c, k),
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  49  		     buf.buf));
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  50  
e06cf0ce070d01 fs/bcachefs/fs/logged_ops.c Kent Overstreet 2025-10-08  51  	struct bkey_buf sk __cleanup(bch2_bkey_buf_exit);
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  52  	bch2_bkey_buf_init(&sk);
49c0ca1fbc434f fs/bcachefs/fs/logged_ops.c Kent Overstreet 2025-10-08  53  	bch2_bkey_buf_reassemble(&sk, k);
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  54  
0f25eb4b60771f fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-23  55  	const struct bch_logged_op_fn *fn = logged_op_fn(sk.k->k.type);
0f25eb4b60771f fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-23  56  	if (fn)
cecfed9b446da5 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-03-31  57  		fn->resume(trans, sk.k);
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  58  
0f25eb4b60771f fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-23  59  	ret = bch2_logged_op_finish(trans, sk.k);
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  60  fsck_err:
d50d7a5fa4df31 fs/bcachefs/logged_ops.c    Kent Overstreet 2024-09-26  61  	return ret ?: trans_was_restarted(trans, restart_count);
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  62  }
aaad530ac6b1c8 fs/bcachefs/logged_ops.c    Kent Overstreet 2023-08-27  63  

:::::: The code at line 45 was first introduced by commit
:::::: d50d7a5fa4df3190b6b6c6d6551b631fda4a4ed2 bcachefs: Check for logged ops when clean

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
