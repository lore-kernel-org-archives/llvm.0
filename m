Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7C62FFDCA;
	Wed,  5 Nov 2025 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762339677; cv=none; b=I1txDFs0qSY5Paad1RDvRsTn0+U0a9eRnr/0aohqV/T1dvMbj0EbCbQe0SSGmTK5x03DEIoh4QDezOasLJStRYw+w+aJalSsXb1+LoZju20O9jZhuIr0H/Ta6BTPjT7qlTgKsmXP0oyi62dharvuXtROGJN5+Pn8Z28MBRys9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762339677; c=relaxed/simple;
	bh=WyATbUgEbs5xcdkjlTCRvokh+NJKSchpk0yo2pp95s4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fClQcXY5Fvx66dBmEHxBD/gULfXYdVsEyIhvga1YdNqkJ0Gxheh/u/w/XFKHxRtxMZIzA7L0jY1qCH7UMTysZJjj+eT5eZjSm35gUbGc2YU2evIkzLVMrGWe/ExVmrJsBbQ9sb+clOyWYCVpp46acuPodCBR9CA1ap458IGLdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+1yfLTW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+1yfLTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762339675; x=1793875675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WyATbUgEbs5xcdkjlTCRvokh+NJKSchpk0yo2pp95s4=;
  b=A+1yfLTWSiWNQisCDz7HlhgbfjG2bj7+ayJwQs0/dcOHOPOK+FRAcdWm
   5bcyTIK9Y4Xla8ylS6/guVebth588/AT4KMYFo4QJXqgJ3dj97/bPCyxA
   i9MalTVGHRhxBRkgBdytf9oN2TZsMvjbpu2/Q0IvlJd3kenhzjkEYG2VJ
   o1N6fcJliWG7b9u3IkTENMdt3uV0nIeBkrti3rz7Euqj1X90tdwI1XZVl
   e6JOp2UW7w5Zqmq5jkZ/JRI7gXapW0aNFQtBBiSoH5vFH11Z01Ok9n+Tq
   I4YKWPju/+ZKpCpilkBkYk14BPDOq3tBhVHgiVFZs2nfnNxcvv5xOljK4
   Q==;
X-CSE-ConnectionGUID: UfKmZJeCSey5oOEa+Tx98A==
X-CSE-MsgGUID: Xb5gPS4lQtiwJK2kBI2z0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81852950"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="81852950"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:47:55 -0800
X-CSE-ConnectionGUID: WTt62aMlSiOk6K4WCj64tg==
X-CSE-MsgGUID: RLUu+ANLRwePluF4+CcGlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187874407"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 02:47:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGb3P-000SRY-1B;
	Wed, 05 Nov 2025 10:47:51 +0000
Date: Wed, 5 Nov 2025 18:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 10/11] fs/super.c:392:5: error: no member
 named 's_min_writeback_pages' in 'struct super_block'
Message-ID: <202511051853.jM0A4ftr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   0b843ef6ec4fae983bb106b2bfaae0481831d4be
commit: 3a8d78a1d066e50eadac1ac7ca8284a9867b8d8e [10/11] Merge branch 'vfs-6.19.fs_header' into vfs.all
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511051853.jM0A4ftr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051853.jM0A4ftr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051853.jM0A4ftr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/super.c:392:5: error: no member named 's_min_writeback_pages' in 'struct super_block'
     392 |         s->s_min_writeback_pages = MIN_WRITEBACK_PAGES;
         |         ~  ^
   1 error generated.
--
>> fs/fs-writeback.c:1915:32: error: no member named 's_min_writeback_pages' in 'struct super_block'
    1915 |         return round_down(pages + sb->s_min_writeback_pages,
         |                                   ~~  ^
>> fs/fs-writeback.c:1915:32: error: no member named 's_min_writeback_pages' in 'struct super_block'
    1915 |         return round_down(pages + sb->s_min_writeback_pages,
         |                                   ~~  ^
   fs/fs-writeback.c:1916:8: error: no member named 's_min_writeback_pages' in 'struct super_block'
    1916 |                         sb->s_min_writeback_pages);
         |                         ~~  ^
   3 errors generated.


vim +392 fs/super.c

5accdf82ba25ca Jan Kara              2012-06-12  306  
^1da177e4c3f41 Linus Torvalds        2005-04-16  307  /**
^1da177e4c3f41 Linus Torvalds        2005-04-16  308   *	alloc_super	-	create new superblock
fe2bbc4832659b Henrik Kretzschmar    2006-09-06  309   *	@type:	filesystem type superblock should belong to
9249e17fe094d8 David Howells         2012-06-25  310   *	@flags: the mount flags
6e4eab577a0cae Eric W. Biederman     2016-05-24  311   *	@user_ns: User namespace for the super_block
^1da177e4c3f41 Linus Torvalds        2005-04-16  312   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  313   *	Allocates and initializes a new &struct super_block.  alloc_super()
^1da177e4c3f41 Linus Torvalds        2005-04-16  314   *	returns a pointer new superblock or %NULL if allocation had failed.
^1da177e4c3f41 Linus Torvalds        2005-04-16  315   */
6e4eab577a0cae Eric W. Biederman     2016-05-24  316  static struct super_block *alloc_super(struct file_system_type *type, int flags,
6e4eab577a0cae Eric W. Biederman     2016-05-24  317  				       struct user_namespace *user_ns)
^1da177e4c3f41 Linus Torvalds        2005-04-16  318  {
2b46a19db0a176 Alexander Mikhalitsyn 2023-12-08  319  	struct super_block *s = kzalloc(sizeof(struct super_block), GFP_KERNEL);
b87221de6a4934 Alexey Dobriyan       2009-09-21  320  	static const struct super_operations default_op;
7eb5e8826911f2 Al Viro               2013-10-01  321  	int i;
7eb5e8826911f2 Al Viro               2013-10-01  322  
7eb5e8826911f2 Al Viro               2013-10-01  323  	if (!s)
7eb5e8826911f2 Al Viro               2013-10-01  324  		return NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  325  
6e4eab577a0cae Eric W. Biederman     2016-05-24  326  	s->s_user_ns = get_user_ns(user_ns);
ca0168e8a77cf8 Al Viro               2017-12-05  327  	init_rwsem(&s->s_umount);
ca0168e8a77cf8 Al Viro               2017-12-05  328  	lockdep_set_class(&s->s_umount, &type->s_umount_key);
ca0168e8a77cf8 Al Viro               2017-12-05  329  	/*
ca0168e8a77cf8 Al Viro               2017-12-05  330  	 * sget() can have s_umount recursion.
ca0168e8a77cf8 Al Viro               2017-12-05  331  	 *
ca0168e8a77cf8 Al Viro               2017-12-05  332  	 * When it cannot find a suitable sb, it allocates a new
ca0168e8a77cf8 Al Viro               2017-12-05  333  	 * one (this one), and tries again to find a suitable old
ca0168e8a77cf8 Al Viro               2017-12-05  334  	 * one.
ca0168e8a77cf8 Al Viro               2017-12-05  335  	 *
ca0168e8a77cf8 Al Viro               2017-12-05  336  	 * In case that succeeds, it will acquire the s_umount
ca0168e8a77cf8 Al Viro               2017-12-05  337  	 * lock of the old one. Since these are clearly distrinct
ca0168e8a77cf8 Al Viro               2017-12-05  338  	 * locks, and this object isn't exposed yet, there's no
ca0168e8a77cf8 Al Viro               2017-12-05  339  	 * risk of deadlocks.
ca0168e8a77cf8 Al Viro               2017-12-05  340  	 *
ca0168e8a77cf8 Al Viro               2017-12-05  341  	 * Annotate this by putting this lock in a different
ca0168e8a77cf8 Al Viro               2017-12-05  342  	 * subclass.
ca0168e8a77cf8 Al Viro               2017-12-05  343  	 */
ca0168e8a77cf8 Al Viro               2017-12-05  344  	down_write_nested(&s->s_umount, SINGLE_DEPTH_NESTING);
b5bd856a0c2a63 Vladimir Davydov      2014-01-21  345  
7b7a8665edd8db Christoph Hellwig     2013-09-04  346  	if (security_sb_alloc(s))
7eb5e8826911f2 Al Viro               2013-10-01  347  		goto fail;
7b7a8665edd8db Christoph Hellwig     2013-09-04  348  
7eb5e8826911f2 Al Viro               2013-10-01  349  	for (i = 0; i < SB_FREEZE_LEVELS; i++) {
8129ed29644bf5 Oleg Nesterov         2015-08-11  350  		if (__percpu_init_rwsem(&s->s_writers.rw_sem[i],
8129ed29644bf5 Oleg Nesterov         2015-08-11  351  					sb_writers_name[i],
8129ed29644bf5 Oleg Nesterov         2015-08-11  352  					&type->s_writers_key[i]))
7eb5e8826911f2 Al Viro               2013-10-01  353  			goto fail;
7eb5e8826911f2 Al Viro               2013-10-01  354  	}
df0ce26cb4ee8b Christoph Hellwig     2015-01-14  355  	s->s_bdi = &noop_backing_dev_info;
9249e17fe094d8 David Howells         2012-06-25  356  	s->s_flags = flags;
cc50a07a247e17 Eric W. Biederman     2016-06-09  357  	if (s->s_user_ns != &init_user_ns)
67690f937c38bb Eric W. Biederman     2016-05-18  358  		s->s_iflags |= SB_I_NODEV;
a5166169f9b920 Al Viro               2011-12-12  359  	INIT_HLIST_NODE(&s->s_instances);
f1ee616214cb22 NeilBrown             2017-12-21  360  	INIT_HLIST_BL_HEAD(&s->s_roots);
e97fedb9ef9868 Dave Chinner          2015-03-04  361  	mutex_init(&s->s_sync_lock);
^1da177e4c3f41 Linus Torvalds        2005-04-16  362  	INIT_LIST_HEAD(&s->s_inodes);
74278da9f70d84 Dave Chinner          2015-03-04  363  	spin_lock_init(&s->s_inode_list_lock);
6c60d2b5746cf2 Dave Chinner          2016-07-26  364  	INIT_LIST_HEAD(&s->s_inodes_wb);
6c60d2b5746cf2 Dave Chinner          2016-07-26  365  	spin_lock_init(&s->s_inode_wblist_lock);
5ca302c8e502ca Glauber Costa         2013-08-28  366  
b20bd1a5e78af2 Al Viro               2010-03-22  367  	s->s_count = 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  368  	atomic_set(&s->s_active, 1);
a11f3a0574a573 Arjan van de Ven      2006-03-23  369  	mutex_init(&s->s_vfs_rename_mutex);
51ee049e771c14 Roland Dreier         2010-04-27  370  	lockdep_set_class(&s->s_vfs_rename_mutex, &type->s_vfs_rename_key);
bc8230ee8e2ba9 Jan Kara              2017-06-08  371  	init_rwsem(&s->s_dquot.dqio_sem);
^1da177e4c3f41 Linus Torvalds        2005-04-16  372  	s->s_maxbytes = MAX_NON_LFS;
^1da177e4c3f41 Linus Torvalds        2005-04-16  373  	s->s_op = &default_op;
^1da177e4c3f41 Linus Torvalds        2005-04-16  374  	s->s_time_gran = 1000000000;
188d20bcd1ebd8 Deepa Dinamani        2018-01-21  375  	s->s_time_min = TIME64_MIN;
188d20bcd1ebd8 Deepa Dinamani        2018-01-21  376  	s->s_time_max = TIME64_MAX;
b0d40c92adafde Dave Chinner          2011-07-08  377  
1720f5dd8d3af3 Qi Zheng              2023-09-11  378  	s->s_shrink = shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
1720f5dd8d3af3 Qi Zheng              2023-09-11  379  				     "sb-%s", type->name);
1720f5dd8d3af3 Qi Zheng              2023-09-11  380  	if (!s->s_shrink)
8e04944f0ea8b8 Tetsuo Handa          2018-04-04  381  		goto fail;
1720f5dd8d3af3 Qi Zheng              2023-09-11  382  
1720f5dd8d3af3 Qi Zheng              2023-09-11  383  	s->s_shrink->scan_objects = super_cache_scan;
1720f5dd8d3af3 Qi Zheng              2023-09-11  384  	s->s_shrink->count_objects = super_cache_count;
1720f5dd8d3af3 Qi Zheng              2023-09-11  385  	s->s_shrink->batch = 1024;
1720f5dd8d3af3 Qi Zheng              2023-09-11  386  	s->s_shrink->private_data = s;
1720f5dd8d3af3 Qi Zheng              2023-09-11  387  
1720f5dd8d3af3 Qi Zheng              2023-09-11  388  	if (list_lru_init_memcg(&s->s_dentry_lru, s->s_shrink))
2b3648a6ff83bd Kirill Tkhai          2018-08-17  389  		goto fail;
1720f5dd8d3af3 Qi Zheng              2023-09-11  390  	if (list_lru_init_memcg(&s->s_inode_lru, s->s_shrink))
2b3648a6ff83bd Kirill Tkhai          2018-08-17  391  		goto fail;
90db4d4441f58d Christoph Hellwig     2025-10-17 @392  	s->s_min_writeback_pages = MIN_WRITEBACK_PAGES;
^1da177e4c3f41 Linus Torvalds        2005-04-16  393  	return s;
5ca302c8e502ca Glauber Costa         2013-08-28  394  
7eb5e8826911f2 Al Viro               2013-10-01  395  fail:
0200894d11551a Al Viro               2017-10-11  396  	destroy_unused_super(s);
7eb5e8826911f2 Al Viro               2013-10-01  397  	return NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  398  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  399  

:::::: The code at line 392 was first introduced by commit
:::::: 90db4d4441f58d433ecf74f7e3bd17e0a553c20c writeback: allow the file system to override MIN_WRITEBACK_PAGES

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
