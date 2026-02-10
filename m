Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E36318BA7;
	Tue, 10 Feb 2026 23:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770767229; cv=none; b=WDpDKINqcw5Obaxco2vVcX3lwW3c3yHni5xpkBvpdc5+PqMOBpvqFtZxkG59bub4KHXaqWcxTJFoQf52hOyrq4ezPeufhUkNUV5L1zgmOfKZ/oiWu8j6ISJ32eYY64c3G7PQ60ES8jH0GpU8cCXhxoVIJXzqm83B2q+pDWZtMaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770767229; c=relaxed/simple;
	bh=j0LddvgoO6VKip0+pj4/pyUdIAr6z9p6l28CtCtXGik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zv0ndf7RKbTWXMBsji0EgripVd5FcP3wGckwO8O5iqQi4RHoJVX27TnaPIjRkcp3jvXIkXRf3ds22hRrMTvVbjZZmCwImtLKA/SVRGf0w3zI/WenuP7D4K4zmyyayMz3VlJ988uIEw4vGlyq9pwDZKun6GtPnTfEvw6JJkiHEDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXIfz4a2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXIfz4a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770767227; x=1802303227;
  h=date:from:to:cc:subject:message-id;
  bh=j0LddvgoO6VKip0+pj4/pyUdIAr6z9p6l28CtCtXGik=;
  b=WXIfz4a2RdyZojzROVZqwY91Yoh05LRZQKbnhNJtj2hiQQ7grR/tUXt+
   stUJUeG7nYrXqczIVdluP4Q0/MKJ6vPZAXQYhVXJZs1P7H28zHZ4rerZ7
   G3atB7OjiTvyucrGomMEm8GO5gSwbZYaHtwNnB3KvOYv5v7ph4QmOhKch
   PmAU8qxvJq1TkrpyBDfGB6ogYcxUeFvkVzL52mZRdbQKJTuQokQsxV3vh
   Dga8zZ3pd4rW7Nrq4hKTAHpsp/NTWGYctNd5bhHkNUW+nXrFEQKsHLdyL
   TkoO8LIIMQxxMo3UMKfS2NZcodxqd2jI4cRu+AMpUd8GUkDHLzLFOvxmK
   Q==;
X-CSE-ConnectionGUID: o5Mg0VEVTM2TNQO7tmWdYg==
X-CSE-MsgGUID: CNgX97p2R/2xYkyewOQuAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71897204"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71897204"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:47:05 -0800
X-CSE-ConnectionGUID: 5Shlde96ThWStv2hgw66yQ==
X-CSE-MsgGUID: 3/hu0X3tSmiGzIO7oSsfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211698694"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2026 15:47:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpxRe-00000000pWA-0y4p;
	Tue, 10 Feb 2026 23:47:02 +0000
Date: Wed, 11 Feb 2026 07:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 2/24] fs/namei.c:4138:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202602110755.IJyM2wQb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   ab82ce180a346bc50223092e6d94b2aa7c863322
commit: 123469bc16f8ab7cebb5b7424e43fece577784b5 [2/24] filelock: add support for ignoring deleg breaks for dir change events
config: arm-randconfig-003-20260211 (https://download.01.org/0day-ci/archive/20260211/202602110755.IJyM2wQb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110755.IJyM2wQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110755.IJyM2wQb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:4138:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4138 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4438:38: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4438 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4993:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4993 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5135:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5135 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> fs/namei.c:5241:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5241 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5372:33: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5372 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5519:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5519 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5651:32: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5651 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
>> fs/namei.c:5921:26: error: use of undeclared identifier 'LEASE_BREAK_DIR_RENAME'
    5921 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5922:12: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5922 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5927:36: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5927 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   11 errors generated.


vim +/LEASE_BREAK_DIR_CREATE +4138 fs/namei.c

  4105	
  4106	/**
  4107	 * vfs_create - create new file
  4108	 * @idmap:	idmap of the mount the inode was found from
  4109	 * @dentry:	dentry of the child file
  4110	 * @mode:	mode of the child file
  4111	 * @di:		returns parent inode, if the inode is delegated.
  4112	 *
  4113	 * Create a new file.
  4114	 *
  4115	 * If the inode has been found through an idmapped mount the idmap of
  4116	 * the vfsmount must be passed through @idmap. This function will then take
  4117	 * care to map the inode according to @idmap before checking permissions.
  4118	 * On non-idmapped mounts or if permission checking is to be performed on the
  4119	 * raw inode simply pass @nop_mnt_idmap.
  4120	 */
  4121	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4122		       struct delegated_inode *di)
  4123	{
  4124		struct inode *dir = d_inode(dentry->d_parent);
  4125		int error;
  4126	
  4127		error = may_create(idmap, dir, dentry);
  4128		if (error)
  4129			return error;
  4130	
  4131		if (!dir->i_op->create)
  4132			return -EACCES;	/* shouldn't it be ENOSYS? */
  4133	
  4134		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4135		error = security_inode_create(dir, dentry, mode);
  4136		if (error)
  4137			return error;
> 4138		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4139		if (error)
  4140			return error;
  4141		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4142		if (!error)
  4143			fsnotify_create(dir, dentry);
  4144		return error;
  4145	}
  4146	EXPORT_SYMBOL(vfs_create);
  4147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
