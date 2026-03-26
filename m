Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E61922FD;
	Thu, 26 Mar 2026 04:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774497784; cv=none; b=fMTk6kPApSvUXBNkOfE2hptgiNVlslskpY5DiAIOw+j+VEZIifeUKT6avmYkfRcCzu9ZJGQbjuRUu5P+2g9Mz+HBO0MyuqokJX87YcQQtjoIGQ4kuyb8mcn9vAK8Oo3Zq6YJtKZCHeYN+Et/7MOVlNOqayv6gHSYFwo4UC9+DkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774497784; c=relaxed/simple;
	bh=IuuEEyWJNDW0imqIl9qXGhUhxnaLcaHZrqucTzs12ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DKUw16nEDj3mXvkp7nU7oKZS65jgvSroMtN+diONtuet1D95Rr/5C3BJwAwwZNzCjnhPJE9cEsV8A8Y1PueXwlFLz0HxqbgJUGek8P5esxEdNu+fLPKvbWILaLKrR3gW9KnkMez8Lz818RRmk+ewkH1v88EckZkUdmUltqJnwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPJh5GOo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPJh5GOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774497782; x=1806033782;
  h=date:from:to:cc:subject:message-id;
  bh=IuuEEyWJNDW0imqIl9qXGhUhxnaLcaHZrqucTzs12ho=;
  b=bPJh5GOo3BEfl3cbgFdI4PLcPJDQguecMgB8vFelqYXT6oKCvZC1Czgp
   O7oIjOzufXmwlbXVqFz38mA4k62M3wYUO9EzxdllkXDVFQ1YrxziVUaBr
   zDBN7bJmxCVRkMqn5FWM1+3I4Vr+2/YMuzbZ+/uM1EaPUzHhD67+VZKmK
   jx9uVWMVqj+2Q3S3hixWtFSQHZXf10wM4keLxraCVASvNWQGGPC4EkIAO
   lPg4Tr0dL3CPYJ4ku1bgM+1+cKX+4vZ6a5AGWwongaQ3hOMsqsNXkrkrz
   I0TaNqnz6i+Ym1WdsA1L0n++PMQt0mql4tuEScWHVFo3KSNENcnNoDKHy
   w==;
X-CSE-ConnectionGUID: ckL6vdtjQyKFQ+mVUX2/Hg==
X-CSE-MsgGUID: tjWdxfmSQ0eF+nhGYheSjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86923493"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="86923493"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 21:03:02 -0700
X-CSE-ConnectionGUID: rKxtnDyVQUK2YEnwCusrGQ==
X-CSE-MsgGUID: m8r38287RcGy+HrIq50DDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224903812"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2026 21:03:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bvt-0000000088l-3gkc;
	Thu, 26 Mar 2026 04:02:57 +0000
Date: Thu, 26 Mar 2026 12:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 4/26] fs/namei.c:4173:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202603261133.R0SpGbfl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   996759a25534ab4a7e986fe0153659e93c1611ec
commit: e7730a146d19c905b78c9c16be3d172b194ab963 [4/26] filelock: add support for ignoring deleg breaks for dir change events
config: i386-buildonly-randconfig-004-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261133.R0SpGbfl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261133.R0SpGbfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261133.R0SpGbfl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:4173:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4173 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
         |                                      ^
   fs/namei.c:4472:38: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4472 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^
   fs/namei.c:5088:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5088 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:5229:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5229 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
>> fs/namei.c:5334:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5334 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^
   fs/namei.c:5464:33: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5464 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^
   fs/namei.c:5611:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5611 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:5742:32: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5742 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^
>> fs/namei.c:6009:26: error: use of undeclared identifier 'LEASE_BREAK_DIR_RENAME'
    6009 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^
   fs/namei.c:6010:12: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    6010 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^
   fs/namei.c:6015:36: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    6015 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^
   11 errors generated.


vim +/LEASE_BREAK_DIR_CREATE +4173 fs/namei.c

  4140	
  4141	/**
  4142	 * vfs_create - create new file
  4143	 * @idmap:	idmap of the mount the inode was found from
  4144	 * @dentry:	dentry of the child file
  4145	 * @mode:	mode of the child file
  4146	 * @di:		returns parent inode, if the inode is delegated.
  4147	 *
  4148	 * Create a new file.
  4149	 *
  4150	 * If the inode has been found through an idmapped mount the idmap of
  4151	 * the vfsmount must be passed through @idmap. This function will then take
  4152	 * care to map the inode according to @idmap before checking permissions.
  4153	 * On non-idmapped mounts or if permission checking is to be performed on the
  4154	 * raw inode simply pass @nop_mnt_idmap.
  4155	 */
  4156	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4157		       struct delegated_inode *di)
  4158	{
  4159		struct inode *dir = d_inode(dentry->d_parent);
  4160		int error;
  4161	
  4162		error = may_create_dentry(idmap, dir, dentry);
  4163		if (error)
  4164			return error;
  4165	
  4166		if (!dir->i_op->create)
  4167			return -EACCES;	/* shouldn't it be ENOSYS? */
  4168	
  4169		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4170		error = security_inode_create(dir, dentry, mode);
  4171		if (error)
  4172			return error;
> 4173		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4174		if (error)
  4175			return error;
  4176		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4177		if (!error)
  4178			fsnotify_create(dir, dentry);
  4179		return error;
  4180	}
  4181	EXPORT_SYMBOL(vfs_create);
  4182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
