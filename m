Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED262187870;
	Thu, 12 Dec 2024 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996033; cv=none; b=WW1EqmWW/iWQI+EUWyyO8DIbpXsAqfoau8958sxQTBc8AdtxUmGmUp0SZyzLVBKH6D77tMmLMmpgIjA1ZkghCqQ5uOHfwFzTG4o9TjDZyPhrVNFVw7xoNZNTshz7yMZhPAb9MtTf2e84wK75kICUzJD0Iir1xA/3CZP0Y1ZIH0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996033; c=relaxed/simple;
	bh=PTLnU5en7xafdx0Ro/8b6rTDSwvxwT4EumfzXWljWNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAaFSwUrgh4FyJY/H0jw0oCWlobOCgiSkrX8PxSwSVjQlwj7EIT+9Ynezy11OdEv/x8ZkRBgcnrCtbSSmzRjyMmzIs7QrMLRqj0Boz8tT2cReHidd7IGKlIzgolxPwmUVi3R8LJeXL86apLpfbJKisbIw694qOEBacQqOcJB4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR9jqafJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR9jqafJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733996031; x=1765532031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PTLnU5en7xafdx0Ro/8b6rTDSwvxwT4EumfzXWljWNo=;
  b=gR9jqafJA0he+lHWildCCSnAIMMflmqzqn4oUAXxmfBw1LYLVmXUCoIc
   xmqw4zRn3q/FgDLQyBKbeWWKv6VR86NAq+M4q/KS3CifFUJBen8guTw1s
   rRKte0wBkyAkX4uCmV89xgcS1nXu04bSJN88310O+SbOYjMa7zbVSHG+g
   1ajezm05P/0z/JwqGeli0E8vBao7aCYJ/ATa5f51UfJ1Ohs+dAvGB8E9H
   E4F28j1z3bnqHrq4PvA7S+Ff9FSGbjiaCGl+HCNssKhlI1NVI2yV/sIZ4
   MjcVMNYQKi1r31E1MtErOB8JPdzISbxcFHXIe/Qn+tiT6DrBqjFkz8NbT
   Q==;
X-CSE-ConnectionGUID: +gwLy7jyR7682W2UjNSPjQ==
X-CSE-MsgGUID: 9KBseSzjQ3KkO7Iod43i7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51819353"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="51819353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:33:50 -0800
X-CSE-ConnectionGUID: RzqNVNJuTB2BHpdvgt53Kw==
X-CSE-MsgGUID: dkOjUquMSLST6YELjAHOxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="101031675"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2024 01:33:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLfZq-0007fZ-0g;
	Thu, 12 Dec 2024 09:33:46 +0000
Date: Thu, 12 Dec 2024 17:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ausef Yousof <Ausef.Yousof@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [linux-next:master 2720/3502]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6268:13:
 warning: stack frame size (3128) exceeds limit (3072) in
 'dml_prefetch_check'
Message-ID: <202412121748.chuX4sap-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e42dc9229c5950e84b1ed705f94ed75ed208228
commit: 24909d9ec7c3afa8da2f3c9afa312e7a4a61f250 [2720/3502] drm/amd/display: Overwriting dualDPP UBF values before usage
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241212/202412121748.chuX4sap-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121748.chuX4sap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121748.chuX4sap-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core_structs.h:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_lib_defines.h:46:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_depedencies.h:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:31:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6268:13: warning: stack frame size (3128) exceeds limit (3072) in 'dml_prefetch_check' [-Wframe-larger-than]
    6268 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
         |             ^
   5 warnings generated.


vim +/dml_prefetch_check +6268 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c

5b2c54e0d0ea09 Rodrigo Siqueira 2023-10-16  6267  
b141fa036c9013 Rodrigo Siqueira 2023-10-16 @6268  static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
7966f319c66d94 Qingqing Zhuo    2023-07-28  6269  {
7966f319c66d94 Qingqing Zhuo    2023-07-28  6270  	struct dml_core_mode_support_locals_st *s = &mode_lib->scratch.dml_core_mode_support_locals;
7966f319c66d94 Qingqing Zhuo    2023-07-28  6271  	struct CalculatePrefetchSchedule_params_st *CalculatePrefetchSchedule_params = &mode_lib->scratch.CalculatePrefetchSchedule_params;
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6272  	struct CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params_st *CalculateWatermarks_params = &mode_lib->scratch.CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params;
7966f319c66d94 Qingqing Zhuo    2023-07-28  6273  	struct DmlPipe *myPipe;
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6274  	dml_uint_t j, k;
7966f319c66d94 Qingqing Zhuo    2023-07-28  6275  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6276  	for (j = 0; j < 2; ++j) {
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6277  		mode_lib->ms.TimeCalc = 24 / mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
7966f319c66d94 Qingqing Zhuo    2023-07-28  6278  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6279  		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6280  			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6281  			mode_lib->ms.swath_width_luma_ub_this_state[k] = mode_lib->ms.swath_width_luma_ub_all_states[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6282  			mode_lib->ms.swath_width_chroma_ub_this_state[k] = mode_lib->ms.swath_width_chroma_ub_all_states[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6283  			mode_lib->ms.SwathWidthYThisState[k] = mode_lib->ms.SwathWidthYAllStates[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6284  			mode_lib->ms.SwathWidthCThisState[k] = mode_lib->ms.SwathWidthCAllStates[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6285  			mode_lib->ms.SwathHeightYThisState[k] = mode_lib->ms.SwathHeightYAllStates[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6286  			mode_lib->ms.SwathHeightCThisState[k] = mode_lib->ms.SwathHeightCAllStates[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6287  			mode_lib->ms.UnboundedRequestEnabledThisState = mode_lib->ms.UnboundedRequestEnabledAllStates[j];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6288  			mode_lib->ms.CompressedBufferSizeInkByteThisState = mode_lib->ms.CompressedBufferSizeInkByteAllStates[j];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6289  			mode_lib->ms.DETBufferSizeInKByteThisState[k] = mode_lib->ms.DETBufferSizeInKByteAllStates[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6290  			mode_lib->ms.DETBufferSizeYThisState[k] = mode_lib->ms.DETBufferSizeYAllStates[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6291  			mode_lib->ms.DETBufferSizeCThisState[k] = mode_lib->ms.DETBufferSizeCAllStates[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6292  		}
7966f319c66d94 Qingqing Zhuo    2023-07-28  6293  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6294  		mode_lib->ms.support.VActiveBandwithSupport[j] = CalculateVActiveBandwithSupport(
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6295  			mode_lib->ms.num_active_planes,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6296  			mode_lib->ms.ReturnBWPerState[j],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6297  			mode_lib->ms.NotUrgentLatencyHiding,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6298  			mode_lib->ms.ReadBandwidthLuma,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6299  			mode_lib->ms.ReadBandwidthChroma,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6300  			mode_lib->ms.cursor_bw,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6301  			mode_lib->ms.meta_row_bandwidth_this_state,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6302  			mode_lib->ms.dpte_row_bandwidth_this_state,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6303  			mode_lib->ms.NoOfDPPThisState,
24909d9ec7c3af Ausef Yousof     2024-11-26  6304  			mode_lib->ms.UrgentBurstFactorLuma[j],
24909d9ec7c3af Ausef Yousof     2024-11-26  6305  			mode_lib->ms.UrgentBurstFactorChroma[j],
24909d9ec7c3af Ausef Yousof     2024-11-26  6306  			mode_lib->ms.UrgentBurstFactorCursor[j]);
7966f319c66d94 Qingqing Zhuo    2023-07-28  6307  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6308  		s->VMDataOnlyReturnBWPerState = dml_get_return_bw_mbps_vm_only(
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6309  																	&mode_lib->ms.soc,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6310  																	mode_lib->ms.state.use_ideal_dram_bw_strobe,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6311  																	mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6312  																	mode_lib->ms.DCFCLKState[j],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6313  																	mode_lib->ms.state.fabricclk_mhz,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6314  																	mode_lib->ms.state.dram_speed_mts);
7966f319c66d94 Qingqing Zhuo    2023-07-28  6315  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6316  		s->HostVMInefficiencyFactor = 1;
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6317  		if (mode_lib->ms.cache_display_cfg.plane.GPUVMEnable && mode_lib->ms.cache_display_cfg.plane.HostVMEnable)
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6318  			s->HostVMInefficiencyFactor = mode_lib->ms.ReturnBWPerState[j] / s->VMDataOnlyReturnBWPerState;
7966f319c66d94 Qingqing Zhuo    2023-07-28  6319  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6320  		mode_lib->ms.ExtraLatency = CalculateExtraLatency(
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6321  				mode_lib->ms.soc.round_trip_ping_latency_dcfclk_cycles,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6322  				s->ReorderingBytes,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6323  				mode_lib->ms.DCFCLKState[j],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6324  				mode_lib->ms.TotalNumberOfActiveDPP[j],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6325  				mode_lib->ms.ip.pixel_chunk_size_kbytes,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6326  				mode_lib->ms.TotalNumberOfDCCActiveDPP[j],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6327  				mode_lib->ms.ip.meta_chunk_size_kbytes,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6328  				mode_lib->ms.ReturnBWPerState[j],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6329  				mode_lib->ms.cache_display_cfg.plane.GPUVMEnable,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6330  				mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6331  				mode_lib->ms.num_active_planes,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6332  				mode_lib->ms.NoOfDPPThisState,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6333  				mode_lib->ms.dpte_group_bytes,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6334  				s->HostVMInefficiencyFactor,
bf282eb92b8470 Daniel Miess     2023-12-20  6335  				mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6336  				mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels);
7966f319c66d94 Qingqing Zhuo    2023-07-28  6337  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6338  		s->NextMaxVStartup = s->MaxVStartupAllPlanes[j];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6339  		s->MaxVStartup = 0;
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6340  		s->AllPrefetchModeTested = true;
7966f319c66d94 Qingqing Zhuo    2023-07-28  6341  		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6342  			CalculatePrefetchMode(mode_lib->ms.policy.AllowForPStateChangeOrStutterInVBlank[k], &s->MinPrefetchMode[k], &s->MaxPrefetchMode[k]);
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6343  			s->NextPrefetchMode[k] = s->MinPrefetchMode[k];
7966f319c66d94 Qingqing Zhuo    2023-07-28  6344  		}
7966f319c66d94 Qingqing Zhuo    2023-07-28  6345  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6346  		do {
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6347  			s->MaxVStartup = s->NextMaxVStartup;
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6348  			s->AllPrefetchModeTested = true;
7966f319c66d94 Qingqing Zhuo    2023-07-28  6349  
7966f319c66d94 Qingqing Zhuo    2023-07-28  6350  			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6351  				mode_lib->ms.PrefetchMode[k] = s->NextPrefetchMode[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6352  				mode_lib->ms.TWait = CalculateTWait(
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6353  								mode_lib->ms.PrefetchMode[k],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6354  								mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6355  								mode_lib->ms.policy.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6356  								mode_lib->ms.cache_display_cfg.timing.DRRDisplay[k],
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6357  								mode_lib->ms.state.dram_clock_change_latency_us,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6358  								mode_lib->ms.state.fclk_change_latency_us,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6359  								mode_lib->ms.UrgLatency,
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6360  								mode_lib->ms.state.sr_enter_plus_exit_time_us);
7966f319c66d94 Qingqing Zhuo    2023-07-28  6361  
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6362  				myPipe = &s->myPipe;
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6363  				myPipe->Dppclk = mode_lib->ms.RequiredDPPCLKPerSurface[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6364  				myPipe->Dispclk = mode_lib->ms.RequiredDISPCLK[j];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6365  				myPipe->PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6366  				myPipe->DCFClkDeepSleep = mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6367  				myPipe->DPPPerSurface = mode_lib->ms.NoOfDPP[j][k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6368  				myPipe->ScalerEnabled = mode_lib->ms.cache_display_cfg.plane.ScalerEnabled[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6369  				myPipe->SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6370  				myPipe->BlockWidth256BytesY = mode_lib->ms.Read256BlockWidthY[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6371  				myPipe->BlockHeight256BytesY = mode_lib->ms.Read256BlockHeightY[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6372  				myPipe->BlockWidth256BytesC = mode_lib->ms.Read256BlockWidthC[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6373  				myPipe->BlockHeight256BytesC = mode_lib->ms.Read256BlockHeightC[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6374  				myPipe->InterlaceEnable = mode_lib->ms.cache_display_cfg.timing.Interlace[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6375  				myPipe->NumberOfCursors = mode_lib->ms.cache_display_cfg.plane.NumberOfCursors[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6376  				myPipe->VBlank = mode_lib->ms.cache_display_cfg.timing.VTotal[k] - mode_lib->ms.cache_display_cfg.timing.VActive[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6377  				myPipe->HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6378  				myPipe->HActive = mode_lib->ms.cache_display_cfg.timing.HActive[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6379  				myPipe->DCCEnable = mode_lib->ms.cache_display_cfg.surface.DCCEnable[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6380  				myPipe->ODMMode = mode_lib->ms.ODMModePerState[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6381  				myPipe->SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6382  				myPipe->BytePerPixelY = mode_lib->ms.BytePerPixelY[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6383  				myPipe->BytePerPixelC = mode_lib->ms.BytePerPixelC[k];
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6384  				myPipe->ProgressiveToInterlaceUnitInOPP = mode_lib->ms.ip.ptoi_supported;
b141fa036c9013 Rodrigo Siqueira 2023-10-16  6385  

:::::: The code at line 6268 was first introduced by commit
:::::: b141fa036c901303ca5659cc22e9c08f8b097892 drm/amd/display: Reduce stack size by splitting function

:::::: TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
