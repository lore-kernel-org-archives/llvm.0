Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E579018AE7;
	Tue, 29 Aug 2023 22:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693347002; x=1724883002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNME3gdnLMyvcTJqOztxL04quPuggWUGzV6ZO1yQO/E=;
  b=jlifVRHaUI51mdK+k/3fhLX1XmKyDmGlPx+MZl5SwS1PL6vGYTMi1FT5
   QjrsS9acd1HBOrsK9FjFzlwGRIUhVKEh3U49s4yrHWIJpl4S8F3QHAgaO
   /B/WtQxfU404KWYrzfa0hahMA5btzpFEiJockGP41BVAppNhdJW7Q5r78
   jrlglja+kVHQrJ+bmYsFWTo9Znd5sq5c3KivayvvbKRWtRygRTT6LiyTT
   xNZVR7IcL8cfUuNbaZaa4shpMMv5YNXTIU6oVI1XGriN9UGoDA0l4rnPQ
   r9YoQmKUyXL5NjYFr9DWAL12KA8W42WtkTsJQqq0f5GEkDuisPS7+IEh1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360487662"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="360487662"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 15:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="828992526"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="828992526"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 15:10:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb6uN-00098V-1H;
	Tue, 29 Aug 2023 22:09:59 +0000
Date: Wed, 30 Aug 2023 06:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-super-mtd 51/51] ld.lld: error: undefined
 symbol: sget_dev
Message-ID: <202308300527.BmzoWgGu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-super-mtd
head:   a115996e417a9245d3f9974b94f649479ad76f99
commit: a115996e417a9245d3f9974b94f649479ad76f99 [51/51] mtd: key superblock by device number
config: x86_64-randconfig-071-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300527.BmzoWgGu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300527.BmzoWgGu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300527.BmzoWgGu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sget_dev
   >>> referenced by mtdsuper.c:33 (drivers/mtd/mtdsuper.c:33)
   >>>               vmlinux.o:(mtd_get_sb)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
