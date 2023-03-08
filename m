Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF758BF3;
	Wed,  8 Mar 2023 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678304941; x=1709840941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbGgAYPO/gtMZnRKV5/houoCHlGpOPxXJCipya3+dTQ=;
  b=NlwCqWj7ftUM81BPiIZEsx5/36HFbdM6BUNIgKHJob+nn58e02uLwrd/
   CUsDuuPnzBeXhp2fesk6A0bLRUf/IMMrn4PcX11pgtkp4siRn0LLZbezN
   1e1NUSPsx0hdmTVmJdKLcCGBLpwER8xo2YAvJvAti4QyBw6nv0pmw34K6
   BEiSArbISItmj9rvX1a5zeiah57QT/vsjfBe9vA9OQmy1LBOPlDI7o/4Q
   rtQe9gKZ8mQwWTlCMAPIqHEdxsOskibojAS08yk6q1MnecTa6D9ZabWzx
   BXhyUxYHY7zhMzCkft7pGYuRI9k95KKHJYfTOxNuxRUQD5gVcWgaPM2EJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333727798"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="333727798"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709558259"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="709558259"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2023 11:48:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzmS-0002NF-1m;
	Wed, 08 Mar 2023 19:48:56 +0000
Date: Thu, 9 Mar 2023 03:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9869/9999]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4433:14:
 warning: performing pointer subtraction with a null pointer has undefined
 behavior
Message-ID: <202303090323.Z90vx3vc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d9b4a0c83a2d405dd85bf32d672686146b9bedff
commit: f1cb549bcd0b0a5fe8a845632b95359992eb0fae [9869/9999] drm/amd/display: Properly handle additional cases where DCN is not supported
config: arm64-randconfig-r013-20230308 (https://download.01.org/0day-ci/archive/20230309/202303090323.Z90vx3vc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=f1cb549bcd0b0a5fe8a845632b95359992eb0fae
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout f1cb549bcd0b0a5fe8a845632b95359992eb0fae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090323.Z90vx3vc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4433:14: warning: performing pointer subtraction with a null pointer has undefined behavior [-Wnull-pointer-subtraction]
           int index = GetIndexIntoMasterTable(DATA, Object_Header);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/atombios.h:7151:132: note: expanded from macro 'GetIndexIntoMasterTable'
   #define   GetIndexIntoMasterTable(MasterOrData, FieldName) (((char*)(&((ATOM_MASTER_LIST_OF_##MasterOrData##_TABLES*)0)->FieldName)-(char*)0)/sizeof(USHORT))
                                                                                                                                      ^~~~~~~~~
   1 warning generated.


vim +4433 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  4427	
  4428	static int dm_early_init(void *handle)
  4429	{
  4430		struct amdgpu_device *adev = (struct amdgpu_device *)handle;
  4431		struct amdgpu_mode_info *mode_info = &adev->mode_info;
  4432		struct atom_context *ctx = mode_info->atom_context;
> 4433		int index = GetIndexIntoMasterTable(DATA, Object_Header);
  4434		u16 data_offset;
  4435	
  4436		/* if there is no object header, skip DM */
  4437		if (!amdgpu_atom_parse_data_header(ctx, index, NULL, NULL, NULL, &data_offset)) {
  4438			adev->harvest_ip_mask |= AMD_HARVEST_IP_DMU_MASK;
  4439			dev_info(adev->dev, "No object header, skipping DM\n");
  4440			return -ENOENT;
  4441		}
  4442	
  4443		switch (adev->asic_type) {
  4444	#if defined(CONFIG_DRM_AMD_DC_SI)
  4445		case CHIP_TAHITI:
  4446		case CHIP_PITCAIRN:
  4447		case CHIP_VERDE:
  4448			adev->mode_info.num_crtc = 6;
  4449			adev->mode_info.num_hpd = 6;
  4450			adev->mode_info.num_dig = 6;
  4451			break;
  4452		case CHIP_OLAND:
  4453			adev->mode_info.num_crtc = 2;
  4454			adev->mode_info.num_hpd = 2;
  4455			adev->mode_info.num_dig = 2;
  4456			break;
  4457	#endif
  4458		case CHIP_BONAIRE:
  4459		case CHIP_HAWAII:
  4460			adev->mode_info.num_crtc = 6;
  4461			adev->mode_info.num_hpd = 6;
  4462			adev->mode_info.num_dig = 6;
  4463			break;
  4464		case CHIP_KAVERI:
  4465			adev->mode_info.num_crtc = 4;
  4466			adev->mode_info.num_hpd = 6;
  4467			adev->mode_info.num_dig = 7;
  4468			break;
  4469		case CHIP_KABINI:
  4470		case CHIP_MULLINS:
  4471			adev->mode_info.num_crtc = 2;
  4472			adev->mode_info.num_hpd = 6;
  4473			adev->mode_info.num_dig = 6;
  4474			break;
  4475		case CHIP_FIJI:
  4476		case CHIP_TONGA:
  4477			adev->mode_info.num_crtc = 6;
  4478			adev->mode_info.num_hpd = 6;
  4479			adev->mode_info.num_dig = 7;
  4480			break;
  4481		case CHIP_CARRIZO:
  4482			adev->mode_info.num_crtc = 3;
  4483			adev->mode_info.num_hpd = 6;
  4484			adev->mode_info.num_dig = 9;
  4485			break;
  4486		case CHIP_STONEY:
  4487			adev->mode_info.num_crtc = 2;
  4488			adev->mode_info.num_hpd = 6;
  4489			adev->mode_info.num_dig = 9;
  4490			break;
  4491		case CHIP_POLARIS11:
  4492		case CHIP_POLARIS12:
  4493			adev->mode_info.num_crtc = 5;
  4494			adev->mode_info.num_hpd = 5;
  4495			adev->mode_info.num_dig = 5;
  4496			break;
  4497		case CHIP_POLARIS10:
  4498		case CHIP_VEGAM:
  4499			adev->mode_info.num_crtc = 6;
  4500			adev->mode_info.num_hpd = 6;
  4501			adev->mode_info.num_dig = 6;
  4502			break;
  4503		case CHIP_VEGA10:
  4504		case CHIP_VEGA12:
  4505		case CHIP_VEGA20:
  4506			adev->mode_info.num_crtc = 6;
  4507			adev->mode_info.num_hpd = 6;
  4508			adev->mode_info.num_dig = 6;
  4509			break;
  4510	#if defined(CONFIG_DRM_AMD_DC_DCN)
  4511		case CHIP_RAVEN:
  4512		case CHIP_RENOIR:
  4513		case CHIP_VANGOGH:
  4514			adev->mode_info.num_crtc = 4;
  4515			adev->mode_info.num_hpd = 4;
  4516			adev->mode_info.num_dig = 4;
  4517			break;
  4518		case CHIP_NAVI10:
  4519		case CHIP_NAVI12:
  4520		case CHIP_SIENNA_CICHLID:
  4521		case CHIP_NAVY_FLOUNDER:
  4522			adev->mode_info.num_crtc = 6;
  4523			adev->mode_info.num_hpd = 6;
  4524			adev->mode_info.num_dig = 6;
  4525			break;
  4526		case CHIP_YELLOW_CARP:
  4527			adev->mode_info.num_crtc = 4;
  4528			adev->mode_info.num_hpd = 4;
  4529			adev->mode_info.num_dig = 4;
  4530			break;
  4531		case CHIP_NAVI14:
  4532		case CHIP_DIMGREY_CAVEFISH:
  4533			adev->mode_info.num_crtc = 5;
  4534			adev->mode_info.num_hpd = 5;
  4535			adev->mode_info.num_dig = 5;
  4536			break;
  4537		case CHIP_BEIGE_GOBY:
  4538			adev->mode_info.num_crtc = 2;
  4539			adev->mode_info.num_hpd = 2;
  4540			adev->mode_info.num_dig = 2;
  4541			break;
  4542	#endif
  4543		default:
  4544			DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
  4545			return -EINVAL;
  4546		}
  4547	
  4548		amdgpu_dm_set_irq_funcs(adev);
  4549	
  4550		if (adev->mode_info.funcs == NULL)
  4551			adev->mode_info.funcs = &dm_display_funcs;
  4552	
  4553		/*
  4554		 * Note: Do NOT change adev->audio_endpt_rreg and
  4555		 * adev->audio_endpt_wreg because they are initialised in
  4556		 * amdgpu_device_init()
  4557		 */
  4558	#if defined(CONFIG_DEBUG_KERNEL_DC)
  4559		device_create_file(
  4560			adev_to_drm(adev)->dev,
  4561			&dev_attr_s3_debug);
  4562	#endif
  4563	
  4564		return 0;
  4565	}
  4566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
