Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C51CCB43;
	Wed,  4 Sep 2024 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725449954; cv=none; b=YndOy90W5YRieKZZQMqm0ASQhPFo5/tuRjO3aUmpmAzUkd/ZwNBOXqeirXIQNAvrUROKi1oKUDjqEzS7Yj0qIuE5ocidzjqc46qYpacYLd7jjFRV1729F3u10tR+uUgQgBZFSmBu11Z1X2iejIjxYXgbK5qhFZHsEs8jb0sZCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725449954; c=relaxed/simple;
	bh=M9yhLPtalzMN7Yv9fifAMNwsC0ZuhH4CKgWnffA6uOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYIN1cjD4T8qIrmC3VzC/prYc2UJZ8iXJvnk/9okFJpsw/0i7zGRxnQY+9dMbCMLp0v5S9t28WApmHaOI6lnzIUphW/lsyqow2WGMzEu9G5vnxux+XDyW+F/+/mAbCCaXlf9YFcNKEhPRBWIyMY70gIaXLaSbcD2/7Rm3zxoP4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8x1alDF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8x1alDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725449952; x=1756985952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9yhLPtalzMN7Yv9fifAMNwsC0ZuhH4CKgWnffA6uOI=;
  b=M8x1alDFws/RG5aHI6tAwIoWAUC6hkc8f/Wwv6Up12CosuUW+T0EQDD+
   x7RPBM3vE4WVBqe3gTJYahyapKeebIQFaIZZn4bcEBS3Do8MO+E9oTuMG
   OSL+I50MDYU0xlmMT+AyaPBByIbQDSbZ/Iz3Iix39ED6TspLxU688zX5+
   mYD3FCcCrjI4nURznuB31Tt19VPFn6MtGWcBtIDhfaFspiFygYzYUQ0L6
   KSnThPIKvjkX3kf44XPUW+rZj3usc4B7Oa6NseKHRe6JwSPyYD6JvapyJ
   lThOnX90i27aW4BARKjGOzseL4PdIInOydHrTojfiRlQFrJeCrfBW7Z4N
   Q==;
X-CSE-ConnectionGUID: KiXKyJhpS+mNN8DN0eDiTw==
X-CSE-MsgGUID: KqWf5/PjQ9u0HO6A06Rv0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23665329"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="23665329"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 04:39:12 -0700
X-CSE-ConnectionGUID: ItJRzvQORP+bj0QvYeLC4Q==
X-CSE-MsgGUID: JBM00pUgT5iq6ljv1m2b3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="64900069"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2024 04:39:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sloLs-0007v9-1h;
	Wed, 04 Sep 2024 11:39:08 +0000
Date: Wed, 4 Sep 2024 19:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 5/5] fs/f2fs/namei.c:469:15: warning: unused variable
 'root_ino'
Message-ID: <202409041931.QlsPggLS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   69dc8fbbbb39f85f9f436ca562c98afbcc2a48d2
commit: 69dc8fbbbb39f85f9f436ca562c98afbcc2a48d2 [5/5] f2fs: get rid of online repaire on corrupted directory
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240904/202409041931.QlsPggLS-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041931.QlsPggLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041931.QlsPggLS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/namei.c:469:15: warning: unused variable 'root_ino' [-Wunused-variable]
     469 |         unsigned int root_ino = F2FS_ROOT_INO(F2FS_I_SB(dir));
         |                      ^~~~~~~~
   1 warning generated.


vim +/root_ino +469 fs/f2fs/namei.c

57397d86c62dfe Jaegeuk Kim             2012-11-02  459  
57397d86c62dfe Jaegeuk Kim             2012-11-02  460  static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
57397d86c62dfe Jaegeuk Kim             2012-11-02  461  		unsigned int flags)
57397d86c62dfe Jaegeuk Kim             2012-11-02  462  {
57397d86c62dfe Jaegeuk Kim             2012-11-02  463  	struct inode *inode = NULL;
57397d86c62dfe Jaegeuk Kim             2012-11-02  464  	struct f2fs_dir_entry *de;
57397d86c62dfe Jaegeuk Kim             2012-11-02  465  	struct page *page;
0c5e36db17f5fe Chao Yu                 2017-10-17  466  	struct dentry *new;
0c5e36db17f5fe Chao Yu                 2017-10-17  467  	nid_t ino = -1;
fcc85a4d86b501 Jaegeuk Kim             2015-04-21  468  	int err = 0;
8c2b1435b9f489 Liu Xue                 2016-02-26 @469  	unsigned int root_ino = F2FS_ROOT_INO(F2FS_I_SB(dir));
43c780ba26244e Eric Biggers            2020-05-07  470  	struct f2fs_filename fname;
57397d86c62dfe Jaegeuk Kim             2012-11-02  471  
0c5e36db17f5fe Chao Yu                 2017-10-17  472  	trace_f2fs_lookup_start(dir, dentry, flags);
0c5e36db17f5fe Chao Yu                 2017-10-17  473  
0c5e36db17f5fe Chao Yu                 2017-10-17  474  	if (dentry->d_name.len > F2FS_NAME_LEN) {
0c5e36db17f5fe Chao Yu                 2017-10-17  475  		err = -ENAMETOOLONG;
0c5e36db17f5fe Chao Yu                 2017-10-17  476  		goto out;
0c5e36db17f5fe Chao Yu                 2017-10-17  477  	}
57397d86c62dfe Jaegeuk Kim             2012-11-02  478  
43c780ba26244e Eric Biggers            2020-05-07  479  	err = f2fs_prepare_lookup(dir, dentry, &fname);
b01531db6cec2a Eric Biggers            2019-03-20  480  	if (err == -ENOENT)
b01531db6cec2a Eric Biggers            2019-03-20  481  		goto out_splice;
b01531db6cec2a Eric Biggers            2019-03-20  482  	if (err)
b01531db6cec2a Eric Biggers            2019-03-20  483  		goto out;
b01531db6cec2a Eric Biggers            2019-03-20  484  	de = __f2fs_find_entry(dir, &fname, &page);
43c780ba26244e Eric Biggers            2020-05-07  485  	f2fs_free_filename(&fname);
b01531db6cec2a Eric Biggers            2019-03-20  486  
eb4246dc12da4a Jaegeuk Kim             2016-05-27  487  	if (!de) {
0c5e36db17f5fe Chao Yu                 2017-10-17  488  		if (IS_ERR(page)) {
0c5e36db17f5fe Chao Yu                 2017-10-17  489  			err = PTR_ERR(page);
0c5e36db17f5fe Chao Yu                 2017-10-17  490  			goto out;
0c5e36db17f5fe Chao Yu                 2017-10-17  491  		}
84597b1f9b051f Chao Yu                 2020-05-27  492  		err = -ENOENT;
0c5e36db17f5fe Chao Yu                 2017-10-17  493  		goto out_splice;
eb4246dc12da4a Jaegeuk Kim             2016-05-27  494  	}
06957e8fe6945e Jaegeuk Kim             2015-04-22  495  
06957e8fe6945e Jaegeuk Kim             2015-04-22  496  	ino = le32_to_cpu(de->ino);
57397d86c62dfe Jaegeuk Kim             2012-11-02  497  	f2fs_put_page(page, 0);
57397d86c62dfe Jaegeuk Kim             2012-11-02  498  
57397d86c62dfe Jaegeuk Kim             2012-11-02  499  	inode = f2fs_iget(dir->i_sb, ino);
0c5e36db17f5fe Chao Yu                 2017-10-17  500  	if (IS_ERR(inode)) {
0c5e36db17f5fe Chao Yu                 2017-10-17  501  		err = PTR_ERR(inode);
0c5e36db17f5fe Chao Yu                 2017-10-17  502  		goto out;
0c5e36db17f5fe Chao Yu                 2017-10-17  503  	}
510022a85839a8 Jaegeuk Kim             2015-03-30  504  
62230e0d702f61 Chandan Rajendra        2018-12-12  505  	if (IS_ENCRYPTED(dir) &&
8074bb515014d2 Jaegeuk Kim             2016-02-23  506  	    (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
8074bb515014d2 Jaegeuk Kim             2016-02-23  507  	    !fscrypt_has_permitted_context(dir, inode)) {
dcbb4c10e6d969 Joe Perches             2019-06-18  508  		f2fs_warn(F2FS_I_SB(inode), "Inconsistent encryption contexts: %lu/%lu",
faac7fd97e0827 Eric Biggers            2017-04-07  509  			  dir->i_ino, inode->i_ino);
faac7fd97e0827 Eric Biggers            2017-04-07  510  		err = -EPERM;
0c5e36db17f5fe Chao Yu                 2017-10-17  511  		goto out_iput;
8074bb515014d2 Jaegeuk Kim             2016-02-23  512  	}
0c5e36db17f5fe Chao Yu                 2017-10-17  513  out_splice:
28add38d545f44 Gabriel Krisman Bertazi 2024-06-06  514  	if (IS_ENABLED(CONFIG_UNICODE) && !inode && IS_CASEFOLDED(dir)) {
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  515  		/* Eventually we want to call d_add_ci(dentry, NULL)
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  516  		 * for negative dentries in the encoding case as
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  517  		 * well.  For now, prevent the negative dentry
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  518  		 * from being cached.
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  519  		 */
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  520  		trace_f2fs_lookup_end(dir, dentry, ino, err);
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  521  		return NULL;
2c2eb7a300cd7c Daniel Rosenberg        2019-07-23  522  	}
28add38d545f44 Gabriel Krisman Bertazi 2024-06-06  523  
0c5e36db17f5fe Chao Yu                 2017-10-17  524  	new = d_splice_alias(inode, dentry);
cadfc2f9f8c35e Wu Bo                   2023-06-01  525  	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
cadfc2f9f8c35e Wu Bo                   2023-06-01  526  				ino, IS_ERR(new) ? PTR_ERR(new) : err);
0c5e36db17f5fe Chao Yu                 2017-10-17  527  	return new;
0c5e36db17f5fe Chao Yu                 2017-10-17  528  out_iput:
d726732c7ce951 Chao Yu                 2016-03-10  529  	iput(inode);
0c5e36db17f5fe Chao Yu                 2017-10-17  530  out:
0c5e36db17f5fe Chao Yu                 2017-10-17  531  	trace_f2fs_lookup_end(dir, dentry, ino, err);
fcc85a4d86b501 Jaegeuk Kim             2015-04-21  532  	return ERR_PTR(err);
57397d86c62dfe Jaegeuk Kim             2012-11-02  533  }
57397d86c62dfe Jaegeuk Kim             2012-11-02  534  

:::::: The code at line 469 was first introduced by commit
:::::: 8c2b1435b9f48904aaa9401d12b800ca8c4dae05 f2fs: recovery missing dot dentries in root directory

:::::: TO: Liu Xue <liuxueliu.liu@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
