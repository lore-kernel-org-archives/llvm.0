Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED6219E4;
	Fri, 16 Aug 2024 02:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723774299; cv=none; b=oYhlKW4ZfqUcReaQmYNnGQbAqRJFeJx0XNr3dUVkKDxS1fmizffxgAk3V+1JE5tTAA3mwl0sUXeGYJv+xkybY84nELchwU0cOy+D3Q/N33PH0X1/eM8/yMZTQpLobPDYhW+kM6UNby/bXc/xWMToIJ/XCKsfJg15Kf+Df8E5i1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723774299; c=relaxed/simple;
	bh=97DcGFerCZEKJUukiMYNhR9zeP/HeFPpqU8SZnKiHzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PhZzu3gB4DfcfKa33tw0bZgSWNs4xDfQUWAhx+U64cTSLUagVHelsDkIYq8k/mq5bXPWU29mYyo59yxaifO+cjT1cU15a6YoXva1vtd6Bz1uYASaZ7MXte1vnjagNTOSPG9uTReEgB98n/ifp+/9iUOKZshLyoqiQmZTKvDQ2a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMKNNktD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMKNNktD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723774297; x=1755310297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=97DcGFerCZEKJUukiMYNhR9zeP/HeFPpqU8SZnKiHzc=;
  b=VMKNNktDDyM0k09mP4/2eWsgpxA1EuqKZ/h9iYT79LsMECxlLZnAVJl7
   42/oOg4VkPu+b8D18M+fjGm3zGTGUg/UbHj5vIXge+aXEsi516epI21tM
   CvRI+prxmmvlBsgV8lSvml1JA8dGijLJaBStZ+uFxMgMfs2pPoiVb6C3Y
   AYF9XY7eWQbcT9VzR7X1xiSceQTe1sKRba7Zo8SFG/f8DyOH4ckiYlDTB
   b7Q+SFZKQohSqltdl0qJuIY/+ET1ZvOUQZ//P89x2JwLhZMcCbcqih0bt
   WXMGMHF+usdfztwH12nfJs1xrGJ7vN61yfnpYZJBZGDmCECSkj2vWv4IY
   w==;
X-CSE-ConnectionGUID: NT4Ca5FYSwS3n02SwYrAyQ==
X-CSE-MsgGUID: +hlJiqHFSoy5lQfN194yuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21938473"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="21938473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 19:11:36 -0700
X-CSE-ConnectionGUID: 8X/+XEEMRTyvGH+tWbJBRA==
X-CSE-MsgGUID: j0FUQkPhQu232+t+wrMfVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="82737227"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2024 19:11:36 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1semRB-0005rC-1o;
	Fri, 16 Aug 2024 02:11:33 +0000
Date: Fri, 16 Aug 2024 10:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 29/32] fs/namei.c:3265:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202408161001.kPZw71qp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   da853062185ac54cb004d8ca64c0e1267fc2630b
commit: 34826b13bd039382f5cd5b6a9155121ddb65fe08 [29/32] fs: add a "reason" parameter to try_break_deleg
config: arm-randconfig-003-20240816 (https://download.01.org/0day-ci/archive/20240816/202408161001.kPZw71qp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408161001.kPZw71qp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408161001.kPZw71qp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   1 warning and 17 errors generated.


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
