Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C391B218A;
	Thu, 27 Feb 2025 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673623; cv=none; b=T1MWD1FmB3dEAfz3XEXVteqs+IkMp7rhEqadpge0dGoBRnHYgb67Nqu8jTwynaFsvFFWsf9Es7DRBT8ATCJbTBMFnIsTxVz4MllLxrhsndFLjRcCgKNLTQnS9IOhnw4W2IApEHpfFpUMxvMCFD/tRPi1HIhUCO4YM2ttBDx7+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673623; c=relaxed/simple;
	bh=4kJ1Lqf4V1JM+dATNL7fZEjgqD0Akq+7w25xiB7s0Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O2fZ/Ija8V7IYl67P10YqhJgKVb4IwoGdZchITfVjQuNuogWfQe2Naw9ctwO3iLCF56K+1P8uvwG/r50dED5k8xS4NAxMuJZ/tNs385gKyTU8IbDSi84NqkFbZZPFMfqGMThfT9BLbiU2WfvqOJcZ8LOZa96mKChZkS8unrmsVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrfLAXHf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrfLAXHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740673621; x=1772209621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kJ1Lqf4V1JM+dATNL7fZEjgqD0Akq+7w25xiB7s0Ks=;
  b=NrfLAXHfx3mpBvoF9aaSuPi2KIYLafsCo6PpacOsNPENSQmlFqjcMtVv
   h7B64HrlZ4VTwnGyEhklVWguIU/fC6yx43CxItxmX43AYiCqp7AzPel/I
   2jASWGLFbEcdcZhiGE20zxy8QghC8kpog3RUWDDalsruMVCY1A8l8NBgR
   fzykiZku1hIKCxsyYMgTz3qSLChPV+jDZeU4TvY6D+imPbcHimSOarTf9
   dkUTPZ1QSwSBKJEf+AxZCeGfxkcQvvWXqyVT/efBYbELIPX7qiIN6ZjpR
   ZbRiHrxHORDpUtB2GSRjW9fayoLKHa80pX4ekIHImIif9LiR2G/lZ66km
   A==;
X-CSE-ConnectionGUID: 59JETZ28RDKmotu51SCHtQ==
X-CSE-MsgGUID: DsM7Qk7MQYCMvnsx4OFr2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59109805"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="59109805"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 08:27:01 -0800
X-CSE-ConnectionGUID: uJBrGJDVS6KIIscuT/852g==
X-CSE-MsgGUID: qvYQEYitR1y5kHnS6YvYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117073753"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2025 08:26:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tngiu-000DgW-2I;
	Thu, 27 Feb 2025 16:26:56 +0000
Date: Fri, 28 Feb 2025 00:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-github:vfs-6.15.async.dir 4/10] fs/sysv/namei.c:275:12:
 error: incompatible function pointer types initializing 'struct dentry
 *(*)(struct mnt_idmap *, struct inode *, struct dentry *, umode_t)' (aka
 'struct dentry *(*)(struct mnt_idmap *, struct inode *, struct dentry *,
 unsigned short...
Message-ID: <202502280043.knolMXTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.15.async.dir
head:   d49e14c16a69c5a3989c32142b986cb863c1debe
commit: 10a5b48c3eeb26bc4fa095dca9a6e7c4a89efdf9 [4/10] Change inode_operations.mkdir to return struct dentry *
config: x86_64-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280043.knolMXTM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280043.knolMXTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280043.knolMXTM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/sysv/namei.c:275:12: error: incompatible function pointer types initializing 'struct dentry *(*)(struct mnt_idmap *, struct inode *, struct dentry *, umode_t)' (aka 'struct dentry *(*)(struct mnt_idmap *, struct inode *, struct dentry *, unsigned short)') with an expression of type 'int (struct mnt_idmap *, struct inode *, struct dentry *, umode_t)' (aka 'int (struct mnt_idmap *, struct inode *, struct dentry *, unsigned short)') [-Wincompatible-function-pointer-types]
     275 |         .mkdir          = sysv_mkdir,
         |                           ^~~~~~~~~~
   1 error generated.


vim +275 fs/sysv/namei.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  265  
^1da177e4c3f41 Linus Torvalds   2005-04-16  266  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  267   * directories can handle most operations...
^1da177e4c3f41 Linus Torvalds   2005-04-16  268   */
c5ef1c42c51b1b Arjan van de Ven 2007-02-12  269  const struct inode_operations sysv_dir_inode_operations = {
^1da177e4c3f41 Linus Torvalds   2005-04-16  270  	.create		= sysv_create,
^1da177e4c3f41 Linus Torvalds   2005-04-16  271  	.lookup		= sysv_lookup,
^1da177e4c3f41 Linus Torvalds   2005-04-16  272  	.link		= sysv_link,
^1da177e4c3f41 Linus Torvalds   2005-04-16  273  	.unlink		= sysv_unlink,
^1da177e4c3f41 Linus Torvalds   2005-04-16  274  	.symlink	= sysv_symlink,
^1da177e4c3f41 Linus Torvalds   2005-04-16 @275  	.mkdir		= sysv_mkdir,

:::::: The code at line 275 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
