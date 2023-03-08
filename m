Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD67C;
	Wed,  8 Mar 2023 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678265442; x=1709801442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pu/sJxTrASdMKUp5HI/2JBb5GB5rbO4KMULJcHaGzmw=;
  b=HhoM8QxMVzVR/M7H8fdO+r/L5lfNsyTDyji99rPDSH0RxTkDee1Xk3Lc
   Bs0dnGFtUytg6QXxkDh7pjPMPIkMaXmOeALxJXPZFYbGJc76eE82wNFnL
   SLbqzVNf6/AB68gUXH5yk+5KgTjmlIPNHjf8u3Pi4ZwKaAp0v2e5GqBEg
   sXx6zhImI8+xmyAmIfTD718uQhEOlgm0rWlz1xwrhnT1+CeX/UDEe3kgo
   Jfq9Lt8ZC9mNKH0TZWE8LNkemur9bUWajxrg0xr+dY9qQzDddDKQa5Psv
   JILJnr3bW0RF+YVkiGNZ4wKkYzdez/ixzmE6cYEdTVgk8yJRFDapu9bsH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422371399"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="422371399"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 00:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765936658"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="765936658"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 00:50:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZpVP-0001zr-38;
	Wed, 08 Mar 2023 08:50:39 +0000
Date: Wed, 8 Mar 2023 16:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 1761/1915]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:
 warning: variable 'software_shutdown_temp' is uninitialized when used here
Message-ID: <202303081657.6Ble80UY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc31900c948610e7b5c2f15fb7795832c8325327
commit: 511a95552ec878fc59a294652ebbf73a0e8e0c76 [1761/1915] drm/amd/pm: Add SMU 13.0.6 support
config: riscv-randconfig-r042-20230306 (https://download.01.org/0day-ci/archive/20230308/202303081657.6Ble80UY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=511a95552ec878fc59a294652ebbf73a0e8e0c76
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 511a95552ec878fc59a294652ebbf73a0e8e0c76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081657.6Ble80UY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: warning: variable 'hotspotlimit' is uninitialized when used here [-Wuninitialized]
                   hotspotlimit * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
                   ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22: note: initialize the variable 'hotspotlimit' to silence this warning
           uint8_t hotspotlimit;
                               ^
                                = '\0'
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24: warning: variable 'memlimit' is uninitialized when used here [-Wuninitialized]
           range->mem_crit_max = memlimit * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
                                 ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18: note: initialize the variable 'memlimit' to silence this warning
           uint8_t memlimit;
                           ^
                            = '\0'
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34: warning: variable 'software_shutdown_temp' is uninitialized when used here [-Wuninitialized]
           range->software_shutdown_temp = software_shutdown_temp;
                                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32: note: initialize the variable 'software_shutdown_temp' to silence this warning
           uint8_t software_shutdown_temp;
                                         ^
                                          = '\0'
   3 warnings generated.


vim +/software_shutdown_temp +1152 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c

  1129	
  1130	static int
  1131	smu_v13_0_6_get_thermal_temperature_range(struct smu_context *smu,
  1132						  struct smu_temperature_range *range)
  1133	{
  1134		uint8_t software_shutdown_temp;
  1135		uint8_t hotspotlimit;
  1136		uint8_t memlimit;
  1137	
  1138		if (!range)
  1139			return -EINVAL;
  1140	
  1141		/* TODO: Find a way to get temperature limits */
  1142		memcpy(range, &smu_v13_0_6_thermal_policy[0],
  1143		       sizeof(struct smu_temperature_range));
  1144	
  1145		range->hotspot_crit_max =
> 1146			hotspotlimit * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
  1147		range->hotspot_emergency_max = (hotspotlimit + CTF_OFFSET_HOTSPOT) *
  1148					       SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
> 1149		range->mem_crit_max = memlimit * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
  1150		range->mem_emergency_max = (memlimit + CTF_OFFSET_MEM) *
  1151					   SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
> 1152		range->software_shutdown_temp = software_shutdown_temp;
  1153	
  1154		return 0;
  1155	}
  1156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
