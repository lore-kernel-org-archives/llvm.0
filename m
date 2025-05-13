Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492B24C67B;
	Tue, 13 May 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138825; cv=none; b=YdJfwTEtHio3kXM4CKb487yIel6VqVDMq+KRjDAbACSfjbMrTGmoRQC69sWBHTOEeAG04uy4ZmHl3qytfI6ug9lMC5yNMGSfTAne9K8VKTxxM2QntmzT+xW1Mk8fHbsVmTa7vl8aD6cWp4t9WOSUrwCo3KPy1Jodpdf4PVsuK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138825; c=relaxed/simple;
	bh=Ybutf2ZA0+rRTJ80CH2hJeSazzgT4qAWA0r4s/tfjQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLRssLz7VGI+O8xfAr6ZgGEhdfoHiVOKRNsrQ34pHAd+H4RFm0rmLNxEIL+QNZGIJ7wKimUF7BYxsIYFG5mXb/D6Saqss/cZjzTz3pWyomETwciJIASBOPmSIsxnuCZz0XtST+Q7FkTbCA0Z+4jq767143uS3PkRo71mllw6JjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+ZqZwsl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+ZqZwsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747138824; x=1778674824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ybutf2ZA0+rRTJ80CH2hJeSazzgT4qAWA0r4s/tfjQM=;
  b=m+ZqZwslcyNlvgBgcbbmbClZ/gt1VxbGMSFo7O9+AhvudeYwCXqBKiJg
   5IYBEy5FvLk7t7UjhufIFJvlnPbqxseFMioR+Sbad1f+L6Rlc06FgNWiX
   H1j1LyLG+hzxZxqdyQliKRbszmE8mMncQnEzft4bXzL+Yrp4wySfevm4Z
   YAHzvWx8lsY2RUhx8gxgxSFV0AdjgTPKiAJ+hPgBZKNzoZxKaClolA6FG
   A7exEk9Igj+mJpiUGKhcByTX1BTgv6Uv4XVp1aL7itZhi0gtEpBTBMA+M
   BMOmLWtbHMkMT5YGIuG0piOwBNTwQutrI0YR5FXm0Vy3aUnwp1GucPQ5x
   g==;
X-CSE-ConnectionGUID: 63PkRt6ORCWKg7+KQPtqDg==
X-CSE-MsgGUID: pMQQkAS+TS+bJgaUzSZ0BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49127384"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="49127384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 05:20:24 -0700
X-CSE-ConnectionGUID: 5o298X1LR6iFqCuV/bBBtg==
X-CSE-MsgGUID: gYqTXkO0RfeLl189ltJQGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137578854"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2025 05:20:22 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEocO-0000yM-0Z;
	Tue, 13 May 2025 12:20:20 +0000
Date: Tue, 13 May 2025 20:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>
Subject: [jaegeuk-f2fs:dev-test 188/191] fs/f2fs/super.c:5283:6: warning:
 unused variable 'i'
Message-ID: <202505132038.wjQGfZCG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   7274f75b0d876f1cc87349fe8e5c8b45f90695c5
commit: 33605141d92b1eb2a5e625a79abe35856a588662 [188/191] f2fs: switch to the new mount api
config: i386-buildonly-randconfig-2003-20250513 (https://download.01.org/0day-ci/archive/20250513/202505132038.wjQGfZCG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505132038.wjQGfZCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505132038.wjQGfZCG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:5283:6: warning: unused variable 'i' [-Wunused-variable]
    5283 |         int i;
         |             ^
   fs/f2fs/super.c:370:20: warning: unused function 'ctx_set_flags' [-Wunused-function]
     370 | static inline void ctx_set_flags(struct f2fs_fs_context *ctx,
         |                    ^~~~~~~~~~~~~
   2 warnings generated.


vim +/i +5283 fs/f2fs/super.c

  5279	
  5280	static void f2fs_fc_free(struct fs_context *fc)
  5281	{
  5282		struct f2fs_fs_context *ctx = fc->fs_private;
> 5283		int i;
  5284	
  5285		if (!ctx)
  5286			return;
  5287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
