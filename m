Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954762912
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652204427; x=1683740427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SKYhWc6BCpgKoED4Q7RMuStn2TWZvN09RucYvqX+Klw=;
  b=LxNRIr44ZXiaJNDlw8eFwyqjWwFwFTF5VpANoSbwjphtAyBxVE3Ek7PT
   FNP8MuZSuozDeriTsROI1JuBhLg4HsfzfBAVhq07Dh6RKlmmkoFJJQDyd
   42b4SlT5/7YicG4EQNFnd7h/2uBdAZUTLUv8iQBSlV5vRPrYq/rObAenI
   bLglxrc+8bhNfs39nuzT/uGuQS9NHH5cbVT8lHU9K0SXySXc+1BLgvMJ8
   yuPtjbAYEvCbDMMp+yFXOylam+lfN2BItgHAIm/N+OtlARUMq+jEgO1+J
   D26VmY7bUuVW6578APN8exJQbnPc6H/hMYyQXlY7Tkktg0TUAV3YVkwc1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269589539"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="269589539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 10:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="657753732"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 May 2022 10:40:20 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noTqN-000IDy-Fn;
	Tue, 10 May 2022 17:40:19 +0000
Date: Wed, 11 May 2022 01:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kenneth Feng <kenneth.feng@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>
Subject: [linux-next:master 9330/10661]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1326:12:
 warning: stack frame size (1040) exceeds limit (1024) in
 'smu_v13_0_7_get_power_profile_mode'
Message-ID: <202205110148.mrGBBmTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3bf222d317a20170ee17f082626c1e0f83537e13
commit: 334682ae81513638aa49da9615c2c0054a711ed4 [9330/10661] drm/amd/pm: enable workload type change on smu_v13_0_7
config: riscv-randconfig-r031-20220509 (https://download.01.org/0day-ci/archive/20220511/202205110148.mrGBBmTn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=334682ae81513638aa49da9615c2c0054a711ed4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 334682ae81513638aa49da9615c2c0054a711ed4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:294:5: warning: no previous prototype for function 'smu_v13_0_7_check_fw_status' [-Wmissing-prototypes]
   int smu_v13_0_7_check_fw_status(struct smu_context *smu) {
       ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:294:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smu_v13_0_7_check_fw_status(struct smu_context *smu) {
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1326:12: warning: stack frame size (1040) exceeds limit (1024) in 'smu_v13_0_7_get_power_profile_mode' [-Wframe-larger-than]
   static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf)
              ^
   2 warnings generated.


vim +/smu_v13_0_7_get_power_profile_mode +1326 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c

  1325	
> 1326	static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf)
  1327	{
  1328		DpmActivityMonitorCoeffIntExternal_t activity_monitor_external[PP_SMC_POWER_PROFILE_COUNT];
  1329		uint32_t i, j, size = 0;
  1330		int16_t workload_type = 0;
  1331		int result = 0;
  1332	
  1333		if (!buf)
  1334			return -EINVAL;
  1335	
  1336		size += sysfs_emit_at(buf, size, "                              ");
  1337		for (i = 0; i <= PP_SMC_POWER_PROFILE_WINDOW3D; i++)
  1338			size += sysfs_emit_at(buf, size, "%-14s%s", amdgpu_pp_profile_name[i],
  1339				(i == smu->power_profile_mode) ? "* " : "  ");
  1340	
  1341		size += sysfs_emit_at(buf, size, "\n");
  1342	
  1343		for (i = 0; i <= PP_SMC_POWER_PROFILE_WINDOW3D; i++) {
  1344			/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
  1345			workload_type = smu_cmn_to_asic_specific_index(smu,
  1346								       CMN2ASIC_MAPPING_WORKLOAD,
  1347								       i);
  1348			if (workload_type < 0)
  1349				return -EINVAL;
  1350	
  1351			result = smu_cmn_update_table(smu,
  1352						  SMU_TABLE_ACTIVITY_MONITOR_COEFF, workload_type,
  1353						  (void *)(&activity_monitor_external[i]), false);
  1354			if (result) {
  1355				dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
  1356				return result;
  1357			}
  1358		}
  1359	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
