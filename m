Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CDF1836D9;
	Mon,  9 Sep 2024 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725911337; cv=none; b=dPRrjDABsnCRjV1ShnzizXS2BW/o4PJGp4mDJD2Eg/xDshrEA3c5g5WWydh6DjOSYjCe/YPSyji+cmgShXt5ZsvX8KZI6Ig6xWJKuIbhA2aiqvdej+ogCXEvqF1EJfojK94Sq1sHzYam5PFalOD2lbsiqh/ANF+TB+1/WTpSEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725911337; c=relaxed/simple;
	bh=YrB49rlLA6G2Pcc4nTFqgJrb2WvXFvFpmWk/Bwpc/nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOgRfp2pq+QOx3K+Ydfc/ti2qWuCdV1Nd1wGHR4bUI8xsZ7YmrqwkMRey+24L2BwPnrgryMjW9Y7iWzGxlbGRn+VtMuZSpqqtvkpDWaT4H+Tqw1hiGoJpwL7KPyBO9MIVLkK33jBhJme7IvV0tdNl6RV4HcFSsLhJ3CoshNdR6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxMCK3hS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxMCK3hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725911335; x=1757447335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YrB49rlLA6G2Pcc4nTFqgJrb2WvXFvFpmWk/Bwpc/nQ=;
  b=NxMCK3hSPQRdQuPJxlGx/SE2pCthqt3hpOvXYmYBgOradh7Hwe3NxTZk
   3e18GnDWxApJ5+0pqZPPlQHFCyAlVY8TZ623oPReN/JkPt24b3ztCu4xS
   XKp6Qc5GLZS7eH/yZyji7NMQT6XOR+YnzGJXQpSNcFyOcT0PdacT4rAJp
   U4tf0f+BK28z6H9fgvuX3Y55HWtB8By1Gkxh1x/MFkJgVtF/8XSyaStdX
   0+TUNN9W8C9DR2YfEJ2LKwxBNfRYYyRxigSPvNRaBYVXGmyPp6XSjLP8q
   dJqVeb83ByRXUtQCI9gPkC/OXrDUpnAZIErs/JycF8llRSHJj1QQ2bIbt
   g==;
X-CSE-ConnectionGUID: gNZ/fN3bRgqaV1n2FQ20Xw==
X-CSE-MsgGUID: u/7ux3njQN65srGt+5LArQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36008252"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="36008252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 12:48:54 -0700
X-CSE-ConnectionGUID: Tc+AmSzkQ4CiunzEbadr4g==
X-CSE-MsgGUID: XpPYQFnRScqN8DEcsz2RBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66571021"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Sep 2024 12:48:53 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snkNW-000FA4-1M;
	Mon, 09 Sep 2024 19:48:50 +0000
Date: Tue, 10 Sep 2024 03:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 188/258]
 fs/bcachefs/fs-common.c:46:28: error: use of undeclared identifier
 'BTREE_ITER_with_updates'; did you mean 'BTREE_ITER_with_journal'?
Message-ID: <202409100324.PGS35meB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 20e2d4702d10bcf4ca4a9bd027be2aaac631dfab [188/258] bcachefs: Kill BTREE_ITER_with_updates
config: i386-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100324.PGS35meB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100324.PGS35meB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100324.PGS35meB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/fs-common.c:46:28: error: use of undeclared identifier 'BTREE_ITER_with_updates'; did you mean 'BTREE_ITER_with_journal'?
      46 |                               BTREE_ITER_intent|BTREE_ITER_with_updates);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                 BTREE_ITER_with_journal
   fs/bcachefs/btree_types.h:292:2: note: 'BTREE_ITER_with_journal' declared here
     292 |         BTREE_ITER_FLAGS()
         |         ^
   fs/bcachefs/btree_types.h:226:2: note: expanded from macro 'BTREE_ITER_FLAGS'
     226 |         x(with_journal)                         \
         |         ^
   fs/bcachefs/btree_types.h:291:14: note: expanded from macro 'x'
     291 | #define x(n) BTREE_ITER_##n     = 1U << BTREE_ITER_FLAG_BIT_##n,
         |              ^
   <scratch space>:128:1: note: expanded from here
     128 | BTREE_ITER_with_journal
         | ^
   fs/bcachefs/fs-common.c:167:28: error: use of undeclared identifier 'BTREE_ITER_with_updates'; did you mean 'BTREE_ITER_with_journal'?
     167 |                                          STR_HASH_must_create|BTREE_ITER_with_updates);
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                               BTREE_ITER_with_journal
   fs/bcachefs/btree_types.h:292:2: note: 'BTREE_ITER_with_journal' declared here
     292 |         BTREE_ITER_FLAGS()
         |         ^
   fs/bcachefs/btree_types.h:226:2: note: expanded from macro 'BTREE_ITER_FLAGS'
     226 |         x(with_journal)                         \
         |         ^
   fs/bcachefs/btree_types.h:291:14: note: expanded from macro 'x'
     291 | #define x(n) BTREE_ITER_##n     = 1U << BTREE_ITER_FLAG_BIT_##n,
         |              ^
   <scratch space>:128:1: note: expanded from here
     128 | BTREE_ITER_with_journal
         | ^
   2 errors generated.


vim +46 fs/bcachefs/fs-common.c

42d237320e9817 Kent Overstreet   2021-03-16   18  
6fed42bb7750e2 Kent Overstreet   2021-03-16   19  int bch2_create_trans(struct btree_trans *trans,
6fed42bb7750e2 Kent Overstreet   2021-03-16   20  		      subvol_inum dir,
9638574229e3ae Kent Overstreet   2019-10-02   21  		      struct bch_inode_unpacked *dir_u,
9638574229e3ae Kent Overstreet   2019-10-02   22  		      struct bch_inode_unpacked *new_inode,
9638574229e3ae Kent Overstreet   2019-10-02   23  		      const struct qstr *name,
9638574229e3ae Kent Overstreet   2019-10-02   24  		      uid_t uid, gid_t gid, umode_t mode, dev_t rdev,
9638574229e3ae Kent Overstreet   2019-10-02   25  		      struct posix_acl *default_acl,
6fed42bb7750e2 Kent Overstreet   2021-03-16   26  		      struct posix_acl *acl,
42d237320e9817 Kent Overstreet   2021-03-16   27  		      subvol_inum snapshot_src,
6fed42bb7750e2 Kent Overstreet   2021-03-16   28  		      unsigned flags)
9638574229e3ae Kent Overstreet   2019-10-02   29  {
9638574229e3ae Kent Overstreet   2019-10-02   30  	struct bch_fs *c = trans->c;
67e0dd8f0d8b4b Kent Overstreet   2021-08-30   31  	struct btree_iter dir_iter = { NULL };
67e0dd8f0d8b4b Kent Overstreet   2021-08-30   32  	struct btree_iter inode_iter = { NULL };
6fed42bb7750e2 Kent Overstreet   2021-03-16   33  	subvol_inum new_inum = dir;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02   34  	u64 now = bch2_current_time(c);
bff796ae6539b5 Kent Overstreet   2021-05-28   35  	u64 cpu = raw_smp_processor_id();
6fed42bb7750e2 Kent Overstreet   2021-03-16   36  	u64 dir_target;
6fed42bb7750e2 Kent Overstreet   2021-03-16   37  	u32 snapshot;
42d237320e9817 Kent Overstreet   2021-03-16   38  	unsigned dir_type = mode_to_type(mode);
9638574229e3ae Kent Overstreet   2019-10-02   39  	int ret;
9638574229e3ae Kent Overstreet   2019-10-02   40  
6fed42bb7750e2 Kent Overstreet   2021-03-16   41  	ret = bch2_subvolume_get_snapshot(trans, dir.subvol, &snapshot);
6fed42bb7750e2 Kent Overstreet   2021-03-16   42  	if (ret)
6fed42bb7750e2 Kent Overstreet   2021-03-16   43  		goto err;
6fed42bb7750e2 Kent Overstreet   2021-03-16   44  
ebcacf303ac177 Sasha Finkelstein 2024-08-18   45  	ret = bch2_inode_peek(trans, &dir_iter, dir_u, dir,
ebcacf303ac177 Sasha Finkelstein 2024-08-18  @46  			      BTREE_ITER_intent|BTREE_ITER_with_updates);
8b53852d0a80ec Kent Overstreet   2020-02-18   47  	if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18   48  		goto err;
9638574229e3ae Kent Overstreet   2019-10-02   49  
42d237320e9817 Kent Overstreet   2021-03-16   50  	if (!(flags & BCH_CREATE_SNAPSHOT)) {
42d237320e9817 Kent Overstreet   2021-03-16   51  		/* Normal create path - allocate a new inode: */
9638574229e3ae Kent Overstreet   2019-10-02   52  		bch2_inode_init_late(new_inode, now, uid, gid, mode, rdev, dir_u);
9638574229e3ae Kent Overstreet   2019-10-02   53  
42d237320e9817 Kent Overstreet   2021-03-16   54  		if (flags & BCH_CREATE_TMPFILE)
103ffe9aaf8566 Kent Overstreet   2023-11-02   55  			new_inode->bi_flags |= BCH_INODE_unlinked;
9638574229e3ae Kent Overstreet   2019-10-02   56  
6fed42bb7750e2 Kent Overstreet   2021-03-16   57  		ret = bch2_inode_create(trans, &inode_iter, new_inode, snapshot, cpu);
9638574229e3ae Kent Overstreet   2019-10-02   58  		if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18   59  			goto err;
9638574229e3ae Kent Overstreet   2019-10-02   60  
42d237320e9817 Kent Overstreet   2021-03-16   61  		snapshot_src = (subvol_inum) { 0 };
42d237320e9817 Kent Overstreet   2021-03-16   62  	} else {
42d237320e9817 Kent Overstreet   2021-03-16   63  		/*
42d237320e9817 Kent Overstreet   2021-03-16   64  		 * Creating a snapshot - we're not allocating a new inode, but
42d237320e9817 Kent Overstreet   2021-03-16   65  		 * we do have to lookup the root inode of the subvolume we're
42d237320e9817 Kent Overstreet   2021-03-16   66  		 * snapshotting and update it (in the new snapshot):
42d237320e9817 Kent Overstreet   2021-03-16   67  		 */
42d237320e9817 Kent Overstreet   2021-03-16   68  
42d237320e9817 Kent Overstreet   2021-03-16   69  		if (!snapshot_src.inum) {
42d237320e9817 Kent Overstreet   2021-03-16   70  			/* Inode wasn't specified, just snapshot: */
97996ddfdb9b0b Kent Overstreet   2021-09-30   71  			struct bch_subvolume s;
42d237320e9817 Kent Overstreet   2021-03-16   72  
97996ddfdb9b0b Kent Overstreet   2021-09-30   73  			ret = bch2_subvolume_get(trans, snapshot_src.subvol, true,
5dd8c60e1e0448 Kent Overstreet   2024-04-07   74  						 BTREE_ITER_cached, &s);
42d237320e9817 Kent Overstreet   2021-03-16   75  			if (ret)
42d237320e9817 Kent Overstreet   2021-03-16   76  				goto err;
97996ddfdb9b0b Kent Overstreet   2021-09-30   77  
97996ddfdb9b0b Kent Overstreet   2021-09-30   78  			snapshot_src.inum = le64_to_cpu(s.inode);
42d237320e9817 Kent Overstreet   2021-03-16   79  		}
42d237320e9817 Kent Overstreet   2021-03-16   80  
42d237320e9817 Kent Overstreet   2021-03-16   81  		ret = bch2_inode_peek(trans, &inode_iter, new_inode, snapshot_src,
5dd8c60e1e0448 Kent Overstreet   2024-04-07   82  				      BTREE_ITER_intent);
42d237320e9817 Kent Overstreet   2021-03-16   83  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16   84  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16   85  
42d237320e9817 Kent Overstreet   2021-03-16   86  		if (new_inode->bi_subvol != snapshot_src.subvol) {
42d237320e9817 Kent Overstreet   2021-03-16   87  			/* Not a subvolume root: */
42d237320e9817 Kent Overstreet   2021-03-16   88  			ret = -EINVAL;
42d237320e9817 Kent Overstreet   2021-03-16   89  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16   90  		}
42d237320e9817 Kent Overstreet   2021-03-16   91  
42d237320e9817 Kent Overstreet   2021-03-16   92  		/*
42d237320e9817 Kent Overstreet   2021-03-16   93  		 * If we're not root, we have to own the subvolume being
42d237320e9817 Kent Overstreet   2021-03-16   94  		 * snapshotted:
42d237320e9817 Kent Overstreet   2021-03-16   95  		 */
42d237320e9817 Kent Overstreet   2021-03-16   96  		if (uid && new_inode->bi_uid != uid) {
42d237320e9817 Kent Overstreet   2021-03-16   97  			ret = -EPERM;
42d237320e9817 Kent Overstreet   2021-03-16   98  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16   99  		}
42d237320e9817 Kent Overstreet   2021-03-16  100  
42d237320e9817 Kent Overstreet   2021-03-16  101  		flags |= BCH_CREATE_SUBVOL;
42d237320e9817 Kent Overstreet   2021-03-16  102  	}
42d237320e9817 Kent Overstreet   2021-03-16  103  
6fed42bb7750e2 Kent Overstreet   2021-03-16  104  	new_inum.inum	= new_inode->bi_inum;
6fed42bb7750e2 Kent Overstreet   2021-03-16  105  	dir_target	= new_inode->bi_inum;
6fed42bb7750e2 Kent Overstreet   2021-03-16  106  
42d237320e9817 Kent Overstreet   2021-03-16  107  	if (flags & BCH_CREATE_SUBVOL) {
42d237320e9817 Kent Overstreet   2021-03-16  108  		u32 new_subvol, dir_snapshot;
42d237320e9817 Kent Overstreet   2021-03-16  109  
42d237320e9817 Kent Overstreet   2021-03-16  110  		ret = bch2_subvolume_create(trans, new_inode->bi_inum,
b8628a2529e7d6 Kent Overstreet   2024-02-08  111  					    dir.subvol,
42d237320e9817 Kent Overstreet   2021-03-16  112  					    snapshot_src.subvol,
42d237320e9817 Kent Overstreet   2021-03-16  113  					    &new_subvol, &snapshot,
42d237320e9817 Kent Overstreet   2021-03-16  114  					    (flags & BCH_CREATE_SNAPSHOT_RO) != 0);
42d237320e9817 Kent Overstreet   2021-03-16  115  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16  116  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16  117  
42d237320e9817 Kent Overstreet   2021-03-16  118  		new_inode->bi_parent_subvol	= dir.subvol;
42d237320e9817 Kent Overstreet   2021-03-16  119  		new_inode->bi_subvol		= new_subvol;
42d237320e9817 Kent Overstreet   2021-03-16  120  		new_inum.subvol			= new_subvol;
42d237320e9817 Kent Overstreet   2021-03-16  121  		dir_target			= new_subvol;
42d237320e9817 Kent Overstreet   2021-03-16  122  		dir_type			= DT_SUBVOL;
42d237320e9817 Kent Overstreet   2021-03-16  123  
42d237320e9817 Kent Overstreet   2021-03-16  124  		ret = bch2_subvolume_get_snapshot(trans, dir.subvol, &dir_snapshot);
42d237320e9817 Kent Overstreet   2021-03-16  125  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16  126  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16  127  
42d237320e9817 Kent Overstreet   2021-03-16  128  		bch2_btree_iter_set_snapshot(&dir_iter, dir_snapshot);
42d237320e9817 Kent Overstreet   2021-03-16  129  		ret = bch2_btree_iter_traverse(&dir_iter);
42d237320e9817 Kent Overstreet   2021-03-16  130  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16  131  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16  132  	}
42d237320e9817 Kent Overstreet   2021-03-16  133  
42d237320e9817 Kent Overstreet   2021-03-16  134  	if (!(flags & BCH_CREATE_SNAPSHOT)) {
9638574229e3ae Kent Overstreet   2019-10-02  135  		if (default_acl) {
6fed42bb7750e2 Kent Overstreet   2021-03-16  136  			ret = bch2_set_acl_trans(trans, new_inum, new_inode,
9638574229e3ae Kent Overstreet   2019-10-02  137  						 default_acl, ACL_TYPE_DEFAULT);
9638574229e3ae Kent Overstreet   2019-10-02  138  			if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  139  				goto err;
9638574229e3ae Kent Overstreet   2019-10-02  140  		}
9638574229e3ae Kent Overstreet   2019-10-02  141  
9638574229e3ae Kent Overstreet   2019-10-02  142  		if (acl) {
6fed42bb7750e2 Kent Overstreet   2021-03-16  143  			ret = bch2_set_acl_trans(trans, new_inum, new_inode,
9638574229e3ae Kent Overstreet   2019-10-02  144  						 acl, ACL_TYPE_ACCESS);
9638574229e3ae Kent Overstreet   2019-10-02  145  			if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  146  				goto err;
9638574229e3ae Kent Overstreet   2019-10-02  147  		}
42d237320e9817 Kent Overstreet   2021-03-16  148  	}
9638574229e3ae Kent Overstreet   2019-10-02  149  
42d237320e9817 Kent Overstreet   2021-03-16  150  	if (!(flags & BCH_CREATE_TMPFILE)) {
9638574229e3ae Kent Overstreet   2019-10-02  151  		struct bch_hash_info dir_hash = bch2_hash_info_init(c, dir_u);
42d237320e9817 Kent Overstreet   2021-03-16  152  		u64 dir_offset;
9638574229e3ae Kent Overstreet   2019-10-02  153  
42d237320e9817 Kent Overstreet   2021-03-16  154  		if (is_subdir_for_nlink(new_inode))
9638574229e3ae Kent Overstreet   2019-10-02  155  			dir_u->bi_nlink++;
6fed42bb7750e2 Kent Overstreet   2021-03-16  156  		dir_u->bi_mtime = dir_u->bi_ctime = now;
9638574229e3ae Kent Overstreet   2019-10-02  157  
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  158  		ret = bch2_inode_write(trans, &dir_iter, dir_u);
9638574229e3ae Kent Overstreet   2019-10-02  159  		if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  160  			goto err;
9638574229e3ae Kent Overstreet   2019-10-02  161  
6fed42bb7750e2 Kent Overstreet   2021-03-16  162  		ret = bch2_dirent_create(trans, dir, &dir_hash,
6fed42bb7750e2 Kent Overstreet   2021-03-16  163  					 dir_type,
6fed42bb7750e2 Kent Overstreet   2021-03-16  164  					 name,
6fed42bb7750e2 Kent Overstreet   2021-03-16  165  					 dir_target,
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  166  					 &dir_offset,
ebcacf303ac177 Sasha Finkelstein 2024-08-18  167  					 STR_HASH_must_create|BTREE_ITER_with_updates);
9638574229e3ae Kent Overstreet   2019-10-02  168  		if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  169  			goto err;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  170  
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  171  		new_inode->bi_dir		= dir_u->bi_inum;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  172  		new_inode->bi_dir_offset	= dir_offset;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  173  	}
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  174  
5dd8c60e1e0448 Kent Overstreet   2024-04-07  175  	inode_iter.flags &= ~BTREE_ITER_all_snapshots;
6fed42bb7750e2 Kent Overstreet   2021-03-16  176  	bch2_btree_iter_set_snapshot(&inode_iter, snapshot);
e6ae27272491af Kent Overstreet   2021-03-15  177  
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  178  	ret   = bch2_btree_iter_traverse(&inode_iter) ?:
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  179  		bch2_inode_write(trans, &inode_iter, new_inode);
8b53852d0a80ec Kent Overstreet   2020-02-18  180  err:
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  181  	bch2_trans_iter_exit(trans, &inode_iter);
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  182  	bch2_trans_iter_exit(trans, &dir_iter);
8b53852d0a80ec Kent Overstreet   2020-02-18  183  	return ret;
9638574229e3ae Kent Overstreet   2019-10-02  184  }
9638574229e3ae Kent Overstreet   2019-10-02  185  

:::::: The code at line 46 was first introduced by commit
:::::: ebcacf303ac1773a9927e482b8ee47a925718db4 bcachefs: Hook up RENAME_WHITEOUT in rename.

:::::: TO: Sasha Finkelstein <fnkl.kernel@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
