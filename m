Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7755DF78;
	Mon, 27 May 2024 06:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716790152; cv=none; b=inACOFGJ402984AfsgYsZ4AdHUvKy5ysb+2phP4x5tjCR5yUbFZdClaFKS3cCjVjW9/oN/7dbb0f9aU90g6J/n2l34W72dnegkRl4ZoOhp061zNSGS9gqjDS1ISN6rDMfejS/xT9YvwcsJO0Q+ubZvM0Bf0AEEYwRcsAh5ryCH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716790152; c=relaxed/simple;
	bh=5juOmIHwN99y4lCK2wMtOeVed5wbxin2pQ46GEfz22g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HkppAlApJ/KEUpLGIcHYMBbflC1HmWi/y54UfOhGV2RJn2QcogN1fQIK+Y0niejXYgzkPQrtk2OVvCHcKE93rDAWstecocP65oDGkPbcUNdC5S47yqzgAgwYc3Et99OvKUHspGiUv7MwjS3Ggj78UwzfH0zLY+qZBvpn5nMGOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5vl3NL4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5vl3NL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716790150; x=1748326150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5juOmIHwN99y4lCK2wMtOeVed5wbxin2pQ46GEfz22g=;
  b=c5vl3NL4Yk/wvyuSOczDavNn5xLOQcyRs9tRhaxZaveA3PCFsb9wJ4Q4
   Mvyq2Zd3WlhC8qDR59kbKnAuw+DtJBi69KSZfCbBi53qJpWIeGKveAj0a
   XWskqBg+UlXphhRW6GyCbZDuGXRwXejbIfjRw2IZ18iO/qh58Yb/ivnol
   us0EIwYlrMwCZ6uixLynI+TawXcFQ8eut5k7vjsKl4fajREJIKZa6ohZb
   JQDcHHB/iGGdVehBrBuC91aJnxHjt0i39xn1146Ba1LtiCVIu1AGtZD1r
   1MTsmBHuAYMemabZg/hLbSMuJKkhhWAK/roPZpBjPVjVAH296eKINJAcO
   A==;
X-CSE-ConnectionGUID: SMn8uFnLR+iyBfjeaz2d8w==
X-CSE-MsgGUID: xfGYA+bKRbWff30lGwN7DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16923250"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="16923250"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 23:09:08 -0700
X-CSE-ConnectionGUID: P9jcPFmMQy2HU1YFgz6uAg==
X-CSE-MsgGUID: 5hfmg+tdQR65UltEUC9TAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="39618406"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2024 23:09:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBTXc-0009Va-1s;
	Mon, 27 May 2024 06:09:04 +0000
Date: Mon, 27 May 2024 14:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 32/32] fs/bcachefs/fsck.c:466:3: warning:
 label followed by a declaration is a C23 extension
Message-ID: <202405271406.K0vDqtws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   161718dc9ebbd6c0d588becd0409c5efcfa7ff9c
commit: 161718dc9ebbd6c0d588becd0409c5efcfa7ff9c [32/32] bcachefs: check_key_has_inode()
config: x86_64-buildonly-randconfig-001-20240527 (https://download.01.org/0day-ci/archive/20240527/202405271406.K0vDqtws-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405271406.K0vDqtws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405271406.K0vDqtws-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fsck.c:466:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     466 |                 struct btree_iter iter = {};
         |                 ^
   1 warning generated.


vim +466 fs/bcachefs/fsck.c

cc0532900bcf18 Kent Overstreet 2024-03-31  457  
161718dc9ebbd6 Kent Overstreet 2024-05-26  458  static int reconstruct_inode(struct btree_trans *trans, enum btree_id btree, u32 snapshot, u64 inum)
09d4c2acbf4c86 Kent Overstreet 2024-04-01  459  {
09d4c2acbf4c86 Kent Overstreet 2024-04-01  460  	struct bch_fs *c = trans->c;
161718dc9ebbd6 Kent Overstreet 2024-05-26  461  	unsigned i_mode = S_IFREG;
161718dc9ebbd6 Kent Overstreet 2024-05-26  462  	u64 i_size = 0;
09d4c2acbf4c86 Kent Overstreet 2024-04-01  463  
161718dc9ebbd6 Kent Overstreet 2024-05-26  464  	switch (btree) {
161718dc9ebbd6 Kent Overstreet 2024-05-26  465  	case BTREE_ID_extents:
09d4c2acbf4c86 Kent Overstreet 2024-04-01 @466  		struct btree_iter iter = {};
09d4c2acbf4c86 Kent Overstreet 2024-04-01  467  
09d4c2acbf4c86 Kent Overstreet 2024-04-01  468  		bch2_trans_iter_init(trans, &iter, BTREE_ID_extents, SPOS(inum, U64_MAX, snapshot), 0);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  469  		struct bkey_s_c k = bch2_btree_iter_peek_prev(&iter);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  470  		bch2_trans_iter_exit(trans, &iter);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  471  		int ret = bkey_err(k);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  472  		if (ret)
09d4c2acbf4c86 Kent Overstreet 2024-04-01  473  			return ret;
09d4c2acbf4c86 Kent Overstreet 2024-04-01  474  
161718dc9ebbd6 Kent Overstreet 2024-05-26  475  		i_size = k.k->p.offset << 9;
161718dc9ebbd6 Kent Overstreet 2024-05-26  476  		break;
161718dc9ebbd6 Kent Overstreet 2024-05-26  477  	case BTREE_ID_dirents:
161718dc9ebbd6 Kent Overstreet 2024-05-26  478  		i_mode = S_IFDIR;
161718dc9ebbd6 Kent Overstreet 2024-05-26  479  		break;
161718dc9ebbd6 Kent Overstreet 2024-05-26  480  	case BTREE_ID_xattrs:
161718dc9ebbd6 Kent Overstreet 2024-05-26  481  		break;
161718dc9ebbd6 Kent Overstreet 2024-05-26  482  	default:
161718dc9ebbd6 Kent Overstreet 2024-05-26  483  		BUG();
161718dc9ebbd6 Kent Overstreet 2024-05-26  484  	}
161718dc9ebbd6 Kent Overstreet 2024-05-26  485  
161718dc9ebbd6 Kent Overstreet 2024-05-26  486  	struct bch_inode_unpacked new_inode;
161718dc9ebbd6 Kent Overstreet 2024-05-26  487  	bch2_inode_init_early(c, &new_inode);
161718dc9ebbd6 Kent Overstreet 2024-05-26  488  	bch2_inode_init_late(&new_inode, bch2_current_time(c), 0, 0, i_mode|0600, 0, NULL);
161718dc9ebbd6 Kent Overstreet 2024-05-26  489  	new_inode.bi_size = i_size;
161718dc9ebbd6 Kent Overstreet 2024-05-26  490  	new_inode.bi_inum = inum;
161718dc9ebbd6 Kent Overstreet 2024-05-26  491  
161718dc9ebbd6 Kent Overstreet 2024-05-26  492  	return __bch2_fsck_write_inode(trans, &new_inode, snapshot);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  493  }
09d4c2acbf4c86 Kent Overstreet 2024-04-01  494  

:::::: The code at line 466 was first introduced by commit
:::::: 09d4c2acbf4c864fef0f520bbcba256c9a19102e bcachefs: reconstruct_inode()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
