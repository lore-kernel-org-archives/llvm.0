Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D75331ECB;
	Wed,  7 Oct 2026 02:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791340305; cv=none; b=MbY+JHUWT9Goz+/JKZv/DgzJlpTZQaj8uRrrdD+T/bhM6V8An/fwlYC4f2zNuC/cF50DQ/RCpGtbnt/kI5XlZoEXjBPG6io02wStKkL/CnIXxl5o1d1tLM6rPaMQtXrd3dmeiftEkCQgw9KZ1/q+isJXVt8e5t0gi4NobXuyti0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791340305; c=relaxed/simple;
	bh=w7NrKQJQjehe4DAaKZjZAUNxN6nrSoEqaBsZOXn+YiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GCFaPl1xCoTk29Q14g2dR5viQK2WBEq4VTz5LFYL3cwwIyNQ9w+ZlDhjT3CevRf/ysNXLo2lkc1329o2I97qgayVrktp3G/iLOr3QOixD/HElQ26iQvZaUXEDKWQbZKUBXWYIuXH259Ovk6HsTogGRUJUkFMmxrCuFhUlrET/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB1759LF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB1759LF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791340302; x=1822876302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7NrKQJQjehe4DAaKZjZAUNxN6nrSoEqaBsZOXn+YiY=;
  b=gB1759LFl2z5j7vdQy2tJuSIfM0PWVCmrl2lI105eMZjhimMnTMBQk/b
   npXGwXaZFEWNPMDBwjirbBrXIRiuCqkLf0JH6yOrr53/3NwSpOQWZVXrK
   51wi4v4f5xfCxQYhQjO2bfHIL63X9FrywbceTil84cHWP47k2vsLy5HQo
   g0Q7Mg2aiuZ2G7l1GAIvqpgRCBmRtrvwmZy2+NLYCAopybKhqHBiMje0X
   xQq0J+KhhfBqCAEJQQEJR339MzWHhr/qdMlbrWwaJHnnL4ygaBxBGz1oZ
   7TdgLgb/Xea9ZryYgrapR+wIKbXTV85OwZpTrf2l7f3dYZ616Y0ANBr8F
   g==;
X-CSE-ConnectionGUID: CH4PpaurReS0Pg2K2jS2mA==
X-CSE-MsgGUID: RsP5CQLfRu6fONIB++bc5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102201744"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="102201744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 19:31:41 -0700
X-CSE-ConnectionGUID: Pgvz/iGuQWyjhTYiLNDkPQ==
X-CSE-MsgGUID: IKcfChePSyKJAgv+j2GOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="306791783"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Oct 2026 19:31:39 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEHRQ-000000002Pg-1wCf;
	Wed, 07 Oct 2026 02:31:36 +0000
Date: Wed, 07 Oct 2026 10:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Huang <Alex.Huang2@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Infrastructure <z1.linuxinfra@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [agd5f:amd-staging-drm-next 6/15]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/amd?=
 =?us-ascii?Q?gpu=5Fdm=5Fconnector=5Ftest.c:9978:13:?= error: use of
 undeclared identifier 'dm_test_content_type_no_data'
Message-ID: <202610071031.zRSn9nQT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   53750a937420a01acf41bf74010557666f679aab
commit: 4c9f84a7e617494261b5d4c26e48c490af2db505 [6/15] drm/amd/display: Clean up FreeSync capability detection
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261007/202610071031.zRSn9nQT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071031.zRSn9nQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071031.zRSn9nQT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3592:23: warning: no previous prototype for function 'dm_edid_parser_send_cea' [-Wmissing-prototypes]
    3592 | VISIBLE_IF_KUNIT bool dm_edid_parser_send_cea(struct amdgpu_display_manager *dm,
         |                       ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3592:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3592 | VISIBLE_IF_KUNIT bool dm_edid_parser_send_cea(struct amdgpu_display_manager *dm,
         |                  ^
         |                  static 
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3651:23: warning: no previous prototype for function 'parse_edid_cea_dmcu' [-Wmissing-prototypes]
    3651 | VISIBLE_IF_KUNIT bool parse_edid_cea_dmcu(struct amdgpu_display_manager *dm,
         |                       ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3651:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3651 | VISIBLE_IF_KUNIT bool parse_edid_cea_dmcu(struct amdgpu_display_manager *dm,
         |                  ^
         |                  static 
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3695:23: warning: no previous prototype for function 'parse_edid_cea_dmub' [-Wmissing-prototypes]
    3695 | VISIBLE_IF_KUNIT bool parse_edid_cea_dmub(struct amdgpu_display_manager *dm,
         |                       ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3695:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3695 | VISIBLE_IF_KUNIT bool parse_edid_cea_dmub(struct amdgpu_display_manager *dm,
         |                  ^
         |                  static 
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3712:23: warning: no previous prototype for function 'parse_edid_cea' [-Wmissing-prototypes]
    3712 | VISIBLE_IF_KUNIT bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
         |                       ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3712:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3712 | VISIBLE_IF_KUNIT bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
         |                  ^
         |                  static 
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3789:37: warning: no previous prototype for function 'parse_hdmi_amd_vsdb' [-Wmissing-prototypes]
    3789 | VISIBLE_IF_KUNIT __maybe_unused int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
         |                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3789:33: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3789 | VISIBLE_IF_KUNIT __maybe_unused int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
         |                                 ^
         |                                 static 
   5 warnings generated.
--
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:161:1: warning: '/*' within block comment [-Wcomment]
     161 | /**
         | ^
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:9978:13: error: use of undeclared identifier 'dm_test_content_type_no_data'
    9978 |         KUNIT_CASE(dm_test_content_type_no_data),
         |                    ^
   1 warning and 1 error generated.


vim +/dm_test_content_type_no_data +9978 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c

a9e28b4d84935ec Alex Hung         2026-08-29   9966  
58ad5aaa2ed357b Alex Hung         2026-04-29   9967  static struct kunit_case amdgpu_dm_connector_tests[] = {
58ad5aaa2ed357b Alex Hung         2026-04-29   9968  	/* get_subconnector_type */
58ad5aaa2ed357b Alex Hung         2026-04-29   9969  	KUNIT_CASE(dm_test_subconnector_type_none),
58ad5aaa2ed357b Alex Hung         2026-04-29   9970  	KUNIT_CASE(dm_test_subconnector_type_vga),
58ad5aaa2ed357b Alex Hung         2026-04-29   9971  	KUNIT_CASE(dm_test_subconnector_type_dvi_converter),
58ad5aaa2ed357b Alex Hung         2026-04-29   9972  	KUNIT_CASE(dm_test_subconnector_type_dvi_dongle),
58ad5aaa2ed357b Alex Hung         2026-04-29   9973  	KUNIT_CASE(dm_test_subconnector_type_hdmi_converter),
58ad5aaa2ed357b Alex Hung         2026-04-29   9974  	KUNIT_CASE(dm_test_subconnector_type_hdmi_dongle),
58ad5aaa2ed357b Alex Hung         2026-04-29   9975  	KUNIT_CASE(dm_test_subconnector_type_mismatched),
58ad5aaa2ed357b Alex Hung         2026-04-29   9976  	KUNIT_CASE(dm_test_subconnector_type_default_unknown),
58ad5aaa2ed357b Alex Hung         2026-04-29   9977  	/* get_output_content_type */
58ad5aaa2ed357b Alex Hung         2026-04-29  @9978  	KUNIT_CASE(dm_test_content_type_no_data),
58ad5aaa2ed357b Alex Hung         2026-04-29   9979  	KUNIT_CASE(dm_test_content_type_graphics),
58ad5aaa2ed357b Alex Hung         2026-04-29   9980  	KUNIT_CASE(dm_test_content_type_photo),
58ad5aaa2ed357b Alex Hung         2026-04-29   9981  	KUNIT_CASE(dm_test_content_type_cinema),
58ad5aaa2ed357b Alex Hung         2026-04-29   9982  	KUNIT_CASE(dm_test_content_type_game),
58ad5aaa2ed357b Alex Hung         2026-04-29   9983  	KUNIT_CASE(dm_test_content_type_unknown_defaults_no_data),
58ad5aaa2ed357b Alex Hung         2026-04-29   9984  	/* adjust_colour_depth_from_display_info */
58ad5aaa2ed357b Alex Hung         2026-04-29   9985  	KUNIT_CASE(dm_test_adjust_colour_depth_fits_at_888),
58ad5aaa2ed357b Alex Hung         2026-04-29   9986  	KUNIT_CASE(dm_test_adjust_colour_depth_reduces_to_888),
58ad5aaa2ed357b Alex Hung         2026-04-29   9987  	KUNIT_CASE(dm_test_adjust_colour_depth_10bpc_passes),
58ad5aaa2ed357b Alex Hung         2026-04-29   9988  	KUNIT_CASE(dm_test_adjust_colour_depth_420_halves_clk),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25   9989  	KUNIT_CASE(dm_test_adjust_colour_depth_420_reduces),
58ad5aaa2ed357b Alex Hung         2026-04-29   9990  	KUNIT_CASE(dm_test_adjust_colour_depth_reduces_12bpc_to_10bpc),
58ad5aaa2ed357b Alex Hung         2026-04-29   9991  	KUNIT_CASE(dm_test_adjust_colour_depth_16bpc_no_fallback),
58ad5aaa2ed357b Alex Hung         2026-04-29   9992  	KUNIT_CASE(dm_test_adjust_colour_depth_none_fits),
58ad5aaa2ed357b Alex Hung         2026-04-29   9993  	KUNIT_CASE(dm_test_adjust_colour_depth_invalid_depth),
58ad5aaa2ed357b Alex Hung         2026-04-29   9994  	/* amdgpu_dm_get_output_color_space */
58ad5aaa2ed357b Alex Hung         2026-04-29   9995  	KUNIT_CASE(dm_test_output_color_space_default_rgb_full),
58ad5aaa2ed357b Alex Hung         2026-04-29   9996  	KUNIT_CASE(dm_test_output_color_space_default_rgb_limited),
58ad5aaa2ed357b Alex Hung         2026-04-29   9997  	KUNIT_CASE(dm_test_output_color_space_default_ycbcr709),
58ad5aaa2ed357b Alex Hung         2026-04-29   9998  	KUNIT_CASE(dm_test_output_color_space_default_ycbcr601_limited),
58ad5aaa2ed357b Alex Hung         2026-04-29   9999  	KUNIT_CASE(dm_test_output_color_space_bt601_y_only),
58ad5aaa2ed357b Alex Hung         2026-04-29  10000  	KUNIT_CASE(dm_test_output_color_space_bt601),
58ad5aaa2ed357b Alex Hung         2026-04-29  10001  	KUNIT_CASE(dm_test_output_color_space_bt709),
58ad5aaa2ed357b Alex Hung         2026-04-29  10002  	KUNIT_CASE(dm_test_output_color_space_bt709_y_only),
58ad5aaa2ed357b Alex Hung         2026-04-29  10003  	KUNIT_CASE(dm_test_output_color_space_oprgb),
58ad5aaa2ed357b Alex Hung         2026-04-29  10004  	KUNIT_CASE(dm_test_output_color_space_bt2020_rgb),
9798a3974556eb6 Satyajit Roy      2026-08-30  10005  	KUNIT_CASE(dm_test_output_color_space_bt2020_rgb_limited),
5342f7d98a26325 Adrian Betschart  2026-09-10  10006  	KUNIT_CASE(dm_test_output_color_space_default_rgb_auto_hdmi_cta),
5342f7d98a26325 Adrian Betschart  2026-09-10  10007  	KUNIT_CASE(dm_test_output_color_space_default_rgb_auto_hdmi_vga),
5342f7d98a26325 Adrian Betschart  2026-09-10  10008  	KUNIT_CASE(dm_test_output_color_space_default_rgb_auto_dp_cta),
5342f7d98a26325 Adrian Betschart  2026-09-10  10009  	KUNIT_CASE(dm_test_output_color_space_default_rgb_full_hdmi_cta),
5342f7d98a26325 Adrian Betschart  2026-09-10  10010  	KUNIT_CASE(dm_test_output_color_space_bt2020_rgb_auto_hdmi_cta),
58ad5aaa2ed357b Alex Hung         2026-04-29  10011  	KUNIT_CASE(dm_test_output_color_space_bt2020_ycc),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10012  	KUNIT_CASE(dm_test_output_color_space_default_ycbcr709_y_only),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10013  	KUNIT_CASE(dm_test_output_color_space_default_ycbcr601),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10014  	KUNIT_CASE(dm_test_output_color_space_bt2020_ycc_rgb_encoding),
9798a3974556eb6 Satyajit Roy      2026-08-30  10015  	KUNIT_CASE(dm_test_output_color_space_bt2020_ycc_rgb_encoding_limited),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10016  	KUNIT_CASE(dm_test_output_color_space_bt2020_rgb_ycc_encoding),
58ad5aaa2ed357b Alex Hung         2026-04-29  10017  	/* Tests for amdgpu_dm_convert_dc_color_depth_into_bpc */
58ad5aaa2ed357b Alex Hung         2026-04-29  10018  	KUNIT_CASE(dm_test_convert_color_depth_bpc_mappings),
58ad5aaa2ed357b Alex Hung         2026-04-29  10019  	KUNIT_CASE(dm_test_convert_color_depth_bpc_unknown),
58ad5aaa2ed357b Alex Hung         2026-04-29  10020  	/* amdgpu_dm_convert_color_depth_from_display_info */
58ad5aaa2ed357b Alex Hung         2026-04-29  10021  	KUNIT_CASE(dm_test_color_depth_from_info_bpc8),
58ad5aaa2ed357b Alex Hung         2026-04-29  10022  	KUNIT_CASE(dm_test_color_depth_from_info_bpc10),
58ad5aaa2ed357b Alex Hung         2026-04-29  10023  	KUNIT_CASE(dm_test_color_depth_from_info_zero_bpc_defaults_888),
58ad5aaa2ed357b Alex Hung         2026-04-29  10024  	KUNIT_CASE(dm_test_color_depth_from_info_requested_bpc_caps),
58ad5aaa2ed357b Alex Hung         2026-04-29  10025  	KUNIT_CASE(dm_test_color_depth_from_info_y420_default),
58ad5aaa2ed357b Alex Hung         2026-04-29  10026  	KUNIT_CASE(dm_test_color_depth_from_info_y420_10bpc),
58ad5aaa2ed357b Alex Hung         2026-04-29  10027  	KUNIT_CASE(dm_test_color_depth_from_info_y420_12bpc),
58ad5aaa2ed357b Alex Hung         2026-04-29  10028  	KUNIT_CASE(dm_test_color_depth_from_info_y420_16bpc),
58ad5aaa2ed357b Alex Hung         2026-04-29  10029  	KUNIT_CASE(dm_test_color_depth_from_info_requested_odd_bpc),
58ad5aaa2ed357b Alex Hung         2026-04-29  10030  	KUNIT_CASE(dm_test_color_depth_from_info_unsupported_bpc),
58ad5aaa2ed357b Alex Hung         2026-04-29  10031  	/* to_drm_connector_type */
58ad5aaa2ed357b Alex Hung         2026-04-29  10032  	KUNIT_CASE(dm_test_to_connector_type_hdmi),
58ad5aaa2ed357b Alex Hung         2026-04-29  10033  	KUNIT_CASE(dm_test_to_connector_type_edp),
58ad5aaa2ed357b Alex Hung         2026-04-29  10034  	KUNIT_CASE(dm_test_to_connector_type_lvds),
58ad5aaa2ed357b Alex Hung         2026-04-29  10035  	KUNIT_CASE(dm_test_to_connector_type_rgb),
58ad5aaa2ed357b Alex Hung         2026-04-29  10036  	KUNIT_CASE(dm_test_to_connector_type_dp),
58ad5aaa2ed357b Alex Hung         2026-04-29  10037  	KUNIT_CASE(dm_test_to_connector_type_dp_mst),
58ad5aaa2ed357b Alex Hung         2026-04-29  10038  	KUNIT_CASE(dm_test_to_connector_type_dvi_dvii),
58ad5aaa2ed357b Alex Hung         2026-04-29  10039  	KUNIT_CASE(dm_test_to_connector_type_dual_link_dvii),
58ad5aaa2ed357b Alex Hung         2026-04-29  10040  	KUNIT_CASE(dm_test_to_connector_type_dvi_dvid),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10041  	KUNIT_CASE(dm_test_to_connector_type_dual_link_dvid),
58ad5aaa2ed357b Alex Hung         2026-04-29  10042  	KUNIT_CASE(dm_test_to_connector_type_virtual),
58ad5aaa2ed357b Alex Hung         2026-04-29  10043  	KUNIT_CASE(dm_test_to_connector_type_unknown),
58ad5aaa2ed357b Alex Hung         2026-04-29  10044  	/* is_duplicate_mode */
58ad5aaa2ed357b Alex Hung         2026-04-29  10045  	KUNIT_CASE(dm_test_is_duplicate_mode_empty_list),
58ad5aaa2ed357b Alex Hung         2026-04-29  10046  	KUNIT_CASE(dm_test_is_duplicate_mode_match),
58ad5aaa2ed357b Alex Hung         2026-04-29  10047  	KUNIT_CASE(dm_test_is_duplicate_mode_no_match),
58ad5aaa2ed357b Alex Hung         2026-04-29  10048  	KUNIT_CASE(dm_test_is_duplicate_mode_same_size_different_clock),
58ad5aaa2ed357b Alex Hung         2026-04-29  10049  	/* amdgpu_dm_get_encoder_crtc_mask */
58ad5aaa2ed357b Alex Hung         2026-04-29  10050  	KUNIT_CASE(dm_test_encoder_crtc_mask_1),
58ad5aaa2ed357b Alex Hung         2026-04-29  10051  	KUNIT_CASE(dm_test_encoder_crtc_mask_2),
58ad5aaa2ed357b Alex Hung         2026-04-29  10052  	KUNIT_CASE(dm_test_encoder_crtc_mask_3),
58ad5aaa2ed357b Alex Hung         2026-04-29  10053  	KUNIT_CASE(dm_test_encoder_crtc_mask_4),
58ad5aaa2ed357b Alex Hung         2026-04-29  10054  	KUNIT_CASE(dm_test_encoder_crtc_mask_5),
58ad5aaa2ed357b Alex Hung         2026-04-29  10055  	KUNIT_CASE(dm_test_encoder_crtc_mask_6),
58ad5aaa2ed357b Alex Hung         2026-04-29  10056  	KUNIT_CASE(dm_test_encoder_crtc_mask_default),
58ad5aaa2ed357b Alex Hung         2026-04-29  10057  	/* get_aspect_ratio */
58ad5aaa2ed357b Alex Hung         2026-04-29  10058  	KUNIT_CASE(dm_test_aspect_ratio_no_data),
58ad5aaa2ed357b Alex Hung         2026-04-29  10059  	KUNIT_CASE(dm_test_aspect_ratio_4_3),
58ad5aaa2ed357b Alex Hung         2026-04-29  10060  	KUNIT_CASE(dm_test_aspect_ratio_16_9),
58ad5aaa2ed357b Alex Hung         2026-04-29  10061  	KUNIT_CASE(dm_test_aspect_ratio_64_27),
58ad5aaa2ed357b Alex Hung         2026-04-29  10062  	KUNIT_CASE(dm_test_aspect_ratio_256_135),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10063  	/* copy_crtc_timing_for_drm_display_mode */
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10064  	KUNIT_CASE(dm_test_copy_crtc_timing_copies_all_fields),
77a3b5d7322232d Bhawanpreet Lakha 2026-06-25  10065  	KUNIT_CASE(dm_test_copy_crtc_timing_leaves_non_crtc_fields),
58ad5aaa2ed357b Alex Hung         2026-04-29  10066  	/* decide_crtc_timing_for_drm_display_mode */
58ad5aaa2ed357b Alex Hung         2026-04-29  10067  	KUNIT_CASE(dm_test_decide_crtc_timing_scale_enabled),
58ad5aaa2ed357b Alex Hung         2026-04-29  10068  	KUNIT_CASE(dm_test_decide_crtc_timing_matching_mode),
58ad5aaa2ed357b Alex Hung         2026-04-29  10069  	KUNIT_CASE(dm_test_decide_crtc_timing_no_copy),
58ad5aaa2ed357b Alex Hung         2026-04-29  10070  	KUNIT_CASE(dm_test_decide_crtc_timing_no_crtc_clock),
58ad5aaa2ed357b Alex Hung         2026-04-29  10071  	/* amdgpu_dm_connector_funcs_reset */
58ad5aaa2ed357b Alex Hung         2026-04-29  10072  	KUNIT_CASE(dm_test_funcs_reset_sets_defaults),
58ad5aaa2ed357b Alex Hung         2026-04-29  10073  	KUNIT_CASE(dm_test_funcs_reset_edp_abm_level),
58ad5aaa2ed357b Alex Hung         2026-04-29  10074  	KUNIT_CASE(dm_test_funcs_reset_edp_abm_disabled),
58ad5aaa2ed357b Alex Hung         2026-04-29  10075  	/* amdgpu_dm_connector_atomic_duplicate_state */
58ad5aaa2ed357b Alex Hung         2026-04-29  10076  	KUNIT_CASE(dm_test_atomic_dup_state_copies_fields),
58ad5aaa2ed357b Alex Hung         2026-04-29  10077  	/* amdgpu_dm_fill_hdr_info_packet */
58ad5aaa2ed357b Alex Hung         2026-04-29  10078  	KUNIT_CASE(dm_test_fill_hdr_null_metadata),
58ad5aaa2ed357b Alex Hung         2026-04-29  10079  	KUNIT_CASE(dm_test_fill_hdr_zeroes_output),
127c936d00f80c0 Bhawanpreet Lakha 2026-08-05  10080  	KUNIT_CASE(dm_test_fill_hdr_hdmi),
127c936d00f80c0 Bhawanpreet Lakha 2026-08-05  10081  	KUNIT_CASE(dm_test_fill_hdr_dp),
127c936d00f80c0 Bhawanpreet Lakha 2026-08-05  10082  	KUNIT_CASE(dm_test_fill_hdr_unsupported_connector),
127c936d00f80c0 Bhawanpreet Lakha 2026-08-05  10083  	KUNIT_CASE(dm_test_fill_hdr_bad_metadata),
0bc90da764e3465 Bhawanpreet Lakha 2026-08-05  10084  	/* amdgpu_dm_connector_atomic_check */
0bc90da764e3465 Bhawanpreet Lakha 2026-08-05  10085  	KUNIT_CASE(dm_test_conn_atomic_check_no_crtc),
0bc90da764e3465 Bhawanpreet Lakha 2026-08-05  10086  	KUNIT_CASE(dm_test_conn_atomic_check_dp_mst),
0bc90da764e3465 Bhawanpreet Lakha 2026-08-05  10087  	KUNIT_CASE(dm_test_conn_atomic_check_no_change),
a3233d68a19d30f Bhawanpreet Lakha 2026-08-05  10088  	KUNIT_CASE(dm_test_conn_atomic_check_privacy_change),
a3233d68a19d30f Bhawanpreet Lakha 2026-08-05  10089  	KUNIT_CASE(dm_test_conn_atomic_check_colorspace_change),
a3233d68a19d30f Bhawanpreet Lakha 2026-08-05  10090  	KUNIT_CASE(dm_test_conn_atomic_check_content_type_change),
a3233d68a19d30f Bhawanpreet Lakha 2026-08-05  10091  	KUNIT_CASE(dm_test_conn_atomic_check_hdr_exit),
a3233d68a19d30f Bhawanpreet Lakha 2026-08-05  10092  	KUNIT_CASE(dm_test_conn_atomic_check_hdr_fill_error),
58ad5aaa2ed357b Alex Hung         2026-04-29  10093  	/* amdgpu_dm_connector_atomic_set_property */
58ad5aaa2ed357b Alex Hung         2026-04-29  10094  	KUNIT_CASE(dm_test_set_property_scaling_center),
58ad5aaa2ed357b Alex Hung         2026-04-29  10095  	KUNIT_CASE(dm_test_set_property_scaling_aspect),
58ad5aaa2ed357b Alex Hung         2026-04-29  10096  	KUNIT_CASE(dm_test_set_property_scaling_fullscreen),
58ad5aaa2ed357b Alex Hung         2026-04-29  10097  	KUNIT_CASE(dm_test_set_property_scaling_none),
58ad5aaa2ed357b Alex Hung         2026-04-29  10098  	KUNIT_CASE(dm_test_set_property_scaling_unchanged),
58ad5aaa2ed357b Alex Hung         2026-04-29  10099  	KUNIT_CASE(dm_test_set_property_underscan_hborder),
58ad5aaa2ed357b Alex Hung         2026-04-29  10100  	KUNIT_CASE(dm_test_set_property_underscan_vborder),
58ad5aaa2ed357b Alex Hung         2026-04-29  10101  	KUNIT_CASE(dm_test_set_property_underscan_enable),
58ad5aaa2ed357b Alex Hung         2026-04-29  10102  	KUNIT_CASE(dm_test_set_property_abm_sysfs_control),
58ad5aaa2ed357b Alex Hung         2026-04-29  10103  	KUNIT_CASE(dm_test_set_property_abm_level_off),
58ad5aaa2ed357b Alex Hung         2026-04-29  10104  	KUNIT_CASE(dm_test_set_property_abm_level_value),
58ad5aaa2ed357b Alex Hung         2026-04-29  10105  	KUNIT_CASE(dm_test_set_property_unknown),
58ad5aaa2ed357b Alex Hung         2026-04-29  10106  	/* amdgpu_dm_connector_atomic_get_property */
58ad5aaa2ed357b Alex Hung         2026-04-29  10107  	KUNIT_CASE(dm_test_get_property_scaling_center),
58ad5aaa2ed357b Alex Hung         2026-04-29  10108  	KUNIT_CASE(dm_test_get_property_scaling_aspect),
58ad5aaa2ed357b Alex Hung         2026-04-29  10109  	KUNIT_CASE(dm_test_get_property_scaling_full),
58ad5aaa2ed357b Alex Hung         2026-04-29  10110  	KUNIT_CASE(dm_test_get_property_scaling_off),
58ad5aaa2ed357b Alex Hung         2026-04-29  10111  	KUNIT_CASE(dm_test_get_property_underscan_borders),
58ad5aaa2ed357b Alex Hung         2026-04-29  10112  	KUNIT_CASE(dm_test_get_property_abm_sysfs_allowed),
58ad5aaa2ed357b Alex Hung         2026-04-29  10113  	KUNIT_CASE(dm_test_get_property_abm_level),
58ad5aaa2ed357b Alex Hung         2026-04-29  10114  	KUNIT_CASE(dm_test_get_property_abm_disabled_zero),
58ad5aaa2ed357b Alex Hung         2026-04-29  10115  	KUNIT_CASE(dm_test_get_property_unknown),
58ad5aaa2ed357b Alex Hung         2026-04-29  10116  	/* amdgpu_dm_get_highest_refresh_rate_mode */
58ad5aaa2ed357b Alex Hung         2026-04-29  10117  	KUNIT_CASE(dm_test_highest_refresh_writeback_null),
58ad5aaa2ed357b Alex Hung         2026-04-29  10118  	KUNIT_CASE(dm_test_highest_refresh_cached_base),
58ad5aaa2ed357b Alex Hung         2026-04-29  10119  	KUNIT_CASE(dm_test_highest_refresh_preferred_mode),
58ad5aaa2ed357b Alex Hung         2026-04-29  10120  	/* amdgpu_dm_is_freesync_video_mode */
58ad5aaa2ed357b Alex Hung         2026-04-29  10121  	KUNIT_CASE(dm_test_is_freesync_video_mode_null_mode),
58ad5aaa2ed357b Alex Hung         2026-04-29  10122  	KUNIT_CASE(dm_test_is_freesync_video_mode_match),
58ad5aaa2ed357b Alex Hung         2026-04-29  10123  	KUNIT_CASE(dm_test_is_freesync_video_mode_no_match),
4027bdec119ea1b Bhawanpreet Lakha 2026-06-25  10124  	/* update_subconnector_property */
4027bdec119ea1b Bhawanpreet Lakha 2026-06-25  10125  	KUNIT_CASE(dm_test_update_subconnector_dp_with_sink),
4027bdec119ea1b Bhawanpreet Lakha 2026-06-25  10126  	KUNIT_CASE(dm_test_update_subconnector_dp_no_sink),
4027bdec119ea1b Bhawanpreet Lakha 2026-06-25  10127  	KUNIT_CASE(dm_test_update_subconnector_non_dp_noop),
4d9439b039f9620 Chenyu Chen       2026-06-22  10128  	/* amdgpu_dm_update_cacp_caps */
4d9439b039f9620 Chenyu Chen       2026-06-22  10129  	KUNIT_CASE(dm_test_cacp_caps_unsupported_ip),
4d9439b039f9620 Chenyu Chen       2026-06-22  10130  	KUNIT_CASE(dm_test_cacp_caps_excluded_ip_316),
4d9439b039f9620 Chenyu Chen       2026-06-22  10131  	KUNIT_CASE(dm_test_cacp_caps_edp_oled_supported),
4d9439b039f9620 Chenyu Chen       2026-06-22  10132  	KUNIT_CASE(dm_test_cacp_caps_lvds_oled_supported),
4d9439b039f9620 Chenyu Chen       2026-06-22  10133  	KUNIT_CASE(dm_test_cacp_caps_non_edp_signal),
4d9439b039f9620 Chenyu Chen       2026-06-22  10134  	KUNIT_CASE(dm_test_cacp_caps_lcd_panel),
4d9439b039f9620 Chenyu Chen       2026-06-22  10135  	/* amdgpu_dm_set_panel_type */
4d9439b039f9620 Chenyu Chen       2026-06-22  10136  	KUNIT_CASE(dm_test_set_panel_type_vsdb_oled),
4d9439b039f9620 Chenyu Chen       2026-06-22  10137  	KUNIT_CASE(dm_test_set_panel_type_vsdb_miniled),
4d9439b039f9620 Chenyu Chen       2026-06-22  10138  	KUNIT_CASE(dm_test_set_panel_type_dpcd_oled),
4d9439b039f9620 Chenyu Chen       2026-06-22  10139  	KUNIT_CASE(dm_test_set_panel_type_dpcd_miniled),
4d9439b039f9620 Chenyu Chen       2026-06-22  10140  	KUNIT_CASE(dm_test_set_panel_type_did_oled),
4d9439b039f9620 Chenyu Chen       2026-06-22  10141  	KUNIT_CASE(dm_test_set_panel_type_did_lcd),
4d9439b039f9620 Chenyu Chen       2026-06-22  10142  	KUNIT_CASE(dm_test_set_panel_type_vendor_lum_heuristic),
4d9439b039f9620 Chenyu Chen       2026-06-22  10143  	KUNIT_CASE(dm_test_set_panel_type_defaults_to_lcd),
b8eb3a80ec3e2ec Bhawanpreet Lakha 2026-06-23  10144  	/* amdgpu_dm_fbc_init */
b8eb3a80ec3e2ec Bhawanpreet Lakha 2026-06-23  10145  	KUNIT_CASE(dm_test_fbc_init_no_compressor),
b8eb3a80ec3e2ec Bhawanpreet Lakha 2026-06-23  10146  	KUNIT_CASE(dm_test_fbc_init_non_edp),
b8eb3a80ec3e2ec Bhawanpreet Lakha 2026-06-23  10147  	KUNIT_CASE(dm_test_fbc_init_already_allocated),
b8eb3a80ec3e2ec Bhawanpreet Lakha 2026-06-23  10148  	KUNIT_CASE(dm_test_fbc_init_no_modes),
7db18f723b76e29 Bhawanpreet Lakha 2026-06-23  10149  	/* amdgpu_dm_detect_mst_link_for_all_connectors */
7db18f723b76e29 Bhawanpreet Lakha 2026-06-23  10150  	KUNIT_CASE(dm_test_detect_mst_no_connectors),
7db18f723b76e29 Bhawanpreet Lakha 2026-06-23  10151  	KUNIT_CASE(dm_test_detect_mst_skips_writeback),
7db18f723b76e29 Bhawanpreet Lakha 2026-06-23  10152  	KUNIT_CASE(dm_test_detect_mst_non_mst_link),
7db18f723b76e29 Bhawanpreet Lakha 2026-06-23  10153  	KUNIT_CASE(dm_test_detect_mst_branch_without_aux),
826752ad96cd7a4 Bhawanpreet Lakha 2026-07-29  10154  	KUNIT_CASE(dm_test_detect_mst_start_fail),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10155  	/* amdgpu_dm_find_first_crtc_matching_connector */
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10156  	KUNIT_CASE(dm_test_find_first_crtc_match),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10157  	KUNIT_CASE(dm_test_find_first_crtc_no_match),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10158  	KUNIT_CASE(dm_test_find_first_crtc_empty_state),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10159  	KUNIT_CASE(dm_test_find_first_crtc_skips_null_ptr),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10160  	KUNIT_CASE(dm_test_find_first_crtc_returns_first),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10161  	/* amdgpu_dm_set_panel_type */
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10162  	KUNIT_CASE(dm_test_set_panel_type_samsung_miniled),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10163  	KUNIT_CASE(dm_test_set_panel_type_samsung_below_threshold),
65cd8ebe8d7c9f3 Bhawanpreet Lakha 2026-06-24  10164  	KUNIT_CASE(dm_test_set_panel_type_default_lcd),
814e57d1e67d770 Bhawanpreet Lakha 2026-06-24  10165  	/* amdgpu_dm_update_cacp_caps */
814e57d1e67d770 Bhawanpreet Lakha 2026-06-24  10166  	KUNIT_CASE(dm_test_cacp_caps_edp_supported),
814e57d1e67d770 Bhawanpreet Lakha 2026-06-24  10167  	KUNIT_CASE(dm_test_cacp_caps_lvds_supported),
814e57d1e67d770 Bhawanpreet Lakha 2026-06-24  10168  	KUNIT_CASE(dm_test_cacp_caps_old_ip_unsupported),
814e57d1e67d770 Bhawanpreet Lakha 2026-06-24  10169  	KUNIT_CASE(dm_test_cacp_caps_ip_3_1_6_unsupported),
814e57d1e67d770 Bhawanpreet Lakha 2026-06-24  10170  	KUNIT_CASE(dm_test_cacp_caps_non_edp_lvds_unsupported),
814e57d1e67d770 Bhawanpreet Lakha 2026-06-24  10171  	KUNIT_CASE(dm_test_cacp_caps_lcd_unsupported),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10172  	/* fill_stream_properties_from_drm_display_mode */
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10173  	KUNIT_CASE(dm_test_fill_stream_borders_zeroed),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10174  	KUNIT_CASE(dm_test_fill_stream_rgb_defaults),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10175  	KUNIT_CASE(dm_test_fill_stream_sync_polarity_positive),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10176  	KUNIT_CASE(dm_test_fill_stream_sync_polarity_negative),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10177  	KUNIT_CASE(dm_test_fill_stream_inherits_old_stream),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10178  	KUNIT_CASE(dm_test_fill_stream_timing_from_crtc),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10179  	KUNIT_CASE(dm_test_fill_stream_color_depth_requested_bpc),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10180  	KUNIT_CASE(dm_test_fill_stream_content_type),
e1154e55e29ed3b Bhawanpreet Lakha 2026-06-24  10181  	KUNIT_CASE(dm_test_fill_stream_aspect_ratio),
4e21311ac088332 Ivan Lipski       2026-07-20  10182  	KUNIT_CASE(dm_test_fill_stream_encoding_from_caller_ycbcr420),
4e21311ac088332 Ivan Lipski       2026-07-20  10183  	KUNIT_CASE(dm_test_fill_stream_encoding_from_caller_ycbcr422),
4e21311ac088332 Ivan Lipski       2026-07-20  10184  	KUNIT_CASE(dm_test_fill_stream_encoding_from_caller_ycbcr444),
4e21311ac088332 Ivan Lipski       2026-07-20  10185  	KUNIT_CASE(dm_test_fill_stream_hdmi_ep_clamps_depth),
4e21311ac088332 Ivan Lipski       2026-07-20  10186  	KUNIT_CASE(dm_test_fill_stream_non_hdmi_ep_keeps_depth),
bd8664444d83a34 Bhawanpreet Lakha 2026-07-29  10187  	KUNIT_CASE(dm_test_fill_stream_hdmi_infoframe),
bd8664444d83a34 Bhawanpreet Lakha 2026-07-29  10188  	KUNIT_CASE(dm_test_fill_stream_freesync_video),
f07e0c2b45f10e0 Bhawanpreet Lakha 2026-06-24  10189  	/* create_stream_for_sink */
f07e0c2b45f10e0 Bhawanpreet Lakha 2026-06-24  10190  	KUNIT_CASE(dm_test_create_stream_fake_sink_success),
f07e0c2b45f10e0 Bhawanpreet Lakha 2026-06-24  10191  	KUNIT_CASE(dm_test_create_stream_sets_dm_context),
f07e0c2b45f10e0 Bhawanpreet Lakha 2026-06-24  10192  	KUNIT_CASE(dm_test_create_stream_virtual_signal),
f07e0c2b45f10e0 Bhawanpreet Lakha 2026-06-24  10193  	KUNIT_CASE(dm_test_create_stream_scaling_src),
f07e0c2b45f10e0 Bhawanpreet Lakha 2026-06-24  10194  	KUNIT_CASE(dm_test_create_stream_existing_sink),
fa2e555d567ea5c Alex Hung         2026-08-29  10195  	KUNIT_CASE(dm_test_create_stream_preferred_mode),
fa2e555d567ea5c Alex Hung         2026-08-29  10196  	KUNIT_CASE(dm_test_create_stream_scaled_keeps_refresh),
fa2e555d567ea5c Alex Hung         2026-08-29  10197  	KUNIT_CASE(dm_test_create_stream_timing_override),
fa2e555d567ea5c Alex Hung         2026-08-29  10198  	KUNIT_CASE(dm_test_create_stream_dp_vsc_colorimetry),
fa2e555d567ea5c Alex Hung         2026-08-29  10199  	KUNIT_CASE(dm_test_create_stream_dp_colorimetry_quirk),
fa2e555d567ea5c Alex Hung         2026-08-29  10200  	KUNIT_CASE(dm_test_create_stream_hdmi_vsif),
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10201  	/* amdgpu_dm_connector_detect */
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10202  	KUNIT_CASE(dm_test_detect_force_on),
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10203  	KUNIT_CASE(dm_test_detect_force_on_digital),
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10204  	KUNIT_CASE(dm_test_detect_force_off),
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10205  	KUNIT_CASE(dm_test_detect_sink_present),
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10206  	KUNIT_CASE(dm_test_detect_no_sink),
abc06e5b2083d27 Bhawanpreet Lakha 2026-07-29  10207  	KUNIT_CASE(dm_test_detect_hides_secondary_tile),
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10208  	/* amdgpu_dm_connector_poll */
1444d6056e4cb5e Bhawanpreet Lakha 2026-06-24  10209  	KUNIT_CASE(dm_test_poll_dac_load_returns_cached),
7d407baea498ab9 Bhawanpreet Lakha 2026-07-29  10210  	KUNIT_CASE(dm_test_poll_connected_cached_sink),
7d407baea498ab9 Bhawanpreet Lakha 2026-07-29  10211  	KUNIT_CASE(dm_test_poll_connected_new_sink),
7d407baea498ab9 Bhawanpreet Lakha 2026-07-29  10212  	KUNIT_CASE(dm_test_poll_disconnect_releases_sink),
8e4007da4a51104 Bhawanpreet Lakha 2026-06-24  10213  	/* amdgpu_dm_connector_late_register */
8e4007da4a51104 Bhawanpreet Lakha 2026-06-24  10214  	KUNIT_CASE(dm_test_late_register_non_dp_succeeds),
8e4007da4a51104 Bhawanpreet Lakha 2026-06-24  10215  	/* amdgpu_dm_connector_unregister */
8e4007da4a51104 Bhawanpreet Lakha 2026-06-24  10216  	KUNIT_CASE(dm_test_unregister_non_dp_noop),
7622331fe336b5d Bhawanpreet Lakha 2026-06-24  10217  	/* amdgpu_dm_connector_destroy */
7622331fe336b5d Bhawanpreet Lakha 2026-06-24  10218  	KUNIT_CASE(dm_test_destroy_minimal),
7622331fe336b5d Bhawanpreet Lakha 2026-06-24  10219  	KUNIT_CASE(dm_test_destroy_releases_dc_sink),
7622331fe336b5d Bhawanpreet Lakha 2026-06-24  10220  	KUNIT_CASE(dm_test_destroy_releases_dc_em_sink),
5521970b597fbb2 Bhawanpreet Lakha 2026-06-24  10221  	/* dm_encoder_helper_disable */
5521970b597fbb2 Bhawanpreet Lakha 2026-06-24  10222  	KUNIT_CASE(dm_test_encoder_disable_noop),
5521970b597fbb2 Bhawanpreet Lakha 2026-06-24  10223  	/* dm_encoder_helper_atomic_check */
5521970b597fbb2 Bhawanpreet Lakha 2026-06-24  10224  	KUNIT_CASE(dm_test_atomic_check_edp_native_keeps_scaling),
5521970b597fbb2 Bhawanpreet Lakha 2026-06-24  10225  	KUNIT_CASE(dm_test_atomic_check_lvds_non_native_enables_scaling),
5521970b597fbb2 Bhawanpreet Lakha 2026-06-24  10226  	KUNIT_CASE(dm_test_atomic_check_non_mst_returns_zero),
54a087dbf2e7acd Bhawanpreet Lakha 2026-07-29  10227  	KUNIT_CASE(dm_test_atomic_check_mst_no_change_returns_zero),
54a087dbf2e7acd Bhawanpreet Lakha 2026-07-29  10228  	KUNIT_CASE(dm_test_atomic_check_mst_finds_vcpi_slots),
54a087dbf2e7acd Bhawanpreet Lakha 2026-07-29  10229  	KUNIT_CASE(dm_test_atomic_check_mst_duplicated_skips_pbn),
54a087dbf2e7acd Bhawanpreet Lakha 2026-07-29  10230  	KUNIT_CASE(dm_test_atomic_check_mst_topology_err_propagates),
54a087dbf2e7acd Bhawanpreet Lakha 2026-07-29  10231  	KUNIT_CASE(dm_test_atomic_check_mst_vcpi_error_propagates),
e24b15363a027a3 Bhawanpreet Lakha 2026-07-29  10232  	KUNIT_CASE(dm_test_encoder_init_success),
77c40159127e7da Bhawanpreet Lakha 2026-06-24  10233  	/* hdmi_cec_unset_edid */
77c40159127e7da Bhawanpreet Lakha 2026-06-24  10234  	KUNIT_CASE(dm_test_hdmi_cec_unset_edid_no_notifier),
77c40159127e7da Bhawanpreet Lakha 2026-06-24  10235  	/* create_eml_sink */
77c40159127e7da Bhawanpreet Lakha 2026-06-24  10236  	KUNIT_CASE(dm_test_create_eml_sink_no_edid),
d42186526cfe62d Bhawanpreet Lakha 2026-08-06  10237  	KUNIT_CASE(dm_test_create_eml_sink_reads_edid),
d42186526cfe62d Bhawanpreet Lakha 2026-08-06  10238  	KUNIT_CASE(dm_test_create_eml_sink_force_on_em),
d42186526cfe62d Bhawanpreet Lakha 2026-08-06  10239  	KUNIT_CASE(dm_test_create_eml_sink_force_on_local),
77c40159127e7da Bhawanpreet Lakha 2026-06-24  10240  	/* handle_edid_mgmt */
77c40159127e7da Bhawanpreet Lakha 2026-06-24  10241  	KUNIT_CASE(dm_test_handle_edid_mgmt_dp_sets_link_caps),
77c40159127e7da Bhawanpreet Lakha 2026-06-24  10242  	KUNIT_CASE(dm_test_handle_edid_mgmt_non_dp_leaves_caps),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10243  	/* amdgpu_dm_connector_funcs_force */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10244  	KUNIT_CASE(dm_test_funcs_force_no_edid),
461526a4d6d4713 Bhawanpreet Lakha 2026-08-06  10245  	KUNIT_CASE(dm_test_funcs_force_reads_edid),
a3b6f8599062884 Bhawanpreet Lakha 2026-08-06  10246  	/* amdgpu_dm_connector_get_modes */
a3b6f8599062884 Bhawanpreet Lakha 2026-08-06  10247  	KUNIT_CASE(dm_test_get_modes_noedid_default),
a3b6f8599062884 Bhawanpreet Lakha 2026-08-06  10248  	KUNIT_CASE(dm_test_get_modes_noedid_128b_adds_more),
a3b6f8599062884 Bhawanpreet Lakha 2026-08-06  10249  	KUNIT_CASE(dm_test_get_modes_noedid_analog_adds_common),
a3b6f8599062884 Bhawanpreet Lakha 2026-08-06  10250  	KUNIT_CASE(dm_test_get_modes_with_edid),
b1fbbc41bb85f3c Bhawanpreet Lakha 2026-08-06  10251  	/* amdgpu_set_panel_orientation */
b1fbbc41bb85f3c Bhawanpreet Lakha 2026-08-06  10252  	KUNIT_CASE(dm_test_panel_orientation_non_edp),
b1fbbc41bb85f3c Bhawanpreet Lakha 2026-08-06  10253  	KUNIT_CASE(dm_test_panel_orientation_no_native_mode),
b1fbbc41bb85f3c Bhawanpreet Lakha 2026-08-06  10254  	KUNIT_CASE(dm_test_panel_orientation_applies_quirk),
e4d9b025740f1fd Bhawanpreet Lakha 2026-08-06  10255  	/* amdgpu_dm_prune_primary_tile_modes */
e4d9b025740f1fd Bhawanpreet Lakha 2026-08-06  10256  	KUNIT_CASE(dm_test_prune_no_sink),
e4d9b025740f1fd Bhawanpreet Lakha 2026-08-06  10257  	KUNIT_CASE(dm_test_prune_no_patch),
e4d9b025740f1fd Bhawanpreet Lakha 2026-08-06  10258  	KUNIT_CASE(dm_test_prune_no_tile),
e4d9b025740f1fd Bhawanpreet Lakha 2026-08-06  10259  	KUNIT_CASE(dm_test_prune_secondary_tile),
e4d9b025740f1fd Bhawanpreet Lakha 2026-08-06  10260  	KUNIT_CASE(dm_test_prune_removes_per_tile),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10261  	/* dm_validate_stream_and_context */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10262  	KUNIT_CASE(dm_test_validate_stream_null_stream),
cb2002fac9d6d4a Bhawanpreet Lakha 2026-07-29  10263  	KUNIT_CASE(dm_test_validate_stream_dc_ok_no_pipe),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10264  	/* amdgpu_dm_connector_to_encoder */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10265  	KUNIT_CASE(dm_test_to_encoder_no_encoder),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10266  	KUNIT_CASE(dm_test_to_encoder_returns_attached),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10267  	/* amdgpu_dm_get_native_mode */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10268  	KUNIT_CASE(dm_test_native_mode_no_encoder),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10269  	KUNIT_CASE(dm_test_native_mode_empty_probed_zeroes_clock),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10270  	KUNIT_CASE(dm_test_native_mode_copies_preferred),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10271  	/* amdgpu_dm_create_common_mode */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10272  	KUNIT_CASE(dm_test_create_common_mode_overrides),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10273  	/* amdgpu_dm_connector_add_common_modes */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10274  	KUNIT_CASE(dm_test_add_common_modes_non_edp_noop),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10275  	KUNIT_CASE(dm_test_add_common_modes_edp_adds),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10276  	/* amdgpu_dm_connector_ddc_get_modes */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10277  	KUNIT_CASE(dm_test_ddc_get_modes_null_edid),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10278  	/* add_fs_modes */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10279  	KUNIT_CASE(dm_test_add_fs_modes_no_preferred_mode),
17775b5a9c32cf7 Bhawanpreet Lakha 2026-08-06  10280  	KUNIT_CASE(dm_test_add_fs_modes_generates),
17775b5a9c32cf7 Bhawanpreet Lakha 2026-08-06  10281  	KUNIT_CASE(dm_test_add_fs_modes_out_of_range),
5e0378afd2b1498 Bhawanpreet Lakha 2026-08-06  10282  	KUNIT_CASE(dm_test_add_fs_modes_skips_illegal),
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10283  	/* amdgpu_dm_connector_add_freesync_modes */
f2e22a10569c76e Bhawanpreet Lakha 2026-06-24  10284  	KUNIT_CASE(dm_test_add_freesync_modes_null_edid_noop),
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10285  	/* amdgpu_dm_i2c_func */
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10286  	KUNIT_CASE(dm_test_i2c_func_returns_flags),
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10287  	/* amdgpu_dm_i2c_xfer */
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10288  	KUNIT_CASE(dm_test_i2c_xfer_no_ddc_pin),
771f61a8f61b91e Bhawanpreet Lakha 2026-08-07  10289  	KUNIT_CASE(dm_test_i2c_xfer_hw_submit_fails),
771f61a8f61b91e Bhawanpreet Lakha 2026-08-07  10290  	KUNIT_CASE(dm_test_i2c_xfer_oem_no_device),
482e6654735b2f3 Bhawanpreet Lakha 2026-08-07  10291  	/* amdgpu_dm_create_i2c */
482e6654735b2f3 Bhawanpreet Lakha 2026-08-07  10292  	KUNIT_CASE(dm_test_create_i2c_oem),
482e6654735b2f3 Bhawanpreet Lakha 2026-08-07  10293  	KUNIT_CASE(dm_test_create_i2c_hw_bus),
00079447d1cdc7a Bhawanpreet Lakha 2026-08-10  10294  	/* dm_restore_drm_connector_state */
00079447d1cdc7a Bhawanpreet Lakha 2026-08-10  10295  	KUNIT_CASE(dm_test_restore_state_writeback),
00079447d1cdc7a Bhawanpreet Lakha 2026-08-10  10296  	KUNIT_CASE(dm_test_restore_state_no_dc_sink),
00079447d1cdc7a Bhawanpreet Lakha 2026-08-10  10297  	KUNIT_CASE(dm_test_restore_state_no_connector_state),
00079447d1cdc7a Bhawanpreet Lakha 2026-08-10  10298  	KUNIT_CASE(dm_test_restore_state_no_encoder),
00079447d1cdc7a Bhawanpreet Lakha 2026-08-10  10299  	KUNIT_CASE(dm_test_restore_state_no_stream),
00079447d1cdc7a Bhawanpreet Lakha 2026-08-10  10300  	KUNIT_CASE(dm_test_restore_state_same_sink),
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10301  	/* get_amd_vsdb */
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10302  	KUNIT_CASE(dm_test_get_amd_vsdb_unsupported),
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10303  	KUNIT_CASE(dm_test_get_amd_vsdb_supported),
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10304  	/* parse_edid_displayid_vrr */
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10305  	KUNIT_CASE(dm_test_parse_displayid_vrr_null_edid),
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10306  	KUNIT_CASE(dm_test_parse_displayid_vrr_no_displayid),
f6e73f251a3864d Bhawanpreet Lakha 2026-06-25  10307  	KUNIT_CASE(dm_test_parse_displayid_vrr_sets_range),
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10308  	/* amdgpu_dm_connector_mode_valid */
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10309  	KUNIT_CASE(dm_test_mode_valid_interlace_rejected),
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10310  	KUNIT_CASE(dm_test_mode_valid_dblscan_rejected),
1096f4648c5f826 Bhawanpreet Lakha 2026-08-05  10311  	KUNIT_CASE(dm_test_mode_valid_no_dc_sink),
1096f4648c5f826 Bhawanpreet Lakha 2026-08-05  10312  	KUNIT_CASE(dm_test_mode_valid_force_on_no_stream),
6dc27c2ddd28b99 Bhawanpreet Lakha 2026-08-05  10313  	KUNIT_CASE(dm_test_mode_valid_edid_mgmt_forced),
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10314  	/* amdgpu_dm_hdmi_cec_set_edid */
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10315  	KUNIT_CASE(dm_test_hdmi_cec_set_edid_no_notifier),
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10316  	/* amdgpu_dm_s3_handle_hdmi_cec */
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10317  	KUNIT_CASE(dm_test_s3_handle_hdmi_cec_suspend),
33f790688acf906 Bhawanpreet Lakha 2026-06-25  10318  	KUNIT_CASE(dm_test_s3_handle_hdmi_cec_resume),
0a0bfc3fd2d4c45 Bhawanpreet Lakha 2026-06-25  10319  	/* amdgpu_dm_create_validate_stream_for_sink */
0a0bfc3fd2d4c45 Bhawanpreet Lakha 2026-06-25  10320  	KUNIT_CASE(dm_test_create_validate_stream_null_dm_state),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10321  	KUNIT_CASE(dm_test_create_validate_stream_writeback),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10322  	KUNIT_CASE(dm_test_create_validate_stream_no_valid_bpc),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10323  	KUNIT_CASE(dm_test_create_validate_stream_hdmi_ycbcr),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10324  	KUNIT_CASE(dm_test_create_validate_stream_force_ycbcr420),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10325  	KUNIT_CASE(dm_test_create_validate_stream_force_ycbcr422),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10326  	KUNIT_CASE(dm_test_create_validate_stream_force_ycbcr444),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10327  	KUNIT_CASE(dm_test_create_validate_stream_prune_timing),
fe5910d89be690b Bhawanpreet Lakha 2026-08-05  10328  	KUNIT_CASE(dm_test_create_validate_stream_prune_context),
b6192d025c660b6 Adrian Betschart  2026-09-11  10329  	KUNIT_CASE(dm_test_create_validate_stream_hdmi_rgb_first),
0a0bfc3fd2d4c45 Bhawanpreet Lakha 2026-06-25  10330  	/* amdgpu_dm_update_connector_after_detect */
0a0bfc3fd2d4c45 Bhawanpreet Lakha 2026-06-25  10331  	KUNIT_CASE(dm_test_update_after_detect_mst_noop),
0a0bfc3fd2d4c45 Bhawanpreet Lakha 2026-06-25  10332  	KUNIT_CASE(dm_test_update_after_detect_sink_unchanged),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10333  	KUNIT_CASE(dm_test_update_after_detect_mst_sink),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10334  	KUNIT_CASE(dm_test_update_after_detect_connect_edid),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10335  	KUNIT_CASE(dm_test_update_after_detect_replace_no_edid),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10336  	KUNIT_CASE(dm_test_update_after_detect_disconnect),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10337  	KUNIT_CASE(dm_test_update_after_detect_force_em_adopt),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10338  	KUNIT_CASE(dm_test_update_after_detect_force_em_replace),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10339  	KUNIT_CASE(dm_test_update_after_detect_force_em_fake),
04b562fcdb67fbd Bhawanpreet Lakha 2026-07-29  10340  	KUNIT_CASE(dm_test_update_after_detect_force_em_keep),
8cfb7dd1c823293 Alex Hung         2026-07-09  10341  	/* amdgpu_dm_update_stream_scaling_settings */
8cfb7dd1c823293 Alex Hung         2026-07-09  10342  	KUNIT_CASE(dm_test_update_scaling_null_mode),
8cfb7dd1c823293 Alex Hung         2026-07-09  10343  	KUNIT_CASE(dm_test_update_scaling_fullscreen_default),
8cfb7dd1c823293 Alex Hung         2026-07-09  10344  	KUNIT_CASE(dm_test_update_scaling_rmx_full),
8cfb7dd1c823293 Alex Hung         2026-07-09  10345  	KUNIT_CASE(dm_test_update_scaling_rmx_aspect_pillarbox),
8cfb7dd1c823293 Alex Hung         2026-07-09  10346  	KUNIT_CASE(dm_test_update_scaling_rmx_aspect_letterbox),
8cfb7dd1c823293 Alex Hung         2026-07-09  10347  	KUNIT_CASE(dm_test_update_scaling_rmx_center),
8cfb7dd1c823293 Alex Hung         2026-07-09  10348  	KUNIT_CASE(dm_test_update_scaling_underscan),
e9040b2bb48c513 Bhawanpreet Lakha 2026-08-07  10349  	/* hdmi_frl_status_polling_work */
e9040b2bb48c513 Bhawanpreet Lakha 2026-08-07  10350  	KUNIT_CASE(dm_test_frl_no_links),
e9040b2bb48c513 Bhawanpreet Lakha 2026-08-07  10351  	KUNIT_CASE(dm_test_frl_skips_no_local_sink),
e9040b2bb48c513 Bhawanpreet Lakha 2026-08-07  10352  	KUNIT_CASE(dm_test_frl_skips_non_hdmi),
e9040b2bb48c513 Bhawanpreet Lakha 2026-08-07  10353  	KUNIT_CASE(dm_test_frl_skips_zero_rate),
e9040b2bb48c513 Bhawanpreet Lakha 2026-08-07  10354  	KUNIT_CASE(dm_test_frl_poll_no_update),
e9040b2bb48c513 Bhawanpreet Lakha 2026-08-07  10355  	KUNIT_CASE(dm_test_frl_poll_retrains),
6b355899dd2fc4f Alex Hung         2026-08-29  10356  	/* amdgpu_dm_connector_init_helper */
6b355899dd2fc4f Alex Hung         2026-08-29  10357  	KUNIT_CASE(dm_test_init_helper_common_defaults),
6b355899dd2fc4f Alex Hung         2026-08-29  10358  	KUNIT_CASE(dm_test_init_helper_hdmi),
6b355899dd2fc4f Alex Hung         2026-08-29  10359  	KUNIT_CASE(dm_test_init_helper_dp),
6b355899dd2fc4f Alex Hung         2026-08-29  10360  	KUNIT_CASE(dm_test_init_helper_dp_mst_root),
6b355899dd2fc4f Alex Hung         2026-08-29  10361  	KUNIT_CASE(dm_test_init_helper_dvid),
6b355899dd2fc4f Alex Hung         2026-08-29  10362  	KUNIT_CASE(dm_test_init_helper_vga),
6b355899dd2fc4f Alex Hung         2026-08-29  10363  	KUNIT_CASE(dm_test_init_helper_unpolled_default),
6b355899dd2fc4f Alex Hung         2026-08-29  10364  	KUNIT_CASE(dm_test_init_helper_edp),
6b355899dd2fc4f Alex Hung         2026-08-29  10365  	KUNIT_CASE(dm_test_init_helper_hdcp_property),
6b355899dd2fc4f Alex Hung         2026-08-29  10366  	KUNIT_CASE(dm_test_init_helper_hpd_debounce_disabled),
0e3b14d0bbee42b Alex Hung         2026-08-29  10367  	/* amdgpu_dm_initialize_hdmi_connector */
0e3b14d0bbee42b Alex Hung         2026-08-29  10368  	KUNIT_CASE(dm_test_initialize_hdmi_cec_registers),
34afeaad1f54c4d Alex Hung         2026-08-29  10369  	/* amdgpu_dm_update_freesync_caps */
34afeaad1f54c4d Alex Hung         2026-08-29  10370  	KUNIT_CASE(dm_test_fs_caps_dp_msa_range),
34afeaad1f54c4d Alex Hung         2026-08-29  10371  	KUNIT_CASE(dm_test_fs_caps_dp_narrow_range),
34afeaad1f54c4d Alex Hung         2026-08-29  10372  	KUNIT_CASE(dm_test_fs_caps_dp_msa_not_allowed),
34afeaad1f54c4d Alex Hung         2026-08-29  10373  	KUNIT_CASE(dm_test_fs_caps_edp_replay_mode),
34afeaad1f54c4d Alex Hung         2026-08-29  10374  	KUNIT_CASE(dm_test_fs_caps_hdmi_vsdb),
34afeaad1f54c4d Alex Hung         2026-08-29  10375  	KUNIT_CASE(dm_test_fs_caps_hdmi_no_vsdb),
34afeaad1f54c4d Alex Hung         2026-08-29  10376  	KUNIT_CASE(dm_test_fs_caps_pcon_whitelist),
34afeaad1f54c4d Alex Hung         2026-08-29  10377  	KUNIT_CASE(dm_test_fs_caps_force_min_hz_quirk),
34afeaad1f54c4d Alex Hung         2026-08-29  10378  	KUNIT_CASE(dm_test_fs_caps_mccs_clears_capability),
34afeaad1f54c4d Alex Hung         2026-08-29  10379  	KUNIT_CASE(dm_test_fs_caps_disables_replay),
e89e4604597dfe2 Alex Hung         2026-08-29  10380  	/* amdgpu_dm_connector_init */
e89e4604597dfe2 Alex Hung         2026-08-29  10381  	KUNIT_CASE(dm_test_conn_init_hdmi),
e89e4604597dfe2 Alex Hung         2026-08-29  10382  	KUNIT_CASE(dm_test_conn_init_dvi),
e89e4604597dfe2 Alex Hung         2026-08-29  10383  	KUNIT_CASE(dm_test_conn_init_get_modes_hook),
a9e28b4d84935ec Alex Hung         2026-08-29  10384  	/* dm_force_atomic_commit */
a9e28b4d84935ec Alex Hung         2026-08-29  10385  	KUNIT_CASE(dm_test_force_commit_succeeds),
a9e28b4d84935ec Alex Hung         2026-08-29  10386  	KUNIT_CASE(dm_test_force_commit_conn_state_error),
58ad5aaa2ed357b Alex Hung         2026-04-29  10387  	{}
58ad5aaa2ed357b Alex Hung         2026-04-29  10388  };
58ad5aaa2ed357b Alex Hung         2026-04-29  10389  

:::::: The code at line 9978 was first introduced by commit
:::::: 58ad5aaa2ed357b0237e5ae7a376b2bd2d7d36db drm/amd/display: Add KUnit tests for amdgpu_dm_connector

:::::: TO: Alex Hung <alex.hung@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
