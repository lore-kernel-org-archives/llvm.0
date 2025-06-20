Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722B0EBE;
	Fri, 20 Jun 2025 00:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750379528; cv=none; b=rrTEkCFtxa6OGKMcyX26SQ7dtTtDzizHGH3flEfQpOZdf2kGMEiFvKIiaDxCQUxH+zmr0QkrndNrzPnw353pJv59zwf1+VJTN/XNKBh4avnbQCPlBGmFaNHUPJw6xcvmCXrZS2cEjwNpr6lEbrg6vGUepqBMnzcyplsVpDIr2kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750379528; c=relaxed/simple;
	bh=FgUZqLhBinIxTSOO1MaZQL3Cq2Zox65AGxkmO8q8SEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rp/sZsbPGbSYFBTKzWPUmZKfMqjmTpx5Q9Uxh4981i8SQZmy8vMVloYSI1APt56hS1ipPVae5gXh8vSu8l03FJ5He2GP++/e070CTVHIPxx6Bkc3Rnkla4rnIrUhRWX2RD/db3NOVPZ2J3wvsTVbaBVxB2f4WU0JmSNiJ88vawc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIjYTgZs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIjYTgZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750379526; x=1781915526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FgUZqLhBinIxTSOO1MaZQL3Cq2Zox65AGxkmO8q8SEo=;
  b=LIjYTgZsfrmH0pjFYW+0JNtfi8izyKJswvSOTXjeogyduyll4wRuddQ6
   iNzp9HI56Bv5lx6M/VWe4l+7fYbw7zFSYbt+9/8yyB2ouQ8o3HeyJyBfv
   IqB3M72aSuOROvOihqlkZ1FayK8gz6caoFSr746fWBmr/caXf0RARUiYd
   Cdie6PD4w4ucXHG36CPXvrMcUS+4h+OO5ILlhuxTbaWFTaYuHvBVRLSWH
   Urh7D8X489P4YbpBPsCZiJN4d+3xx8nb06hDn0LRgIcPAVFt/kMtIVMzB
   sJkg/mgM8PVxqtNTTOQfrpWNqQL2r5MgSRC8eD0PiVbR+vL1P+vlTvbBT
   Q==;
X-CSE-ConnectionGUID: WePLwdPwQ8y/7YpK/jIL+g==
X-CSE-MsgGUID: 8C1ZFP2rSiqF6I+cObqF8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63241042"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="63241042"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 17:32:05 -0700
X-CSE-ConnectionGUID: KQeovqlBS7mR32FVxqNGVA==
X-CSE-MsgGUID: P/C5lmYgRZCNCT8r7SeHCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="151316679"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2025 17:32:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSPfl-000LDO-2D;
	Fri, 20 Jun 2025 00:32:01 +0000
Date: Fri, 20 Jun 2025 08:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.pidfs.setns 8/9] fs/pidfs.c:38:8: error: assigning
 to 'struct path' from incompatible type 'void (struct path *)'
Message-ID: <202506200845.lMHN9g7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.pidfs.setns
head:   80432e84dc3a17336efd11282d8c5db368ed827b
commit: f7b88122fa711d730ad163427e8da56adee73e33 [8/9] fhandle, pidfs: support open_by_handle_at() purely based on file handle
config: x86_64-buildonly-randconfig-006-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200845.lMHN9g7G-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200845.lMHN9g7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200845.lMHN9g7G-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/pidfs.c:34:20: error: redefinition of 'pidfs_root_path' as different kind of symbol
      34 | static struct path pidfs_root_path = {};
         |                    ^
   fs/internal.h:356:6: note: previous definition is here
     356 | void pidfs_root_path(struct path *path);
         |      ^
>> fs/pidfs.c:38:8: error: assigning to 'struct path' from incompatible type 'void (struct path *)'
      38 |         *path = pidfs_root_path;
         |               ^ ~~~~~~~~~~~~~~~
>> fs/pidfs.c:1077:17: error: member reference base type 'void (struct path *)' is not a structure or union
    1077 |         pidfs_root_path.mnt = pidfs_mnt;
         |         ~~~~~~~~~~~~~~~^~~~
   fs/pidfs.c:1078:17: error: member reference base type 'void (struct path *)' is not a structure or union
    1078 |         pidfs_root_path.dentry = pidfs_mnt->mnt_root;
         |         ~~~~~~~~~~~~~~~^~~~~~~
   4 errors generated.


vim +38 fs/pidfs.c

90c48e2619324e Christian Brauner 2025-06-19  35  
90c48e2619324e Christian Brauner 2025-06-19  36  void pidfs_root_path(struct path *path)
90c48e2619324e Christian Brauner 2025-06-19  37  {
90c48e2619324e Christian Brauner 2025-06-19 @38  	*path = pidfs_root_path;
90c48e2619324e Christian Brauner 2025-06-19  39  	path_get(path);
90c48e2619324e Christian Brauner 2025-06-19  40  }
90c48e2619324e Christian Brauner 2025-06-19  41  

:::::: The code at line 38 was first introduced by commit
:::::: 90c48e2619324e40223af34ff8aed6480b9d19c1 pidfs: add pidfs_root_path() helper

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
