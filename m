Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5E2A1C9;
	Sun, 25 May 2025 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748171744; cv=none; b=g2c4HpX+RZscvPZzN+6WyfuiSYpkU6+Zmo2kBR7IyTAG021IXtKIq1Vj2lUSU1Dmh65oZCXsKro8D+/Sa1Yb0as/dXK9TOJlGljnLcWk7JuRK4wP8JTmBjNuq4S78KBseWzeZH7rH8+ImvBTFVWPJUx844ffaEl/2st8qdoP8WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748171744; c=relaxed/simple;
	bh=PoLSrGKVyF7ZtAPj67eiyNJ3FlkWO5BwYZMrbUTrFKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bcxn1Isi3PlKtxRn4+GYiLXcfFCtuezj4HpHQokWKwxlI5ysgXMzpvE76S0rabDTLLc/omNl7GN6k/aEcvbl2bA6hWmV0ZD4CRan2FbbBBwf4kP8NYmJdhVxiGZFiDcSch7xvez6xj1KZp8e+JuEFAl5H8046Q/NcCKMpEq57N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OETVtrz7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OETVtrz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748171742; x=1779707742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PoLSrGKVyF7ZtAPj67eiyNJ3FlkWO5BwYZMrbUTrFKc=;
  b=OETVtrz7yHJZ6fdt7STRipUu1DGnocWxmQ1iq9USLbduS0TEABNjIb8z
   pgAwMvzmUGqXSyvPoixg3ejlRVLp4DTbciVwFmE2vcxX2ac4YfHKhRq1E
   +pQvisR2HxnIKvXA9YruEyAtO7XIe90tGWTn/AR1yGe1IKymTQeDh/1ZQ
   hr1QYFeYV1mb2db6cGli/AKmGOSklaWLuk2EIqj2WJKlPmSmMUIFh/gxO
   FF+rYjZSHd8srthDAZNT3pXau4nfJd50xcqOtUn8I0QW/laBAHggXpkLK
   nlJD/6QTe+yBD2kyKmLaSiHTB8g+0beAK7x6oaujtb5JlizbTFn1xI4Zx
   A==;
X-CSE-ConnectionGUID: Z3wN2SyISSGOescqMMRzug==
X-CSE-MsgGUID: WXtBl59fQfOw3XAg9EA3CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="37786205"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="37786205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 04:15:41 -0700
X-CSE-ConnectionGUID: Hq8V6z7kSvucoT4OEBw91A==
X-CSE-MsgGUID: G1zeHuJaT9iLY2ZDIVCTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="142488464"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 May 2025 04:15:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ9KL-000Rme-2M;
	Sun, 25 May 2025 11:15:37 +0000
Date: Sun, 25 May 2025 19:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 300/304]
 fs/bcachefs/fs.c:556:3: error: cannot jump from this goto statement to its
 label
Message-ID: <202505251921.ZBHPwtHS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a65e0ec5d1fc367a41e153f173cc1e5fb78e46b5
commit: 106f874a1626b41be21aaf2f8128669250a8a900 [300/304] bcachefs: CLASS(btree_trans)
config: arm-randconfig-001-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251921.ZBHPwtHS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251921.ZBHPwtHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251921.ZBHPwtHS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/fs.c:556:3: error: cannot jump from this goto statement to its label
     556 |                 goto err;
         |                 ^
   fs/bcachefs/fs.c:564:21: note: jump bypasses initialization of variable with __attribute__((cleanup))
     564 |         CLASS(btree_trans, trans)(c);
         |                            ^
   fs/bcachefs/fs.c:948:5: error: cannot jump from this goto statement to its label
     948 |                                 goto err;
         |                                 ^
   fs/bcachefs/fs.c:952:21: note: jump bypasses initialization of variable with __attribute__((cleanup))
     952 |         CLASS(btree_trans, trans)(c);
         |                            ^
   fs/bcachefs/fs.c:941:5: error: cannot jump from this goto statement to its label
     941 |                                 goto err;
         |                                 ^
   fs/bcachefs/fs.c:952:21: note: jump bypasses initialization of variable with __attribute__((cleanup))
     952 |         CLASS(btree_trans, trans)(c);
         |                            ^
   fs/bcachefs/fs.c:1132:3: error: cannot jump from this goto statement to its label
    1132 |                 goto err;
         |                 ^
   fs/bcachefs/fs.c:1134:21: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1134 |         CLASS(btree_trans, trans)(c);
         |                            ^
   4 errors generated.


vim +556 fs/bcachefs/fs.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  525  
6fed42bb7750e21 Kent Overstreet 2021-03-16  526  struct bch_inode_info *
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  527  __bch2_create(struct mnt_idmap *idmap,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  528  	      struct bch_inode_info *dir, struct dentry *dentry,
42d237320e9817a Kent Overstreet 2021-03-16  529  	      umode_t mode, dev_t rdev, subvol_inum snapshot_src,
42d237320e9817a Kent Overstreet 2021-03-16  530  	      unsigned flags)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  531  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  532  	struct bch_fs *c = dir->v.i_sb->s_fs_info;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  533  	struct bch_inode_unpacked dir_u;
a91bc5e50558fdc Kent Overstreet 2024-01-25  534  	struct bch_inode_info *inode;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  535  	struct bch_inode_unpacked inode_u;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  536  	struct posix_acl *default_acl = NULL, *acl = NULL;
284ae18c1d7aa44 Kent Overstreet 2021-03-16  537  	subvol_inum inum;
9ca4853b98af5fa Kent Overstreet 2021-10-27  538  	struct bch_subvolume subvol;
73ab6f356db737d Kent Overstreet 2018-07-23  539  	u64 journal_seq = 0;
c24adfa0dfc2754 Hongbo Li       2024-08-24  540  	kuid_t kuid;
c24adfa0dfc2754 Hongbo Li       2024-08-24  541  	kgid_t kgid;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  542  	int ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  543  
9638574229e3ae0 Kent Overstreet 2019-10-02  544  	/*
9638574229e3ae0 Kent Overstreet 2019-10-02  545  	 * preallocate acls + vfs inode before btree transaction, so that
9638574229e3ae0 Kent Overstreet 2019-10-02  546  	 * nothing can fail after the transaction succeeds:
9638574229e3ae0 Kent Overstreet 2019-10-02  547  	 */
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  548  #ifdef CONFIG_BCACHEFS_POSIX_ACL
9638574229e3ae0 Kent Overstreet 2019-10-02  549  	ret = posix_acl_create(&dir->v, &mode, &default_acl, &acl);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  550  	if (ret)
9638574229e3ae0 Kent Overstreet 2019-10-02  551  		return ERR_PTR(ret);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  552  #endif
9897713fe1077c9 Michal Hocko    2024-09-26  553  	inode = __bch2_new_inode(c, GFP_NOFS);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  554  	if (unlikely(!inode)) {
9638574229e3ae0 Kent Overstreet 2019-10-02  555  		inode = ERR_PTR(-ENOMEM);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16 @556  		goto err;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  557  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  558  
9638574229e3ae0 Kent Overstreet 2019-10-02  559  	bch2_inode_init_early(c, &inode_u);
9638574229e3ae0 Kent Overstreet 2019-10-02  560  
6fed42bb7750e21 Kent Overstreet 2021-03-16  561  	if (!(flags & BCH_CREATE_TMPFILE))
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  562  		mutex_lock(&dir->ei_update_lock);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  563  
106f874a1626b41 Kent Overstreet 2025-05-25  564  	CLASS(btree_trans, trans)(c);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  565  retry:
6bd68ec266ad718 Kent Overstreet 2023-09-12  566  	bch2_trans_begin(trans);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  567  
c24adfa0dfc2754 Hongbo Li       2024-08-24  568  	kuid = mapped_fsuid(idmap, i_user_ns(&dir->v));
c24adfa0dfc2754 Hongbo Li       2024-08-24  569  	kgid = mapped_fsgid(idmap, i_user_ns(&dir->v));
112d21fd1a122f7 Kent Overstreet 2024-06-08  570  	ret   = bch2_subvol_is_ro_trans(trans, dir->ei_inum.subvol) ?:
0d72ab35a925d66 Kent Overstreet 2023-12-29  571  		bch2_create_trans(trans,
6fed42bb7750e21 Kent Overstreet 2021-03-16  572  				  inode_inum(dir), &dir_u, &inode_u,
6fed42bb7750e21 Kent Overstreet 2021-03-16  573  				  !(flags & BCH_CREATE_TMPFILE)
6fed42bb7750e21 Kent Overstreet 2021-03-16  574  				  ? &dentry->d_name : NULL,
c24adfa0dfc2754 Hongbo Li       2024-08-24  575  				  from_kuid(i_user_ns(&dir->v), kuid),
c24adfa0dfc2754 Hongbo Li       2024-08-24  576  				  from_kgid(i_user_ns(&dir->v), kgid),
9638574229e3ae0 Kent Overstreet 2019-10-02  577  				  mode, rdev,
42d237320e9817a Kent Overstreet 2021-03-16  578  				  default_acl, acl, snapshot_src, flags) ?:
9638574229e3ae0 Kent Overstreet 2019-10-02  579  		bch2_quota_acct(c, bch_qid(&inode_u), Q_INO, 1,
9638574229e3ae0 Kent Overstreet 2019-10-02  580  				KEY_TYPE_QUOTA_PREALLOC);
9638574229e3ae0 Kent Overstreet 2019-10-02  581  	if (unlikely(ret))
9638574229e3ae0 Kent Overstreet 2019-10-02  582  		goto err_before_quota;
9638574229e3ae0 Kent Overstreet 2019-10-02  583  
112d21fd1a122f7 Kent Overstreet 2024-06-08  584  	inum.subvol = inode_u.bi_subvol ?: dir->ei_inum.subvol;
9ca4853b98af5fa Kent Overstreet 2021-10-27  585  	inum.inum = inode_u.bi_inum;
9ca4853b98af5fa Kent Overstreet 2021-10-27  586  
ce70157112482c7 Kent Overstreet 2024-12-04  587  	ret   = bch2_subvolume_get(trans, inum.subvol, true, &subvol) ?:
6bd68ec266ad718 Kent Overstreet 2023-09-12  588  		bch2_trans_commit(trans, NULL, &journal_seq, 0);
9638574229e3ae0 Kent Overstreet 2019-10-02  589  	if (unlikely(ret)) {
9638574229e3ae0 Kent Overstreet 2019-10-02  590  		bch2_quota_acct(c, bch_qid(&inode_u), Q_INO, -1,
9638574229e3ae0 Kent Overstreet 2019-10-02  591  				KEY_TYPE_QUOTA_WARN);
9638574229e3ae0 Kent Overstreet 2019-10-02  592  err_before_quota:
549d173c1bd9b58 Kent Overstreet 2022-07-17  593  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  594  			goto retry;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  595  		goto err_trans;
9638574229e3ae0 Kent Overstreet 2019-10-02  596  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  597  
6fed42bb7750e21 Kent Overstreet 2021-03-16  598  	if (!(flags & BCH_CREATE_TMPFILE)) {
6bd68ec266ad718 Kent Overstreet 2023-09-12  599  		bch2_inode_update_after_write(trans, dir, &dir_u,
e614a6c52d32c9c Hongbo Li       2025-01-07  600  					      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  601  		mutex_unlock(&dir->ei_update_lock);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  602  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  603  
6bd68ec266ad718 Kent Overstreet 2023-09-12  604  	bch2_vfs_inode_init(trans, inum, inode, &inode_u, &subvol);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  605  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  606  	set_cached_acl(&inode->v, ACL_TYPE_ACCESS, acl);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  607  	set_cached_acl(&inode->v, ACL_TYPE_DEFAULT, default_acl);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  608  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  609  	/*
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  610  	 * we must insert the new inode into the inode cache before calling
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  611  	 * bch2_trans_exit() and dropping locks, else we could race with another
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  612  	 * thread pulling the inode in and modifying it:
54f7702466b3a10 Kent Overstreet 2024-08-16  613  	 *
54f7702466b3a10 Kent Overstreet 2024-08-16  614  	 * also, calling bch2_inode_hash_insert() without passing in the
54f7702466b3a10 Kent Overstreet 2024-08-16  615  	 * transaction object is sketchy - if we could ever end up in
54f7702466b3a10 Kent Overstreet 2024-08-16  616  	 * __wait_on_freeing_inode(), we'd risk deadlock.
54f7702466b3a10 Kent Overstreet 2024-08-16  617  	 *
54f7702466b3a10 Kent Overstreet 2024-08-16  618  	 * But that shouldn't be possible, since we still have the inode locked
54f7702466b3a10 Kent Overstreet 2024-08-16  619  	 * that we just created, and we _really_ can't take a transaction
54f7702466b3a10 Kent Overstreet 2024-08-16  620  	 * restart here.
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  621  	 */
54f7702466b3a10 Kent Overstreet 2024-08-16  622  	inode = bch2_inode_hash_insert(c, NULL, inode);
9638574229e3ae0 Kent Overstreet 2019-10-02  623  err:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  624  	posix_acl_release(default_acl);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  625  	posix_acl_release(acl);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  626  	return inode;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  627  err_trans:
6fed42bb7750e21 Kent Overstreet 2021-03-16  628  	if (!(flags & BCH_CREATE_TMPFILE))
19ee5f2ac4b3465 Kent Overstreet 2018-07-20  629  		mutex_unlock(&dir->ei_update_lock);
19ee5f2ac4b3465 Kent Overstreet 2018-07-20  630  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  631  	make_bad_inode(&inode->v);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  632  	iput(&inode->v);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  633  	inode = ERR_PTR(ret);
9638574229e3ae0 Kent Overstreet 2019-10-02  634  	goto err;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  635  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  636  

:::::: The code at line 556 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
