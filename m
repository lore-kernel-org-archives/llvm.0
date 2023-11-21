Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D330F80;
	Tue, 21 Nov 2023 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGKAevVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700552778; x=1732088778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+aa5zzAHi0i3nxd5Pc79trW6WgPcuvijQWFGQUmpMVE=;
  b=YGKAevVTrK88qd//8dPIbdZyVtKHufFZSgXl1/wgqDWzSWdHuerCBimT
   797uwQImgtkslLEXEV7GZ/fRCKXEX/2Ti9jf2OKlRbb8do8tRCl3tRGE3
   X8960Vt1HCMkUdqfHf1s/tPwvJmP1Z+J4qaDcwPq6718w9fOpYDp5T+wL
   62arTOrTXWS4626mhMnA+SSn2dcvQAS8Zxox+wZ3fyI2vdjtFuMYrvZ0K
   lPbqz8SMH+gPTETnvP9U0wt2PoRHS5l4DIJveNnMiLoxgbf9s/RLUAh1d
   0se+6yYQYXuOjb8P39aPD4kM+cE8Bndvq9/rqC1VSi3TrEAL+igXiS5RL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376822784"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="376822784"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="884102974"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="884102974"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2023 23:45:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5LRx-0007WM-2X;
	Tue, 21 Nov 2023 07:45:49 +0000
Date: Tue, 21 Nov 2023 15:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Hill <daniel@gluo.nz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kent Overstreet <kmo@daterainc.com>
Subject: [linux-next:master 1707/2217] fs/bcachefs/super-io.c:661:5: warning:
 no previous prototype for function '__bch2_read_super'
Message-ID: <202311211543.cJzjS2Ky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07b677953b9dca02928be323e2db853511305fa9
commit: 700b6aa33cac353aadde200e10391ec19905451c [1707/2217] bcachefs: add a quieter bch2_read_super
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231121/202311211543.cJzjS2Ky-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211543.cJzjS2Ky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211543.cJzjS2Ky-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/super-io.c:661:5: warning: no previous prototype for function '__bch2_read_super' [-Wmissing-prototypes]
   int __bch2_read_super(const char *path, struct bch_opts *opts,
       ^
   fs/bcachefs/super-io.c:661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __bch2_read_super(const char *path, struct bch_opts *opts,
   ^
   static 
   1 warning generated.


vim +/__bch2_read_super +661 fs/bcachefs/super-io.c

   660	
 > 661	int __bch2_read_super(const char *path, struct bch_opts *opts,
   662			    struct bch_sb_handle *sb, bool ignore_notbchfs_msg)
   663	{
   664		u64 offset = opt_get(*opts, sb);
   665		struct bch_sb_layout layout;
   666		struct printbuf err = PRINTBUF;
   667		struct printbuf err2 = PRINTBUF;
   668		__le64 *i;
   669		int ret;
   670	#ifndef __KERNEL__
   671	retry:
   672	#endif
   673		memset(sb, 0, sizeof(*sb));
   674		sb->mode	= BLK_OPEN_READ;
   675		sb->have_bio	= true;
   676		sb->holder	= kmalloc(1, GFP_KERNEL);
   677		if (!sb->holder)
   678			return -ENOMEM;
   679	
   680		sb->sb_name = kstrdup(path, GFP_KERNEL);
   681		if (!sb->sb_name)
   682			return -ENOMEM;
   683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
