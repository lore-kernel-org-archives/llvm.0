Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957234A9B7;
	Wed, 10 Jan 2024 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+eI4sNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704920432; x=1736456432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+zESqkNjNEwU25hDY2YZwHVqYRNYH8ez7OmV4ce+9Q=;
  b=M+eI4sNx5Vr2CP8uiF0rBl8SzAQQIRI2twyo2e930Wsz9hzRNDunP3f4
   J2mPdDMnec+8h4YCl0hELsbyj4s6v6R169sS+oOxgA5LK25hp5Ge5yHaI
   t5c0lhTKo89PnEVA8SVC5RC1BLyw4IPHxRU3fnBsluXcpDxRONJll68Kf
   kLVlNTv3gKDQ8cWJwIABctr/xnKRI1zPODMudOuf5QQag9A6+R0tpUyJ0
   1osJ+s+Dxg6m6nTCqiXTHgUTyvpj/ajT51uINv5ATOf5HAJpkgHJYrDbj
   0jnijJJH1/o+vTsVMATMHlMIa5OOcN8r4wTAIUhou0J31ymArsRD/rwFL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="484832821"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="484832821"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 13:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="816481782"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="816481782"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Jan 2024 13:00:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNfgZ-0007UG-11;
	Wed, 10 Jan 2024 21:00:27 +0000
Date: Thu, 11 Jan 2024 04:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peichen Huang <peichen.huang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Cruise Hung <cruise.hung@amd.com>
Subject: [linux-next:master 12891/13109]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:548:24:
 warning: arithmetic between different enumeration types ('const enum
 dc_link_rate' and 'const enum dc_lane_count')
Message-ID: <202401110427.FNT67xeQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8cb47d7cd090a690c1785385b2f3d407d4a53ad0
commit: 5f3bce13266e6fe2f7a46f94d8bc94d5274e276b [12891/13109] drm/amd/display: Request usb4 bw for mst streams
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240111/202401110427.FNT67xeQ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110427.FNT67xeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110427.FNT67xeQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:548:24: warning: arithmetic between different enumeration types ('const enum dc_link_rate' and 'const enum dc_lane_count') [-Wenum-enum-conversion]
     548 |                         link_cap->link_rate * link_cap->lane_count * LINK_RATE_REF_FREQ_IN_KHZ * 8;
         |                         ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +548 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c

   531	
   532	int link_dp_dpia_get_dp_overhead_in_dp_tunneling(struct dc_link *link)
   533	{
   534		int dp_overhead = 0, link_mst_overhead = 0;
   535	
   536		if (!get_bw_alloc_proceed_flag((link)))
   537			return dp_overhead;
   538	
   539		/* if its mst link, add MTPH overhead */
   540		if ((link->type == dc_connection_mst_branch) &&
   541			!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
   542			/* For 8b/10b encoding: MTP is 64 time slots long, slot 0 is used for MTPH
   543			 * MST overhead is 1/64 of link bandwidth (excluding any overhead)
   544			 */
   545			const struct dc_link_settings *link_cap =
   546				dc_link_get_link_cap(link);
   547			uint32_t link_bw_in_kbps =
 > 548				link_cap->link_rate * link_cap->lane_count * LINK_RATE_REF_FREQ_IN_KHZ * 8;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
