Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C310A19;
	Tue, 13 Feb 2024 18:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707850395; cv=none; b=OygNb+mXzLqKRGkIv6qwDhKNhyfbcMKSSawxBF/B5vwo4GVsFAQcBc1TSsrwD9DdO/BThbmsj2c8AM0q6xn4txJ8y7WnvlmulJUptCoX236wSU5kc28SsAb1Y8ONOGmSt4nu5e8BfVGmeCw9oNZ/h7XOk+SwSgw+GWZynp9VYaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707850395; c=relaxed/simple;
	bh=WvrOSKzDb/QYARjcr4xYBp2foTGTX0KofFoWltDye/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IZRTocw1o83IL5qbWvgaYXF4ealhcuSCrRl/AXPv8U6p/i+Ha1DCMqp9tdRIm8yZbKrHybbzmAy7jp+sGFoBpv2uehkxiw/KbpF3IRbexmln4iHFqWvvQZimFIMoB9YkbBJyjM+ObMUbudTnqsBQrzQyJ3bD3bW/iwKTFZmUvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNUKEV9y; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNUKEV9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707850393; x=1739386393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvrOSKzDb/QYARjcr4xYBp2foTGTX0KofFoWltDye/c=;
  b=CNUKEV9y+zLGmYEkwnSGpvq5gj+51GTcfAUmkn/C/bva5MmlzQuk7noW
   AaqKXNiloWHFEqrcfOyg9l2ny2fwEPEMaUVjYKNhQJm+GAsc4fuKDODLg
   JciXaDBEnXFrRNPD2vI+tNILU+SbzHKXw27HL1Go2YJ6f9GVstPg9ahBY
   XM3EuEwTcvShpZ7T/7IJSE7peFgJ1ohj42fHZcbMgAor2wVC2X2rYjvHS
   3tnXkyyAxN6yZzhqWa5WE8iUT9IJVsBB/HScB7ZUbFR6c0wkUfyjJ7WfN
   Y0V4UtUXF5o0SEvAn4vHcF3MuaSRpgnTMRbGc7UFK3eWbChIrEXIuuwp3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="396308587"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="396308587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 10:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="34035162"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2024 10:53:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZxu0-0007zy-2Q;
	Tue, 13 Feb 2024 18:53:08 +0000
Date: Wed, 14 Feb 2024 02:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sonny Jiang <sonny.jiang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Subject: [agd5f:drm-next 358/374]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:713:12: warning: stack frame size
 (2992) exceeds limit (2048) in 'vcn_v5_0_0_start'
Message-ID: <202402140203.PIO7EJSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   ce311df91d73eaddc5489d4d63fb96c21e80f7cf
commit: b6d1a06320519ac3bfda6ce81067a1bc409b9cff [358/374] drm/amdgpu: add VCN_5_0_0 IP block support
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240214/202402140203.PIO7EJSa-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140203.PIO7EJSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140203.PIO7EJSa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:713:12: warning: stack frame size (2992) exceeds limit (2048) in 'vcn_v5_0_0_start' [-Wframe-larger-than]
     713 | static int vcn_v5_0_0_start(struct amdgpu_device *adev)
         |            ^
   1 warning generated.


vim +/vcn_v5_0_0_start +713 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c

   705	
   706	/**
   707	 * vcn_v5_0_0_start - VCN start
   708	 *
   709	 * @adev: amdgpu_device pointer
   710	 *
   711	 * Start VCN block
   712	 */
 > 713	static int vcn_v5_0_0_start(struct amdgpu_device *adev)
   714	{
   715		volatile struct amdgpu_vcn4_fw_shared *fw_shared;
   716		struct amdgpu_ring *ring;
   717		uint32_t tmp;
   718		int i, j, k, r;
   719	
   720		if (adev->pm.dpm_enabled)
   721			amdgpu_dpm_enable_uvd(adev, true);
   722	
   723		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
   724			fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
   725	
   726			if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
   727				r = vcn_v5_0_0_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
   728				continue;
   729			}
   730	
   731			/* disable VCN power gating */
   732			vcn_v5_0_0_disable_static_power_gating(adev, i);
   733	
   734			/* set VCN status busy */
   735			tmp = RREG32_SOC15(VCN, i, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
   736			WREG32_SOC15(VCN, i, regUVD_STATUS, tmp);
   737	
   738			/* enable VCPU clock */
   739			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
   740				UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
   741	
   742			/* disable master interrupt */
   743			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN), 0,
   744				~UVD_MASTINT_EN__VCPU_EN_MASK);
   745	
   746			/* enable LMI MC and UMC channels */
   747			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_LMI_CTRL2), 0,
   748				~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
   749	
   750			tmp = RREG32_SOC15(VCN, i, regUVD_SOFT_RESET);
   751			tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
   752			tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
   753			WREG32_SOC15(VCN, i, regUVD_SOFT_RESET, tmp);
   754	
   755			/* setup regUVD_LMI_CTRL */
   756			tmp = RREG32_SOC15(VCN, i, regUVD_LMI_CTRL);
   757			WREG32_SOC15(VCN, i, regUVD_LMI_CTRL, tmp |
   758				UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
   759				UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
   760				UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
   761				UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
   762	
   763			vcn_v5_0_0_mc_resume(adev, i);
   764	
   765			/* VCN global tiling registers */
   766			WREG32_SOC15(VCN, i, regUVD_GFX10_ADDR_CONFIG,
   767				adev->gfx.config.gb_addr_config);
   768	
   769			/* unblock VCPU register access */
   770			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_RB_ARB_CTRL), 0,
   771				~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
   772	
   773			/* release VCPU reset to boot */
   774			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
   775				~UVD_VCPU_CNTL__BLK_RST_MASK);
   776	
   777			for (j = 0; j < 10; ++j) {
   778				uint32_t status;
   779	
   780				for (k = 0; k < 100; ++k) {
   781					status = RREG32_SOC15(VCN, i, regUVD_STATUS);
   782					if (status & 2)
   783						break;
   784					mdelay(10);
   785					if (amdgpu_emu_mode == 1)
   786						msleep(1);
   787				}
   788	
   789				if (amdgpu_emu_mode == 1) {
   790					r = -1;
   791					if (status & 2) {
   792						r = 0;
   793						break;
   794					}
   795				} else {
   796					r = 0;
   797					if (status & 2)
   798						break;
   799	
   800					dev_err(adev->dev,
   801						"VCN[%d] is not responding, trying to reset the VCPU!!!\n", i);
   802					WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL),
   803								UVD_VCPU_CNTL__BLK_RST_MASK,
   804								~UVD_VCPU_CNTL__BLK_RST_MASK);
   805					mdelay(10);
   806					WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_VCPU_CNTL), 0,
   807								~UVD_VCPU_CNTL__BLK_RST_MASK);
   808	
   809					mdelay(10);
   810					r = -1;
   811				}
   812			}
   813	
   814			if (r) {
   815				dev_err(adev->dev, "VCN[%d] is not responding, giving up!!!\n", i);
   816				return r;
   817			}
   818	
   819			/* enable master interrupt */
   820			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_MASTINT_EN),
   821					UVD_MASTINT_EN__VCPU_EN_MASK,
   822					~UVD_MASTINT_EN__VCPU_EN_MASK);
   823	
   824			/* clear the busy bit of VCN_STATUS */
   825			WREG32_P(SOC15_REG_OFFSET(VCN, i, regUVD_STATUS), 0,
   826				~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
   827	
   828			ring = &adev->vcn.inst[i].ring_enc[0];
   829			WREG32_SOC15(VCN, i, regVCN_RB1_DB_CTRL,
   830				ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
   831				VCN_RB1_DB_CTRL__EN_MASK);
   832	
   833			WREG32_SOC15(VCN, i, regUVD_RB_BASE_LO, ring->gpu_addr);
   834			WREG32_SOC15(VCN, i, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
   835			WREG32_SOC15(VCN, i, regUVD_RB_SIZE, ring->ring_size / 4);
   836	
   837			tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
   838			tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
   839			WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
   840			fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
   841			WREG32_SOC15(VCN, i, regUVD_RB_RPTR, 0);
   842			WREG32_SOC15(VCN, i, regUVD_RB_WPTR, 0);
   843	
   844			tmp = RREG32_SOC15(VCN, i, regUVD_RB_RPTR);
   845			WREG32_SOC15(VCN, i, regUVD_RB_WPTR, tmp);
   846			ring->wptr = RREG32_SOC15(VCN, i, regUVD_RB_WPTR);
   847	
   848			tmp = RREG32_SOC15(VCN, i, regVCN_RB_ENABLE);
   849			tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
   850			WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
   851			fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
   852		}
   853	
   854		return 0;
   855	}
   856	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
