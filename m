Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5410BE7C;
	Sun, 10 Dec 2023 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8FPXjzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702223197; x=1733759197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxMgVDX8E221F0XByN95AeHy9t31xp4N6PC9RbSYb+0=;
  b=B8FPXjzm+1/XVgKOrWmNG1OcIiP3VKA/7wVAmNN6eHzwuVu8SXg2IhOR
   RTUT627I4/Pf0GfXjdzLQxGEjUadP0Wh62sJVSm2KDsE3jhT8eD2S8vw8
   lSSZb7SY0097gyYe1IjG2tGGfG74FMi/lJtmJteWQxKjLLcRz/0k6Bxcf
   DVjVqb0cNJs3iupU87xuMx5xBeK+4BUpmQm6qn308ysSH4ygvzXuqttlP
   sI4PLMeeT0Hl1D6sMGULQZ7eqlzlCVBkBHfQvb225WOLVH7j8m6ZF1LM8
   yAvlytx214NDn0M0L5YaR87GsfkdjST6Bf+XD3ctZ20fy2sL0fNOHrnQm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="16109247"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="16109247"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 07:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843206016"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="843206016"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2023 07:46:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCM0m-000GzI-2i;
	Sun, 10 Dec 2023 15:46:32 +0000
Date: Sun, 10 Dec 2023 23:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-pp-provider 18/31] io_uring/uring_cmd.c:250:5:
 warning: no previous prototype for function 'io_uring_cmd_sock'
Message-ID: <202312102323.ticiB8ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider
head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
commit: 6ad9b73c4e6e27dc9e3adfe7f139c37975780415 [18/31] io_uring: separate header for exported net bits
config: i386-randconfig-012-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102323.ticiB8ua-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102323.ticiB8ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102323.ticiB8ua-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/uring_cmd.c:250:5: warning: no previous prototype for function 'io_uring_cmd_sock' [-Wmissing-prototypes]
   int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags)
       ^
   io_uring/uring_cmd.c:250:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags)
   ^
   static 
   1 warning generated.


vim +/io_uring_cmd_sock +250 io_uring/uring_cmd.c

4232c6e349f3a5 Breno Leitao 2023-10-16  248  
d2cac3ec823798 Breno Leitao 2023-10-16  249  #if defined(CONFIG_NET)
8e9fad0e70b7b6 Breno Leitao 2023-06-27 @250  int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags)

:::::: The code at line 250 was first introduced by commit
:::::: 8e9fad0e70b7b62848e0aeb1a873903b9ce4d7c4 io_uring: Add io_uring command support for sockets

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
