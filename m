Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81E200137;
	Tue,  2 Jul 2024 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719953440; cv=none; b=TlKwsTmEcXX+NTNON4p1fIfy6/wa6MViF0UxwQ5D5CDnJ7b7JM9YOvo3goDeK0gDZRIgldlD+Bz++sVwwju5YdlgzOBaChaAh6WHYdShNHqUNqm1sF8xgMx9K/Llu/pcPjwgfMAgWFNNcYlARvdTQVqRl5Y+J/VwRh3X8eyo/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719953440; c=relaxed/simple;
	bh=g5H7A4pwS0zQSPWku94nkoUEbRxphLWYfkzs3W8mlB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1Jnn0itGpKKjhNGDePlCGa3FgQKYhA0KWDemEo1ehVdNCPcSgqiC33nFdkDUWMLKRpEBuG4oI5GPzBH89G3w/dvGog9A+gbCXCzkXUi3/g412kW8aNCfUXPa/69C9OUSAxBWtpmYZNiz9mJMOFK1GHWmot1XIevEC996ZNt8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aW2ChdtH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aW2ChdtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719953438; x=1751489438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g5H7A4pwS0zQSPWku94nkoUEbRxphLWYfkzs3W8mlB0=;
  b=aW2ChdtHxcgWVrSLSC/4XXHO+FCxC3wKLSgGNzaCzLY103XxdrZzo5pF
   UjwFYvX+bpBT8bH9exc/o9EY6lBsNbW/H5DTQk0EuZKEoWqZiYUeEIc2o
   Dk3VxR6mpmoQPdm9d2rDQIf+m8KuGqDeRTbA3a/tPBRpDDeQKaotN4++w
   SQam5Aj7xoIlEjev5bEon4tkebAdyhzClxN6KB+wqyEKd9TV++JyXX9ey
   Px3ZxAZjbFYFbTHG508BuauQ2D6v+EVFolU3rPrIc7WqNlQTZHC0kXLUi
   YRc9oXyWvpLkd+4F599gSZJZNVARPSRm41UczL5gs8GR/TUvn1IKmgvGn
   w==;
X-CSE-ConnectionGUID: 9EkF1xvzRR29zdE+FadYng==
X-CSE-MsgGUID: zwosrucAQ4u9U5vOUa5nNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17029642"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17029642"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 13:50:35 -0700
X-CSE-ConnectionGUID: 6qz7mYDCTViC8VRbzm/mKw==
X-CSE-MsgGUID: USNXMlpWSryLevUIaz/D/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="76755901"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2024 13:50:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOkSN-000OeG-0k;
	Tue, 02 Jul 2024 20:50:31 +0000
Date: Wed, 3 Jul 2024 04:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped
 MIPI DCS functions
Message-ID: <202407030420.ECruvZx4-lkp@intel.com>
References: <20240628124444.28152-4-lvzhaoxiong@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628124444.28152-4-lvzhaoxiong@huaqin.corp-partner.google.com>

Hi Zhaoxiong,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.10-rc6]
[cannot apply to next-20240702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhaoxiong-Lv/drm-panel-jd9365da-Modify-the-method-of-sending-commands/20240630-000444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240628124444.28152-4-lvzhaoxiong%40huaqin.corp-partner.google.com
patch subject: [PATCH v6 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions
config: arm-randconfig-004-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030420.ECruvZx4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030420.ECruvZx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030420.ECruvZx4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:12:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:32: error: variable has incomplete type 'struct mipi_dsi_multi_context'
      50 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:9: note: forward declaration of 'struct mipi_dsi_multi_context'
      50 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:54:2: error: call to undeclared function 'mipi_dsi_dcs_exit_sleep_mode_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      54 |         mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
         |         ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:54:2: note: did you mean 'mipi_dsi_dcs_exit_sleep_mode'?
   include/drm/drm_mipi_dsi.h:291:5: note: 'mipi_dsi_dcs_exit_sleep_mode' declared here
     291 | int mipi_dsi_dcs_exit_sleep_mode(struct mipi_dsi_device *dsi);
         |     ^
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:56:2: error: call to undeclared function 'mipi_dsi_dcs_set_display_on_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |         mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
         |         ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:56:2: note: did you mean 'mipi_dsi_dcs_set_display_on'?
   include/drm/drm_mipi_dsi.h:293:5: note: 'mipi_dsi_dcs_set_display_on' declared here
     293 | int mipi_dsi_dcs_set_display_on(struct mipi_dsi_device *dsi);
         |     ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:32: error: variable has incomplete type 'struct mipi_dsi_multi_context'
      64 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:9: note: forward declaration of 'struct mipi_dsi_multi_context'
      64 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:66:2: error: call to undeclared function 'mipi_dsi_dcs_set_display_off_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      66 |         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
         |         ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:66:2: note: did you mean 'mipi_dsi_dcs_set_display_off'?
   include/drm/drm_mipi_dsi.h:292:5: note: 'mipi_dsi_dcs_set_display_off' declared here
     292 | int mipi_dsi_dcs_set_display_off(struct mipi_dsi_device *dsi);
         |     ^
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:68:2: error: call to undeclared function 'mipi_dsi_dcs_enter_sleep_mode_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
         |         ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:68:2: note: did you mean 'mipi_dsi_dcs_enter_sleep_mode'?
   include/drm/drm_mipi_dsi.h:290:5: note: 'mipi_dsi_dcs_enter_sleep_mode' declared here
     290 | int mipi_dsi_dcs_enter_sleep_mode(struct mipi_dsi_device *dsi);
         |     ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:32: error: variable has incomplete type 'struct mipi_dsi_multi_context'
     149 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:9: note: forward declaration of 'struct mipi_dsi_multi_context'
     149 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:151:2: error: call to undeclared function 'mipi_dsi_dcs_write_seq_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
         |         ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:151:2: note: did you mean 'mipi_dsi_dcs_write_buffer'?
   include/drm/drm_mipi_dsi.h:280:9: note: 'mipi_dsi_dcs_write_buffer' declared here
     280 | ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
         |         ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:32: error: variable has incomplete type 'struct mipi_dsi_multi_context'
     349 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:9: note: forward declaration of 'struct mipi_dsi_multi_context'
     349 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:351:2: error: call to undeclared function 'mipi_dsi_dcs_write_seq_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     351 |         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
         |         ^
   1 warning and 10 errors generated.


vim +50 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c

    46	
    47	static int jadard_enable(struct drm_panel *panel)
    48	{
    49		struct jadard *jadard = panel_to_jadard(panel);
  > 50		struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
    51	
    52		msleep(120);
    53	
  > 54		mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
    55	
  > 56		mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
    57	
    58		return dsi_ctx.accum_err;
    59	}
    60	
    61	static int jadard_disable(struct drm_panel *panel)
    62	{
    63		struct jadard *jadard = panel_to_jadard(panel);
  > 64		struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
    65	
  > 66		mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
    67	
  > 68		mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
    69	
    70		return dsi_ctx.accum_err;
    71	}
    72	
    73	static int jadard_prepare(struct drm_panel *panel)
    74	{
    75		struct jadard *jadard = panel_to_jadard(panel);
    76		int ret;
    77	
    78		ret = regulator_enable(jadard->vccio);
    79		if (ret)
    80			return ret;
    81	
    82		ret = regulator_enable(jadard->vdd);
    83		if (ret)
    84			return ret;
    85	
    86		gpiod_set_value(jadard->reset, 1);
    87		msleep(5);
    88	
    89		gpiod_set_value(jadard->reset, 0);
    90		msleep(10);
    91	
    92		gpiod_set_value(jadard->reset, 1);
    93		msleep(130);
    94	
    95		ret = jadard->desc->init(jadard);
    96		if (ret)
    97			return ret;
    98	
    99		return 0;
   100	}
   101	
   102	static int jadard_unprepare(struct drm_panel *panel)
   103	{
   104		struct jadard *jadard = panel_to_jadard(panel);
   105	
   106		gpiod_set_value(jadard->reset, 1);
   107		msleep(120);
   108	
   109		regulator_disable(jadard->vdd);
   110		regulator_disable(jadard->vccio);
   111	
   112		return 0;
   113	}
   114	
   115	static int jadard_get_modes(struct drm_panel *panel,
   116				    struct drm_connector *connector)
   117	{
   118		struct jadard *jadard = panel_to_jadard(panel);
   119		const struct drm_display_mode *desc_mode = &jadard->desc->mode;
   120		struct drm_display_mode *mode;
   121	
   122		mode = drm_mode_duplicate(connector->dev, desc_mode);
   123		if (!mode) {
   124			DRM_DEV_ERROR(&jadard->dsi->dev, "failed to add mode %ux%ux@%u\n",
   125				      desc_mode->hdisplay, desc_mode->vdisplay,
   126				      drm_mode_vrefresh(desc_mode));
   127			return -ENOMEM;
   128		}
   129	
   130		drm_mode_set_name(mode);
   131		drm_mode_probed_add(connector, mode);
   132	
   133		connector->display_info.width_mm = mode->width_mm;
   134		connector->display_info.height_mm = mode->height_mm;
   135	
   136		return 1;
   137	}
   138	
   139	static const struct drm_panel_funcs jadard_funcs = {
   140		.disable = jadard_disable,
   141		.unprepare = jadard_unprepare,
   142		.prepare = jadard_prepare,
   143		.enable = jadard_enable,
   144		.get_modes = jadard_get_modes,
   145	};
   146	
   147	static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
   148	{
 > 149		struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
   150	
 > 151		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
   152		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
   153		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
   154		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
   155		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
   156		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);
   157		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
   158		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x7e);
   159		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
   160		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x65);
   161		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
   162		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
   163		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xb7);
   164		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
   165		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
   166		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xb7);
   167		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
   168		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
   169		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
   170		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
   171		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
   172		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
   173		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x01);
   174		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x70);
   175		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
   176		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
   177		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
   178		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
   179		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
   180		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
   181		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0f);
   182		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
   183		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x04);
   184		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
   185		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x01);
   186		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0xa9);
   187		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x0a);
   188		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
   189		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x37);
   190		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
   191		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x78);
   192		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x63);
   193		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x54);
   194		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x49);
   195		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x45);
   196		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x38);
   197		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x3d);
   198		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x28);
   199		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
   200		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x41);
   201		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
   202		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
   203		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x50);
   204		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x57);
   205		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x49);
   206		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x44);
   207		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x37);
   208		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x23);
   209		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x10);
   210		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x78);
   211		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x63);
   212		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x54);
   213		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x49);
   214		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x45);
   215		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x38);
   216		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x3d);
   217		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x28);
   218		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
   219		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x41);
   220		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
   221		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
   222		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x50);
   223		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x57);
   224		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x49);
   225		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x44);
   226		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x37);
   227		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x23);
   228		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x10);
   229		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x02);
   230		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x47);
   231		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x47);
   232		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x45);
   233		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x45);
   234		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x4b);
   235		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x4b);
   236		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x49);
   237		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x49);
   238		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x41);
   239		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x1f);
   240		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x1f);
   241		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x1f);
   242		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x1f);
   243		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x1f);
   244		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x1f);
   245		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x5f);
   246		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
   247		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x57);
   248		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
   249		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x35);
   250		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x1f);
   251		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
   252		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x46);
   253		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x46);
   254		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x44);
   255		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x44);
   256		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x4a);
   257		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x4a);
   258		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x48);
   259		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x48);
   260		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x40);
   261		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x1f);
   262		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x1f);
   263		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x1f);
   264		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x1f);
   265		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x1f);
   266		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x1f);
   267		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x5f);
   268		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
   269		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x57);
   270		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
   271		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x35);
   272		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1f);
   273		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
   274		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
   275		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
   276		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
   277		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
   278		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
   279		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
   280		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
   281		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
   282		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
   283		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
   284		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
   285		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x03);
   286		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6b);
   287		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x05);
   288		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x0c);
   289		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
   290		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x09);
   291		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x03);
   292		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x56);
   293		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
   294		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
   295		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
   296		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
   297		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
   298		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x00);
   299		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x00);
   300		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x06);
   301		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x7b);
   302		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x00);
   303		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xf8);
   304		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
   305		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xd5);
   306		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2e);
   307		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x12);
   308		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x03);
   309		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x00);
   310		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x00);
   311		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x03);
   312		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x7b);
   313		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x04);
   314		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
   315		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
   316		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
   317		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x2a);
   318		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x59);
   319		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
   320	
   321		return dsi_ctx.accum_err;
   322	};
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
