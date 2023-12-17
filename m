Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAEEA9;
	Sun, 17 Dec 2023 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llFjRDIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702782561; x=1734318561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5CURWEQkF62VIh3RmQCQJr90Pr0jMlBh2UMAiR5UDM=;
  b=llFjRDIX7YwsDY4cCBLeDfQehYAillRDvVmIGnmkJvLuRqc/yrni+5Kf
   s1jWhchvDxnbdDUQaDc26ALM00SUAXZYXgK1trlvXT9ZvGbFT21mxNtpX
   HRv7Pfw1FuNROQJ2zDcb2CCIC30i76WvW8wBBgNWX/T4xA9iR0HqOR293
   WOs9dmymHHQY8O7RLn2dFy03OGqA4S4o5Q8w7Un/TVBr0D7f7o3A4Mpoy
   IKPidq5YGT9RyVDV5nYz0FDfBw9cVxOB6y6h0jO/W6TPCsrBL0ZGFImdJ
   On3Ac8edHfen83ozBHfJ3djEPrbDjUWqBVav13anPlp+qK9v9Vo9ti6WB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2250057"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2250057"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 19:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="751367419"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="751367419"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2023 19:09:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEhWj-0002YX-1Q;
	Sun, 17 Dec 2023 03:09:13 +0000
Date: Sun, 17 Dec 2023 11:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:headers.unaligned 2/2] tools/arch/x86/lib/insn.c:16:10:
 fatal error: '../include/linux/unaligned.h' file not found
Message-ID: <202312171105.MC5EGJ0W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Al,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git headers.unaligned
head:   3169da8e80dfca2bcbfb6e998e2f36bcdcd5895a
commit: 3169da8e80dfca2bcbfb6e998e2f36bcdcd5895a [2/2] move asm/unaligned.h to linux/unaligned.h
config: i386-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171105.MC5EGJ0W-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171105.MC5EGJ0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171105.MC5EGJ0W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/tools/insn_sanity.c:19:
>> tools/arch/x86/lib/insn.c:16:10: fatal error: '../include/linux/unaligned.h' file not found
   #include "../include/linux/unaligned.h" /* __ignore_sync_check__ */
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +16 tools/arch/x86/lib/insn.c

  > 16	#include "../include/linux/unaligned.h" /* __ignore_sync_check__ */
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
