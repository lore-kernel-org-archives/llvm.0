Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87C1DE2DF;
	Wed, 11 Dec 2024 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733940752; cv=none; b=TP21DqulhkYw3OtG1zOZvuOyWMPOYdq8xz9Cmwf8P7fRr/MjNLcJ0GgN3k2hkCU6NOdbQRPQJG88mK/a1eLvkhF1O+/PpFKjx9+H4Bdu43daI/ebImadA0wm4ic+mOGWcMtRkoAJk5h1TJ+gpJa48+tYibOhnC+ztCpjgwemTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733940752; c=relaxed/simple;
	bh=Mf7GkJjGkt2JSWnTUAizF7N8btKeN4+sAHrltHpx65c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQvMEauC6c0T0ZFywoW5GVmfAkzBkNILJa712Oaru6Wz6x1CyTgVsYmogpCTVFu79OIn+c75lPXS7w+n1dgk3Zmdms6ulKNZgdtRsZnU/3mQKsMCZ3msuC65Rhrwcqz4LzNP6v2ZoeWtRdnCEYQXHTwm1b7A2sQHKbBZiex+pIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItHCi9sY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItHCi9sY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733940751; x=1765476751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mf7GkJjGkt2JSWnTUAizF7N8btKeN4+sAHrltHpx65c=;
  b=ItHCi9sYzC6z9ZHqNsMV21HwWw8Kgml157BReX9Kn/xXd4ul4s7B2J1j
   ueApGaRYwP2vgHRnzsObPHLFkbg/PuhjJhjUW8vzdOtNzbolQSm0ySaXe
   XyES7kBIjZHBv9/VAUJeBZEpYkqpIQu7m/KZD+QUSntYMTs1l1G4fu2tO
   WwN4wyFG/+PdWb2p8FMy+rzD7ifbwY5JrG53Gj4IJ6WZm9k9nNyErS27q
   XaCRSdl6tazyw2lmqjLUi/kFPESdIgN6f9GL++duW6cQRUU1gi+EbBDs9
   BecIlm5g9Vtu+IjBPCPwCjGjkJGin+N6nnp0kWUletNE45uPfZRiO0/PD
   A==;
X-CSE-ConnectionGUID: hyjtuWsiTNmTJry3pm/kvw==
X-CSE-MsgGUID: S0Lfkn6TT2WNiNyjCTLi9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51748723"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="51748723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 10:12:30 -0800
X-CSE-ConnectionGUID: w1JJMNQcRIGT3WD+wzxjrg==
X-CSE-MsgGUID: y02M2BNrSherz02dZ3hUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100849348"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2024 10:12:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLRCD-0006yH-2w;
	Wed, 11 Dec 2024 18:12:25 +0000
Date: Thu, 12 Dec 2024 02:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sonny Jiang <sonjiang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 2910/3192]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c:560:12: warning: stack frame size
 (2576) exceeds limit (2048) in 'vcn_v5_0_1_start'
Message-ID: <202412120216.XAgRfNLD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: 346492f30ce3581bf5324c4ae417eab8537dc998 [2910/3192] drm/amdgpu: Add VCN_5_0_1 support
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241212/202412120216.XAgRfNLD-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120216.XAgRfNLD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120216.XAgRfNLD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c:560:12: warning: stack frame size (2576) exceeds limit (2048) in 'vcn_v5_0_1_start' [-Wframe-larger-than]
   static int vcn_v5_0_1_start(struct amdgpu_device *adev)
              ^
   2443/2576 (94.84%) spills, 133/2576 (5.16%) variables
   1 warning generated.


vim +/vcn_v5_0_1_start +560 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c

   552	
   553	/**
   554	 * vcn_v5_0_1_start - VCN start
   555	 *
   556	 * @adev: amdgpu_device pointer
   557	 *
   558	 * Start VCN block
   559	 */
 > 560	static int vcn_v5_0_1_start(struct amdgpu_device *adev)
   561	{
   562		volatile struct amdgpu_vcn4_fw_shared *fw_shared;
   563		struct amdgpu_ring *ring;
   564		uint32_t tmp;
   565		int i, j, k, r, vcn_inst;
   566	
   567		if (adev->pm.dpm_enabled)
   568			amdgpu_dpm_enable_uvd(adev, true);
   569	
   570		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
   571			fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
   572	
   573			if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
   574				r = vcn_v5_0_1_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
   575				continue;
   576			}
   577	
   578			vcn_inst = GET_INST(VCN, i);
   579	
   580			/* set VCN status busy */
   581			tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_STATUS) | UVD_STATUS__UVD_BUSY;
   582			WREG32_SOC15(VCN, vcn_inst, regUVD_STATUS, tmp);
   583	
   584			/* enable VCPU clock */
   585			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL),
   586				UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
   587	
   588			/* disable master interrupt */
   589			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_MASTINT_EN), 0,
   590				~UVD_MASTINT_EN__VCPU_EN_MASK);
   591	
   592			/* enable LMI MC and UMC channels */
   593			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_LMI_CTRL2), 0,
   594				~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
   595	
   596			tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET);
   597			tmp &= ~UVD_SOFT_RESET__LMI_SOFT_RESET_MASK;
   598			tmp &= ~UVD_SOFT_RESET__LMI_UMC_SOFT_RESET_MASK;
   599			WREG32_SOC15(VCN, vcn_inst, regUVD_SOFT_RESET, tmp);
   600	
   601			/* setup regUVD_LMI_CTRL */
   602			tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL);
   603			WREG32_SOC15(VCN, vcn_inst, regUVD_LMI_CTRL, tmp |
   604				UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK |
   605				UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
   606				UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
   607				UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
   608	
   609			vcn_v5_0_1_mc_resume(adev, i);
   610	
   611			/* VCN global tiling registers */
   612			WREG32_SOC15(VCN, vcn_inst, regUVD_GFX10_ADDR_CONFIG,
   613				adev->gfx.config.gb_addr_config);
   614	
   615			/* unblock VCPU register access */
   616			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_RB_ARB_CTRL), 0,
   617				~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
   618	
   619			/* release VCPU reset to boot */
   620			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL), 0,
   621				~UVD_VCPU_CNTL__BLK_RST_MASK);
   622	
   623			for (j = 0; j < 10; ++j) {
   624				uint32_t status;
   625	
   626				for (k = 0; k < 100; ++k) {
   627					status = RREG32_SOC15(VCN, vcn_inst, regUVD_STATUS);
   628					if (status & 2)
   629						break;
   630					mdelay(100);
   631					if (amdgpu_emu_mode == 1)
   632						msleep(20);
   633				}
   634	
   635				if (amdgpu_emu_mode == 1) {
   636					r = -1;
   637					if (status & 2) {
   638						r = 0;
   639						break;
   640					}
   641				} else {
   642					r = 0;
   643					if (status & 2)
   644						break;
   645	
   646					dev_err(adev->dev,
   647					    "VCN[%d] is not responding, trying to reset the VCPU!!!\n", i);
   648					WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL),
   649								UVD_VCPU_CNTL__BLK_RST_MASK,
   650								~UVD_VCPU_CNTL__BLK_RST_MASK);
   651					mdelay(10);
   652					WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_VCPU_CNTL), 0,
   653								~UVD_VCPU_CNTL__BLK_RST_MASK);
   654	
   655					mdelay(10);
   656					r = -1;
   657				}
   658			}
   659	
   660			if (r) {
   661				dev_err(adev->dev, "VCN[%d] is not responding, giving up!!!\n", i);
   662				return r;
   663			}
   664	
   665			/* enable master interrupt */
   666			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_MASTINT_EN),
   667					UVD_MASTINT_EN__VCPU_EN_MASK,
   668					~UVD_MASTINT_EN__VCPU_EN_MASK);
   669	
   670			/* clear the busy bit of VCN_STATUS */
   671			WREG32_P(SOC15_REG_OFFSET(VCN, vcn_inst, regUVD_STATUS), 0,
   672				~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
   673	
   674			ring = &adev->vcn.inst[i].ring_enc[0];
   675	
   676			WREG32_SOC15(VCN, vcn_inst, regVCN_RB1_DB_CTRL,
   677				ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
   678				VCN_RB1_DB_CTRL__EN_MASK);
   679	
   680			/* Read DB_CTRL to flush the write DB_CTRL command. */
   681			RREG32_SOC15(VCN, vcn_inst, regVCN_RB1_DB_CTRL);
   682	
   683			WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_LO, ring->gpu_addr);
   684			WREG32_SOC15(VCN, vcn_inst, regUVD_RB_BASE_HI, upper_32_bits(ring->gpu_addr));
   685			WREG32_SOC15(VCN, vcn_inst, regUVD_RB_SIZE, ring->ring_size / 4);
   686	
   687			tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
   688			tmp &= ~(VCN_RB_ENABLE__RB1_EN_MASK);
   689			WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
   690			fw_shared->sq.queue_mode |= FW_QUEUE_RING_RESET;
   691			WREG32_SOC15(VCN, vcn_inst, regUVD_RB_RPTR, 0);
   692			WREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR, 0);
   693	
   694			tmp = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_RPTR);
   695			WREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR, tmp);
   696			ring->wptr = RREG32_SOC15(VCN, vcn_inst, regUVD_RB_WPTR);
   697	
   698			tmp = RREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE);
   699			tmp |= VCN_RB_ENABLE__RB1_EN_MASK;
   700			WREG32_SOC15(VCN, vcn_inst, regVCN_RB_ENABLE, tmp);
   701			fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
   702		}
   703	
   704		return 0;
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
