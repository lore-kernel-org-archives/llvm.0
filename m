Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58135387363;
	Fri, 29 May 2026 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076205; cv=none; b=gHbIX6mt31aiGrj/f3JYdUqP8Ao71GRLuXz6R5b003JhhP4FmSK8IjPXyCUeCA7t7j5tzP2I/fFrt1ejAUPlNZE+5ApQn48d915GEycGYVM44//p2E9nFvbdfSx3xkPsV1MtR+A3o4K4OQz2kxT1Re3g5sQ4g1np6+JTeWB3Qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076205; c=relaxed/simple;
	bh=7Uuo5e8hVDwUSS8WSodvniwPfg7SrlP4W5S07wwq/gA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sxQMWFXBe484xEixjbNTmJd/Hxl68VnypLUG4lXsj2Qv7nriGf8GXQRIBiDaIirzbAdMAId1MlOUy9ORCxtm8GHdF8s3qOuUt0k/R441ouDmoMxvRkKVmYUw82Ft0V/uqCqWnE8MASX4KPyHO4XhASW5AAvEbtVBHos0/yYzEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmSrRPrZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmSrRPrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780076205; x=1811612205;
  h=date:from:to:cc:subject:message-id;
  bh=7Uuo5e8hVDwUSS8WSodvniwPfg7SrlP4W5S07wwq/gA=;
  b=YmSrRPrZxubelrVR6C/ieW+ToomnLSKTpAqW8+S4Ucc/egr6wI1yE8bd
   q2vvyob25BNqo02ORyM4qdVHK/T/J+FWY71BiF1wpq8907/kkTSrv1qpW
   jdsbVYdcqpMPRq0m1720QIujuISIkJ5hELU/6u+q4+owmw5NGN5TZHezt
   q917CzJ8HVhUm+hoJg0vcYGritAiMf/P7GLu93HZlEe1sByMBVxmthDSy
   pL34dJL9ddMA9SgKZsa79Q8zVDfOvGzKJYbhManCoxGMBbICDzkAkgZyT
   I1wiSn0451m1Np9PTXwWH5yMbnSsM8Jdzpm/uEwQm06zTmAKxYJI2ZWjk
   Q==;
X-CSE-ConnectionGUID: Wikp9C4JTEymAOEEKJOsKQ==
X-CSE-MsgGUID: PMvP3opjSgKHZGg3Z7/0nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="106383592"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="106383592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 10:36:44 -0700
X-CSE-ConnectionGUID: wIHHYo8NRBGuYJd4X/WH7g==
X-CSE-MsgGUID: pdCWgOXVTeafER6u51fimg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="241863341"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2026 10:36:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT18R-000000007YA-2u2v;
	Fri, 29 May 2026 17:36:39 +0000
Date: Sat, 30 May 2026 01:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 27/29]
 fs/configfs/mount.c:256:6: warning: variable 'dentry' is used uninitialized
 whenever 'if' condition is false
Message-ID: <202605300137.nbNI6Vs7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   964d695bfb8ffb92899c77a55c4920fdb3d79e7b
commit: 2d39db5facb268ddbb34f11f3a28f5518ab5cf84 [27/29] fs/configfs: rework configfs_pin_fs()
config: arm-lpc32xx_defconfig (https://download.01.org/0day-ci/archive/20260530/202605300137.nbNI6Vs7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300137.nbNI6Vs7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300137.nbNI6Vs7-lkp@intel.com/

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
