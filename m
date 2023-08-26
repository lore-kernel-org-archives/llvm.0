Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907DEC1;
	Sat, 26 Aug 2023 07:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693033765; x=1724569765;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7ocVKg3ovYjpFQLrmrjk6At6S+FKTYJXY+m8lCkLpus=;
  b=ECPnXl1yu/Tgi02CPOJPQ5AGjLN1kxGjFmT4fKN4V0FmiWWZ5+pEip62
   GEBqF2s0fJVSkhjTpu8JHiOG6LqjwWGw1yMnJqk+pl2qW/UK3vah2i7QE
   UOMo0Th3MirKOhZSCfoVLLS/l9KP4PMDt16Kgwo4dQ/ztEhrcfYsCQKBs
   X17AO5qvBWnz7okc6eMl2lp9EmJxoy8L090sopJl+D5Eh+RB4/WTg0CEG
   htBbAKTTrMmonEB7bEy3NS9Syn7rj1mIYuUGSWpV97QRl9OkXemh4Lwo1
   FPhj+/T+1Vit5IBI6wbNoPnrRYj20EzlNb5grTVx5/6vROiiz7WwxcohY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354381233"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="354381233"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 00:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068466270"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068466270"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 00:09:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZnQA-0004Rq-20;
	Sat, 26 Aug 2023 07:09:22 +0000
Date: Sat, 26 Aug 2023 15:09:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/iio/imu/bmi160/bmi160_core.o: warning: objtool:
 bmi160_setup_irq() falls through to next function
 bmi160_data_rdy_trigger_set_state()
Message-ID: <202308261506.l4R1lVt5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e
commit: 5f474919fad82cd5761d2842c261d736941035fe iio: imu: bmi160: Make use of device properties
date:   1 year, 4 months ago
config: x86_64-randconfig-012-20230823 (https://download.01.org/0day-ci/archive/20230826/202308261506.l4R1lVt5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261506.l4R1lVt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261506.l4R1lVt5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/imu/bmi160/bmi160_core.o: warning: objtool: bmi160_setup_irq() falls through to next function bmi160_data_rdy_trigger_set_state()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
