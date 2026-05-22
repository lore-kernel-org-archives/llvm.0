Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900F5361DC0;
	Fri, 22 May 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473796; cv=none; b=po0ipskcvVVcHF0Qdy36sWU+YhjBDgRbM9TvDBDJ7RhMawPa7qWKX+oDBEq+sfs6MLRvASTmhk/BDWBGw/CrsQxUJKIGRNeo1PgFxFpMRDSuWRVeNgIwVZDRpFMeV7tLwx8w/YgpNH+WmIqWZKK4Lo7gvUlnGbkj/ZVIOk4CduE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473796; c=relaxed/simple;
	bh=VMXR+M2pwwm5P/++6qF/73JXZ0wE7yNam/co+QLUm/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rYz4FWNKJh6ukJQ80o5JYi/EnSWqJ5rNpIoNj7I8dHEnHtMWFKWa/JmBUVtsCVWwFwIVh11I7IIwHms5+j/nezUOT4Qcgie+YhPDHfL9c3/sWC2wOBvCQWKsGVtgdhp616I6xFRt9Drp4Q0Z4ZBOy06VDVirjzCjKaFg+T3lXBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhR72lKl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhR72lKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779473794; x=1811009794;
  h=date:from:to:cc:subject:message-id;
  bh=VMXR+M2pwwm5P/++6qF/73JXZ0wE7yNam/co+QLUm/Q=;
  b=mhR72lKlEozvUZpQdHC1Y51dhrMHrGsWTCsETHCOGDmWQXvZa+JzjxSG
   o7sZTjA6ZtWYO0/8aFM2LwFxox+fgtBOdNi1KRQSgEHEMtEeOHKAOTDWn
   86WuXb6n10kbE1RHcttSSUpATqL+NhpVwIkv1NhZrr2ydA7mdptC2IYiG
   1DqjrMj3hLsTGHqcJDpPkPNgkXE7jHt+6/Z2kSuWPqz7ZyBN2hF690fQv
   pLsN4jXK9dkgrUIqa6+3jGKx8FvcNnxEGLv1U1TE2UlqT0SISKug1/J2s
   URe3aT/aWIQDpI1MPbR5dQX/K8r+xfW3Dlp+jDu1+F85K1wzObwKtaHdI
   g==;
X-CSE-ConnectionGUID: y5jnWy6NQrCPbrkEmcJsXQ==
X-CSE-MsgGUID: ztAfxd4CQ9umgbqSdtKa/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80314689"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80314689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 11:16:33 -0700
X-CSE-ConnectionGUID: Is3dL3WJQoWCw/PzpfHasQ==
X-CSE-MsgGUID: RUvfHYJMQ3SG1vgK4OGtVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="237953547"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 May 2026 11:16:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQUQ9-00000000BOr-054w;
	Fri, 22 May 2026 18:16:29 +0000
Date: Fri, 22 May 2026 20:15:46 +0200
From: kernel test robot <lkp@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_bw.c:688:18: warning:
 variable 'i' is uninitialized when used here
Message-ID: <202605222053.jcDUANTC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vinod-Govindapillai/drm-i915-wm-clear-the-plane-ddb_y-entries-on-plane-disable/20260512-154329
head:   ee9a09753214444ba3391a390752dbd0bc248646
commit: ee9a09753214444ba3391a390752dbd0bc248646 drm/i915/bw: insert a sw bw info entry to cater low data rate usecases
date:   10 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260522/202605222053.jcDUANTC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605222053.jcDUANTC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605222053.jcDUANTC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_bw.c:688:18: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     688 |         display->bw.max[i].num_planes = 0;
         |                         ^
   drivers/gpu/drm/i915/display/intel_bw.c:651:7: note: initialize the variable 'i' to silence this warning
     651 |         int i, ret;
         |              ^
         |               = 0
   1 warning generated.


vim +/i +688 drivers/gpu/drm/i915/display/intel_bw.c

   637	
   638	static int tgl_get_bw_info(struct intel_display *display,
   639				   const struct dram_info *dram_info,
   640				   const struct intel_sa_info *sa)
   641	{
   642		struct intel_qgv_info qi = {};
   643		bool is_y_tile = is_tile_y_factored(display);
   644		int num_channels = max_t(u8, 1, dram_info->num_channels);
   645		int ipqdepth, ipqdepthpch = 16;
   646		int dclk_max;
   647		bool insert_low_peakbw;
   648		int maxdebw, peakbw;
   649		int clperchgroup;
   650		int num_groups = ARRAY_SIZE(display->bw.max);
   651		int i, ret;
   652	
   653		ret = icl_get_qgv_points(display, dram_info, &qi, is_y_tile);
   654		if (ret) {
   655			drm_dbg_kms(display->drm,
   656				    "Failed to get memory subsystem information, ignoring bandwidth limits");
   657			return ret;
   658		}
   659	
   660		if (DISPLAY_VER(display) < 14 &&
   661		    (dram_info->type == INTEL_DRAM_LPDDR4 || dram_info->type == INTEL_DRAM_LPDDR5))
   662			num_channels *= 2;
   663	
   664		qi.deinterleave = qi.deinterleave ? : DIV_ROUND_UP(num_channels, is_y_tile ? 4 : 2);
   665	
   666		if (num_channels < qi.max_numchannels && DISPLAY_VER(display) >= 12)
   667			qi.deinterleave = max(DIV_ROUND_UP(qi.deinterleave, 2), 1);
   668	
   669		if (DISPLAY_VER(display) >= 12 && num_channels > qi.max_numchannels)
   670			drm_warn(display->drm, "Number of channels exceeds max number of channels.");
   671		if (qi.max_numchannels != 0)
   672			num_channels = min_t(u8, num_channels, qi.max_numchannels);
   673	
   674		dclk_max = icl_sagv_max_dclk(display, &qi);
   675	
   676		peakbw = num_channels * DIV_ROUND_UP(qi.channel_width, 8) * dclk_max;
   677		maxdebw = min(sa->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 100);
   678	
   679		ipqdepth = min(ipqdepthpch, sa->displayrtids / num_channels);
   680		/*
   681		 * clperchgroup = 4kpagespermempage * clperchperblock,
   682		 * clperchperblock = 8 / num_channels * interleave
   683		 */
   684		clperchgroup = 4 * DIV_ROUND_UP(8, num_channels) * qi.deinterleave;
   685	
   686		insert_low_peakbw = xe3_check_lower_peakbw(display, &qi, num_channels);
   687	
 > 688		display->bw.max[i].num_planes = 0;
   689	
   690		for (i = 0; i < num_groups; i++) {
   691			struct intel_bw_info *bi = &display->bw.max[i];
   692			struct intel_bw_info *bi_next;
   693			int clpchgroup;
   694			int j;
   695	
   696			clpchgroup = (sa->deburst * qi.deinterleave / num_channels) << i;
   697	
   698			if (i < num_groups - 1) {
   699				bi_next = &display->bw.max[i + 1];
   700	
   701				if (clpchgroup < clperchgroup)
   702					bi_next->num_planes = (ipqdepth - clpchgroup) /
   703							       clpchgroup + 1;
   704				else
   705					bi_next->num_planes = 0;
   706			}
   707	
   708			bi->num_qgv_points = qi.num_points;
   709			bi->num_psf_gv_points = qi.num_psf_points;
   710	
   711			for (j = 0; j < qi.num_points; j++) {
   712				const struct intel_qgv_point *sp = &qi.points[j];
   713				int ct, bw;
   714	
   715				/*
   716				 * Max row cycle time
   717				 *
   718				 * FIXME what is the logic behind the
   719				 * assumed burst length?
   720				 */
   721				ct = max_t(int, sp->t_rc, sp->t_rp + sp->t_rcd +
   722					   (clpchgroup - 1) * qi.t_bl + sp->t_rdpre);
   723				bw = DIV_ROUND_UP(sp->dclk * clpchgroup * 32 * num_channels, ct);
   724	
   725				bi->deratedbw[j] = min(maxdebw,
   726						       bw * (100 - sa->derating) / 100);
   727				bi->peakbw[j] = DIV_ROUND_CLOSEST(sp->dclk *
   728								  num_channels *
   729								  qi.channel_width, 8);
   730			}
   731	
   732			if (insert_low_peakbw)
   733				xe3_insert_lowest_qgv_point(display, bi);
   734	
   735			for (j = 0; j < qi.num_psf_points; j++) {
   736				const struct intel_psf_gv_point *sp = &qi.psf_points[j];
   737	
   738				bi->psf_bw[j] = adl_calc_psf_bw(sp->clk);
   739			}
   740		}
   741	
   742		debug_print_bw_info(display);
   743	
   744		update_sagv_status(display, qi.num_points);
   745	
   746		return 0;
   747	}
   748	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
