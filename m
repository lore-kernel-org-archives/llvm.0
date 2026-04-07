Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E85374170;
	Tue,  7 Apr 2026 04:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534683; cv=none; b=cd//Eald4tn+0XEGOeIcT+JFnmBzwQlw19Q75qWKZJsKpYleyoVVwKEL+mA1ek1Vd8j+iNzKwDq8rPT0CmqGxRq/P8sm8fuUrML5DLleNaA9xsh/T9uI0duBisZIormhyhnOygkJpQsJI04HF3mEbyzX1IbPrTCkLoc+imYRgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534683; c=relaxed/simple;
	bh=xO/Rk3YZ1Xz2//xBVTNEIxCH8LcFtvV76leECoMGjGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VtvYcsRulf5lBouaKAYRxox69vx1Z2Z2x2wdBl0A7JlSQAhl80yjhLu1Xhs99tPaUn+nWAYhMTY5HijC9qFvk6dd0FrfACT8pMSi9M7HzFMT3gFo4exJfXdVNst8lWOY6thIFC6UuhgxcT9T7AjQhyrUgMtxdBlI4Swc3vmHqaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHxhX28Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHxhX28Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534681; x=1807070681;
  h=date:from:to:cc:subject:message-id;
  bh=xO/Rk3YZ1Xz2//xBVTNEIxCH8LcFtvV76leECoMGjGw=;
  b=IHxhX28YTFOTWbLUf9LXVjbzHZEm/NJMshv9aPAd/WKEqLoxGWXDousa
   6qmhSXyg1Tpk74CYGRVJC6Oab0P6K6eO6pP7Z4X4yDOEqdyZjP017V86O
   R9pua5lqeaB5qrC33oouchhRZiyBbRslutvU/TkVLlXVmYTNe0mrggkM4
   6m4fNktwVbG4whij/nnOicQ+qlZoL8QRqlgh+2Shmf31uJudHN8w1CN+T
   wBFz0ZCVWtktkLVg7HPk3xXUbWSlYcNaMoFoj1gs0FZewlw+PhEr1Xggj
   TfLk2xbHNoQ+cZ8LQ5WMtVbDmFuP4sOVRjkrgAR1P2fYexm7UYk+imuI9
   w==;
X-CSE-ConnectionGUID: old7+jHbSZy6n0h15LlESw==
X-CSE-MsgGUID: dVnfFvoGSF2rTmaKcENxCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87193705"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87193705"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:04:38 -0700
X-CSE-ConnectionGUID: o0X8ymqaTGO2Vnj6Ki8JBQ==
X-CSE-MsgGUID: jWoTY36/Qf2vh8gDkteqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="228319732"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2026 21:04:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xg2-0000000009P-10Kz;
	Tue, 07 Apr 2026 04:04:34 +0000
Date: Tue, 07 Apr 2026 12:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 4/27] fs/namei.c:4173:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202604071143.P8NeOS1a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   4c7561ebe642f97bf42406cdbbda294c0b7b4a63
commit: 6c5b0d9e45361e997bfb76a078bc1013a04ac0b3 [4/27] filelock: add support for ignoring deleg breaks for dir change events
config: s390-randconfig-002-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071143.P8NeOS1a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071143.P8NeOS1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071143.P8NeOS1a-lkp@intel.com/

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
