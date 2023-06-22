Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77D15DA;
	Thu, 22 Jun 2023 01:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687397669; x=1718933669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0izurAVdR+Y8lGess2CDj0geTy/cAKSxXQ98/4NaRw=;
  b=Ju6lP1nM+cH8GXCeAjzAvMRdB0y5uvVltm7y4S6faxwgC/N4sbMQsMlH
   B8AKdYpXrg3+g4QdrY6OSp25tBHMft9Wy7U2ZcJvprN3G6D8Zmld/r2LS
   G2aMlVa0gd+h3l+1BtXZOD1ssN6NOzK9OS3CfIyJ6LKW1bctDAsio6Jp/
   Aj4vGDgagY/uFrYqNqxJslfOqVy1rDshri/64t/09uE3t28H0IhIiqIPl
   Eup5nAWsBkSPL+3hP0ZTnHyJcnF4/sfBeWo8TkvaGB/dptmj0h67nKNp8
   a74SvhpEhBF71Sr1fCkpGguZ6rVH6UXBJ/7/QsZy0mcSCVwKv3Rpe6lOK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="424026462"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="424026462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 18:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804591908"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="804591908"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 18:34:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC9DM-0007EB-0M;
	Thu, 22 Jun 2023 01:34:24 +0000
Date: Thu, 22 Jun 2023 09:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daniel-lezcano:thermal/tuxsuite 26/32]
 drivers/thermal/tegra/../thermal_core.h:18:2: warning: This header can only
 be included by the thermal core code
Message-ID: <202306220923.87UyOSMc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   http://git.linaro.org/people/daniel.lezcano/linux thermal/tuxsuite
head:   f619663add5d265ddbfeb5ccc165dd88c1edd5ce
commit: 19bc6f9da25e7f7c944afa60a586510ec747b0bd [26/32] thermal/core: Hardening the self-encapsulation
config: arm64-randconfig-r013-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220923.87UyOSMc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220923.87UyOSMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220923.87UyOSMc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/thermal/tegra/soctherm.c:36:
>> drivers/thermal/tegra/../thermal_core.h:18:2: warning: This header can only be included by the thermal core code [-W#warnings]
      18 | #warning This header can only be included by the thermal core code
         |  ^
   1 warning generated.


vim +18 drivers/thermal/tegra/../thermal_core.h

    16	
    17	#ifndef THERMAL_CORE_SUBSYS
  > 18	#warning This header can only be included by the thermal core code
    19	#endif
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
