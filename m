Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA0925568;
	Sat, 24 Feb 2024 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708786750; cv=none; b=tfd9PtoXdVb2SBEQoWzZjRTomp0xncpbefGu0SWBe7grvoG4myvwPOsreMt3hdz6pfFDemiJI64c6PjrGuE2yVkCb0fOYhegnFoZvl1ymVht5LHJzZdGHqllDZ/m+Qt3ylu5bca0YOpOAuKovX2ScJARgLEZiNSStHDAWVsOzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708786750; c=relaxed/simple;
	bh=37oIykUMwCgqrO0MUp++QF611c+Fdm4SI3WpcvKgTjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BG+GpQ2Acy2K06MEhfC2jXZCTBJTUoNEFbF0C3iAz9zFp1sUjlQGcnpTMzBU10hRK8vWFoONTyNKDbD15pbVFmJjQD0yKegdPJcICIMUXwcZap2+HdSNAI4DGOf1zoMlRh1YsxeG/8KMiY4PrhlbIMW5/7cNlcgjwxGuplJDAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbcsVn7A; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbcsVn7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708786749; x=1740322749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37oIykUMwCgqrO0MUp++QF611c+Fdm4SI3WpcvKgTjg=;
  b=GbcsVn7APosqZfRL3S2mij4Mmn/81lnukDk88du3Lh+H7JdsVajRzrc8
   L+FGq2SjYc2bnabHHukZEJ60D15emDRCY0Mytv7TCMDdqJKtbiFdVkx76
   yxzVxGcumrwGsviODtBHU1N8i4lvyn2PuDZSEacrvKy7S47B8RREOLZxE
   GZTi8NXb0Z2x7wFHGaDx3Lfc22adDuMHSlYNJMw4w6A+cfoNiI2uTB+2L
   VK7FxIDEzxljCcYFjFGkxTIRzM9UYCbYqoqIQ9rHfX3mkO4MWtMTspCth
   rskE535J34fTZ5xUlKYhLn/elbjFfuJduax5RMZHUFbrxloHFYPgMBrUA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3026347"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3026347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 06:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="36992716"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2024 06:59:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdtUX-0008ca-06;
	Sat, 24 Feb 2024 14:59:05 +0000
Date: Sat, 24 Feb 2024 22:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Clark <robdclark@chromium.org>
Subject: [drm-msm:msm-next-robclark 13/14]
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable 'out'
 set but not used
Message-ID: <202402242226.RxSIdzCv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-robclark
head:   d43c750b8d20e447a136f278a4d825340d78dd2a
commit: 10f0f9c18a86f8936408c1adae426689418876ba [13/14] drm/msm: More fully implement devcoredump for a7xx
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240224/202402242226.RxSIdzCv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242226.RxSIdzCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242226.RxSIdzCv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable 'out' set but not used [-Wunused-but-set-variable]
           u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
               ^
   1 warning generated.


vim +/out +843 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c

   834	
   835	/* Read a shader / debug block from the HLSQ aperture with the crashdumper */
   836	static void a6xx_get_shader_block(struct msm_gpu *gpu,
   837			struct a6xx_gpu_state *a6xx_state,
   838			const struct a6xx_shader_block *block,
   839			struct a6xx_gpu_state_obj *obj,
   840			struct a6xx_crashdumper *dumper)
   841	{
   842		u64 *in = dumper->ptr;
 > 843		u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
   844		size_t datasize = block->size * A6XX_NUM_SHADER_BANKS * sizeof(u32);
   845		int i;
   846	
   847		if (WARN_ON(datasize > A6XX_CD_DATA_SIZE))
   848			return;
   849	
   850		for (i = 0; i < A6XX_NUM_SHADER_BANKS; i++) {
   851			in += CRASHDUMP_WRITE(in, REG_A6XX_HLSQ_DBG_READ_SEL,
   852				(block->type << 8) | i);
   853	
   854			in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
   855				block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
   856	
   857			out += block->size * sizeof(u32);
   858		}
   859	
   860		CRASHDUMP_FINI(in);
   861	
   862		if (a6xx_crashdumper_run(gpu, dumper))
   863			return;
   864	
   865		obj->handle = block;
   866		obj->data = state_kmemdup(a6xx_state, dumper->ptr + A6XX_CD_DATA_OFFSET,
   867			datasize);
   868	}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
