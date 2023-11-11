Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FB1DA50;
	Sat, 11 Nov 2023 21:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKwjI5Ad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699739106; x=1731275106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8GejNVACKzLiy+kjLFivUt0ogXAKhNmXzczU4cJ0h4=;
  b=GKwjI5AdhE4/qRPglYDXj0l3Wt1DYFAdXmJMPi/SYK+6wzXMAcOPPQix
   3DLl2jdcktSkVPeKO9+EDgS7KQeUBSSOI8C36M03qqS+H8Wg83+q/VWVB
   lNISw+rlT+v3wajIa2vCuJcnZ7l9UGmNiStTOZAT69rHcFLH5SL/FgkwU
   nGlMe9fRfuaufmrT40i1zF8d7RE1TWG6KcANiIAp+svlWKAJPR/9nCvN3
   HjdMI2h8ZzCe1RxlBHqlqfqU94hX1YD7c0XPuCdFWb/XjAX1V8gfLP7Vq
   8V6ylUzuphZi29mZLoZFmDQtTULzkRGfyfbLmhC6AlLburDYgqApMi3lY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="8942361"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="8942361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 13:45:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="5332188"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2023 13:45:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1vmn-000AmX-1v;
	Sat, 11 Nov 2023 21:45:01 +0000
Date: Sun, 12 Nov 2023 05:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: fs/f2fs/recovery.c:804:5: warning: stack frame size (2064) exceeds
 limit (2048) in 'f2fs_recover_fsync_data'
Message-ID: <202311120541.Rd5RZFFL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 0ef4ca04a3f9223ff8bc440041c524b2123e09a3 f2fs: fix to do sanity check on destination blkaddr during recovery
date:   1 year, 1 month ago
config: powerpc64-randconfig-r005-20230827 (https://download.01.org/0day-ci/archive/20231112/202311120541.Rd5RZFFL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120541.Rd5RZFFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120541.Rd5RZFFL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/recovery.c:804:5: warning: stack frame size (2064) exceeds limit (2048) in 'f2fs_recover_fsync_data' [-Wframe-larger-than]
     804 | int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
         |     ^
   1 warning generated.


vim +/f2fs_recover_fsync_data +804 fs/f2fs/recovery.c

d624c96fb3249e Jaegeuk Kim          2012-11-02  803  
4d57b86dd86404 Chao Yu              2018-05-30 @804  int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
d624c96fb3249e Jaegeuk Kim          2012-11-02  805  {
26b5a079197c8c Sheng Yong           2018-10-12  806  	struct list_head inode_list, tmp_inode_list;
f61cce5b81f91b Chao Yu              2016-05-07  807  	struct list_head dir_list;
6ead114232f786 Jaegeuk Kim          2013-03-20  808  	int err;
6781eabba1bdb1 Jaegeuk Kim          2016-03-23  809  	int ret = 0;
4b2414d04e9912 Chao Yu              2017-08-08  810  	unsigned long s_flags = sbi->sb->s_flags;
aabe51364f4468 Haicheng Li          2013-10-23  811  	bool need_writecp = false;
c426d99127b1ab Shin'ichiro Kawasaki 2019-12-09  812  	bool fix_curseg_write_pointer = false;
ea6767337f8631 Jaegeuk Kim          2017-10-06  813  #ifdef CONFIG_QUOTA
ea6767337f8631 Jaegeuk Kim          2017-10-06  814  	int quota_enabled;
ea6767337f8631 Jaegeuk Kim          2017-10-06  815  #endif
d624c96fb3249e Jaegeuk Kim          2012-11-02  816  
1751e8a6cb935e Linus Torvalds       2017-11-27  817  	if (s_flags & SB_RDONLY) {
dcbb4c10e6d969 Joe Perches          2019-06-18  818  		f2fs_info(sbi, "recover fsync data on readonly fs");
1751e8a6cb935e Linus Torvalds       2017-11-27  819  		sbi->sb->s_flags &= ~SB_RDONLY;
4b2414d04e9912 Chao Yu              2017-08-08  820  	}
4b2414d04e9912 Chao Yu              2017-08-08  821  

:::::: The code at line 804 was first introduced by commit
:::::: 4d57b86dd86404fd8bb4f87d277d5a86a7fe537e f2fs: clean up symbol namespace

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
