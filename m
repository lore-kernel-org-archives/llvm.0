Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7357CA20;
	Tue,  6 Aug 2024 00:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722902881; cv=none; b=OD5s5R32yMP4/Myv9mQ8k4becSTVpefB4kECma1VplE0x1izl5qJ43CVJVfuISKxo2tk4J7wMc6IoQpztt3OxXYL35Pk27bvGjly/jx54hXdFeAD6JjasOqAfNnuTXDsAFxDFtFk+MFukT4cFqL1FjASlxefzxTUHrSM1kETo4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722902881; c=relaxed/simple;
	bh=thR6OOGr+0F4UYfRH+AD/RbFolIxu2wFlZmTFiqn3Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRF/o4yCfhYTzcha6r9HoLuVtBTiclsQXslJkAmVbOE9/MbsFRp8XhDulHCAI2sDo8hBjPYlLYMuZ6niQ3lsKxqio6gqm2LxZNLtdePfh4dXpm0qC99tK72yAy5lnjHhRys5lNB3QUFDau7MDN4yh/86qweocw2AGyRsbOuOsm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzLF7u5l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzLF7u5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722902880; x=1754438880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thR6OOGr+0F4UYfRH+AD/RbFolIxu2wFlZmTFiqn3Uw=;
  b=GzLF7u5llcw6qHaQEt+EpHd1rzFmOo822pqiG7Gua9Q9b802TuA4bj3u
   0SnaTLBc1m+STf0LMWAeO7ah9sAWpWxKuk/upwQvYn6NNqa7BKDQL/W4J
   +TgEAtxyj7pvMi8y3wNKk1Ih7fdAIhhnMPHXVOULnOkEEmqTQxyKWtcKn
   fKHF2wB5g4LcM0+pu96lG0AfYBrR8CcvIT0PRL8beqJpjteNw3HgWZwqH
   vRqV3He1Hv18KgjIW9/M7sCUXPgTJ7kiZ+jNQpl7tEkwKzSJx4hfIZicX
   4Mqhfl6+idDj7Re0plTiIcRT5hb4OOGFDL9EQttAU3rQhlOiMBaKA9cNN
   g==;
X-CSE-ConnectionGUID: DXTUagQJRguDlROMYe56pA==
X-CSE-MsgGUID: pJcbzgaASgSg9Zmch2TgtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32275414"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="32275414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 17:07:58 -0700
X-CSE-ConnectionGUID: FKbOnLYGQa6Mm9M97UdlQg==
X-CSE-MsgGUID: qZx+ReOGRP6ZmcjJgISOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="61183720"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2024 17:07:57 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb7k2-0003uG-2H;
	Tue, 06 Aug 2024 00:07:54 +0000
Date: Tue, 6 Aug 2024 08:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 29/30] fs/namei.c:3265:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202408060822.O9ARU7V1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   3ef3065a07c0fc797ef9b034216f09d8b324e0b1
commit: 121ae7108b842f3ca7dc5dfd771ae94fe41fcecb [29/30] fs: add a "reason" parameter to try_break_deleg
config: x86_64-buildonly-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408060822.O9ARU7V1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060822.O9ARU7V1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060822.O9ARU7V1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:3265:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    3265 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:3582:38: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    3582 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^
   fs/namei.c:3613:25: error: variable has incomplete type 'struct delegated_inode'
    3613 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4097:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4097 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:4155:25: error: variable has incomplete type 'struct delegated_inode'
    4155 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4240:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4240 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:4278:25: error: variable has incomplete type 'struct delegated_inode'
    4278 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
>> fs/namei.c:4339:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    4339 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^
   fs/namei.c:4389:25: error: variable has incomplete type 'struct delegated_inode'
    4389 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4496:33: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    4496 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^
   fs/namei.c:4538:25: error: variable has incomplete type 'struct delegated_inode'
    4538 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4770:32: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4770 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^
   fs/namei.c:4804:25: error: variable has incomplete type 'struct delegated_inode'
    4804 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
>> fs/namei.c:5039:26: error: use of undeclared identifier 'LEASE_BREAK_DIR_RENAME'
    5039 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^
   fs/namei.c:5040:12: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5040 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^
   fs/namei.c:5045:36: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5045 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^
   fs/namei.c:5107:25: error: variable has incomplete type 'struct delegated_inode'
    5107 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   17 errors generated.


vim +/LEASE_BREAK_DIR_CREATE +3265 fs/namei.c

  3247	
  3248	static int __vfs_create(struct mnt_idmap *idmap, struct inode *dir,
  3249				struct dentry *dentry, umode_t mode, bool want_excl,
  3250				struct delegated_inode *delegated_inode)
  3251	{
  3252		int error;
  3253	
  3254		error = may_create(idmap, dir, dentry);
  3255		if (error)
  3256			return error;
  3257	
  3258		if (!dir->i_op->create)
  3259			return -EACCES;	/* shouldn't it be ENOSYS? */
  3260	
  3261		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  3262		error = security_inode_create(dir, dentry, mode);
  3263		if (error)
  3264			return error;
> 3265		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
  3266		if (error)
  3267			return error;
  3268		error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
  3269		if (!error)
  3270			fsnotify_create(dir, dentry);
  3271		return error;
  3272	}
  3273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
