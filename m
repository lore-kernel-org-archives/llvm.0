Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5F2F28
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 22:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652395978; x=1683931978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KesB9TkFdl9cmnTv7mRpkD//DnYASuepMhknEjHthiQ=;
  b=NkpKVio4EfjNeshi7X7WkcBDDbaRdLm8P/4DFxSQm8uNdvMIThXrDWjz
   yI0HlCDNpenXOPCdNZtGAevEuBKqupUhjDJSPHSDlnE4403mudVA4yaWX
   BLaFe38Ntv54O21rTVWz2iRTTWzUytRZHKx0qWov6JBeNwcuSHtskjRcU
   +ngWj/oKNnoWsl2edbsiZYORIj81A2fO0fEdgppGB9k+PYpGGCr8qQkVu
   WwKu9gSQeuud9luSduh/hWURfdzwuktbEGr7smd/rQo2ahQB7SdlFPw+C
   Fzi+yz8d4a/UXtV/90VhEphFGpAvkgfjANrVhKuS6Stkn7sofcLT9qFOU
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="267747569"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="267747569"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 15:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="624605132"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2022 15:52:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npHfz-000L12-Lt;
	Thu, 12 May 2022 22:52:55 +0000
Date: Fri, 13 May 2022 06:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [mszyprow:v5.18-next-20220511-dsi-rework 14/35] ERROR: modpost:
 "dsi_driver" [drivers/gpu/drm/exynos/exynosdrm.ko] undefined!
Message-ID: <202205130603.OtcbHnd9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mszyprow/linux.git v5.18-next-20220511-dsi-rework
head:   65cb4959430021041f1e68ef98a6ec541d5891aa
commit: 395cab08cbac6e4028dafce068414ea43244a592 [14/35] drm: bridge: Add Samsung DSIM bridge driver
config: arm64-randconfig-r034-20220512 (https://download.01.org/0day-ci/archive/20220513/202205130603.OtcbHnd9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/mszyprow/linux/commit/395cab08cbac6e4028dafce068414ea43244a592
        git remote add mszyprow https://github.com/mszyprow/linux.git
        git fetch --no-tags mszyprow v5.18-next-20220511-dsi-rework
        git checkout 395cab08cbac6e4028dafce068414ea43244a592
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dsi_driver" [drivers/gpu/drm/exynos/exynosdrm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
