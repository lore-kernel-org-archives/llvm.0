Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386BD369220;
	Tue, 17 Mar 2026 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743507; cv=none; b=nfvoPh6Zxhek86XR5rYGXzKeOeev8eImrjCMLOOkRx92d2LN+xew0fkVqJ1jCX/wVUhNfHK2bhvGSb8SJxmY+eZPmubIUc/wISn4nzrKDhHAm6Z0RszGT7lvGpJoHPdBe2q94yAwTKXPP4MUfm+CEFy7EARtHutiR38BaBv946E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743507; c=relaxed/simple;
	bh=5a4otmlXMXl+OKMa3jtyUU5FQmCser64UOBMlNJzTR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n9vEvgs5y4QXvsnXnfpkuRYX36jVXH8MJDxziV4mUTp2NzRN8agqUiqKHWnOKC1rRDNbtz0j/0laRM1rSRwWM6MmWcByZ/e6/U45Y287wltAxnYHykrvqbuWvYXjXRZ2WIW/0iZcNcbwKzYFrQljLKuXAAkv1G7Q8vp3z2EkqY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cipn0WB7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cipn0WB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773743506; x=1805279506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5a4otmlXMXl+OKMa3jtyUU5FQmCser64UOBMlNJzTR0=;
  b=cipn0WB7/bziksrTbkJP67WMEFr9TMlxcWQZO85tZuShJpFthXlB/gAl
   Ykmix3+ogzDg96k6rIn9Wu/+0JwqccMUOB1IQfKsJBzIdifBonrdNl0Sl
   KNobjd46KGsR7f2pbUqwUpJWAfeG5rz1E8sPNWuM+lnsGxLsxMvp1Cyv4
   dF/QYCImPP/4SeZyq8ttuhQgrM1tA6JfuFw4OtdA1VKYHTYPbxXHQb3Vr
   XMXsb7Z0v/+nHtrm9x0Q8MeHj+2NWDZVAEwx/rSXco/DIpogx7JF5z0FW
   69AReve9w93JrvsbaPkThr/YW+5klWK2X+cFRI/QBSn+rL15veJq8Jxcb
   g==;
X-CSE-ConnectionGUID: 0mXQmR4zSy+Mfjx77swO3w==
X-CSE-MsgGUID: gPqkffq9RO63XLYHTgXOKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74745234"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74745234"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:31:45 -0700
X-CSE-ConnectionGUID: 8FCw3WN2R1iFY/Ejn0KfRA==
X-CSE-MsgGUID: QgkE+ESwRqCptj9RR/hEDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222452669"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 03:31:44 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Ri9-000000000FB-2MZp;
	Tue, 17 Mar 2026 10:31:41 +0000
Date: Tue, 17 Mar 2026 18:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Serin Yeh <serin.yeh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 =?utf-8?Q?"=D0=94=D0=B0=D0=BC=D1=98=D0=B0=D0=BD?=
 =?utf-8?Q?_=D0=93=D0=B5=D0=BE=D1=80=D0=B3=D0=B8=D0=B5=D0=B2=D1=81=D0?=
 =?utf-8?Q?=BA=D0=B8"?= <gdamjan@gmail.com>
Subject: [gdamjan:v7.0/thinkpad-x9-14 4/4]
 drivers/media/i2c/imx471.c:932:15: warning: variable 'props' is uninitialized
 when passed as a const pointer argument here
Message-ID: <202603171859.NgbhSEFJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/gdamjan/linux v7.0/thinkpad-x9-14
head:   0c3c30420dc270439af41cee1c574d624d5bf3fc
commit: 0c3c30420dc270439af41cee1c574d624d5bf3fc [4/4] Add IMX471 mirror/flip functions for fitting camera module's orientation In order to meet Sony's init table and flip function, also modify registers as a better settings.
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603171859.NgbhSEFJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f46a5153850c1303d687233d4adf699b01041da8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171859.NgbhSEFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171859.NgbhSEFJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx471.c:932:15: warning: variable 'props' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
     932 |                                                               &props);
         |                                                                ^~~~~
   1 warning generated.


vim +/props +932 drivers/media/i2c/imx471.c

   842	
   843	/* Initialize control handlers */
   844	static int imx471_init_controls(struct imx471 *imx471)
   845	{
   846		struct i2c_client *client = v4l2_get_subdevdata(&imx471->sd);
   847		struct v4l2_ctrl_handler *ctrl_hdlr;
   848		struct v4l2_fwnode_device_properties props;
   849	
   850		s64 exposure_max;
   851		s64 vblank_def;
   852		s64 vblank_min;
   853		s64 hblank;
   854		u64 pixel_rate;
   855		const struct imx471_mode *mode;
   856		u32 max;
   857		int ret;
   858	
   859		ctrl_hdlr = &imx471->ctrl_handler;
   860		ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
   861		if (ret)
   862			return ret;
   863	
   864		mutex_init(&imx471->mutex);
   865		ctrl_hdlr->lock = &imx471->mutex;
   866		max = ARRAY_SIZE(link_freq_menu_items) - 1;
   867		imx471->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx471_ctrl_ops,
   868							   V4L2_CID_LINK_FREQ, max, 0,
   869							   link_freq_menu_items);
   870		if (imx471->link_freq)
   871			imx471->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   872	
   873		/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
   874		pixel_rate = IMX471_LINK_FREQ_DEFAULT * 2 * 4;
   875		do_div(pixel_rate, 10);
   876		/* By default, PIXEL_RATE is read only */
   877		imx471->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   878						       V4L2_CID_PIXEL_RATE, pixel_rate,
   879						       pixel_rate, 1, pixel_rate);
   880	
   881		/* Initial vblank/hblank/exposure parameters based on current mode */
   882		mode = imx471->cur_mode;
   883		vblank_def = mode->fll_def - mode->height;
   884		vblank_min = mode->fll_min - mode->height;
   885		imx471->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   886						   V4L2_CID_VBLANK, vblank_min,
   887						   IMX471_FLL_MAX - mode->height,
   888						   1, vblank_def);
   889	
   890		hblank = mode->llp - mode->width;
   891		imx471->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   892						   V4L2_CID_HBLANK, hblank, hblank,
   893						   1, hblank);
   894		if (imx471->hblank)
   895			imx471->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   896	
   897		/* fll >= exposure time + adjust parameter (default value is 18) */
   898		exposure_max = mode->fll_def - 18;
   899		imx471->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   900						     V4L2_CID_EXPOSURE,
   901						     IMX471_EXPOSURE_MIN, exposure_max,
   902						     IMX471_EXPOSURE_STEP,
   903						     IMX471_EXPOSURE_DEFAULT);
   904	
   905		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
   906				  IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
   907				  IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);
   908	
   909		/* Digital gain */
   910		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
   911				  IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
   912				  IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT);
   913	
   914		v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
   915					     V4L2_CID_TEST_PATTERN,
   916					     ARRAY_SIZE(imx471_test_pattern_menu) - 1,
   917					     0, 0, imx471_test_pattern_menu);
   918	
   919		/* HFLIP & VFLIP */
   920		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   921					V4L2_CID_HFLIP, 0, 1, 1, 0);
   922		v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
   923					V4L2_CID_VFLIP, 0, 1, 1, 0);
   924	
   925		if (ctrl_hdlr->error) {
   926			ret = ctrl_hdlr->error;
   927			dev_err(&client->dev, "%s control init failed: %d", __func__, ret);
   928			goto error;
   929		}
   930	
   931		ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops,
 > 932								      &props);
   933		if (ret)
   934			goto error;
   935	
   936		imx471->sd.ctrl_handler = ctrl_hdlr;
   937	
   938		return 0;
   939	
   940	error:
   941		v4l2_ctrl_handler_free(ctrl_hdlr);
   942		mutex_destroy(&imx471->mutex);
   943	
   944		return ret;
   945	}
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
