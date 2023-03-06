Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD917E;
	Mon,  6 Mar 2023 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678094098; x=1709630098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXZCDteeVb740tzfik+7h8Ga+ZkVn0dnKRazKz3cqH8=;
  b=kTXKqQpMmUAL9XaHy/PgTm74Ozswi57ZxGeAbuOeL+31WTjvz1VegXrP
   PTMo5JqnPp7bPcc620IxfdvZ6n+37n4dlVvPQsPxFsKcR5C+LeUQiybHy
   Qqttttb3hI/ZqesjJcQTzlNFGPigQeRogd9yNw1S3JikfsZJ3877FZIv7
   tAoyYpVLetXpWKihIsVeuQNeUM2+D9d7VEUJmnR94yTwylt8w8h06YSr6
   3ifdKhZWFr4WgLLq/bTLGZ/LyEJU6sL5N/15TcDGYS2mvhVdoeJ3mdF5R
   pve6QGsqA/OI9cgWPxWQ0xa4O2BftYxYmWj1z2X/OpDtoP+hNLpTUqEuq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315904904"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="315904904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 01:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="921850224"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="921850224"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2023 01:14:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ6vn-0000Bz-2R;
	Mon, 06 Mar 2023 09:14:55 +0000
Date: Mon, 6 Mar 2023 17:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kun Liu <Kun.Liu2@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Evan Quan <evan.quan@amd.com>
Subject: [linux-next:master 13683/14548]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:5: warning:
 no previous prototype for function 'vangogh_set_apu_thermal_limit'
Message-ID: <202303061725.Wv3p5RDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dc837c1a5137a8cf2e9432c1891392b6a66f4d8d
commit: 0c3c99364361171f8cfeb8b66b1e6f4709919dc3 [13683/14548] drm/amdgpu: added a sysfs interface for thermal throttling
config: mips-randconfig-r035-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061725.Wv3p5RDB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c3c99364361171f8cfeb8b66b1e6f4709919dc3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0c3c99364361171f8cfeb8b66b1e6f4709919dc3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061725.Wv3p5RDB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:5: warning: no previous prototype for function 'vangogh_set_apu_thermal_limit' [-Wmissing-prototypes]
   int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
       ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
   ^
   static 
   1 warning generated.


vim +/vangogh_set_apu_thermal_limit +1600 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c

  1599	
> 1600	int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
  1601	{
  1602		return smu_cmn_send_smc_msg_with_param(smu,
  1603						      SMU_MSG_SetReducedThermalLimit,
  1604						      limit, NULL);
  1605	}
  1606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
