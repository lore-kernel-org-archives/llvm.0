Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463662F43
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652285994; x=1683821994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6C9KAYnEmBWWBR4DM906YXcM9YGbTJHiYSsq8mzI1RM=;
  b=PhqvWedy8CHPWdrcW09R7UkGenyg4CbUbtXC3JKnerUICYYkIVhqsfgH
   cwXGoHsJ54c//mR8AeFYqJoRZmmauXtBrC6phlujur+HCzNXggvo9VgzE
   dgO3cCwjTcHANm5CGSAEXrikAK5grOwT2/BxNJ+FzmWwOD31+gKUmS/HZ
   1YN9DWjtZxCV4ReqBc/OnqqsCMD0OiXsyo2n+wQE8Qo+H4WnpBs6+36Rl
   hW6ygsgN7z8x/2fXfzP0ee5kc3zLgN1M7jxbbM7qslbSbJF7NKGQC0xtl
   DEHAl/IzCuJrHCTiaswzDijhnX+f1oC6JXn3upDJ3hrN5tLFK6FCtOkRO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="249641604"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="249641604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 09:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="739286946"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2022 09:16:57 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nop1E-000JHo-GH;
	Wed, 11 May 2022 16:16:56 +0000
Date: Thu, 12 May 2022 00:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Strauss <michael.strauss@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Wesley Chalmers <Wesley.Chalmers@amd.com>
Subject: [linux-next:master 10532/11094]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5102:7: warning:
 variable 'allow_lttpr_non_transparent_mode' set but not used
Message-ID: <202205120010.zWBednzM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6107040c99d5dfc920721c198d45ed2d639b113a
commit: 3b90318d44f87a3582f876802253a7748d270385 [10532/11094] drm/amd/display: Refactor LTTPR cap retrieval
config: s390-randconfig-c005-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120010.zWBednzM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3b90318d44f87a3582f876802253a7748d270385
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3b90318d44f87a3582f876802253a7748d270385
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5102:7: warning: variable 'allow_lttpr_non_transparent_mode' set but not used [-Wunused-but-set-variable]
           bool allow_lttpr_non_transparent_mode = 0;
                ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5104:17: warning: variable 'status' set but not used [-Wunused-but-set-variable]
           enum dc_status status = DC_ERROR_UNEXPECTED;
                          ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5149:6: warning: no previous prototype for function 'dp_parse_lttpr_mode' [-Wmissing-prototypes]
   bool dp_parse_lttpr_mode(struct dc_link *link)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool dp_parse_lttpr_mode(struct dc_link *link)
   ^
   static 
   3 warnings generated.


vim +/allow_lttpr_non_transparent_mode +5102 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c

96577cf82a1331 Hersen Wu        2020-01-14  5099  
3b90318d44f87a Michael Strauss  2022-04-22  5100  void dp_retrieve_lttpr_cap(struct dc_link *link)
4562236b3bc0a2 Harry Wentland   2017-09-12  5101  {
f01ee019586220 Fangzhi Zuo      2021-08-03 @5102  	bool allow_lttpr_non_transparent_mode = 0;
ba18f2350e494e Wesley Chalmers  2021-07-19  5103  	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
ee9b1992f1fdf3 Wesley Chalmers  2021-05-14  5104  	enum dc_status status = DC_ERROR_UNEXPECTED;
8e5100a575433c abdoulaye berthe 2019-07-19  5105  
3b90318d44f87a Michael Strauss  2022-04-22  5106  	memset(link->lttpr_dpcd_data, '\0', sizeof(link->lttpr_dpcd_data));
7809fc00e20e6e Wesley Chalmers  2021-03-17  5107  
f01ee019586220 Fangzhi Zuo      2021-08-03  5108  	if ((link->dc->config.allow_lttpr_non_transparent_mode.bits.DP2_0 &&
f01ee019586220 Fangzhi Zuo      2021-08-03  5109  			link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)) {
f01ee019586220 Fangzhi Zuo      2021-08-03  5110  		allow_lttpr_non_transparent_mode = 1;
f01ee019586220 Fangzhi Zuo      2021-08-03  5111  	} else if (link->dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A &&
f01ee019586220 Fangzhi Zuo      2021-08-03  5112  			!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
f01ee019586220 Fangzhi Zuo      2021-08-03  5113  		allow_lttpr_non_transparent_mode = 1;
f01ee019586220 Fangzhi Zuo      2021-08-03  5114  	}
f01ee019586220 Fangzhi Zuo      2021-08-03  5115  
3b90318d44f87a Michael Strauss  2022-04-22  5116  	link->lttpr_mode = LTTPR_MODE_NON_LTTPR;
3b90318d44f87a Michael Strauss  2022-04-22  5117  	link->lttpr_support = LTTPR_UNSUPPORTED;
3b90318d44f87a Michael Strauss  2022-04-22  5118  
7809fc00e20e6e Wesley Chalmers  2021-03-17  5119  	/*
3b90318d44f87a Michael Strauss  2022-04-22  5120  	 * Logic to determine LTTPR support
7809fc00e20e6e Wesley Chalmers  2021-03-17  5121  	 */
3b90318d44f87a Michael Strauss  2022-04-22  5122  	if (vbios_lttpr_interop)
3b90318d44f87a Michael Strauss  2022-04-22  5123  		link->lttpr_support = LTTPR_SUPPORTED;
3b90318d44f87a Michael Strauss  2022-04-22  5124  	else if (link->dc->config.allow_lttpr_non_transparent_mode.raw == 0
3b90318d44f87a Michael Strauss  2022-04-22  5125  			|| !link->dc->caps.extended_aux_timeout_support)
3b90318d44f87a Michael Strauss  2022-04-22  5126  			link->lttpr_support = LTTPR_UNSUPPORTED;
7809fc00e20e6e Wesley Chalmers  2021-03-17  5127  	else
3b90318d44f87a Michael Strauss  2022-04-22  5128  		link->lttpr_support = LTTPR_CHECK_EXT_SUPPORT;
3b90318d44f87a Michael Strauss  2022-04-22  5129  
6aa8d42c667446 Jimmy Kizito     2021-08-25  5130  #if defined(CONFIG_DRM_AMD_DC_DCN)
6aa8d42c667446 Jimmy Kizito     2021-08-25  5131  	/* Check DP tunnel LTTPR mode debug option. */
6aa8d42c667446 Jimmy Kizito     2021-08-25  5132  	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
6aa8d42c667446 Jimmy Kizito     2021-08-25  5133  	    link->dc->debug.dpia_debug.bits.force_non_lttpr)
3b90318d44f87a Michael Strauss  2022-04-22  5134  		link->lttpr_support = LTTPR_UNSUPPORTED;
6aa8d42c667446 Jimmy Kizito     2021-08-25  5135  #endif
7809fc00e20e6e Wesley Chalmers  2021-03-17  5136  
3b90318d44f87a Michael Strauss  2022-04-22  5137  	if (link->lttpr_support > LTTPR_UNSUPPORTED) {
c797ede0ec89f1 Wenjing Liu      2020-06-01  5138  		/* By reading LTTPR capability, RX assumes that we will enable
7809fc00e20e6e Wesley Chalmers  2021-03-17  5139  		 * LTTPR extended aux timeout if LTTPR is present.
c797ede0ec89f1 Wenjing Liu      2020-06-01  5140  		 */
8e5100a575433c abdoulaye berthe 2019-07-19  5141  		status = core_link_read_dpcd(
8e5100a575433c abdoulaye berthe 2019-07-19  5142  				link,
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5143  				DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
3b90318d44f87a Michael Strauss  2022-04-22  5144  				link->lttpr_dpcd_data,
3b90318d44f87a Michael Strauss  2022-04-22  5145  				sizeof(link->lttpr_dpcd_data));
3b90318d44f87a Michael Strauss  2022-04-22  5146  	}
3b90318d44f87a Michael Strauss  2022-04-22  5147  }
3b90318d44f87a Michael Strauss  2022-04-22  5148  
3b90318d44f87a Michael Strauss  2022-04-22 @5149  bool dp_parse_lttpr_mode(struct dc_link *link)
3b90318d44f87a Michael Strauss  2022-04-22  5150  {
3b90318d44f87a Michael Strauss  2022-04-22  5151  	bool dpcd_allow_lttpr_non_transparent_mode = false;
3b90318d44f87a Michael Strauss  2022-04-22  5152  	bool is_lttpr_present = false;
3b90318d44f87a Michael Strauss  2022-04-22  5153  
3b90318d44f87a Michael Strauss  2022-04-22  5154  	bool vbios_lttpr_enable = link->dc->caps.vbios_lttpr_enable;
3b90318d44f87a Michael Strauss  2022-04-22  5155  
3b90318d44f87a Michael Strauss  2022-04-22  5156  	if ((link->dc->config.allow_lttpr_non_transparent_mode.bits.DP2_0 &&
3b90318d44f87a Michael Strauss  2022-04-22  5157  			link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)) {
3b90318d44f87a Michael Strauss  2022-04-22  5158  		dpcd_allow_lttpr_non_transparent_mode = true;
3b90318d44f87a Michael Strauss  2022-04-22  5159  	} else if (link->dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A &&
3b90318d44f87a Michael Strauss  2022-04-22  5160  			!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
3b90318d44f87a Michael Strauss  2022-04-22  5161  		dpcd_allow_lttpr_non_transparent_mode = true;
3b90318d44f87a Michael Strauss  2022-04-22  5162  	}
3b90318d44f87a Michael Strauss  2022-04-22  5163  
3b90318d44f87a Michael Strauss  2022-04-22  5164  	/*
3b90318d44f87a Michael Strauss  2022-04-22  5165  	 * Logic to determine LTTPR mode
3b90318d44f87a Michael Strauss  2022-04-22  5166  	 */
3b90318d44f87a Michael Strauss  2022-04-22  5167  	if (link->lttpr_support == LTTPR_SUPPORTED)
3b90318d44f87a Michael Strauss  2022-04-22  5168  		if (vbios_lttpr_enable)
3b90318d44f87a Michael Strauss  2022-04-22  5169  			link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
3b90318d44f87a Michael Strauss  2022-04-22  5170  		else if (dpcd_allow_lttpr_non_transparent_mode)
3b90318d44f87a Michael Strauss  2022-04-22  5171  			link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
3b90318d44f87a Michael Strauss  2022-04-22  5172  		else
3b90318d44f87a Michael Strauss  2022-04-22  5173  			link->lttpr_mode = LTTPR_MODE_TRANSPARENT;
3b90318d44f87a Michael Strauss  2022-04-22  5174  	else	// lttpr_support == LTTPR_CHECK_EXT_SUPPORT
3b90318d44f87a Michael Strauss  2022-04-22  5175  		if (dpcd_allow_lttpr_non_transparent_mode) {
3b90318d44f87a Michael Strauss  2022-04-22  5176  			link->lttpr_support = LTTPR_SUPPORTED;
3b90318d44f87a Michael Strauss  2022-04-22  5177  			link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
3b90318d44f87a Michael Strauss  2022-04-22  5178  		} else {
3b90318d44f87a Michael Strauss  2022-04-22  5179  			link->lttpr_support = LTTPR_UNSUPPORTED;
85019b19d484b0 Pu Lehui         2021-06-17  5180  		}
8e5100a575433c abdoulaye berthe 2019-07-19  5181  
3b90318d44f87a Michael Strauss  2022-04-22  5182  	if (link->lttpr_support == LTTPR_UNSUPPORTED)
3b90318d44f87a Michael Strauss  2022-04-22  5183  		return false;
3b90318d44f87a Michael Strauss  2022-04-22  5184  
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5185  	link->dpcd_caps.lttpr_caps.revision.raw =
3b90318d44f87a Michael Strauss  2022-04-22  5186  			link->lttpr_dpcd_data[DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV -
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5187  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
8e5100a575433c abdoulaye berthe 2019-07-19  5188  
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5189  	link->dpcd_caps.lttpr_caps.max_link_rate =
3b90318d44f87a Michael Strauss  2022-04-22  5190  			link->lttpr_dpcd_data[DP_MAX_LINK_RATE_PHY_REPEATER -
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5191  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
8e5100a575433c abdoulaye berthe 2019-07-19  5192  
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5193  	link->dpcd_caps.lttpr_caps.phy_repeater_cnt =
3b90318d44f87a Michael Strauss  2022-04-22  5194  			link->lttpr_dpcd_data[DP_PHY_REPEATER_CNT -
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5195  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
8e5100a575433c abdoulaye berthe 2019-07-19  5196  
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5197  	link->dpcd_caps.lttpr_caps.max_lane_count =
3b90318d44f87a Michael Strauss  2022-04-22  5198  			link->lttpr_dpcd_data[DP_MAX_LANE_COUNT_PHY_REPEATER -
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5199  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
8e5100a575433c abdoulaye berthe 2019-07-19  5200  
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5201  	link->dpcd_caps.lttpr_caps.mode =
3b90318d44f87a Michael Strauss  2022-04-22  5202  			link->lttpr_dpcd_data[DP_PHY_REPEATER_MODE -
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5203  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
8e5100a575433c abdoulaye berthe 2019-07-19  5204  
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5205  	link->dpcd_caps.lttpr_caps.max_ext_timeout =
3b90318d44f87a Michael Strauss  2022-04-22  5206  			link->lttpr_dpcd_data[DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT -
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5207  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
8e5100a575433c abdoulaye berthe 2019-07-19  5208  
f01ee019586220 Fangzhi Zuo      2021-08-03  5209  	link->dpcd_caps.lttpr_caps.main_link_channel_coding.raw =
3b90318d44f87a Michael Strauss  2022-04-22  5210  			link->lttpr_dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER -
f01ee019586220 Fangzhi Zuo      2021-08-03  5211  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
f01ee019586220 Fangzhi Zuo      2021-08-03  5212  
f01ee019586220 Fangzhi Zuo      2021-08-03  5213  	link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
3b90318d44f87a Michael Strauss  2022-04-22  5214  			link->lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
f01ee019586220 Fangzhi Zuo      2021-08-03  5215  							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
f01ee019586220 Fangzhi Zuo      2021-08-03  5216  
3b90318d44f87a Michael Strauss  2022-04-22  5217  
ede4f6dac99e4b Jimmy Kizito     2021-04-05  5218  	/* Attempt to train in LTTPR transparent mode if repeater count exceeds 8. */
72b90723b3760c Sung Joon Kim    2022-01-23  5219  	is_lttpr_present = (link->dpcd_caps.lttpr_caps.max_lane_count > 0 &&
61aa7a6f760e78 abdoulaye berthe 2019-10-10  5220  			link->dpcd_caps.lttpr_caps.max_lane_count <= 4 &&
c797ede0ec89f1 Wenjing Liu      2020-06-01  5221  			link->dpcd_caps.lttpr_caps.revision.raw >= 0x14);
ac62875e9b6bfd Wesley Chalmers  2021-03-24  5222  	if (is_lttpr_present) {
3b90318d44f87a Michael Strauss  2022-04-22  5223  		CONN_DATA_DETECT(link, link->lttpr_dpcd_data, sizeof(link->lttpr_dpcd_data), "LTTPR Caps: ");
ac62875e9b6bfd Wesley Chalmers  2021-03-24  5224  		configure_lttpr_mode_transparent(link);
ac62875e9b6bfd Wesley Chalmers  2021-03-24  5225  	} else
fab8580107b88b Wesley Chalmers  2021-03-30  5226  		link->lttpr_mode = LTTPR_MODE_NON_LTTPR;
3b90318d44f87a Michael Strauss  2022-04-22  5227  
ee9b1992f1fdf3 Wesley Chalmers  2021-05-14  5228  	return is_lttpr_present;
ee9b1992f1fdf3 Wesley Chalmers  2021-05-14  5229  }
ee9b1992f1fdf3 Wesley Chalmers  2021-05-14  5230  

:::::: The code at line 5102 was first introduced by commit
:::::: f01ee019586220c86f238263a4fbde6e72085e11 drm/amd/display: Add DP 2.0 SST DC Support

:::::: TO: Fangzhi Zuo <Jerry.Zuo@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
