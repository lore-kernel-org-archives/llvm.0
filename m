Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5B3D64;
	Fri, 11 Oct 2024 02:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614931; cv=none; b=eAfGfhIZYIBlM1xvVhEnedORS6Y0nTW3AWalwjKbAqz86cBwSDukCxnnfmmr//KnodUlAfCXAEoZf98SyCpXPaCOxn38Zk6M+ZsX+GIwHzy+DrP1o3BOvNGo6Wu3c2ge7IEXfQyA1VKEDG8gJpQ9sUDJ0Dc4IKe9JaRh+aUtCc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614931; c=relaxed/simple;
	bh=4/Oz2VPpHBFcZj5de13qgjiFEEnmrWQYG/R8YNP9kq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXZBLiVC/bbQh3BUDN+nOzSG0i1drb/6Bhb5GWFvIQazNboYQqE5YbjcIzqFpb03+NS/7rLeiIArd0i7S8xzyNKPGf98nqChVW33BwP2GgxdAbov83+7caY1NlPuw6R6G9sI4LLvKHbPEcd3/xqwYhnQMcMMzn0HXRP7W0Sbl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxKpCyk0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxKpCyk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728614929; x=1760150929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/Oz2VPpHBFcZj5de13qgjiFEEnmrWQYG/R8YNP9kq4=;
  b=XxKpCyk0btFaWj3Tgsbdpp96Ft+dNAdW0AzSELghs9gAHx8Oiwd3G+ZL
   95OYR1qYkUKEcEW2f4wZvAbfYbkRFjXiLTo9kW01SoPJ9OhftQLx/L3pR
   PTixB/t2KgBCneYPWCFIPqquFP5MeKUqiVopoHAUspQh1IrZQHdBCOACD
   Rt9cLaT79/8EC+m9DlIcPbHVInN9nFmC4fQqy+Qdv+WLRO33ow8x2zZLn
   cV3EV8kVZb3Wfe6NZSkmVOCPlSBxukItdi+cEjRXpw9f7ZDz14tuXCVxO
   X9b5ABKaUj6abvWj23k0oe6uURR1+cufYgxdgvPnXGinYLNMLXfDBxWRZ
   w==;
X-CSE-ConnectionGUID: 0MUhJg8WTTyyfSe5btM/rQ==
X-CSE-MsgGUID: PzqkaHbLR4+uNMqzKmICZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="45518793"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="45518793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 19:48:49 -0700
X-CSE-ConnectionGUID: JqNfMz6pTuSwNoWw14oubA==
X-CSE-MsgGUID: 9GyxNOEpRmqNNdSjkh5LYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76783056"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2024 19:48:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz5ht-000BeJ-2q;
	Fri, 11 Oct 2024 02:48:45 +0000
Date: Fri, 11 Oct 2024 10:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 32/35] fs/namei.c:3279:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202410111043.5k0K9SJH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   b91bc932b468b4c460faef8759fbae5a75b2ab5c
commit: 65bf014be263dadeb74c9d0f75333ae09b373f8b [32/35] fs: add a "reason" parameter to try_break_deleg
config: i386-buildonly-randconfig-001-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111043.5k0K9SJH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111043.5k0K9SJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111043.5k0K9SJH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:3279:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    3279 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:3599:38: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    3599 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^
   fs/namei.c:3666:25: error: variable has incomplete type 'struct delegated_inode'
    3666 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4144:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4144 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:4202:25: error: variable has incomplete type 'struct delegated_inode'
    4202 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4287:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4287 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^
   fs/namei.c:4325:25: error: variable has incomplete type 'struct delegated_inode'
    4325 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
>> fs/namei.c:4386:31: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    4386 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^
   fs/namei.c:4436:25: error: variable has incomplete type 'struct delegated_inode'
    4436 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4543:33: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    4543 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^
   fs/namei.c:4585:25: error: variable has incomplete type 'struct delegated_inode'
    4585 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4817:32: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    4817 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^
   fs/namei.c:4851:25: error: variable has incomplete type 'struct delegated_inode'
    4851 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
>> fs/namei.c:5086:26: error: use of undeclared identifier 'LEASE_BREAK_DIR_RENAME'
    5086 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^
   fs/namei.c:5087:12: error: use of undeclared identifier 'LEASE_BREAK_DIR_DELETE'
    5087 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^
   fs/namei.c:5092:36: error: use of undeclared identifier 'LEASE_BREAK_DIR_CREATE'
    5092 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^
   fs/namei.c:5154:25: error: variable has incomplete type 'struct delegated_inode'
    5154 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   17 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/LEASE_BREAK_DIR_CREATE +3279 fs/namei.c

  3261	
  3262	static int __vfs_create(struct mnt_idmap *idmap, struct inode *dir,
  3263				struct dentry *dentry, umode_t mode, bool want_excl,
  3264				struct delegated_inode *delegated_inode)
  3265	{
  3266		int error;
  3267	
  3268		error = may_create(idmap, dir, dentry);
  3269		if (error)
  3270			return error;
  3271	
  3272		if (!dir->i_op->create)
  3273			return -EACCES;	/* shouldn't it be ENOSYS? */
  3274	
  3275		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  3276		error = security_inode_create(dir, dentry, mode);
  3277		if (error)
  3278			return error;
> 3279		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
  3280		if (error)
  3281			return error;
  3282		error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
  3283		if (!error)
  3284			fsnotify_create(dir, dentry);
  3285		return error;
  3286	}
  3287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
