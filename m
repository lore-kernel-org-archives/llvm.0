Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463B62C
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650967379; x=1682503379;
  h=date:from:cc:subject:message-id:mime-version;
  bh=J2oA6GjtFHRq4M7UhUSv54G1PG2hUncaf1sDulQGi2M=;
  b=Q2Qok4Lcc12++KY+FHfQVxBPSfl5SEhQx6dRvdYbaI/ofnpNflapTtYa
   t4suECJaROmIOsgBKl0pG9Sj6Ti4WaT3oS7gG72jmWH4hIun+OFK3Ohrb
   XL+PzFebzkLCUF/eYYZRYFZJKXPEsPJfd8mjeJOf/vsUIoxO9v3H2vyt7
   7TM8cy/JoymMYeqrUMAnnDXwj6276ln+fqvIpENIboYDsuTHTquZwpysh
   BvjqVjl6oLK7znVX4AUxEV+DHWjs7JLpMUA/OssKS3zhCU0TzgDLuA4vM
   f+JP5DBYeVffwcDZoAy6GtidTm82XJ9qSF07iU/Tidio60tRSRkoGan3v
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="326015052"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="326015052"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 03:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="874283693"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Apr 2022 03:02:53 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njI21-0003PL-0r;
	Tue, 26 Apr 2022 10:02:53 +0000
Date: Tue, 26 Apr 2022 18:02:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [asahilinux:pr/22 78/189] kernel/reboot.o: warning: objtool:
 sys_off_handler_power_off() falls through to next function
 sys_off_handler_restart()
Message-ID: <202204261724.5aLY2xju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux pr/22
head:   7ee315306d1a3b0da8cf2a53e7f55889d0e7f034
commit: ec159207530d80c0a0bd04c1ac94db5766bbc3c0 [78/189] kernel: Add combined power-off+restart handler call chain API
config: x86_64-randconfig-a005-20220425 (https://download.01.org/0day-ci/archive/20220426/202204261724.5aLY2xju-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/ec159207530d80c0a0bd04c1ac94db5766bbc3c0
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux pr/22
        git checkout ec159207530d80c0a0bd04c1ac94db5766bbc3c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/reboot.o: warning: objtool: sys_off_handler_power_off() falls through to next function sys_off_handler_restart()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
