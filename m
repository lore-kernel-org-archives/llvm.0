Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D6D2F0;
	Sat, 18 Nov 2023 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AChrXqwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700297050; x=1731833050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4PAq8AXIKGxSKrr0aKgQv8Mci6H7jVHiPzq47htjhEk=;
  b=AChrXqwC4YjcdWWh+ZClxEo2W/qdXO95t0VZnvWfNz4/asB515U87bIG
   z9Cj81mP7SU/ysBv+hy6xmBR9codCuY/Gcatb78TpH+K0DnbmLGVNG6Bq
   2wTisIcgT/wxWdpSL65fy2ngdXk7IZPwkRm8OcYSbyx/gjO2i/PdqAt33
   ksBGw6jZiPgj+mYDRKCTmSkbBeESBFSWGmY7/eBrLCr3E46FiFzCrvlkh
   gx4JD5xnJ1dQRn/EMBZeyh5YRBvo91mnoXOs4jEUrxSuetJ6Tti92ATVM
   IDBMS+/LbZVNRk9/qS2J3Cs/+pwdHMXH7fZDvuwC7N374d39LQyysGIuM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="381803247"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="381803247"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 00:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="13704331"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2023 00:44:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Gvt-0003ht-1n;
	Sat, 18 Nov 2023 08:44:05 +0000
Date: Sat, 18 Nov 2023 16:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 5/7] media: ov8858: Use pm_runtime_get_if_active(),
 put usage_count correctly
Message-ID: <202311181620.Oz3Uibrc-lkp@intel.com>
References: <20231117111433.1561669-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117111433.1561669-6-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3e238417254bfdcc23fe207780b59cbb08656762]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/pm-runtime-Simplify-pm_runtime_get_if_active-usage/20231117-191654
base:   3e238417254bfdcc23fe207780b59cbb08656762
patch link:    https://lore.kernel.org/r/20231117111433.1561669-6-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 5/7] media: ov8858: Use pm_runtime_get_if_active(), put usage_count correctly
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311181620.Oz3Uibrc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181620.Oz3Uibrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181620.Oz3Uibrc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov8858.c:1606:3: error: call to undeclared function 'pm_runtime_mark_busy_autosusp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   pm_runtime_mark_busy_autosusp(&client->dev);
                   ^
   drivers/media/i2c/ov8858.c:1606:3: note: did you mean 'pm_runtime_put_mark_busy_autosusp'?
   include/linux/pm_runtime.h:508:19: note: 'pm_runtime_put_mark_busy_autosusp' declared here
   static inline int pm_runtime_put_mark_busy_autosusp(struct device *dev)
                     ^
   1 error generated.


vim +/pm_runtime_mark_busy_autosusp +1606 drivers/media/i2c/ov8858.c

  1530	
  1531	static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
  1532	{
  1533		struct ov8858 *ov8858 = container_of(ctrl->handler,
  1534						     struct ov8858, ctrl_handler);
  1535	
  1536		struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
  1537		struct v4l2_mbus_framefmt *format;
  1538		struct v4l2_subdev_state *state;
  1539		u16 digi_gain;
  1540		s64 max_exp;
  1541		int ret, pm_status;
  1542	
  1543		/*
  1544		 * The control handler and the subdev state use the same mutex and the
  1545		 * mutex is guaranteed to be locked:
  1546		 * - by the core when s_ctrl is called int the VIDIOC_S_CTRL call path
  1547		 * - by the driver when s_ctrl is called in the s_stream(1) call path
  1548		 */
  1549		state = v4l2_subdev_get_locked_active_state(&ov8858->subdev);
  1550		format = v4l2_subdev_get_pad_format(&ov8858->subdev, state, 0);
  1551	
  1552		/* Propagate change of current control to all related controls */
  1553		switch (ctrl->id) {
  1554		case V4L2_CID_VBLANK:
  1555			/* Update max exposure while meeting expected vblanking */
  1556			max_exp = format->height + ctrl->val - OV8858_EXPOSURE_MARGIN;
  1557			__v4l2_ctrl_modify_range(ov8858->exposure,
  1558						 ov8858->exposure->minimum, max_exp,
  1559						 ov8858->exposure->step,
  1560						 ov8858->exposure->default_value);
  1561			break;
  1562		}
  1563	
  1564		pm_status = pm_runtime_get_if_active(&client->dev);
  1565		if (!pm_status)
  1566			return 0;
  1567	
  1568		switch (ctrl->id) {
  1569		case V4L2_CID_EXPOSURE:
  1570			/* 4 least significant bits of exposure are fractional part */
  1571			ret = ov8858_write(ov8858, OV8858_REG_LONG_EXPO,
  1572					   ctrl->val << 4, NULL);
  1573			break;
  1574		case V4L2_CID_ANALOGUE_GAIN:
  1575			ret = ov8858_write(ov8858, OV8858_REG_LONG_GAIN,
  1576					   ctrl->val, NULL);
  1577			break;
  1578		case V4L2_CID_DIGITAL_GAIN:
  1579			/*
  1580			 * Digital gain is assembled as:
  1581			 * 0x350a[7:0] = dgain[13:6]
  1582			 * 0x350b[5:0] = dgain[5:0]
  1583			 * Reassemble the control value to write it in one go.
  1584			 */
  1585			digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
  1586				  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
  1587				      OV8858_LONG_DIGIGAIN_H_SHIFT);
  1588			ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
  1589					   digi_gain, NULL);
  1590			break;
  1591		case V4L2_CID_VBLANK:
  1592			ret = ov8858_write(ov8858, OV8858_REG_VTS,
  1593					   ctrl->val + format->height, NULL);
  1594			break;
  1595		case V4L2_CID_TEST_PATTERN:
  1596			ret = ov8858_enable_test_pattern(ov8858, ctrl->val);
  1597			break;
  1598		default:
  1599			ret = -EINVAL;
  1600			dev_warn(&client->dev, "%s Unhandled id: 0x%x\n",
  1601				 __func__, ctrl->id);
  1602			break;
  1603		}
  1604	
  1605		if (pm_status > 0)
> 1606			pm_runtime_mark_busy_autosusp(&client->dev);
  1607	
  1608		return ret;
  1609	}
  1610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
