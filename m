Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898412701BB;
	Sat, 16 May 2026 03:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778902998; cv=none; b=M/FeSXAvn9ETh76yJQVno2/m2A+5ND1u/CjtNIwJjibFcxKbS57H1AUEpfl9AJeLDK4+3aZNwFvJd6Ivs+xu7IyEeP/7PSbsrHXreBMJLNoqpJyN73DLYJKNESGes7jEEwtV3dI9gsPdZVQnJu6HNvZoZytlMPRxPK0qiKYs/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778902998; c=relaxed/simple;
	bh=fvG2Gf6R9tHsmZK3Gwgj1hfvVoVJ6rd0ZgC7qzp6AIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lgrmVfxzD6uTFKSsebiZqzWAoA8h3Y4TQHw/Nrl0ih3i66odo84HzFY2u9EyDZ/YbMELN/PSxbxEx3yinKiD3PTgSpoZYyxEI+ZjR54zDd+EMIZf9SpwNZi5xeOvq+Ppez7FME8s+uUO9sBBxwzVqwOiB9NDQRHqdzs2+wmeRkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QToABT+E; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QToABT+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778902996; x=1810438996;
  h=date:from:to:cc:subject:message-id;
  bh=fvG2Gf6R9tHsmZK3Gwgj1hfvVoVJ6rd0ZgC7qzp6AIA=;
  b=QToABT+ExCWNGgXctqPIml5dlE3wmsQgc/SJi2huCPQjOGhg1zQ63cdH
   HN8Olsf/HLMzL/xtXo9MFe7oeoqHdfH6g5UoRmtL3/UJPC4tCpIqvPJsk
   3h2MesSOWUDLwcFmExcPjR5tA+E2fM3TMo6kECiltyCHEPd8Omcxt5IZe
   aRzk+cZbgqg4Uk0OKABWMrDSX2u9AnJ9kzmClD3iHrM6oTM1w7zDWY3Pe
   vs2+2ASBUoTmzvntUnG7gFZLxdrVy4FdQ4m4dZ+jgYGzz+/diYQHY1rWS
   tDIlsjaOXoe9d3Qt87t886hhR+Yr1glHDp76xw2WQo2yDrb/Hkq6ekvwu
   A==;
X-CSE-ConnectionGUID: /Dv690sJS1imvbnOONUkZQ==
X-CSE-MsgGUID: ZUjCfqEmTMu7aGdfAYnIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79750886"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79750886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 20:43:16 -0700
X-CSE-ConnectionGUID: tdwNUvTZQAiLU2PgfUV5UA==
X-CSE-MsgGUID: TB3GN67GR+ODfcHh31B81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="243847760"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2026 20:43:14 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5vj-000000000RN-1lF9;
	Sat, 16 May 2026 03:43:11 +0000
Date: Sat, 16 May 2026 11:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-github:vfs-7.2.directory.delegations 2/8]
 fs/namei.c:4201:31: error: use of undeclared identifier
 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202605161122.wMFet13U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.2.directory.delegations
head:   1e325f7debec9bb22c71bc7336135bf8f87b730a
commit: 24cbf43337f46329ddda5983bc3c585174a020ee [2/8] filelock: add support for ignoring deleg breaks for dir change events
config: i386-buildonly-randconfig-001-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161122.wMFet13U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161122.wMFet13U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161122.wMFet13U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:4201:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4201 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
         |                                      ^
   fs/namei.c:4500:38: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4500 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^
   fs/namei.c:5116:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5116 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:5257:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5257 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
>> fs/namei.c:5362:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5362 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^
   fs/namei.c:5492:33: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5492 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^
   fs/namei.c:5639:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5639 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:5770:32: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5770 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^
>> fs/namei.c:6037:26: error: use of undeclared identifier 'LEASE_BREAK_DIR_RENAME'
    6037 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^
   fs/namei.c:6038:12: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    6038 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^
   fs/namei.c:6043:36: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    6043 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^
   11 errors generated.


vim +/LEASE_BREAK_DIR_CREATE +4201 fs/namei.c

  4168	
  4169	/**
  4170	 * vfs_create - create new file
  4171	 * @idmap:	idmap of the mount the inode was found from
  4172	 * @dentry:	dentry of the child file
  4173	 * @mode:	mode of the child file
  4174	 * @di:		returns parent inode, if the inode is delegated.
  4175	 *
  4176	 * Create a new file.
  4177	 *
  4178	 * If the inode has been found through an idmapped mount the idmap of
  4179	 * the vfsmount must be passed through @idmap. This function will then take
  4180	 * care to map the inode according to @idmap before checking permissions.
  4181	 * On non-idmapped mounts or if permission checking is to be performed on the
  4182	 * raw inode simply pass @nop_mnt_idmap.
  4183	 */
  4184	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4185		       struct delegated_inode *di)
  4186	{
  4187		struct inode *dir = d_inode(dentry->d_parent);
  4188		int error;
  4189	
  4190		error = may_create_dentry(idmap, dir, dentry);
  4191		if (error)
  4192			return error;
  4193	
  4194		if (!dir->i_op->create)
  4195			return -EACCES;	/* shouldn't it be ENOSYS? */
  4196	
  4197		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4198		error = security_inode_create(dir, dentry, mode);
  4199		if (error)
  4200			return error;
> 4201		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4202		if (error)
  4203			return error;
  4204		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4205		if (!error)
  4206			fsnotify_create(dir, dentry);
  4207		return error;
  4208	}
  4209	EXPORT_SYMBOL(vfs_create);
  4210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
