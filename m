Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7D54FBD;
	Mon, 29 Jan 2024 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706522131; cv=none; b=uG3ZYk8y4TM78LbVa17swm8FCI9TemPel6GaWROYyogq1oEY/oqiFIHGb4DljTyg+BhJjKVRYHbPtOz3vwBHs+XDNMzQq9WolyAVL19BEqE5cu3eWZL5nRbf+Wr7tD797gyvhbAXEZcHQIJadFq2buhuRwSONgv2MZzY/jA27qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706522131; c=relaxed/simple;
	bh=gXwKlEO+xUBbTmc4b7AohfdeQ3LQ9vIuDRkPFZMXU1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXwopMg7oKCesBqyZmVA53MzYuXdgB85rUFdJRPIdTJTcZ0QFGdyf8ECxMHK+4wVFvFFWTT3lk/Ji5FFfHC4wmUn3IvbP/uAfrTXnrO0KgZyfwqr/ahfIt7mqUKVMcaV+8LDBT8f526FqX22a+cjzm/NtBcZNyQ6ymUil454pvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf14mLxs; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf14mLxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706522128; x=1738058128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gXwKlEO+xUBbTmc4b7AohfdeQ3LQ9vIuDRkPFZMXU1U=;
  b=Zf14mLxsdO6X55odd8Y0l6ktBIVdTIVjUmm93qMwcuz4h4yv/rwPlXeI
   P8JzfgTEF+i0oeGMERIcGyjupF63CP7/qejrvCoNCFTUKlcPW4psn6M75
   9kX4S+Nfq90wrtyKHr+5w5pXVWepp5EiRBXeOOWCiG3lV9U2Ea982AkwK
   t4zWzJFwy6piyGflfkMWwkp3H8/QrLUNp9FzNMDIPCSVNxFwxQFLN2aNn
   8b3iTGPJMhApZg/pN/uQcrlywhC6w/yNDD1MpUNY6z4ph8ABLHlWyYMXI
   YRdKtT324PsXB0Ir8+/96gg1ybqJ2sqaBC4a6Id2ZFAj83A2zbfCLl1zf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="434071897"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="434071897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 01:55:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="36079071"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2024 01:55:15 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUOMD-0004D9-1P;
	Mon, 29 Jan 2024 09:55:13 +0000
Date: Mon, 29 Jan 2024 17:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] drm/amd/display: switch amdgpu_dm_connector to
 use struct drm_edid
Message-ID: <202401291732.o3PWNUUx-lkp@intel.com>
References: <20240126163429.56714-3-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126163429.56714-3-mwen@igalia.com>

Hi Melissa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.8-rc1]
[also build test ERROR on linus/master next-20240129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-fix-null-pointer-dereference-on-edid-reading/20240127-010342
base:   v6.8-rc1
patch link:    https://lore.kernel.org/r/20240126163429.56714-3-mwen%40igalia.com
patch subject: [RFC PATCH 2/2] drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240129/202401291732.o3PWNUUx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291732.o3PWNUUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291732.o3PWNUUx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11134:12: error: assigning to 'struct detailed_timing *' from 'const struct detailed_timing *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    11134 |                                 timing  = &edid->detailed_timings[i];
          |                                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11179:12: error: assigning to 'struct detailed_timing *' from 'const struct detailed_timing *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    11179 |                         timing  = &edid->detailed_timings[i];
          |                                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +11134 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

f9b4f20c4777bd Stylon Wang          2020-12-04  11064  
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11065  /**
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11066   * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11067   *
41ee1f18ef5239 Alex Deucher         2022-08-30  11068   * @connector: Connector to query.
41ee1f18ef5239 Alex Deucher         2022-08-30  11069   * @edid: EDID from monitor
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11070   *
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11071   * Amdgpu supports Freesync in DP and HDMI displays, and it is required to keep
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11072   * track of some of the display information in the internal data struct used by
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11073   * amdgpu_dm. This function checks which type of connector we need to set the
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11074   * FreeSync parameters.
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11075   */
98e6436d3af5fe Anthony Koo          2018-08-21  11076  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
e5d89dbba370d6 Melissa Wen          2024-01-26  11077  				    const struct drm_edid *drm_edid)
e7b07ceef2a650 Harry Wentland       2017-08-10  11078  {
eb0709ba077a21 Souptick Joarder     2021-02-23  11079  	int i = 0;
e7b07ceef2a650 Harry Wentland       2017-08-10  11080  	struct detailed_timing *timing;
e7b07ceef2a650 Harry Wentland       2017-08-10  11081  	struct detailed_non_pixel *data;
e7b07ceef2a650 Harry Wentland       2017-08-10  11082  	struct detailed_data_monitor_range *range;
c84dec2fe8837f Harry Wentland       2017-09-05  11083  	struct amdgpu_dm_connector *amdgpu_dm_connector =
c84dec2fe8837f Harry Wentland       2017-09-05  11084  			to_amdgpu_dm_connector(connector);
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11085  	struct dm_connector_state *dm_con_state = NULL;
9ad544670514e2 Colin Ian King       2021-08-29  11086  	struct dc_sink *sink;
534eee82356c22 Srinivasan Shanmugam 2023-11-12  11087  	struct amdgpu_device *adev = drm_to_adev(connector->dev);
f9b4f20c4777bd Stylon Wang          2020-12-04  11088  	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
e5d89dbba370d6 Melissa Wen          2024-01-26  11089  	const struct edid *edid = drm_edid_raw(drm_edid);
c620e79bb695b8 Rodrigo Siqueira     2022-02-21  11090  	bool freesync_capable = false;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11091  	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
b830ebc910f641 Harry Wentland       2017-07-26  11092  
8218d7f1f70179 Harry Wentland       2017-10-17  11093  	if (!connector->state) {
8218d7f1f70179 Harry Wentland       2017-10-17  11094  		DRM_ERROR("%s - Connector has no state", __func__);
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11095  		goto update;
8218d7f1f70179 Harry Wentland       2017-10-17  11096  	}
8218d7f1f70179 Harry Wentland       2017-10-17  11097  
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11098  	sink = amdgpu_dm_connector->dc_sink ?
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11099  		amdgpu_dm_connector->dc_sink :
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11100  		amdgpu_dm_connector->dc_em_sink;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11101  
e5d89dbba370d6 Melissa Wen          2024-01-26  11102  	if (!drm_edid || !sink) {
98e6436d3af5fe Anthony Koo          2018-08-21  11103  		dm_con_state = to_dm_connector_state(connector->state);
98e6436d3af5fe Anthony Koo          2018-08-21  11104  
98e6436d3af5fe Anthony Koo          2018-08-21  11105  		amdgpu_dm_connector->min_vfreq = 0;
98e6436d3af5fe Anthony Koo          2018-08-21  11106  		amdgpu_dm_connector->max_vfreq = 0;
98e6436d3af5fe Anthony Koo          2018-08-21  11107  		amdgpu_dm_connector->pixel_clock_mhz = 0;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11108  		connector->display_info.monitor_range.min_vfreq = 0;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11109  		connector->display_info.monitor_range.max_vfreq = 0;
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11110  		freesync_capable = false;
98e6436d3af5fe Anthony Koo          2018-08-21  11111  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11112  		goto update;
98e6436d3af5fe Anthony Koo          2018-08-21  11113  	}
98e6436d3af5fe Anthony Koo          2018-08-21  11114  
8218d7f1f70179 Harry Wentland       2017-10-17  11115  	dm_con_state = to_dm_connector_state(connector->state);
8218d7f1f70179 Harry Wentland       2017-10-17  11116  
e7b07ceef2a650 Harry Wentland       2017-08-10  11117  	if (!adev->dm.freesync_module)
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11118  		goto update;
f9b4f20c4777bd Stylon Wang          2020-12-04  11119  
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11120  	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT
9b2fdc33218933 Aurabindo Pillai     2021-08-11  11121  		|| sink->sink_signal == SIGNAL_TYPE_EDP) {
f9b4f20c4777bd Stylon Wang          2020-12-04  11122  		bool edid_check_required = false;
f9b4f20c4777bd Stylon Wang          2020-12-04  11123  
e5d89dbba370d6 Melissa Wen          2024-01-26  11124  		if (drm_edid) {
e7b07ceef2a650 Harry Wentland       2017-08-10  11125  			edid_check_required = is_dp_capable_without_timing_msa(
e7b07ceef2a650 Harry Wentland       2017-08-10  11126  						adev->dm.dc,
c84dec2fe8837f Harry Wentland       2017-09-05  11127  						amdgpu_dm_connector);
e7b07ceef2a650 Harry Wentland       2017-08-10  11128  		}
f9b4f20c4777bd Stylon Wang          2020-12-04  11129  
e7b07ceef2a650 Harry Wentland       2017-08-10  11130  		if (edid_check_required == true && (edid->version > 1 ||
e7b07ceef2a650 Harry Wentland       2017-08-10  11131  		   (edid->version == 1 && edid->revision > 1))) {
e7b07ceef2a650 Harry Wentland       2017-08-10  11132  			for (i = 0; i < 4; i++) {
e7b07ceef2a650 Harry Wentland       2017-08-10  11133  
e7b07ceef2a650 Harry Wentland       2017-08-10 @11134  				timing	= &edid->detailed_timings[i];
e7b07ceef2a650 Harry Wentland       2017-08-10  11135  				data	= &timing->data.other_data;
e7b07ceef2a650 Harry Wentland       2017-08-10  11136  				range	= &data->data.range;
e7b07ceef2a650 Harry Wentland       2017-08-10  11137  				/*
e7b07ceef2a650 Harry Wentland       2017-08-10  11138  				 * Check if monitor has continuous frequency mode
e7b07ceef2a650 Harry Wentland       2017-08-10  11139  				 */
e7b07ceef2a650 Harry Wentland       2017-08-10  11140  				if (data->type != EDID_DETAIL_MONITOR_RANGE)
e7b07ceef2a650 Harry Wentland       2017-08-10  11141  					continue;
e7b07ceef2a650 Harry Wentland       2017-08-10  11142  				/*
e7b07ceef2a650 Harry Wentland       2017-08-10  11143  				 * Check for flag range limits only. If flag == 1 then
e7b07ceef2a650 Harry Wentland       2017-08-10  11144  				 * no additional timing information provided.
e7b07ceef2a650 Harry Wentland       2017-08-10  11145  				 * Default GTF, GTF Secondary curve and CVT are not
e7b07ceef2a650 Harry Wentland       2017-08-10  11146  				 * supported
e7b07ceef2a650 Harry Wentland       2017-08-10  11147  				 */
e7b07ceef2a650 Harry Wentland       2017-08-10  11148  				if (range->flags != 1)
e7b07ceef2a650 Harry Wentland       2017-08-10  11149  					continue;
e7b07ceef2a650 Harry Wentland       2017-08-10  11150  
c84dec2fe8837f Harry Wentland       2017-09-05  11151  				amdgpu_dm_connector->min_vfreq = range->min_vfreq;
c84dec2fe8837f Harry Wentland       2017-09-05  11152  				amdgpu_dm_connector->max_vfreq = range->max_vfreq;
c84dec2fe8837f Harry Wentland       2017-09-05  11153  				amdgpu_dm_connector->pixel_clock_mhz =
e7b07ceef2a650 Harry Wentland       2017-08-10  11154  					range->pixel_clock_mhz * 10;
a0ffc3fd67e72b Stylon Wang          2021-01-05  11155  
a0ffc3fd67e72b Stylon Wang          2021-01-05  11156  				connector->display_info.monitor_range.min_vfreq = range->min_vfreq;
a0ffc3fd67e72b Stylon Wang          2021-01-05  11157  				connector->display_info.monitor_range.max_vfreq = range->max_vfreq;
a0ffc3fd67e72b Stylon Wang          2021-01-05  11158  
e7b07ceef2a650 Harry Wentland       2017-08-10  11159  				break;
e7b07ceef2a650 Harry Wentland       2017-08-10  11160  			}
e7b07ceef2a650 Harry Wentland       2017-08-10  11161  
c84dec2fe8837f Harry Wentland       2017-09-05  11162  			if (amdgpu_dm_connector->max_vfreq -
c84dec2fe8837f Harry Wentland       2017-09-05  11163  			    amdgpu_dm_connector->min_vfreq > 10) {
98e6436d3af5fe Anthony Koo          2018-08-21  11164  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11165  				freesync_capable = true;
e7b07ceef2a650 Harry Wentland       2017-08-10  11166  			}
e7b07ceef2a650 Harry Wentland       2017-08-10  11167  		}
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11168  		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11169  
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11170  		if (vsdb_info.replay_mode) {
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11171  			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11172  			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11173  			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11174  		}
ec8e59cb4e0c1a Bhawanpreet Lakha    2023-06-12  11175  
e5d89dbba370d6 Melissa Wen          2024-01-26  11176  	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
7c7dd77489540d Arnd Bergmann        2021-02-25  11177  		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
7c7dd77489540d Arnd Bergmann        2021-02-25  11178  		if (i >= 0 && vsdb_info.freesync_supported) {
f9b4f20c4777bd Stylon Wang          2020-12-04  11179  			timing  = &edid->detailed_timings[i];
f9b4f20c4777bd Stylon Wang          2020-12-04  11180  			data    = &timing->data.other_data;
f9b4f20c4777bd Stylon Wang          2020-12-04  11181  
f9b4f20c4777bd Stylon Wang          2020-12-04  11182  			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11183  			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11184  			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11185  				freesync_capable = true;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11186  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11187  			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11188  			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11189  		}
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11190  	}
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11191  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11192  	as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11193  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11194  	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11195  		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11196  		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11197  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11198  			amdgpu_dm_connector->pack_sdp_v1_3 = true;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11199  			amdgpu_dm_connector->as_type = as_type;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11200  			amdgpu_dm_connector->vsdb_info = vsdb_info;
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11201  
5b49da02ddbe1b Sung Joon Kim        2023-01-12  11202  			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  11203  			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  11204  			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
f9b4f20c4777bd Stylon Wang          2020-12-04  11205  				freesync_capable = true;
f9b4f20c4777bd Stylon Wang          2020-12-04  11206  
f9b4f20c4777bd Stylon Wang          2020-12-04  11207  			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  11208  			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
f9b4f20c4777bd Stylon Wang          2020-12-04  11209  		}
f9b4f20c4777bd Stylon Wang          2020-12-04  11210  	}
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11211  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11212  update:
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11213  	if (dm_con_state)
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11214  		dm_con_state->freesync_capable = freesync_capable;
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11215  
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11216  	if (connector->vrr_capable_property)
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11217  		drm_connector_set_vrr_capable_property(connector,
bb47de73666188 Nicholas Kazlauskas  2018-10-04  11218  						       freesync_capable);
e7b07ceef2a650 Harry Wentland       2017-08-10  11219  }
e7b07ceef2a650 Harry Wentland       2017-08-10  11220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
