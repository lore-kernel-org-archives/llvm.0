Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D615D1;
	Tue,  3 Sep 2024 00:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725323492; cv=none; b=sDGCxhUf8vQUjFCjhHdUgPUUPli/L+Tc4kAmzF5EdDGrDpqLF6aoPBX3gyaGu6BhSX7cdpxfPMtCAqXZNWhorzpW0XsZMW3R8EbGThRKIVjyUDWk8KjnTidbpcN0cRByZozMFmcevaqnvTQf+fkArnIKn2vwISb49UoZ6XGYLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725323492; c=relaxed/simple;
	bh=q67CvVbCF4WWAgjYFPlgiIMZmKVIhMgIt74iibx03kM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdmNvHHyg749dLk0b7mXB/BOM2q0YSP9ZEhvxKQ+LIQLdhxzl7ICLG+LoBW0V5nWbT1G7jHC8DxkmaQXYCpNsyDPCWtie6Un8FcH5dPY1ZE8KRk+5BXUNaXobvbMsrO82h9M8+hpDNQtVBpS30rNFlyGCu39f1imVe0bkVrTaMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vp7O6kPR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vp7O6kPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725323490; x=1756859490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q67CvVbCF4WWAgjYFPlgiIMZmKVIhMgIt74iibx03kM=;
  b=Vp7O6kPRoXjpFnLH6K7NwEnPMGYrO/yOdLSuTYPi7gTUltutuOkpVObi
   xHF85U1sNzqqg07+HomOwjogIylzfcFjxAgqpMoyAjQwlKaP8NI0KGUkZ
   lZ9eMyYOIsQXocaqf7AzySgIxD7lAIoMfF86FYiov81Wv06vzn/VeSijT
   V99Z5Q6Hao97nkA4S4rNk1P91LAtFusVaIfBL4/wbDHjdeH/HjBbIrM/t
   Nbyo/XxVw+vje0ZoRlg01fd1+ekQO5dqVal7+CVb/4fB4a+2YHjiMjPnE
   hsSWPGiKDmoc/f6mFEu/JWrvtWgCIVvDKO9Zr4SRKhotCdI8pUPQTSMZd
   g==;
X-CSE-ConnectionGUID: xe3xd4lHTHeXnVuzB05OBg==
X-CSE-MsgGUID: 0a6i7sVxQ/qW2klqPRKL9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23467641"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="23467641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 17:31:29 -0700
X-CSE-ConnectionGUID: i7zG7aW5R2yioqY2bwugxA==
X-CSE-MsgGUID: OREpCmeJSfedxcGR6No5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="69528122"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2024 17:31:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slHS9-00062k-26;
	Tue, 03 Sep 2024 00:31:25 +0000
Date: Tue, 3 Sep 2024 08:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 140/143] fs/bcachefs/fs.c:715:12: warning: stack
 frame size (1032) exceeds limit (1024) in 'bch2_rename2'
Message-ID: <202409030844.3CszD3y9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   4e7795eda4459bf3e69c87c793bc34f610f9d981
commit: 2b3a3fdc7c95ea7d9e9ac9a02ecfc87006923f72 [140/143] bcachefs: Hook up RENAME_WHITEOUT in rename.
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240903/202409030844.3CszD3y9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030844.3CszD3y9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030844.3CszD3y9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/bcachefs/fs.c:715:12: warning: stack frame size (1032) exceeds limit (1024) in 'bch2_rename2' [-Wframe-larger-than]
     715 | static int bch2_rename2(struct mnt_idmap *idmap,
         |            ^
   8 warnings generated.


vim +/bch2_rename2 +715 fs/bcachefs/fs.c

1c6fdbd8f2465d Kent Overstreet   2017-03-16  714  
1c6fdbd8f2465d Kent Overstreet   2017-03-16 @715  static int bch2_rename2(struct mnt_idmap *idmap,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  716  			struct inode *src_vdir, struct dentry *src_dentry,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  717  			struct inode *dst_vdir, struct dentry *dst_dentry,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  718  			unsigned flags)
1c6fdbd8f2465d Kent Overstreet   2017-03-16  719  {
1c6fdbd8f2465d Kent Overstreet   2017-03-16  720  	struct bch_fs *c = src_vdir->i_sb->s_fs_info;
9638574229e3ae Kent Overstreet   2019-10-02  721  	struct bch_inode_info *src_dir = to_bch_ei(src_vdir);
9638574229e3ae Kent Overstreet   2019-10-02  722  	struct bch_inode_info *dst_dir = to_bch_ei(dst_vdir);
9638574229e3ae Kent Overstreet   2019-10-02  723  	struct bch_inode_info *src_inode = to_bch_ei(src_dentry->d_inode);
9638574229e3ae Kent Overstreet   2019-10-02  724  	struct bch_inode_info *dst_inode = to_bch_ei(dst_dentry->d_inode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  725  	struct bch_inode_unpacked dst_dir_u, src_dir_u;
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  726  	struct bch_inode_unpacked src_inode_u, dst_inode_u, whiteout_inode_u;
6bd68ec266ad71 Kent Overstreet   2023-09-12  727  	struct btree_trans *trans;
9638574229e3ae Kent Overstreet   2019-10-02  728  	enum bch_rename_mode mode = flags & RENAME_EXCHANGE
9638574229e3ae Kent Overstreet   2019-10-02  729  		? BCH_RENAME_EXCHANGE
9638574229e3ae Kent Overstreet   2019-10-02  730  		: dst_dentry->d_inode
9638574229e3ae Kent Overstreet   2019-10-02  731  		? BCH_RENAME_OVERWRITE : BCH_RENAME;
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  732  	bool whiteout = !!(flags & RENAME_WHITEOUT);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  733  	int ret;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  734  
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  735  	if (flags & ~(RENAME_NOREPLACE|RENAME_EXCHANGE|RENAME_WHITEOUT))
1c6fdbd8f2465d Kent Overstreet   2017-03-16  736  		return -EINVAL;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  737  
9638574229e3ae Kent Overstreet   2019-10-02  738  	if (mode == BCH_RENAME_OVERWRITE) {
9638574229e3ae Kent Overstreet   2019-10-02  739  		ret = filemap_write_and_wait_range(src_inode->v.i_mapping,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  740  						   0, LLONG_MAX);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  741  		if (ret)
1c6fdbd8f2465d Kent Overstreet   2017-03-16  742  			return ret;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  743  	}
1c6fdbd8f2465d Kent Overstreet   2017-03-16  744  
168f4c5fb37513 Kent Overstreet   2019-06-24  745  	bch2_lock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae Kent Overstreet   2019-10-02  746  			 src_dir,
9638574229e3ae Kent Overstreet   2019-10-02  747  			 dst_dir,
9638574229e3ae Kent Overstreet   2019-10-02  748  			 src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  749  			 dst_inode);
9638574229e3ae Kent Overstreet   2019-10-02  750  
f369de82679f4f Kent Overstreet   2024-07-04  751  	trans = bch2_trans_get(c);
f369de82679f4f Kent Overstreet   2024-07-04  752  
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  753  	if (whiteout)
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  754  		bch2_inode_init_early(c, &whiteout_inode_u);
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  755  
35c94b2cea126d Kent Overstreet   2024-06-08  756  	ret   = bch2_subvol_is_ro_trans(trans, src_dir->ei_inum.subvol) ?:
35c94b2cea126d Kent Overstreet   2024-06-08  757  		bch2_subvol_is_ro_trans(trans, dst_dir->ei_inum.subvol);
0d72ab35a925d6 Kent Overstreet   2023-12-29  758  	if (ret)
0d72ab35a925d6 Kent Overstreet   2023-12-29  759  		goto err;
0d72ab35a925d6 Kent Overstreet   2023-12-29  760  
9638574229e3ae Kent Overstreet   2019-10-02  761  	if (inode_attr_changing(dst_dir, src_inode, Inode_opt_project)) {
9638574229e3ae Kent Overstreet   2019-10-02  762  		ret = bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  763  					     dst_dir->ei_qid,
96012e143e699d Kent Overstreet   2018-12-17  764  					     1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  765  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699d Kent Overstreet   2018-12-17  766  		if (ret)
96012e143e699d Kent Overstreet   2018-12-17  767  			goto err;
96012e143e699d Kent Overstreet   2018-12-17  768  	}
96012e143e699d Kent Overstreet   2018-12-17  769  
9638574229e3ae Kent Overstreet   2019-10-02  770  	if (mode == BCH_RENAME_EXCHANGE &&
9638574229e3ae Kent Overstreet   2019-10-02  771  	    inode_attr_changing(src_dir, dst_inode, Inode_opt_project)) {
9638574229e3ae Kent Overstreet   2019-10-02  772  		ret = bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae Kent Overstreet   2019-10-02  773  					     src_dir->ei_qid,
96012e143e699d Kent Overstreet   2018-12-17  774  					     1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  775  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699d Kent Overstreet   2018-12-17  776  		if (ret)
96012e143e699d Kent Overstreet   2018-12-17  777  			goto err;
96012e143e699d Kent Overstreet   2018-12-17  778  	}
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  779  retry:
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  780  	bch2_trans_begin(trans);
96012e143e699d Kent Overstreet   2018-12-17  781  
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  782  	ret = bch2_rename_trans(trans,
6fed42bb7750e2 Kent Overstreet   2021-03-16  783  				inode_inum(src_dir), &src_dir_u,
6fed42bb7750e2 Kent Overstreet   2021-03-16  784  				inode_inum(dst_dir), &dst_dir_u,
9638574229e3ae Kent Overstreet   2019-10-02  785  				&src_inode_u,
9638574229e3ae Kent Overstreet   2019-10-02  786  				&dst_inode_u,
9638574229e3ae Kent Overstreet   2019-10-02  787  				&src_dentry->d_name,
9638574229e3ae Kent Overstreet   2019-10-02  788  				&dst_dentry->d_name,
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  789  				mode);
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  790  	if (unlikely(ret))
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  791  		goto err_tx_restart;
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  792  
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  793  	if (whiteout) {
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  794  		ret = bch2_create_trans(trans,
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  795  					inode_inum(src_dir), &src_dir_u,
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  796  					&whiteout_inode_u,
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  797  					&src_dentry->d_name,
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  798  					from_kuid(i_user_ns(&src_dir->v), current_fsuid()),
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  799  					from_kgid(i_user_ns(&src_dir->v), current_fsgid()),
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  800  					S_IFCHR|WHITEOUT_MODE, 0,
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  801  					NULL, NULL, (subvol_inum) { 0 }, 0) ?:
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  802  		      bch2_quota_acct(c, bch_qid(&whiteout_inode_u), Q_INO, 1,
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  803  				      KEY_TYPE_QUOTA_PREALLOC);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  804  		if (unlikely(ret))
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  805  			goto err_tx_restart;
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  806  	}
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  807  
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  808  	ret = bch2_trans_commit(trans, NULL, NULL, 0);
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  809  	if (unlikely(ret)) {
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  810  err_tx_restart:
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  811  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  812  			goto retry;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  813  		goto err;
2b3a3fdc7c95ea Sasha Finkelstein 2024-08-18  814  	}
1c6fdbd8f2465d Kent Overstreet   2017-03-16  815  
9638574229e3ae Kent Overstreet   2019-10-02  816  	BUG_ON(src_inode->v.i_ino != src_inode_u.bi_inum);
9638574229e3ae Kent Overstreet   2019-10-02  817  	BUG_ON(dst_inode &&
9638574229e3ae Kent Overstreet   2019-10-02  818  	       dst_inode->v.i_ino != dst_inode_u.bi_inum);
9638574229e3ae Kent Overstreet   2019-10-02  819  
6bd68ec266ad71 Kent Overstreet   2023-09-12  820  	bch2_inode_update_after_write(trans, src_dir, &src_dir_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  821  				      ATTR_MTIME|ATTR_CTIME);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  822  
68a2054d88f7cd Kent Overstreet   2021-11-05  823  	if (src_dir != dst_dir)
6bd68ec266ad71 Kent Overstreet   2023-09-12  824  		bch2_inode_update_after_write(trans, dst_dir, &dst_dir_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  825  					      ATTR_MTIME|ATTR_CTIME);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  826  
6bd68ec266ad71 Kent Overstreet   2023-09-12  827  	bch2_inode_update_after_write(trans, src_inode, &src_inode_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  828  				      ATTR_CTIME);
9638574229e3ae Kent Overstreet   2019-10-02  829  
68a2054d88f7cd Kent Overstreet   2021-11-05  830  	if (dst_inode)
6bd68ec266ad71 Kent Overstreet   2023-09-12  831  		bch2_inode_update_after_write(trans, dst_inode, &dst_inode_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  832  					      ATTR_CTIME);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  833  err:
6bd68ec266ad71 Kent Overstreet   2023-09-12  834  	bch2_trans_put(trans);
96012e143e699d Kent Overstreet   2018-12-17  835  
9638574229e3ae Kent Overstreet   2019-10-02  836  	bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  837  			       bch_qid(&src_inode->ei_inode),
96012e143e699d Kent Overstreet   2018-12-17  838  			       1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  839  			       KEY_TYPE_QUOTA_NOCHECK);
9638574229e3ae Kent Overstreet   2019-10-02  840  	if (dst_inode)
9638574229e3ae Kent Overstreet   2019-10-02  841  		bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae Kent Overstreet   2019-10-02  842  				       bch_qid(&dst_inode->ei_inode),
96012e143e699d Kent Overstreet   2018-12-17  843  				       1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  844  				       KEY_TYPE_QUOTA_NOCHECK);
96012e143e699d Kent Overstreet   2018-12-17  845  
168f4c5fb37513 Kent Overstreet   2019-06-24  846  	bch2_unlock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae Kent Overstreet   2019-10-02  847  			   src_dir,
9638574229e3ae Kent Overstreet   2019-10-02  848  			   dst_dir,
9638574229e3ae Kent Overstreet   2019-10-02  849  			   src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  850  			   dst_inode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  851  
1a1c93e7f81417 Kent Overstreet   2024-02-09  852  	return bch2_err_class(ret);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  853  }
1c6fdbd8f2465d Kent Overstreet   2017-03-16  854  

:::::: The code at line 715 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
