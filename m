Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308418EC5;
	Fri, 15 Dec 2023 23:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUUqqp3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702681711; x=1734217711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ea4jBCYtQ2auku9rqiJ5wsdQiARPic3KpBoLedt2jXA=;
  b=XUUqqp3OKvEhYj80Ixj9wQwHQz+y0nd/b6hFMdZZK+b0HnU4Hz7d+eht
   V0q7Tj6QuPYR0rGOI6NEqnjFiNClPqPNqUb9Q4PlGralic/OsTf1p7Z67
   l/mMLrNoOXWMz6WvfkInwgdyaeRWFMcOJUGuVMI1Da124GFAgVFUdOwsi
   Gf2PMeEYKaUXtywMOQTf913Ya4yjvWGBvyo0O1PqX8VXqaJwxgVTwuTgg
   CvzlqX7I/TZQHU+zxtleMP/Tn1HZXPfAAYTHW14pwiTj+eGR4BzKJM04M
   FS42Gzkv/GoQp4PaKWfNYMAeSnTePDLll5t2465RhPspkUtYX/UyX3YJ0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="395078189"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="395078189"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 15:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="724601802"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="724601802"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2023 15:08:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEHI9-0000sm-0s;
	Fri, 15 Dec 2023 23:08:25 +0000
Date: Sat, 16 Dec 2023 07:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [steev:lenovo-x13s-v6.7-rc5 128/138]
 drivers/media/i2c/ar1337.c:349:54: error: incompatible pointer types passing
 'struct v4l2_subdev_pad_config *' to parameter of type 'struct
 v4l2_subdev_state *'
Message-ID: <202312160723.5w8KtEwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.7-rc5
head:   b8cd563c115473e27fa4778c1eca7b25f6f9a7ee
commit: 3816d49b9f2ab3e4b7b94aa5b5a8207c062b504d [128/138] media: i2c: ar1337: Add OnSemi AR1337 CMOS sensor
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231216/202312160723.5w8KtEwc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160723.5w8KtEwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160723.5w8KtEwc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ar1337.c:281:6: warning: unused variable 'ret' [-Wunused-variable]
           int ret;
               ^
>> drivers/media/i2c/ar1337.c:349:54: error: incompatible pointer types passing 'struct v4l2_subdev_pad_config *' to parameter of type 'struct v4l2_subdev_state *' [-Werror,-Wincompatible-pointer-types]
                   framefmt = v4l2_subdev_get_try_format(&ar1337->sd, cfg,
                                                                      ^~~
   include/media/v4l2-subdev.h:1212:33: note: expanded from macro 'v4l2_subdev_get_try_format'
           v4l2_subdev_get_pad_format(sd, state, pad)
                                          ^~~~~
   include/media/v4l2-subdev.h:1157:33: note: passing argument to parameter 'state' here
                              struct v4l2_subdev_state *state,
                                                        ^
   drivers/media/i2c/ar1337.c:401:43: error: incompatible pointer types passing 'struct v4l2_subdev_pad_config *' to parameter of type 'struct v4l2_subdev_state *' [-Werror,-Wincompatible-pointer-types]
                   format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
                                                           ^~~
   include/media/v4l2-subdev.h:1212:33: note: expanded from macro 'v4l2_subdev_get_try_format'
           v4l2_subdev_get_pad_format(sd, state, pad)
                                          ^~~~~
   include/media/v4l2-subdev.h:1157:33: note: passing argument to parameter 'state' here
                              struct v4l2_subdev_state *state,
                                                        ^
>> drivers/media/i2c/ar1337.c:560:14: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *)' [-Wincompatible-function-pointer-types]
           .init_cfg = ar1337_entity_init_cfg,
                       ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ar1337.c:561:20: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Wincompatible-function-pointer-types]
           .enum_mbus_code = ar1337_enum_mbus_code,
                             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ar1337.c:562:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
           .get_fmt = ar1337_get_fmt,
                      ^~~~~~~~~~~~~~
   drivers/media/i2c/ar1337.c:563:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
           .set_fmt = ar1337_set_fmt,
                      ^~~~~~~~~~~~~~
>> drivers/media/i2c/ar1337.c:597:56: error: too few arguments to function call, expected 2, have 1
           ar1337->ep = v4l2_fwnode_endpoint_alloc_parse(endpoint);
                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ^
   include/media/v4l2-fwnode.h:282:5: note: 'v4l2_fwnode_endpoint_alloc_parse' declared here
   int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
       ^
>> drivers/media/i2c/ar1337.c:606:30: error: use of undeclared identifier 'V4L2_MBUS_CSI2'; did you mean 'V4L2_MBUS_CSI1'?
           if (ar1337->ep->bus_type != V4L2_MBUS_CSI2) {
                                       ^~~~~~~~~~~~~~
                                       V4L2_MBUS_CSI1
   include/media/v4l2-mediabus.h:140:2: note: 'V4L2_MBUS_CSI1' declared here
           V4L2_MBUS_CSI1,
           ^
>> drivers/media/i2c/ar1337.c:763:3: error: field designator 'probe_new' does not refer to any field in type 'struct i2c_driver'
           .probe_new  = ar1337_probe,
            ^
>> drivers/media/i2c/ar1337.c:764:12: error: incompatible function pointer types initializing 'void (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *)' [-Wincompatible-function-pointer-types]
           .remove = ar1337_remove,
                     ^~~~~~~~~~~~~
   1 warning and 10 errors generated.


vim +349 drivers/media/i2c/ar1337.c

   229	
   230	static int ar1337_set_register_array(struct ar1337 *ar1337,
   231					     const struct ar1337_regval *settings,
   232					     unsigned int num_settings)
   233	{
   234		unsigned int i;
   235		int ret;
   236	
   237		for (i = 0; i < num_settings; ++i, ++settings) {
   238			ret = ar1337_write_reg16(ar1337, settings->reg, settings->val);
   239			if (ret < 0)
   240				return ret;
   241	
   242			/* Settle time is 10ms for all registers */
   243			msleep(10);
   244		}
   245	
   246		return 0;
   247	}
   248	/*
   249	static int ar1337_write_buffered_reg(struct ar1337 *ar1337, u16 address_low,
   250					     u8 nr_regs, u32 value)
   251	{
   252		unsigned int i;
   253		int ret;
   254	
   255		ret = ar1337_write_reg8(ar1337, AR1337_REG_HOLD, 0x01);
   256		if (ret) {
   257			dev_err(ar1337->dev, "Error setting hold register\n");
   258			return ret;
   259		}
   260	
   261		for (i = 0; i < nr_regs; i++) {
   262			ret = ar1337_write_reg(ar1337, address_low + i,
   263					       (u8)(value >> (i * 8)));
   264			if (ret) {
   265				dev_err(ar1337->dev, "Error writing buffered registers\n");
   266				return ret;
   267			}
   268		}
   269	
   270		ret = ar1337_write_reg8(ar1337, AR1337_REG_HOLD, 0x00);
   271		if (ret) {
   272			dev_err(ar1337->dev, "Error setting hold register\n");
   273			return ret;
   274		}
   275	
   276		return ret;
   277	}
   278	*/
   279	static int ar1337_set_gain(struct ar1337 *ar1337, u32 value)
   280	{
 > 281		int ret;
   282	/*
   283		ret = ar1337_write_buffered_reg(ar1337, AR1337_GAIN_HIGH, 1,
   284						(u8)((value >> 8) & 0xFF));
   285		if (ret < 0)
   286			return ret;
   287	
   288		ret = ar1337_write_buffered_reg(ar1337, AR1337_GAIN_HIGH, 1,
   289						(u8)((value) & 0xFF));
   290		if (ret < 0)
   291			return ret;
   292	*/
   293		return 0;
   294	}
   295	
   296	/* Stop streaming */
   297	static int ar1337_stop_streaming(struct ar1337 *ar1337)
   298	{
   299		return ar1337_write_reg8(ar1337, AR1337_REG_MODE, 0x00);
   300	}
   301	
   302	static int ar1337_set_ctrl(struct v4l2_ctrl *ctrl)
   303	{
   304		struct ar1337 *ar1337 = container_of(ctrl->handler,
   305						     struct ar1337, ctrls);
   306		int ret = 0;
   307	
   308		/* V4L2 controls values will be applied only when power is already up */
   309		if (!pm_runtime_get_if_in_use(ar1337->dev))
   310			return 0;
   311	
   312		switch (ctrl->id) {
   313		case V4L2_CID_GAIN:
   314			ret = ar1337_set_gain(ar1337, ctrl->val);
   315			break;
   316		default:
   317			ret = -EINVAL;
   318			break;
   319		}
   320	
   321		pm_runtime_put(ar1337->dev);
   322	
   323		return ret;
   324	}
   325	
   326	static const struct v4l2_ctrl_ops ar1337_ctrl_ops = {
   327		.s_ctrl = ar1337_set_ctrl,
   328	};
   329	
   330	static int ar1337_enum_mbus_code(struct v4l2_subdev *sd,
   331					 struct v4l2_subdev_pad_config *cfg,
   332					 struct v4l2_subdev_mbus_code_enum *code)
   333	{
   334		code->code = AR1337_DEFAULT_FORMAT;
   335	
   336		return 0;
   337	}
   338	
   339	static int ar1337_get_fmt(struct v4l2_subdev *sd,
   340				  struct v4l2_subdev_pad_config *cfg,
   341				  struct v4l2_subdev_format *fmt)
   342	{
   343		struct ar1337 *ar1337 = to_ar1337(sd);
   344		struct v4l2_mbus_framefmt *framefmt;
   345	
   346		mutex_lock(&ar1337->lock);
   347	
   348		if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 > 349			framefmt = v4l2_subdev_get_try_format(&ar1337->sd, cfg,
   350							      fmt->pad);
   351		else
   352			framefmt = &ar1337->current_format;
   353	
   354		fmt->format = *framefmt;
   355	
   356		mutex_unlock(&ar1337->lock);
   357	
   358		return 0;
   359	}
   360	
   361	static const struct ar1337_mode *
   362	ar1337_find_nearest_mode(unsigned int width, unsigned int height)
   363	{
   364		unsigned int max_dist_match = (unsigned int) - 1;
   365		int i, n = 0;
   366	
   367		for (i = 0; i < ARRAY_SIZE(ar1337_modes); i++) {
   368			unsigned int dist = min(width, ar1337_modes[i].width)
   369					* min(height, ar1337_modes[i].height);
   370			dist = ar1337_modes[i].width * ar1337_modes[i].height +
   371				width * height - 2 * dist;
   372			if (dist < max_dist_match) {
   373				n = i;
   374				max_dist_match = dist;
   375			}
   376		}
   377	
   378		return &ar1337_modes[n];
   379	}
   380	
   381	static int ar1337_set_fmt(struct v4l2_subdev *sd,
   382				  struct v4l2_subdev_pad_config *cfg,
   383				  struct v4l2_subdev_format *fmt)
   384	{
   385		struct ar1337 *ar1337 = to_ar1337(sd);
   386		const struct ar1337_mode *mode;
   387		struct v4l2_mbus_framefmt *format;
   388		int ret = 0;
   389	
   390		mutex_lock(&ar1337->lock);
   391	
   392		mode = ar1337_find_nearest_mode(fmt->format.width, fmt->format.height);
   393	
   394		fmt->format.width = mode->width;
   395		fmt->format.height = mode->height;
   396	
   397		fmt->format.code = AR1337_DEFAULT_FORMAT;
   398		fmt->format.field = V4L2_FIELD_NONE;
   399	
   400		if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 > 401			format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
   402		} else {
   403			format = &ar1337->current_format;
   404			__v4l2_ctrl_s_ctrl_int64(ar1337->pixel_rate, mode->pixel_rate);
   405	
   406			ar1337->current_mode = mode;
   407		}
   408	
   409		*format = fmt->format;
   410	
   411		mutex_unlock(&ar1337->lock);
   412	
   413		return ret;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
