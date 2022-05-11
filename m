Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F8C28F9
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652278791; x=1683814791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIYxxxnvAvwf3hWmF3mAjY1CY/Bs+tmUQzkc8WHNqDQ=;
  b=Xg/PJxMNCDynk49uaq4E9GuP7oojH6uJLeyQJQ7N4Rj9bwaThdDRjNpI
   r1Cnor3lTYzJrPnCg2eqLZ5/j5XGekQxESEXYkUeXBxaVFHwaO6+CVX4+
   a6AZE03j4mCsou0Iqt5bsQcWVHfP495ieZrnfj9mLHDyp6lQTsAhCmSoi
   aPf+MCrTj89WuaJw5kf3T4/CxpTbLYlnMYnT2wNpJqXWpIZM7/iwOLTXS
   i2B5JOGq20h8u/8gpgq/kVwY2RAviAhUFE6dJzu9AaqUuj69lWFVf6DkI
   y+veTZ7LWv2es9D6DqFlNJD/7u72Vhju8BPamLaAnysvdD/FE+50BQqpC
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269380622"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="269380622"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 07:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="520540124"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 May 2022 07:19:48 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nonBs-000JB4-7d;
	Wed, 11 May 2022 14:19:48 +0000
Date: Wed, 11 May 2022 22:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Strauss <michael.strauss@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Wesley Chalmers <Wesley.Chalmers@amd.com>
Subject: [linux-next:master 10532/11094]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5149:6: warning:
 no previous prototype for function 'dp_parse_lttpr_mode'
Message-ID: <202205112212.ZoNRvDHS-lkp@intel.com>
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
config: arm-buildonly-randconfig-r006-20220509 (https://download.01.org/0day-ci/archive/20220511/202205112212.ZoNRvDHS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3b90318d44f87a3582f876802253a7748d270385
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3b90318d44f87a3582f876802253a7748d270385
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:38:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.h:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dmub/dmub_srv.h:67:
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:867:18: warning: field cursor_copy_src within 'struct dmub_rb_cmd_mall' is less aligned than 'union dmub_addr' and is usually due to 'struct dmub_rb_cmd_mall' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union dmub_addr cursor_copy_src; /**< Cursor copy address */
                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:868:18: warning: field cursor_copy_dst within 'struct dmub_rb_cmd_mall' is less aligned than 'union dmub_addr' and is usually due to 'struct dmub_rb_cmd_mall' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union dmub_addr cursor_copy_dst; /**< Cursor copy destination */
                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5102:7: warning: variable 'allow_lttpr_non_transparent_mode' set but not used [-Wunused-but-set-variable]
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
   5 warnings generated.


vim +/dp_parse_lttpr_mode +5149 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c

  5099	
  5100	void dp_retrieve_lttpr_cap(struct dc_link *link)
  5101	{
> 5102		bool allow_lttpr_non_transparent_mode = 0;
  5103		bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
  5104		enum dc_status status = DC_ERROR_UNEXPECTED;
  5105	
  5106		memset(link->lttpr_dpcd_data, '\0', sizeof(link->lttpr_dpcd_data));
  5107	
  5108		if ((link->dc->config.allow_lttpr_non_transparent_mode.bits.DP2_0 &&
  5109				link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)) {
  5110			allow_lttpr_non_transparent_mode = 1;
  5111		} else if (link->dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A &&
  5112				!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
  5113			allow_lttpr_non_transparent_mode = 1;
  5114		}
  5115	
  5116		link->lttpr_mode = LTTPR_MODE_NON_LTTPR;
  5117		link->lttpr_support = LTTPR_UNSUPPORTED;
  5118	
  5119		/*
  5120		 * Logic to determine LTTPR support
  5121		 */
  5122		if (vbios_lttpr_interop)
  5123			link->lttpr_support = LTTPR_SUPPORTED;
  5124		else if (link->dc->config.allow_lttpr_non_transparent_mode.raw == 0
  5125				|| !link->dc->caps.extended_aux_timeout_support)
  5126				link->lttpr_support = LTTPR_UNSUPPORTED;
  5127		else
  5128			link->lttpr_support = LTTPR_CHECK_EXT_SUPPORT;
  5129	
  5130	#if defined(CONFIG_DRM_AMD_DC_DCN)
  5131		/* Check DP tunnel LTTPR mode debug option. */
  5132		if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
  5133		    link->dc->debug.dpia_debug.bits.force_non_lttpr)
  5134			link->lttpr_support = LTTPR_UNSUPPORTED;
  5135	#endif
  5136	
  5137		if (link->lttpr_support > LTTPR_UNSUPPORTED) {
  5138			/* By reading LTTPR capability, RX assumes that we will enable
  5139			 * LTTPR extended aux timeout if LTTPR is present.
  5140			 */
  5141			status = core_link_read_dpcd(
  5142					link,
  5143					DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
  5144					link->lttpr_dpcd_data,
  5145					sizeof(link->lttpr_dpcd_data));
  5146		}
  5147	}
  5148	
> 5149	bool dp_parse_lttpr_mode(struct dc_link *link)
  5150	{
  5151		bool dpcd_allow_lttpr_non_transparent_mode = false;
  5152		bool is_lttpr_present = false;
  5153	
  5154		bool vbios_lttpr_enable = link->dc->caps.vbios_lttpr_enable;
  5155	
  5156		if ((link->dc->config.allow_lttpr_non_transparent_mode.bits.DP2_0 &&
  5157				link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)) {
  5158			dpcd_allow_lttpr_non_transparent_mode = true;
  5159		} else if (link->dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A &&
  5160				!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
  5161			dpcd_allow_lttpr_non_transparent_mode = true;
  5162		}
  5163	
  5164		/*
  5165		 * Logic to determine LTTPR mode
  5166		 */
  5167		if (link->lttpr_support == LTTPR_SUPPORTED)
  5168			if (vbios_lttpr_enable)
  5169				link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
  5170			else if (dpcd_allow_lttpr_non_transparent_mode)
  5171				link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
  5172			else
  5173				link->lttpr_mode = LTTPR_MODE_TRANSPARENT;
  5174		else	// lttpr_support == LTTPR_CHECK_EXT_SUPPORT
  5175			if (dpcd_allow_lttpr_non_transparent_mode) {
  5176				link->lttpr_support = LTTPR_SUPPORTED;
  5177				link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
  5178			} else {
  5179				link->lttpr_support = LTTPR_UNSUPPORTED;
  5180			}
  5181	
  5182		if (link->lttpr_support == LTTPR_UNSUPPORTED)
  5183			return false;
  5184	
  5185		link->dpcd_caps.lttpr_caps.revision.raw =
  5186				link->lttpr_dpcd_data[DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV -
  5187								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5188	
  5189		link->dpcd_caps.lttpr_caps.max_link_rate =
  5190				link->lttpr_dpcd_data[DP_MAX_LINK_RATE_PHY_REPEATER -
  5191								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5192	
  5193		link->dpcd_caps.lttpr_caps.phy_repeater_cnt =
  5194				link->lttpr_dpcd_data[DP_PHY_REPEATER_CNT -
  5195								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5196	
  5197		link->dpcd_caps.lttpr_caps.max_lane_count =
  5198				link->lttpr_dpcd_data[DP_MAX_LANE_COUNT_PHY_REPEATER -
  5199								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5200	
  5201		link->dpcd_caps.lttpr_caps.mode =
  5202				link->lttpr_dpcd_data[DP_PHY_REPEATER_MODE -
  5203								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5204	
  5205		link->dpcd_caps.lttpr_caps.max_ext_timeout =
  5206				link->lttpr_dpcd_data[DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT -
  5207								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5208	
  5209		link->dpcd_caps.lttpr_caps.main_link_channel_coding.raw =
  5210				link->lttpr_dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER -
  5211								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5212	
  5213		link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
  5214				link->lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
  5215								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
  5216	
  5217	
  5218		/* Attempt to train in LTTPR transparent mode if repeater count exceeds 8. */
  5219		is_lttpr_present = (link->dpcd_caps.lttpr_caps.max_lane_count > 0 &&
  5220				link->dpcd_caps.lttpr_caps.max_lane_count <= 4 &&
  5221				link->dpcd_caps.lttpr_caps.revision.raw >= 0x14);
  5222		if (is_lttpr_present) {
  5223			CONN_DATA_DETECT(link, link->lttpr_dpcd_data, sizeof(link->lttpr_dpcd_data), "LTTPR Caps: ");
  5224			configure_lttpr_mode_transparent(link);
  5225		} else
  5226			link->lttpr_mode = LTTPR_MODE_NON_LTTPR;
  5227	
  5228		return is_lttpr_present;
  5229	}
  5230	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
