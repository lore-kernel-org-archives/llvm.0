Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E93D7082A;
	Sun,  3 Nov 2024 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730675341; cv=none; b=VKtm0zThIp5jkPTH3Ad6FwYfu7wK1uDB36+p1TnuvlGgR17rqWyBeBOm3brWd/zqVvOww9cvfO2wplWSFygrARRayIo4c6EIu+5BmDP9ytFHVAdvt9SB80kry5SHhKn9zDcvJa8mimbm641qR54Hawcy0uT7SCZVMCx1X0zn3b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730675341; c=relaxed/simple;
	bh=crm/QIDyI3SOwwf2rxiPmdFgzY2cX7ykwgcqLsbgRfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IjLlEmmnOwRNfbPDH10SZrKx2YYCZVaBQN997CCPDpZbR2dP7PzYtGFFy9jWELJkIMXnrKhaK0ByJ5S8renalP7RmxSg4Tnp0LNBKw0R1EJB2HPWzKx4k4mkWPRemqAe/zcQOPPUjw51FDaD2c9f+8LQFsysyGmzfmnMkfNg0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONa31SDW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONa31SDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730675339; x=1762211339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crm/QIDyI3SOwwf2rxiPmdFgzY2cX7ykwgcqLsbgRfs=;
  b=ONa31SDWX8M5oDK0OTRPJZAKlPCQujmgEd2yOCZ0+sdhfZ6BgJyti47X
   kX73eHu9kgqMeKSa7lfauRa3flnS/34ClqAQ3m8r8Z/NV4/EDI3ZTWw15
   JYnpxIHn8YUlr5graRcgvzQ0XYMd8PF/FX5fGyT8wL5lSMphwrMzb372t
   FGAaTpdgY11lli5nZK0C5M2u5reLL3HUn3xrFPmUWECSQKXryhiSvZ5fk
   F8Fj4JpOzHPdxZEZTAhaA83PPAKNS7qnP4fvLctDrq5rVg7O1mPTintUV
   sbZI/yOg9ijIEWEfTINomeUXMXGaZwOemLeZcV9WHuqSLKXNhEL1CfeBS
   g==;
X-CSE-ConnectionGUID: RCZpwI7WQ26qEIkfoDJkLg==
X-CSE-MsgGUID: IrMR2Ax7R1GYXIRtabRmEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="47863232"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="47863232"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 15:08:58 -0800
X-CSE-ConnectionGUID: Ur1Zp7IiSZeQkQDtGg/KuQ==
X-CSE-MsgGUID: pLydNDSKRRKZujw9P5yU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88302210"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Nov 2024 15:08:57 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7jiJ-000kH3-00;
	Sun, 03 Nov 2024 23:08:55 +0000
Date: Mon, 4 Nov 2024 07:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 32/42] fs/namei.c:3279:31: error: use of
 undeclared identifier 'LEASE_BREAK_DIR_CREATE'
Message-ID: <202411040722.7Y57ubXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   7c5f52902153bdf6d59451262c63a5dc54c66f01
commit: 9a34820ca26623411877c1af5a4d81f5c00c0ed5 [32/42] fs: add a "reason" parameter to try_break_deleg
config: i386-buildonly-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411040722.7Y57ubXt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040722.7Y57ubXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040722.7Y57ubXt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings and 17 errors generated.


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
