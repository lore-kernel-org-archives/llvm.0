Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F462E7378;
	Fri, 29 May 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070921; cv=none; b=pLl8jI1yJnGgQJbWOmUNbUOATzKyI3xQqz8BxxlxqsGy/ITAnV794p34G0ZHvfG5kXYH3nVGXl5iZDY9/f+tgHekrx2kmOCIY4ceHj6IR67DIG01GmRTE3tCe0U2iUdFvkf3B+jn7s/8emnhlXXpd+Wy7jDAcVVLOxhZGDLqArE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070921; c=relaxed/simple;
	bh=FPIDO8Th/9W+Bs1Y2HZTcoisymwgATSC3kpjj0NlJDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KwM1fYf04eqXSbNfwJkeNLn5lRwqDOsnIdPSkn0Z44comcQE3dE+IQV9B07er+K9HdwKriRe8y11JhiJDP0oJidRC+0Kov7KkOQ8RZAqou+W77GhS/23XGrwnqi7sq/lpsv5UBgnsORan2Uw2E3mcGlhYXXCgk+SPk0msdpyN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hd2H+TzH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hd2H+TzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780070920; x=1811606920;
  h=date:from:to:cc:subject:message-id;
  bh=FPIDO8Th/9W+Bs1Y2HZTcoisymwgATSC3kpjj0NlJDU=;
  b=Hd2H+TzHmJu2qRvwUWzHse/AwVfZsVJGy0HD5XtTfFQPwFzzfnWP5Syr
   kdR/P7TOQ2iYN6q3VwsDD5MG4uEghJPjsPVUqgCqVWQjLHHqrufcrWe0g
   gyaOv897UKjNeNlaDVnU/q6y/tDm5F5/QYUI5XtUpUrrkhaBjTXoOnrpH
   QKHSnaWzOW5HkFLP0x2lSnxUfsVNLR0A2+a5bLkpArdso9O9bWVQQdV54
   qrR5x9rT4oaI4OOKfmVycS4lH/hMu6s4DNg3dVnb627YtLR65VpjI+qyr
   A4ud2RMNSyZAjcdmpNJN1iBVnPqtoc1fy9RokkOCf0xyztIEJFJfj2YzT
   g==;
X-CSE-ConnectionGUID: S4ABi1aTSQ++4Q9YxheYLQ==
X-CSE-MsgGUID: 3fWrursxSLaRXUCumZ+X6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81109588"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="81109588"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 09:08:40 -0700
X-CSE-ConnectionGUID: 2HFK82PeQtu7lhJt8ez2AA==
X-CSE-MsgGUID: zjtlVkrbQJ2QSsnl/Y/yUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="246897299"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2026 09:08:37 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSzlD-000000000ub-1wWL;
	Fri, 29 May 2026 16:08:35 +0000
Date: Fri, 29 May 2026 18:08:20 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 27/29]
 fs/configfs/mount.c:256:6: warning: variable 'dentry' is used uninitialized
 whenever 'if' condition is false
Message-ID: <202605291802.UGY3xPFG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   964d695bfb8ffb92899c77a55c4920fdb3d79e7b
commit: 2d39db5facb268ddbb34f11f3a28f5518ab5cf84 [27/29] fs/configfs: rework configfs_pin_fs()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260529/202605291802.UGY3xPFG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291802.UGY3xPFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291802.UGY3xPFG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/configfs/mount.c:256:6: warning: variable 'dentry' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     256 |         if (!info->mnt) {
         |             ^~~~~~~~~~
   fs/configfs/mount.c:267:9: note: uninitialized use occurs here
     267 |         return dentry;
         |                ^~~~~~
   fs/configfs/mount.c:256:2: note: remove the 'if' if its condition is always true
     256 |         if (!info->mnt) {
         |         ^~~~~~~~~~~~~~~
   fs/configfs/mount.c:240:23: note: initialize the variable 'dentry' to silence this warning
     240 |         struct dentry *dentry;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +256 fs/configfs/mount.c

   235	
   236	struct dentry *configfs_pin_fs(struct super_block *sb)
   237	{
   238		struct configfs_super_info *info;
   239		struct vfsmount *mnt;
   240		struct dentry *dentry;
   241	
   242		if (sb) {
   243			struct configfs_super_info *root = configfs_get_root(NULL);
   244	
   245			info = sb->s_fs_info;
   246			dentry = sb->s_root;
   247			dget(dentry);
   248			info->mnt = root->mnt;
   249			configfs_put_root(root);
   250			goto get_mount;
   251		}
   252		info = configfs_get_root(NULL);
   253		if (WARN_ON(!info))
   254			return ERR_PTR(-EAGAIN);
   255	
 > 256		if (!info->mnt) {
   257			mnt = vfs_kern_mount(&configfs_fs_type, SB_KERNMOUNT,
   258					     configfs_fs_type.name, NULL);
   259			if (IS_ERR(mnt))
   260				return ERR_CAST(mnt);
   261			info->mnt = mnt;
   262			dentry = info->mnt->mnt_root;
   263		}
   264	get_mount:
   265		refcount_inc(&info->mnt_ref);
   266		mntget(info->mnt);
   267		return dentry;
   268	}
   269	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
