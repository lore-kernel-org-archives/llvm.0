Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B842BAF7;
	Sun,  3 Aug 2025 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754221665; cv=none; b=KPp1q7IUIIrmbYbu0I3cr+voP4dplWl1MEu1uKSTpfpxTizFR53i/msedY+/HrILZOio9GxFY2kqGzZEuX8ms2OYUV0X28x9/RL9oc+CmBEKSlKDBsxKBMRfDpYWvqlnsWZ05hGLnKku7pMBlpXBRNei2lxQsst04UNsYxuSGm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754221665; c=relaxed/simple;
	bh=Z6LUtm/a1u3IqonFflkwNo9Q8rvdSD3mMT0ePh0ZCac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRbNnmdTfn3s8hGpg81KISCRWFA+SuorFkctstq4QIBsBdw9BEDmD0BIn5PemLY7l6/9YNtpwlB/48X2EtY/3VGUj/I64HtEnj/rqmElG7HardSCxhfCPivrBmeV5j3Z2NEouj/R15r1Vz9oTjEE/RAvPyq63+MFZnJvW2rL1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJULeuj2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJULeuj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754221663; x=1785757663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6LUtm/a1u3IqonFflkwNo9Q8rvdSD3mMT0ePh0ZCac=;
  b=UJULeuj2uJovV8oQJmx/AOo5mQspvpkYnmlpKFZzqiS2UVarIOO102mR
   Ulh91MZPQp68lfbuJ/tUDjCrY86jU1h4tpaEthwe5oVzi6kQf9aj1Ib4o
   T2LpWObjbowqsiSTFIpCgGHhAbNf4zqqBJwkweUwYYPej1MjUnIz623qD
   10Z9n8O54JmWpBrMYFFCNNWZyi7+2OqA+sWZksDGZlrFGA3YuT/8hXsJL
   8igOj0z9QuBaIL3OIl0ETcJRqfN8BmAZCDc7Hcgox1k+WaKjgvasAA1fW
   9JU3Ye2gd1uugwRFbWjBr67DHOCahoAR8/NucGnzSTFxKxP+RHuqmUUVs
   Q==;
X-CSE-ConnectionGUID: RL/x5k2bSkibf8IwCV5H3A==
X-CSE-MsgGUID: suBx52sYTfiIq17UKRwVpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="60314841"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60314841"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 04:47:43 -0700
X-CSE-ConnectionGUID: 16KLkAucQLSg6lZg4oZb1w==
X-CSE-MsgGUID: +w8HhBzfTRKBwjk+wneDAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194767570"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2025 04:47:42 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiXBj-0001cp-1S;
	Sun, 03 Aug 2025 11:47:39 +0000
Date: Sun, 3 Aug 2025 13:46:55 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12906/13054] fs/bcachefs/io_misc.c:275:3: error:
 cannot jump from this goto statement to its label
Message-ID: <202508031339.6X3Lcpa8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: 4c3205637f1ecb1af44e99c92a9931ae2f84bc58 [12906/13054] bcachefs: CLASS(btree_iter)
config: x86_64-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250803/202508031339.6X3Lcpa8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031339.6X3Lcpa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031339.6X3Lcpa8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/io_misc.c:275:3: error: cannot jump from this goto statement to its label
     275 |                 goto err;
         |                 ^
   fs/bcachefs/io_misc.c:277:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     277 |         CLASS(btree_iter, fpunch_iter)(trans, BTREE_ID_extents,
         |                           ^
   1 error generated.
--
>> fs/bcachefs/dirent.c:752:3: error: cannot jump from this goto statement to its label
     752 |                 goto err;
         |                 ^
   fs/bcachefs/dirent.c:756:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     756 |         CLASS(btree_iter, iter)(trans, BTREE_ID_dirents, pos, BTREE_ITER_intent);
         |                           ^
   1 error generated.


vim +275 fs/bcachefs/io_misc.c

5902cc283c060f Kent Overstreet 2023-09-04  260  
b030e262b517b6 Kent Overstreet 2023-09-10  261  static int __bch2_resume_logged_op_truncate(struct btree_trans *trans,
b030e262b517b6 Kent Overstreet 2023-09-10  262  					    struct bkey_i *op_k,
b030e262b517b6 Kent Overstreet 2023-09-10  263  					    u64 *i_sectors_delta)
5902cc283c060f Kent Overstreet 2023-09-04  264  {
b030e262b517b6 Kent Overstreet 2023-09-10  265  	struct bch_fs *c = trans->c;
b030e262b517b6 Kent Overstreet 2023-09-10  266  	struct bkey_i_logged_op_truncate *op = bkey_i_to_logged_op_truncate(op_k);
b030e262b517b6 Kent Overstreet 2023-09-10  267  	subvol_inum inum = { le32_to_cpu(op->v.subvol), le64_to_cpu(op->v.inum) };
b030e262b517b6 Kent Overstreet 2023-09-10  268  	u64 new_i_size = le64_to_cpu(op->v.new_i_size);
0f25eb4b60771f Kent Overstreet 2024-09-23  269  	bool warn_errors = i_sectors_delta != NULL;
5902cc283c060f Kent Overstreet 2023-09-04  270  	int ret;
5902cc283c060f Kent Overstreet 2023-09-04  271  
cb52d23e77a6e5 Kent Overstreet 2023-11-11  272  	ret = commit_do(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
0f25eb4b60771f Kent Overstreet 2024-09-23  273  			truncate_set_isize(trans, inum, new_i_size, i_sectors_delta != NULL));
5902cc283c060f Kent Overstreet 2023-09-04  274  	if (ret)
5902cc283c060f Kent Overstreet 2023-09-04 @275  		goto err;
5902cc283c060f Kent Overstreet 2023-09-04  276  
4c3205637f1ecb Kent Overstreet 2025-07-30  277  	CLASS(btree_iter, fpunch_iter)(trans, BTREE_ID_extents,
b030e262b517b6 Kent Overstreet 2023-09-10  278  			     POS(inum.inum, round_up(new_i_size, block_bytes(c)) >> 9),
5dd8c60e1e0448 Kent Overstreet 2024-04-07  279  			     BTREE_ITER_intent);
b030e262b517b6 Kent Overstreet 2023-09-10  280  	ret = bch2_fpunch_at(trans, &fpunch_iter, inum, U64_MAX, i_sectors_delta);
b030e262b517b6 Kent Overstreet 2023-09-10  281  
5902cc283c060f Kent Overstreet 2023-09-04  282  	if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
5902cc283c060f Kent Overstreet 2023-09-04  283  		ret = 0;
5902cc283c060f Kent Overstreet 2023-09-04  284  err:
0f25eb4b60771f Kent Overstreet 2024-09-23  285  	if (warn_errors)
e5aa8046415528 Kent Overstreet 2024-03-23  286  		bch_err_fn(c, ret);
5902cc283c060f Kent Overstreet 2023-09-04  287  	return ret;
5902cc283c060f Kent Overstreet 2023-09-04  288  }
5902cc283c060f Kent Overstreet 2023-09-04  289  

:::::: The code at line 275 was first introduced by commit
:::::: 5902cc283c060f0a006ee9b2f2a64855a09399b4 bcachefs: New io_misc.c helpers

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
