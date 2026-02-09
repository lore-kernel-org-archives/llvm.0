Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE82241CB7;
	Mon,  9 Feb 2026 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668881; cv=none; b=fzmjgNr4JYXxy6PNuecrXXbx/Uj4v7pkd6U0N5QGxsmG3SauQqgOQd6x1wZY7ajQN2eDwJCqp5vfyFsC/T8yPu1NioY7BKU66GNfxohhTxmpGj3AYLqMWZrJ+uXvXu6SELir6yUvCfVsDte+pUUP2zKp8B6yxK1xYk/BcRO/UN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668881; c=relaxed/simple;
	bh=WEV5mOow8F6Ry8gM6cw1vIIDpqATGHeSnwG1OldvvAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dd7WjOnQKUewTqgDu+yQUoaFQbB6P2qcc1CYDduQaaGDNKGx4ZUA0t7ZVLuHbpRGiG91sfOstovkkhlQ7203WJwUhF/yAhHjYn7drv6EIb3xj5F6KNoeM4yx3r8rgFIYf9EJjzCBmscrog/j+18C82skwwrB3IKGRYFh5cQFfbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlexDtWW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlexDtWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770668880; x=1802204880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WEV5mOow8F6Ry8gM6cw1vIIDpqATGHeSnwG1OldvvAQ=;
  b=hlexDtWW+7wow6yJZPSPDtHawdQfXVpG3Sap1wMLNGNx+xsxcP5hzmYy
   ZS5LVrfEZYaKywMV6ncNLkfXy2hBzk9MY3jCi8h4sZcD6FfAY93X9QvcI
   B8uzqCayRGHK1C6TuD8jNDDuzWsUjtShgCD33QzDMR4uwkFp+HesE4Pr5
   MVk/HZgdIRwsCVixA2OoBkOcl5pQWhT/Z6aO9BxPQ7m0ItLR/PzH2Hm3q
   aPwlShFabWmGv4lxE7RJbv0eRfQ2U3dAgS8nULAKEtTVvq8Ofl0oB6JUV
   Bw06kXAiZxt+cvJ+jWXEmJEesBI5JFJW2vIzB9hNX/s7MtorU3ZhdBcsg
   Q==;
X-CSE-ConnectionGUID: vLmMwpuSSjC4L6jp0TG+aw==
X-CSE-MsgGUID: EOjwBXvXRIq5YoJ6siayoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71689255"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71689255"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 12:27:59 -0800
X-CSE-ConnectionGUID: hPsFvtonT7yHiCpk/Upb8g==
X-CSE-MsgGUID: PgWSPXFDRuW4D5lf8+uOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211703463"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 12:27:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpXrP-00000000oJE-0g02;
	Mon, 09 Feb 2026 20:27:55 +0000
Date: Tue, 10 Feb 2026 04:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: Serin Yeh <serin.yeh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 =?utf-8?Q?"=D0=94=D0=B0=D0=BC=D1=98=D0=B0=D0=BD?=
 =?utf-8?Q?_=D0=93=D0=B5=D0=BE=D1=80=D0=B3=D0=B8=D0=B5=D0=B2=D1=81=D0?=
 =?utf-8?Q?=BA=D0=B8"?= <gdamjan@gmail.com>
Subject: [gdamjan:v6.19/imx471 3/5]
 drivers/media/i2c/imx471.c:937:15: warning: variable 'props' is uninitialized
 when passed as a const pointer argument here
Message-ID: <202602100409.4ri5XKiD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/gdamjan/linux v6.19/imx471
head:   103cd095452bd7b6091b71ab56cfd41af826e6cf
commit: 7bdc415a14aa3dae7319a71be9e1fdb3b2f565ca [3/5] Add IMX471 mirror/flip functions for fitting camera module's orientation In order to meet Sony's init table and flip function, also modify registers as a better settings.
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602100409.4ri5XKiD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100409.4ri5XKiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100409.4ri5XKiD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx471.c:937:15: warning: variable 'props' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
     937 |                                                               &props);
         |                                                                ^~~~~
   drivers/media/i2c/imx471.c:1145:1: warning: unused label 'error_power_off' [-Wunused-label]
    1145 | error_power_off:
         | ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/props +937 drivers/media/i2c/imx471.c

   847	
   848	/* Initialize control handlers */
   849	static int imx471_init_controls(struct imx471 *imx471)
   850	{
   851		struct i2c_client *client = v4l2_get_subdevdata(&imx471->sd);
   852		struct v4l2_ctrl_handler *ctrl_hdlr;
   853		struct v4l2_fwnode_device_properties props;
   854	
   855		s64 exposure_max;
   856		s64 vblank_def;
   857		s64 vblank_min;
   858		s64 hblank;
   859		u64 pixel_rate;
   860		const struct imx471_mode *mode;
   861		u32 max;
   862		int ret;
   863	
   864		ctrl_hdlr = &imx471->ctrl_handler;
   865		ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
   866		if (ret)
   867			return ret;
   868	
   869		mutex_init(&imx471->mutex);
   870		ctrl_hdlr->lock = &imx471->mutex;
   871		max = ARRAY_SIZE(link_freq_menu_items) - 1;
   872		imx471->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx471_ctrl_ops,
   873							   V4L2_CID_LINK_FREQ, max, 0,
   874							   link_freq_menu_items);
   875		if (imx471->link_freq)
   876			imx471->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   877	
   878		/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
   879		pixel_rate = IMX471_LINK_FREQ_DEFAULT * 2 * 4;
   880		do_div(pixel_rate, 10);
   881		/* By default, PIXEL_RATE is read only */
   882		imx471->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   883						       V4L2_CID_PIXEL_RATE, pixel_rate,
   884						       pixel_rate, 1, pixel_rate);
   885	
   886		/* Initial vblank/hblank/exposure parameters based on current mode */
   887		mode = imx471->cur_mode;
   888		vblank_def = mode->fll_def - mode->height;
   889		vblank_min = mode->fll_min - mode->height;
   890		imx471->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   891						   V4L2_CID_VBLANK, vblank_min,
   892						   IMX471_FLL_MAX - mode->height,
   893						   1, vblank_def);
   894	
   895		hblank = mode->llp - mode->width;
   896		imx471->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   897						   V4L2_CID_HBLANK, hblank, hblank,
   898						   1, hblank);
   899		if (imx471->hblank)
   900			imx471->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   901	
   902		/* fll >= exposure time + adjust parameter (default value is 18) */
   903		exposure_max = mode->fll_def - 18;
   904		imx471->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   905						     V4L2_CID_EXPOSURE,
   906						     IMX471_EXPOSURE_MIN, exposure_max,
   907						     IMX471_EXPOSURE_STEP,
   908						     IMX471_EXPOSURE_DEFAULT);
   909	
   910		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
   911				  IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
   912				  IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);
   913	
   914		/* Digital gain */
   915		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
   916				  IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
   917				  IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT);
   918	
   919		v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
   920					     V4L2_CID_TEST_PATTERN,
   921					     ARRAY_SIZE(imx471_test_pattern_menu) - 1,
   922					     0, 0, imx471_test_pattern_menu);
   923	
   924		/* HFLIP & VFLIP */
   925		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   926					V4L2_CID_HFLIP, 0, 1, 1, 0);
   927		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   928					V4L2_CID_VFLIP, 0, 1, 1, 0);
   929	
   930		if (ctrl_hdlr->error) {
   931			ret = ctrl_hdlr->error;
   932			dev_err(&client->dev, "%s control init failed: %d", __func__, ret);
   933			goto error;
   934		}
   935	
   936		ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops,
 > 937								      &props);
   938		if (ret)
   939			goto error;
   940	
   941		imx471->sd.ctrl_handler = ctrl_hdlr;
   942	
   943		return 0;
   944	
   945	error:
   946		v4l2_ctrl_handler_free(ctrl_hdlr);
   947		mutex_destroy(&imx471->mutex);
   948	
   949		return ret;
   950	}
   951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
