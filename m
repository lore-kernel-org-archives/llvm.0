Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5191A0BE0;
	Sat, 31 Jan 2026 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769877262; cv=none; b=RtgwEZWSYgFNI5IHC9UJ05/OtkM9XezfcakBiptCUUK4YZzEZJf+Y1q4EILnQv7CwU0ybcaIw11pkBBQBn6E/rTB3ma6WUUtbYWUu1WHGSN9plR+xEMjwkVB2EOptJD/tPx6x0UMIDbG//nACq8xVSwqZifuANRS9aLKN+ca65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769877262; c=relaxed/simple;
	bh=bnf95Md76DNgf1cWpsKruqT4lDnFBtUIfSIM1fE+2lI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C3TEpMoGSSGSNNMw/NRLoLQwRfs2y1DzNVLk1HywRrxXUwjzMydO/a7Y32NiRm0RTS5rrzcWSe0k+SaIfKJ/8X7hYo5eDyUn72lWN68oW9gh/jChLe6qKqiA/ixGiTDNevzkxJBldcZ9OSN19i3nwSLGL78U0qZHsHbaRnRC6x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2YTPOfM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2YTPOfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769877260; x=1801413260;
  h=date:from:to:cc:subject:message-id;
  bh=bnf95Md76DNgf1cWpsKruqT4lDnFBtUIfSIM1fE+2lI=;
  b=S2YTPOfMY4r8lPC84S0jWQqk66JZInJg1N0i3zFPhP7ZlRIkBWbalOnH
   9kTSmxAZuMgR4aNiOOrO9+J/8t5WUDbG0keDoo2Hhyc1wPgd+pNvDxqOq
   bOkWQZ3F0eGbF3gc+owo2XnhlMmCJgEBIWZ1MaNg9fcfyLjQXRC0/CbJY
   T19NWeRAMA6vpfL/TRybzr//yKQf+D4uHKU+J8xlt7SPQJfkJeuvE5hEu
   6NjEXAKZuLeRGXDwYBCZerRlZbsO6YkWwso4pOt9X14d1lr/tR3Uq6cfR
   9emYVrA7ExuuFsb3BiS0G+luQmggrbm5FCsIxsRL/UVzehvkKlA5CSMoN
   A==;
X-CSE-ConnectionGUID: 1h/uSzR1ToqDCaSGrWz1Fg==
X-CSE-MsgGUID: SYrxLdcGRTyxoMEM3yPGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="96563080"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="96563080"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 08:34:19 -0800
X-CSE-ConnectionGUID: xbVLkJF9Q+Ch7YwGHoAnhA==
X-CSE-MsgGUID: 1EmkD5g4RVCd4zqKMLg9vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="214007527"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jan 2026 08:34:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmDvL-00000000eBL-2NCh;
	Sat, 31 Jan 2026 16:34:15 +0000
Date: Sun, 01 Feb 2026 00:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:ib_improvements7 8/17]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4687:3: warning: variable 'ib' is
 uninitialized when used here
Message-ID: <202602010017.IVwlmiJb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ib_improvements7
head:   d143c0854dc1ee192d8993b3b949dc7288d2f755
commit: 68c2a1121922681ac8d09b43a322bca7e0d634cb [8/17] drm/amdgpu: switch all IPs to using job for IBs
config: x86_64-randconfig-006-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010017.IVwlmiJb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010017.IVwlmiJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010017.IVwlmiJb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4687:3: warning: variable 'ib' is uninitialized when used here [-Wuninitialized]
    4687 |                 ib->ptr[i + (vgpr_offset / 4)] = vgpr_init_shader_ptr[i];
         |                 ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4631:22: note: initialize the variable 'ib' to silence this warning
    4631 |         struct amdgpu_ib *ib;
         |                             ^
         |                              = NULL
   1 warning generated.
--
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:374:3: warning: variable 'ib' is uninitialized when used here [-Wuninitialized]
     374 |                 ib->ptr[i + (shader_offset / 4)] = shader_ptr[i];
         |                 ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:354:22: note: initialize the variable 'ib' to silence this warning
     354 |         struct amdgpu_ib *ib;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +/ib +4687 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c

  4626	
  4627	static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
  4628	{
  4629		struct amdgpu_ring *ring = &adev->gfx.compute_ring[0];
  4630		struct amdgpu_job *job;
  4631		struct amdgpu_ib *ib;
  4632		struct dma_fence *f = NULL;
  4633		int r, i;
  4634		unsigned total_size, vgpr_offset, sgpr_offset;
  4635		u64 gpu_addr;
  4636	
  4637		int compute_dim_x = adev->gfx.config.max_shader_engines *
  4638							adev->gfx.config.max_cu_per_sh *
  4639							adev->gfx.config.max_sh_per_se;
  4640		int sgpr_work_group_size = 5;
  4641		int gpr_reg_size = adev->gfx.config.max_shader_engines + 6;
  4642		int vgpr_init_shader_size;
  4643		const u32 *vgpr_init_shader_ptr;
  4644		const struct soc15_reg_entry *vgpr_init_regs_ptr;
  4645	
  4646		/* only support when RAS is enabled */
  4647		if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
  4648			return 0;
  4649	
  4650		/* bail if the compute ring is not ready */
  4651		if (!ring->sched.ready)
  4652			return 0;
  4653	
  4654		if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1)) {
  4655			vgpr_init_shader_ptr = vgpr_init_compute_shader_arcturus;
  4656			vgpr_init_shader_size = sizeof(vgpr_init_compute_shader_arcturus);
  4657			vgpr_init_regs_ptr = vgpr_init_regs_arcturus;
  4658		} else {
  4659			vgpr_init_shader_ptr = vgpr_init_compute_shader;
  4660			vgpr_init_shader_size = sizeof(vgpr_init_compute_shader);
  4661			vgpr_init_regs_ptr = vgpr_init_regs;
  4662		}
  4663	
  4664		total_size =
  4665			(gpr_reg_size * 3 + 4 + 5 + 2) * 4; /* VGPRS */
  4666		total_size +=
  4667			(gpr_reg_size * 3 + 4 + 5 + 2) * 4; /* SGPRS1 */
  4668		total_size +=
  4669			(gpr_reg_size * 3 + 4 + 5 + 2) * 4; /* SGPRS2 */
  4670		total_size = ALIGN(total_size, 256);
  4671		vgpr_offset = total_size;
  4672		total_size += ALIGN(vgpr_init_shader_size, 256);
  4673		sgpr_offset = total_size;
  4674		total_size += sizeof(sgpr_init_compute_shader);
  4675	
  4676		/* allocate an indirect buffer to put the commands in */
  4677		r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, total_size,
  4678					     AMDGPU_IB_POOL_DIRECT, &job,
  4679					     AMDGPU_KERNEL_JOB_ID_RUN_SHADER);
  4680		if (r) {
  4681			drm_err(adev_to_drm(adev), "failed to get ib (%d).\n", r);
  4682			return r;
  4683		}
  4684	
  4685		/* load the compute shaders */
  4686		for (i = 0; i < vgpr_init_shader_size/sizeof(u32); i++)
> 4687			ib->ptr[i + (vgpr_offset / 4)] = vgpr_init_shader_ptr[i];
  4688	
  4689		for (i = 0; i < ARRAY_SIZE(sgpr_init_compute_shader); i++)
  4690			ib->ptr[i + (sgpr_offset / 4)] = sgpr_init_compute_shader[i];
  4691	
  4692		/* init the ib length to 0 */
  4693		ib->length_dw = 0;
  4694	
  4695		/* VGPR */
  4696		/* write the register state for the compute dispatch */
  4697		for (i = 0; i < gpr_reg_size; i++) {
  4698			ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 1);
  4699			ib->ptr[ib->length_dw++] = SOC15_REG_ENTRY_OFFSET(vgpr_init_regs_ptr[i])
  4700									- PACKET3_SET_SH_REG_START;
  4701			ib->ptr[ib->length_dw++] = vgpr_init_regs_ptr[i].reg_value;
  4702		}
  4703		/* write the shader start address: mmCOMPUTE_PGM_LO, mmCOMPUTE_PGM_HI */
  4704		gpu_addr = (ib->gpu_addr + (u64)vgpr_offset) >> 8;
  4705		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 2);
  4706		ib->ptr[ib->length_dw++] = SOC15_REG_OFFSET(GC, 0, mmCOMPUTE_PGM_LO)
  4707								- PACKET3_SET_SH_REG_START;
  4708		ib->ptr[ib->length_dw++] = lower_32_bits(gpu_addr);
  4709		ib->ptr[ib->length_dw++] = upper_32_bits(gpu_addr);
  4710	
  4711		/* write dispatch packet */
  4712		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_DISPATCH_DIRECT, 3);
  4713		ib->ptr[ib->length_dw++] = compute_dim_x * 2; /* x */
  4714		ib->ptr[ib->length_dw++] = 1; /* y */
  4715		ib->ptr[ib->length_dw++] = 1; /* z */
  4716		ib->ptr[ib->length_dw++] =
  4717			REG_SET_FIELD(0, COMPUTE_DISPATCH_INITIATOR, COMPUTE_SHADER_EN, 1);
  4718	
  4719		/* write CS partial flush packet */
  4720		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_EVENT_WRITE, 0);
  4721		ib->ptr[ib->length_dw++] = EVENT_TYPE(7) | EVENT_INDEX(4);
  4722	
  4723		/* SGPR1 */
  4724		/* write the register state for the compute dispatch */
  4725		for (i = 0; i < gpr_reg_size; i++) {
  4726			ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 1);
  4727			ib->ptr[ib->length_dw++] = SOC15_REG_ENTRY_OFFSET(sgpr1_init_regs[i])
  4728									- PACKET3_SET_SH_REG_START;
  4729			ib->ptr[ib->length_dw++] = sgpr1_init_regs[i].reg_value;
  4730		}
  4731		/* write the shader start address: mmCOMPUTE_PGM_LO, mmCOMPUTE_PGM_HI */
  4732		gpu_addr = (ib->gpu_addr + (u64)sgpr_offset) >> 8;
  4733		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 2);
  4734		ib->ptr[ib->length_dw++] = SOC15_REG_OFFSET(GC, 0, mmCOMPUTE_PGM_LO)
  4735								- PACKET3_SET_SH_REG_START;
  4736		ib->ptr[ib->length_dw++] = lower_32_bits(gpu_addr);
  4737		ib->ptr[ib->length_dw++] = upper_32_bits(gpu_addr);
  4738	
  4739		/* write dispatch packet */
  4740		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_DISPATCH_DIRECT, 3);
  4741		ib->ptr[ib->length_dw++] = compute_dim_x / 2 * sgpr_work_group_size; /* x */
  4742		ib->ptr[ib->length_dw++] = 1; /* y */
  4743		ib->ptr[ib->length_dw++] = 1; /* z */
  4744		ib->ptr[ib->length_dw++] =
  4745			REG_SET_FIELD(0, COMPUTE_DISPATCH_INITIATOR, COMPUTE_SHADER_EN, 1);
  4746	
  4747		/* write CS partial flush packet */
  4748		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_EVENT_WRITE, 0);
  4749		ib->ptr[ib->length_dw++] = EVENT_TYPE(7) | EVENT_INDEX(4);
  4750	
  4751		/* SGPR2 */
  4752		/* write the register state for the compute dispatch */
  4753		for (i = 0; i < gpr_reg_size; i++) {
  4754			ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 1);
  4755			ib->ptr[ib->length_dw++] = SOC15_REG_ENTRY_OFFSET(sgpr2_init_regs[i])
  4756									- PACKET3_SET_SH_REG_START;
  4757			ib->ptr[ib->length_dw++] = sgpr2_init_regs[i].reg_value;
  4758		}
  4759		/* write the shader start address: mmCOMPUTE_PGM_LO, mmCOMPUTE_PGM_HI */
  4760		gpu_addr = (ib->gpu_addr + (u64)sgpr_offset) >> 8;
  4761		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 2);
  4762		ib->ptr[ib->length_dw++] = SOC15_REG_OFFSET(GC, 0, mmCOMPUTE_PGM_LO)
  4763								- PACKET3_SET_SH_REG_START;
  4764		ib->ptr[ib->length_dw++] = lower_32_bits(gpu_addr);
  4765		ib->ptr[ib->length_dw++] = upper_32_bits(gpu_addr);
  4766	
  4767		/* write dispatch packet */
  4768		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_DISPATCH_DIRECT, 3);
  4769		ib->ptr[ib->length_dw++] = compute_dim_x / 2 * sgpr_work_group_size; /* x */
  4770		ib->ptr[ib->length_dw++] = 1; /* y */
  4771		ib->ptr[ib->length_dw++] = 1; /* z */
  4772		ib->ptr[ib->length_dw++] =
  4773			REG_SET_FIELD(0, COMPUTE_DISPATCH_INITIATOR, COMPUTE_SHADER_EN, 1);
  4774	
  4775		/* write CS partial flush packet */
  4776		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_EVENT_WRITE, 0);
  4777		ib->ptr[ib->length_dw++] = EVENT_TYPE(7) | EVENT_INDEX(4);
  4778	
  4779		/* shedule the ib on the ring */
  4780		r = amdgpu_job_submit_direct(job, ring, &f);
  4781		if (r) {
  4782			drm_err(adev_to_drm(adev), "ib schedule failed (%d).\n", r);
  4783			amdgpu_job_free(job);
  4784			goto fail;
  4785		}
  4786	
  4787		/* wait for the GPU to finish processing the IB */
  4788		r = dma_fence_wait(f, false);
  4789		if (r) {
  4790			drm_err(adev_to_drm(adev), "fence wait failed (%d).\n", r);
  4791			goto fail;
  4792		}
  4793	
  4794	fail:
  4795		dma_fence_put(f);
  4796	
  4797		return r;
  4798	}
  4799	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
