Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F65BA56;
	Tue, 12 Sep 2023 23:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694560536; x=1726096536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoRX1ngPYXJRCUiOI8FWj30xj1JHQS7ADR6a1dUJXEA=;
  b=by6k/IHymHaGTc+q4P02KLuiOmVVGB7YD28eO9Ff54xMCGFHp0ieO4s+
   6T29l9UTaJ6jdmDIOF7LYBhxMgVRw6hb2Qf1dr1SrxyXZwoSAe8BPhdaz
   ZhyXE34eLcmwq+Q90aFRn2gtweAa4AB3Ws/xgryCHKfKTWDRA16Z/Md7a
   Ut48suH4Qkt9uHxe79rPvmfXYduLnTri5QY4SEaCsGohf3vVClRuGTkqq
   g9FKYEmiB0/fCihdpH5og+1Slu3CRBl68UgYXk/nI/HRiXHab4/Ix368T
   YW/Ai85QJTeBdV9QF8VThL/VUHm4xB3xIdZqVzW79GO47YXGAy9fofdpB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368783603"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="368783603"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 16:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990675274"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="990675274"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 16:15:06 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgCb2-0000PZ-14;
	Tue, 12 Sep 2023 23:15:04 +0000
Date: Wed, 13 Sep 2023 07:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:noumask 10/10] fs/init.c:156:2: error: implicit declaration
 of function 'mode_strip_umask' is invalid in C99
Message-ID: <202309130719.d02PxZ5U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git noumask
head:   b003e37dfced8ac4df1f4a16200e02f15ab7bff7
commit: b003e37dfced8ac4df1f4a16200e02f15ab7bff7 [10/10] fs: add a new SB_NOUMASK flag
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130719.d02PxZ5U-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130719.d02PxZ5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130719.d02PxZ5U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/init.c:156:2: error: implicit declaration of function 'mode_strip_umask' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mode_strip_umask(d_inode(path.dentry), mode);
           ^
   fs/init.c:156:2: note: did you mean 'mode_strip_sgid'?
   include/linux/fs.h:1812:9: note: 'mode_strip_sgid' declared here
   umode_t mode_strip_sgid(struct mnt_idmap *idmap,
           ^
   fs/init.c:232:2: error: implicit declaration of function 'mode_strip_umask' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mode_strip_umask(d_inode(path.dentry), mode);
           ^
   fs/init.c:225:16: warning: unused variable 'inode' [-Wunused-variable]
           struct inode *inode;
                         ^
   1 warning and 2 errors generated.


vim +/mode_strip_umask +156 fs/init.c

   140	
   141	int __init init_mknod(const char *filename, umode_t mode, unsigned int dev)
   142	{
   143		struct dentry *dentry;
   144		struct path path;
   145		int error;
   146	
   147		if (S_ISFIFO(mode) || S_ISSOCK(mode))
   148			dev = 0;
   149		else if (!(S_ISBLK(mode) || S_ISCHR(mode)))
   150			return -EINVAL;
   151	
   152		dentry = kern_path_create(AT_FDCWD, filename, &path, 0);
   153		if (IS_ERR(dentry))
   154			return PTR_ERR(dentry);
   155	
 > 156		mode_strip_umask(d_inode(path.dentry), mode);
   157		error = security_path_mknod(&path, dentry, mode, dev);
   158		if (!error)
   159			error = vfs_mknod(mnt_idmap(path.mnt), path.dentry->d_inode,
   160					  dentry, mode, new_decode_dev(dev));
   161		done_path_create(&path, dentry);
   162		return error;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
