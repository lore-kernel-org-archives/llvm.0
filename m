Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7482580CB;
	Tue, 20 May 2025 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722780; cv=none; b=nPddYZ+3lo2RekAbIJWt0yeZJKWvjjzlrfTuBPFvsr/yVQ+Sj4jyPNNDzItWVaml0IGn+LmjEn33FLNvO1GTXTsF3Dw3CS70sArpz2UOisQ0tYXEjwX+SUTvQHLRhb6OfyC/jEC7DOgVx6vcZON+M3kEUE1p7pkvqWSE6RaTlmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722780; c=relaxed/simple;
	bh=jdWOEZA6mMp42ZsMe13Yc20rFzJyPL8u7eDH0dGAz4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRVcefy62XXI3sNOdxJ2wZ7Qta2F8sTPmRQo8sslfqgEibabXe0bKBkThrgJQemsueGVB6l3oHdl1lZdFlIyiD2W30Mga2Ypw+iwWZSkXP60/TtqGZMEyg6u52YSldsSwy4dJJWqEK6L0EN4FTX4TQodH4BQw16rmdS9qO9UnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTnavkvt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTnavkvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747722779; x=1779258779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jdWOEZA6mMp42ZsMe13Yc20rFzJyPL8u7eDH0dGAz4c=;
  b=GTnavkvtC6aNUMvW5dB/r/oei/BlQrzeJL4gXX2Sx5/hW9SfO7htq3EQ
   P8zWGIB4C3HWFL+fYabbLZnC5OE60YnALLQ6FmoHT1aaJFe8aTrXEtU5d
   bWMERbwXBROq+q+X1UGNYF43dbFz9+RTevKWz6vqi2BVzT9DiYmpYI34U
   7Q8bMc0lZ23P934Effr9hkKXxnB6VsMfXyD2TlSEEAeNZOQOG6v02+dOr
   cShXplgRd6jieF4cwYRT2bNcsekSuvEayPaUo4qkRKVaiXMibb3j1+Ttv
   JXXIva8MsX/uqSZdYwHHRK1uiARv0+AKn3Jr8JbyE1YVdQYveoxmX6nER
   Q==;
X-CSE-ConnectionGUID: MEFg412HS/CwXsXJbzkWVQ==
X-CSE-MsgGUID: +pz4lePaTCK+9XkK+IVv1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49778978"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49778978"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 23:32:58 -0700
X-CSE-ConnectionGUID: 4N+KoOo4TmWk1jGIJgNUNg==
X-CSE-MsgGUID: EQ1isqA7Swe0T2hRVewOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140603915"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2025 23:32:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHGX1-000ME0-0s;
	Tue, 20 May 2025 06:32:55 +0000
Date: Tue, 20 May 2025 14:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 251/252]
 fs/bcachefs/fs.c:960:8: warning: variable 'trans' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202505201434.jPrDJIPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   0d62becef614036a50005eca81fb5bd0b0790fb0
commit: ba3508b68bd71545e1d7eb062ebb0ee33fb1345a [251/252] bcachefs: Hook up d_casefold_enable()
config: hexagon-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201434.jPrDJIPG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201434.jPrDJIPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201434.jPrDJIPG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fs.c:960:8: warning: variable 'trans' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     960 |                         if (ret)
         |                             ^~~
   fs/bcachefs/fs.c:1051:17: note: uninitialized use occurs here
    1051 |         bch2_trans_put(trans);
         |                        ^~~~~
   fs/bcachefs/fs.c:960:4: note: remove the 'if' if its condition is always false
     960 |                         if (ret)
         |                         ^~~~~~~~
     961 |                                 goto err;
         |                                 ~~~~~~~~
   fs/bcachefs/fs.c:953:8: warning: variable 'trans' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     953 |                         if (ret)
         |                             ^~~
   fs/bcachefs/fs.c:1051:17: note: uninitialized use occurs here
    1051 |         bch2_trans_put(trans);
         |                        ^~~~~
   fs/bcachefs/fs.c:953:4: note: remove the 'if' if its condition is always false
     953 |                         if (ret)
         |                         ^~~~~~~~
     954 |                                 goto err;
         |                                 ~~~~~~~~
   fs/bcachefs/fs.c:926:27: note: initialize the variable 'trans' to silence this warning
     926 |         struct btree_trans *trans;
         |                                  ^
         |                                   = NULL
   2 warnings generated.


vim +960 fs/bcachefs/fs.c

   911	
   912	static int bch2_rename2(struct mnt_idmap *idmap,
   913				struct inode *src_vdir, struct dentry *src_dentry,
   914				struct inode *dst_vdir, struct dentry *dst_dentry,
   915				unsigned flags)
   916	{
   917		struct bch_fs *c = src_vdir->i_sb->s_fs_info;
   918		struct bch_inode_info *src_dir = to_bch_ei(src_vdir);
   919		struct bch_inode_info *dst_dir = to_bch_ei(dst_vdir);
   920		struct bch_inode_info *src_inode = to_bch_ei(src_dentry->d_inode);
   921		struct bch_inode_info *dst_inode = to_bch_ei(dst_dentry->d_inode);
   922		struct bch_inode_unpacked dst_dir_u, src_dir_u;
   923		struct bch_inode_unpacked src_inode_u, dst_inode_u, *whiteout_inode_u;
   924		struct d_casefold_enable casefold_enable_src = {};
   925		struct d_casefold_enable casefold_enable_dst = {};
   926		struct btree_trans *trans;
   927		enum bch_rename_mode mode = flags & RENAME_EXCHANGE
   928			? BCH_RENAME_EXCHANGE
   929			: dst_dentry->d_inode
   930			? BCH_RENAME_OVERWRITE : BCH_RENAME;
   931		bool whiteout = !!(flags & RENAME_WHITEOUT);
   932		int ret;
   933	
   934		if (flags & ~(RENAME_NOREPLACE|RENAME_EXCHANGE|RENAME_WHITEOUT))
   935			return -EINVAL;
   936	
   937		if (mode == BCH_RENAME_OVERWRITE) {
   938			ret = filemap_write_and_wait_range(src_inode->v.i_mapping,
   939							   0, LLONG_MAX);
   940			if (ret)
   941				return ret;
   942		}
   943	
   944		bch2_lock_inodes(INODE_UPDATE_LOCK,
   945				 src_dir,
   946				 dst_dir,
   947				 src_inode,
   948				 dst_inode);
   949	
   950		if (src_dir != dst_dir) {
   951			if (bch2_inode_casefold(c, &src_inode->ei_inode)) {
   952				ret = d_casefold_enable(dst_dentry, &casefold_enable_dst);
   953				if (ret)
   954					goto err;
   955			}
   956	
   957			if (mode == BCH_RENAME_EXCHANGE &&
   958			    bch2_inode_casefold(c, &dst_inode->ei_inode)) {
   959				ret = d_casefold_enable(src_dentry, &casefold_enable_src);
 > 960				if (ret)
   961					goto err;
   962			}
   963		}
   964	
   965		trans = bch2_trans_get(c);
   966	
   967		ret   = bch2_subvol_is_ro_trans(trans, src_dir->ei_inum.subvol) ?:
   968			bch2_subvol_is_ro_trans(trans, dst_dir->ei_inum.subvol);
   969		if (ret)
   970			goto err_tx_restart;
   971	
   972		if (inode_attr_changing(dst_dir, src_inode, Inode_opt_project)) {
   973			ret = bch2_fs_quota_transfer(c, src_inode,
   974						     dst_dir->ei_qid,
   975						     1 << QTYP_PRJ,
   976						     KEY_TYPE_QUOTA_PREALLOC);
   977			if (ret)
   978				goto err;
   979		}
   980	
   981		if (mode == BCH_RENAME_EXCHANGE &&
   982		    inode_attr_changing(src_dir, dst_inode, Inode_opt_project)) {
   983			ret = bch2_fs_quota_transfer(c, dst_inode,
   984						     src_dir->ei_qid,
   985						     1 << QTYP_PRJ,
   986						     KEY_TYPE_QUOTA_PREALLOC);
   987			if (ret)
   988				goto err;
   989		}
   990	retry:
   991		bch2_trans_begin(trans);
   992	
   993		ret = bch2_rename_trans(trans,
   994					inode_inum(src_dir), &src_dir_u,
   995					inode_inum(dst_dir), &dst_dir_u,
   996					&src_inode_u,
   997					&dst_inode_u,
   998					&src_dentry->d_name,
   999					&dst_dentry->d_name,
  1000					mode);
  1001		if (unlikely(ret))
  1002			goto err_tx_restart;
  1003	
  1004		if (whiteout) {
  1005			whiteout_inode_u = bch2_trans_kmalloc_nomemzero(trans, sizeof(*whiteout_inode_u));
  1006			ret = PTR_ERR_OR_ZERO(whiteout_inode_u);
  1007			if (unlikely(ret))
  1008				goto err_tx_restart;
  1009			bch2_inode_init_early(c, whiteout_inode_u);
  1010	
  1011			ret = bch2_create_trans(trans,
  1012						inode_inum(src_dir), &src_dir_u,
  1013						whiteout_inode_u,
  1014						&src_dentry->d_name,
  1015						from_kuid(i_user_ns(&src_dir->v), current_fsuid()),
  1016						from_kgid(i_user_ns(&src_dir->v), current_fsgid()),
  1017						S_IFCHR|WHITEOUT_MODE, 0,
  1018						NULL, NULL, (subvol_inum) { 0 }, 0) ?:
  1019			      bch2_quota_acct(c, bch_qid(whiteout_inode_u), Q_INO, 1,
  1020					      KEY_TYPE_QUOTA_PREALLOC);
  1021			if (unlikely(ret))
  1022				goto err_tx_restart;
  1023		}
  1024	
  1025		ret = bch2_trans_commit(trans, NULL, NULL, 0);
  1026		if (unlikely(ret)) {
  1027	err_tx_restart:
  1028			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
  1029				goto retry;
  1030			goto err;
  1031		}
  1032	
  1033		BUG_ON(src_inode->v.i_ino != src_inode_u.bi_inum);
  1034		BUG_ON(dst_inode &&
  1035		       dst_inode->v.i_ino != dst_inode_u.bi_inum);
  1036	
  1037		bch2_inode_update_after_write(trans, src_dir, &src_dir_u,
  1038					      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
  1039	
  1040		if (src_dir != dst_dir)
  1041			bch2_inode_update_after_write(trans, dst_dir, &dst_dir_u,
  1042						      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
  1043	
  1044		bch2_inode_update_after_write(trans, src_inode, &src_inode_u,
  1045					      ATTR_CTIME);
  1046	
  1047		if (dst_inode)
  1048			bch2_inode_update_after_write(trans, dst_inode, &dst_inode_u,
  1049						      ATTR_CTIME);
  1050	err:
  1051		bch2_trans_put(trans);
  1052	
  1053		bch2_fs_quota_transfer(c, src_inode,
  1054				       bch_qid(&src_inode->ei_inode),
  1055				       1 << QTYP_PRJ,
  1056				       KEY_TYPE_QUOTA_NOCHECK);
  1057		if (dst_inode)
  1058			bch2_fs_quota_transfer(c, dst_inode,
  1059					       bch_qid(&dst_inode->ei_inode),
  1060					       1 << QTYP_PRJ,
  1061					       KEY_TYPE_QUOTA_NOCHECK);
  1062	
  1063		bch2_unlock_inodes(INODE_UPDATE_LOCK,
  1064				   src_dir,
  1065				   dst_dir,
  1066				   src_inode,
  1067				   dst_inode);
  1068	
  1069		d_casefold_enable_commit(&casefold_enable_dst, ret);
  1070		d_casefold_enable_commit(&casefold_enable_src, ret);
  1071	
  1072		return bch2_err_class(ret);
  1073	}
  1074	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
