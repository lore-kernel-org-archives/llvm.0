Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77989137B;
	Sat, 10 Jun 2023 00:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686355383; x=1717891383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHrUFX0U46K1wbQS7/+JiqCv8DGIbqklS6Ui5kHHCdo=;
  b=M+Zf1YkvRoss0fuj0wSAuKTMMTJU/kqh4gb26Lf+uGWhL03f0dQEKMfT
   rH99msRtCGk/OvI17lghV1eAWURytR/kHD2F5gVKJmOWJj6OcPRwOuQ80
   9z5GtgYIfN1z969BOPRa8jsVIxmBurRMcPqWwsqumxdCSO2CmcLUYO+qp
   kJ6CcFkH7/9c5C0sfPimUmHBTfDhGtKBKQA7AhR+PtRG4/G/evcXE2ufe
   SKTJ0t8yBAs4NT6iV3MszLv1rtLN052CTU1jD5mKbtUoA0d3DGsGaqQch
   lwnxwqbxdGj5x6usLPg0UeACvbWl3YCqBenxHzuH5EDVnKFkWVT6/bVjK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347355327"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="347355327"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854902413"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="854902413"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 17:02:58 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7m4H-0009W8-1s;
	Sat, 10 Jun 2023 00:02:57 +0000
Date: Sat, 10 Jun 2023 08:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Liu <leo.liu@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	James Zhu <James.Zhu@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1303:12: warning: stack frame
 size (3536) exceeds limit (2048) in 'vcn_v4_0_stop'
Message-ID: <202306100755.2Kmzf3xm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   64569520920a3ca5d456ddd9f4f95fc6ea9b8b45
commit: 8da1170a16e4d4b49fa07d1f75ad480847ff7eca drm/amdgpu: add VCN4 ip block support
date:   1 year, 1 month ago
config: riscv-randconfig-r012-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100755.2Kmzf3xm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8da1170a16e4d4b49fa07d1f75ad480847ff7eca
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8da1170a16e4d4b49fa07d1f75ad480847ff7eca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/ lib/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100755.2Kmzf3xm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1303:12: warning: stack frame size (3536) exceeds limit (2048) in 'vcn_v4_0_stop' [-Wframe-larger-than]
   static int vcn_v4_0_stop(struct amdgpu_device *adev)
              ^
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1057:12: warning: stack frame size (8896) exceeds limit (2048) in 'vcn_v4_0_start' [-Wframe-larger-than]
   static int vcn_v4_0_start(struct amdgpu_device *adev)
              ^
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:887:12: warning: stack frame size (3056) exceeds limit (2048) in 'vcn_v4_0_start_dpg_mode' [-Wframe-larger-than]
   static int vcn_v4_0_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
              ^
   3 warnings generated.


vim +/vcn_v4_0_stop +1303 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

  1295	
  1296	/**
  1297	 * vcn_v4_0_stop - VCN stop
  1298	 *
  1299	 * @adev: amdgpu_device pointer
  1300	 *
  1301	 * Stop VCN block
  1302	 */
> 1303	static int vcn_v4_0_stop(struct amdgpu_device *adev)
  1304	{
  1305		uint32_t tmp;
  1306		int i, r = 0;
  1307	
  1308		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
  1309			if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
  1310				r = vcn_v4_0_stop_dpg_mode(adev, i);
  1311				continue;
  1312			}
  1313	
  1314			/* wait for vcn idle */
  1315			r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
  1316			if (r)
  1317				return r;
  1318	
  1319			tmp = UVD_LMI_STATUS__VCPU_LMI_WRITE_CLEAN_MASK |
  1320				UVD_LMI_STATUS__READ_CLEAN_MASK |
  1321				UVD_LMI_STATUS__WRITE_CLEAN_MASK |
  1322				UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
  1323			r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
  1324			if (r)
  1325				return r;
  1326	
  1327			/* disable LMI UMC channel */
  1328			tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL2);
  1329			tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
  1330			WREG32_SOC15(VCN, i, regUVD_LMI_CTRL2, tmp);
  1331			tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK |
  1332				UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
  1333			r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_LMI_STATUS, tmp, tmp);
  1334			if (r)
  1335				return r;
  1336	
  1337			/* block VCPU register access */
  1338			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL),
  1339					UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
  1340					~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
  1341	
  1342			/* reset VCPU */
  1343			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
  1344					UVD_VCPU_CNTL__BLK_RST_MASK,
  1345					~UVD_VCPU_CNTL__BLK_RST_MASK);
  1346	
  1347			/* disable VCPU clock */
  1348			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
  1349					~(UVD_VCPU_CNTL__CLK_EN_MASK));
  1350	
  1351			/* apply soft reset */
  1352			tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
  1353			tmp |= UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
  1354			WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
  1355			tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
  1356			tmp |= UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
  1357			WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
  1358	
  1359			/* clear status */
  1360			WREG32_SOC15(VCN, i, regUVD_STATUS, 0);
  1361	
  1362			/* apply HW clock gating */
  1363			vcn_v4_0_enable_clock_gating(adev, i);
  1364	
  1365			/* enable VCN power gating */
  1366			vcn_v4_0_enable_static_power_gating(adev, i);
  1367		}
  1368	
  1369		if (adev->pm.dpm_enabled)
  1370			amdgpu_dpm_enable_uvd(adev, false);
  1371	
  1372		return 0;
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
