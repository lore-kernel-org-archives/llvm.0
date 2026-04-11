Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5FD18A93F;
	Sat, 11 Apr 2026 01:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775870874; cv=none; b=XK7BWm33KCX3e8H6hrxcOFbYopDfdP9H9lS9pXe5OY4JsFEtbWDh9PMjHTQCb8rfbgCsJ9igY0969xZIEU3aqEIciei+yZsd5Q8xad0bvM9sQ5weYi9izlLjRfu1WCqBobxJ+fMAqJfwwJTVSTJDZYAaJZsjITijDO74ycCHDOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775870874; c=relaxed/simple;
	bh=xYyvnjgWJmzN7LRwYRVN4c7JQ5YqBX7vIK9zo8tvaKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uGKhMfEbN4bP9ciyGaMRWZvOVFBTu5Dl1LuhgdkG9Y4/+0RpMy75kXZRANZL4MLrwoQBFbrXP1S8ex/y2S2o3f98kZR8KkEUuJzSUHV1bNAuIf4YXKDdu1HvD99zARftZANXWrDRVtjr4UuQQCHG2F+zdm93l+T5YaXMnfdIoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZQ9WbCs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZQ9WbCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775870874; x=1807406874;
  h=date:from:to:cc:subject:message-id;
  bh=xYyvnjgWJmzN7LRwYRVN4c7JQ5YqBX7vIK9zo8tvaKM=;
  b=eZQ9WbCsAMeP3d6kZjh76ZXdqHqOh4gKuMm5mLEcnu0IxLTb4DP8f8jo
   0KryRa9cz+Zu/usKKQmpcY0hPLpmKIywFtgNFwz8Qb+5qtQehMOVPAjOr
   k/L195yhsh7B3MA0eu1TdEGq1f1ZWmv6rE+3qE0JawA1yD+rcs63G2kPh
   c9fGzSt5+8zjv7JJjeAJvOsy2sAFBHzEndQxaCryy4lALDTBWJDP1DWhw
   kWV1H3ZGftsFLPcrB2hDLWJheX2KexzUxyb8xqHg8cgWdU/p/Z15yeHLj
   NSeQ7ettIPQfuCKVRyqzqvYGVcfYebxTSJ/+uEaNIWjRFD0xWjZ3JQ3dy
   Q==;
X-CSE-ConnectionGUID: VbX2j132QjmogJpoLTtauA==
X-CSE-MsgGUID: dhtYN990QZKi5GcoVV2VRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76913026"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76913026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:27:52 -0700
X-CSE-ConnectionGUID: +ifO6Y/WSO2WB4/rXb5OqA==
X-CSE-MsgGUID: aez06bYCQhKWXIv+9MQICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="229514550"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2026 18:27:50 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBN8V-000000000Zl-35sp;
	Sat, 11 Apr 2026 01:27:47 +0000
Date: Sat, 11 Apr 2026 09:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jan Kara <jack@suse.cz>
Subject: [jlayton:dir-deleg 4/27] fs/namei.c:4179:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202604110909.gP0Ck8Ov-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   340042c418d5b1b9287c2cdd19cae0f1c012da40
commit: 9c7ece0d6dc6e427217c4086f7d90e1932a9acad [4/27] filelock: add support for ignoring deleg breaks for dir change events
config: arm-randconfig-003-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110909.gP0Ck8Ov-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110909.gP0Ck8Ov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110909.gP0Ck8Ov-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:4179:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4179 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4478:38: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4478 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5094:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5094 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5235:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5235 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> fs/namei.c:5340:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5340 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5470:33: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5470 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5617:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5617 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5748:32: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5748 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
>> fs/namei.c:6015:26: error: use of undeclared identifier 'LEASE_BREAK_DIR_RENAME'
    6015 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:6016:12: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    6016 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:6021:36: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    6021 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   11 errors generated.


vim +/LEASE_BREAK_DIR_CREATE +4179 fs/namei.c

  4146	
  4147	/**
  4148	 * vfs_create - create new file
  4149	 * @idmap:	idmap of the mount the inode was found from
  4150	 * @dentry:	dentry of the child file
  4151	 * @mode:	mode of the child file
  4152	 * @di:		returns parent inode, if the inode is delegated.
  4153	 *
  4154	 * Create a new file.
  4155	 *
  4156	 * If the inode has been found through an idmapped mount the idmap of
  4157	 * the vfsmount must be passed through @idmap. This function will then take
  4158	 * care to map the inode according to @idmap before checking permissions.
  4159	 * On non-idmapped mounts or if permission checking is to be performed on the
  4160	 * raw inode simply pass @nop_mnt_idmap.
  4161	 */
  4162	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4163		       struct delegated_inode *di)
  4164	{
  4165		struct inode *dir = d_inode(dentry->d_parent);
  4166		int error;
  4167	
  4168		error = may_create_dentry(idmap, dir, dentry);
  4169		if (error)
  4170			return error;
  4171	
  4172		if (!dir->i_op->create)
  4173			return -EACCES;	/* shouldn't it be ENOSYS? */
  4174	
  4175		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4176		error = security_inode_create(dir, dentry, mode);
  4177		if (error)
  4178			return error;
> 4179		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4180		if (error)
  4181			return error;
  4182		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4183		if (!error)
  4184			fsnotify_create(dir, dentry);
  4185		return error;
  4186	}
  4187	EXPORT_SYMBOL(vfs_create);
  4188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
