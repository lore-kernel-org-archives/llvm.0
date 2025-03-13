Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9282C80;
	Thu, 13 Mar 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857702; cv=none; b=DkL4Z5tcVvkVQekMnhtTnaKyDurMLP/wM5Ah5gNR0S+M0SYCTccTROi+uIBTKIWQYGMhR7IFOvo9jT/ZRw03nacvPNkUccMVEovfnS1cTA2Zc9KXD5UwkSo1Jw2OCCTGPVSRbvW/tI89Z91CbgJWjJ6fmSSiOFtM4CF6rekWWxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857702; c=relaxed/simple;
	bh=3f8DatpaCTCsrOcjdqQNsOqvp/r6FqXq5NhT6ju+igM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUw5+STPfJjgdJWuoCeY08j0uiIsQ1f37WQ6B0qbHLd5o0x7DF0w1lOgJj/tGAse5t5s7aBEJ79E14wvuZiAdbGr4j4ssluC+q+nMAwaASYiAu72gU1shRbIyEqCZbtiWoP57fRSDOO7dDUU6pcKEQSKu1ULWnpz95608EfNzmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwy4MNuk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwy4MNuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741857700; x=1773393700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3f8DatpaCTCsrOcjdqQNsOqvp/r6FqXq5NhT6ju+igM=;
  b=iwy4MNukLNo5CTAn4t4IQbXpsuAVyrqN7mDRrLtHO1IVKnNkgSd+xV7a
   4YuqbpJ+1kVwWQsvFfi29RLPpjb+S8FVezMuXg3o8+LEwNJExkkiQX72I
   q+rtrgL/cvwOywU6YjGVBopPRcwExMQoXdyujSf8CxgoN3oiHNn2LEwL6
   G93NrJqNd0U6luthTKtAbrM1a8V/3QAS7GwSxQUVa4+8nIJImRTUg7JLo
   h2KPt9CWn+kqzDCjyScpdp/3k//zWYzZlOyaLv5Xe33fqnpPN+H9eQa+K
   W4cR0uqiTRiZ0NjT8E2lX/IBwL4BHUgcu+3+0bhLACqXLhKxMHyl4ryTt
   Q==;
X-CSE-ConnectionGUID: 6PRpBUZkTg+tg0Jc3GghqA==
X-CSE-MsgGUID: 57mOxCqlTkGUlfUs8uP41w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46869755"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="46869755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:21:39 -0700
X-CSE-ConnectionGUID: I0KmZhh7SLad9YeDid7Ddw==
X-CSE-MsgGUID: j8/7fQA8T0qgD3hEoLrp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121819972"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Mar 2025 02:21:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsekx-0009HM-2s;
	Thu, 13 Mar 2025 09:21:35 +0000
Date: Thu, 13 Mar 2025 17:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 148/149]
 fs/bcachefs/xattr.c:526:23: error: too few arguments to function
 'bch2_opt_check_may_set'
Message-ID: <202503131738.6QiKyFK8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   c616621c9b68c91f9486fb27827d521c3a99c8be
commit: d74a15fb0e1c99935df10bf18c62e38ad3ec385d [148/149] bcachefs: Device state is now a runtime option
config: i386-buildonly-randconfig-001-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131738.6QiKyFK8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131738.6QiKyFK8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131738.6QiKyFK8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/bcachefs/xattr.c: In function 'bch2_xattr_bcachefs_set':
>> fs/bcachefs/xattr.c:526:49: warning: passing argument 2 of 'bch2_opt_check_may_set' makes pointer from integer without a cast [-Wint-conversion]
     526 |                 ret = bch2_opt_check_may_set(c, opt_id, v);
         |                                                 ^~~~~~
         |                                                 |
         |                                                 int
   In file included from fs/bcachefs/bcachefs.h:214,
                    from fs/bcachefs/xattr.c:3:
   fs/bcachefs/opts.h:645:45: note: expected 'struct bch_dev *' but argument is of type 'int'
     645 | int bch2_opt_check_may_set(struct bch_fs *, struct bch_dev *, int, u64);
         |                                             ^~~~~~~~~~~~~~~~
>> fs/bcachefs/xattr.c:526:23: error: too few arguments to function 'bch2_opt_check_may_set'
     526 |                 ret = bch2_opt_check_may_set(c, opt_id, v);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:645:5: note: declared here
     645 | int bch2_opt_check_may_set(struct bch_fs *, struct bch_dev *, int, u64);
         |     ^~~~~~~~~~~~~~~~~~~~~~
--
   fs/bcachefs/sysfs.c: In function 'sysfs_opt_store':
>> fs/bcachefs/sysfs.c:653:41: warning: passing argument 2 of 'bch2_opt_check_may_set' makes pointer from integer without a cast [-Wint-conversion]
     653 |         ret = bch2_opt_check_may_set(c, id, v);
         |                                         ^~
         |                                         |
         |                                         int
   In file included from fs/bcachefs/bcachefs.h:214,
                    from fs/bcachefs/sysfs.c:11:
   fs/bcachefs/opts.h:645:45: note: expected 'struct bch_dev *' but argument is of type 'int'
     645 | int bch2_opt_check_may_set(struct bch_fs *, struct bch_dev *, int, u64);
         |                                             ^~~~~~~~~~~~~~~~
>> fs/bcachefs/sysfs.c:653:15: error: too few arguments to function 'bch2_opt_check_may_set'
     653 |         ret = bch2_opt_check_may_set(c, id, v);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:645:5: note: declared here
     645 | int bch2_opt_check_may_set(struct bch_fs *, struct bch_dev *, int, u64);
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/bch2_opt_check_may_set +526 fs/bcachefs/xattr.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  485  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  486  static int bch2_xattr_bcachefs_set(const struct xattr_handler *handler,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  487  				   struct mnt_idmap *idmap,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  488  				   struct dentry *dentry, struct inode *vinode,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  489  				   const char *name, const void *value,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  490  				   size_t size, int flags)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  491  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  492  	struct bch_inode_info *inode = to_bch_ei(vinode);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  493  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  494  	const struct bch_option *opt;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  495  	char *buf;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  496  	struct inode_opt_set s;
4d269918ed502cb Kent Overstreet 2018-12-17  497  	int opt_id, inode_opt_id, ret;
4d269918ed502cb Kent Overstreet 2018-12-17  498  
4d269918ed502cb Kent Overstreet 2018-12-17  499  	opt_id = bch2_opt_lookup(name);
4d269918ed502cb Kent Overstreet 2018-12-17  500  	if (opt_id < 0)
4d269918ed502cb Kent Overstreet 2018-12-17  501  		return -EINVAL;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  502  
4d269918ed502cb Kent Overstreet 2018-12-17  503  	opt = bch2_opt_table + opt_id;
4d269918ed502cb Kent Overstreet 2018-12-17  504  
4d269918ed502cb Kent Overstreet 2018-12-17  505  	inode_opt_id = opt_to_inode_opt(opt_id);
4d269918ed502cb Kent Overstreet 2018-12-17  506  	if (inode_opt_id < 0)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  507  		return -EINVAL;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  508  
4d269918ed502cb Kent Overstreet 2018-12-17  509  	s.id = inode_opt_id;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  510  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  511  	if (value) {
4d269918ed502cb Kent Overstreet 2018-12-17  512  		u64 v = 0;
4d269918ed502cb Kent Overstreet 2018-12-17  513  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  514  		buf = kmalloc(size + 1, GFP_KERNEL);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  515  		if (!buf)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  516  			return -ENOMEM;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  517  		memcpy(buf, value, size);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  518  		buf[size] = '\0';
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  519  
63c4b25453828ee Kent Overstreet 2022-03-21  520  		ret = bch2_opt_parse(c, opt, buf, &v, NULL);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  521  		kfree(buf);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  522  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  523  		if (ret < 0)
7e23c1746b027ea Hongbo Li       2024-03-01  524  			goto err_class_exit;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  525  
4d269918ed502cb Kent Overstreet 2018-12-17 @526  		ret = bch2_opt_check_may_set(c, opt_id, v);
c258f28ebab6be1 Kent Overstreet 2018-11-12  527  		if (ret < 0)
7e23c1746b027ea Hongbo Li       2024-03-01  528  			goto err_class_exit;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  529  
4d269918ed502cb Kent Overstreet 2018-12-17  530  		s.v = v + 1;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  531  		s.defined = true;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  532  	} else {
ba276ce5865b5a2 Kent Overstreet 2023-11-14  533  		/*
ba276ce5865b5a2 Kent Overstreet 2023-11-14  534  		 * Check if this option was set on the parent - if so, switched
ba276ce5865b5a2 Kent Overstreet 2023-11-14  535  		 * back to inheriting from the parent:
ba276ce5865b5a2 Kent Overstreet 2023-11-14  536  		 *
ba276ce5865b5a2 Kent Overstreet 2023-11-14  537  		 * rename() also has to deal with keeping inherited options up
ba276ce5865b5a2 Kent Overstreet 2023-11-14  538  		 * to date - see bch2_reinherit_attrs()
ba276ce5865b5a2 Kent Overstreet 2023-11-14  539  		 */
ba276ce5865b5a2 Kent Overstreet 2023-11-14  540  		spin_lock(&dentry->d_lock);
4d269918ed502cb Kent Overstreet 2018-12-17  541  		if (!IS_ROOT(dentry)) {
4d269918ed502cb Kent Overstreet 2018-12-17  542  			struct bch_inode_info *dir =
4d269918ed502cb Kent Overstreet 2018-12-17  543  				to_bch_ei(d_inode(dentry->d_parent));
4d269918ed502cb Kent Overstreet 2018-12-17  544  
4d269918ed502cb Kent Overstreet 2018-12-17  545  			s.v = bch2_inode_opt_get(&dir->ei_inode, inode_opt_id);
4d269918ed502cb Kent Overstreet 2018-12-17  546  		} else {
4d269918ed502cb Kent Overstreet 2018-12-17  547  			s.v = 0;
4d269918ed502cb Kent Overstreet 2018-12-17  548  		}
ba276ce5865b5a2 Kent Overstreet 2023-11-14  549  		spin_unlock(&dentry->d_lock);
4d269918ed502cb Kent Overstreet 2018-12-17  550  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  551  		s.defined = false;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  552  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  553  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  554  	mutex_lock(&inode->ei_update_lock);
2fab25cdd70be68 Kent Overstreet 2018-12-19  555  	if (inode_opt_id == Inode_opt_project) {
7af0cec3076886d Kent Overstreet 2020-08-24  556  		/*
7af0cec3076886d Kent Overstreet 2020-08-24  557  		 * inode fields accessible via the xattr interface are stored
7af0cec3076886d Kent Overstreet 2020-08-24  558  		 * with a +1 bias, so that 0 means unset:
7af0cec3076886d Kent Overstreet 2020-08-24  559  		 */
7af0cec3076886d Kent Overstreet 2020-08-24  560  		ret = bch2_set_projid(c, inode, s.v ? s.v - 1 : 0);
2fab25cdd70be68 Kent Overstreet 2018-12-19  561  		if (ret)
2fab25cdd70be68 Kent Overstreet 2018-12-19  562  			goto err;
2fab25cdd70be68 Kent Overstreet 2018-12-19  563  	}
2fab25cdd70be68 Kent Overstreet 2018-12-19  564  
2ea9004864b918b Kent Overstreet 2018-07-17  565  	ret = bch2_write_inode(c, inode, inode_opt_set_fn, &s, 0);
2fab25cdd70be68 Kent Overstreet 2018-12-19  566  err:
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  567  	mutex_unlock(&inode->ei_update_lock);
7e23c1746b027ea Hongbo Li       2024-03-01  568  err_class_exit:
e47a390aa5946e3 Kent Overstreet 2023-05-27  569  	return bch2_err_class(ret);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  570  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  571  

:::::: The code at line 526 was first introduced by commit
:::::: 4d269918ed502cba80ddad998bdb087a633c63ab bcachefs: add bcachefs_effective xattrs

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
