Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A329CA
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 22:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639779993; x=1671315993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y46nR9mbGiugxOwyhhf42nGHY5wuv9RUnq901IPr+FE=;
  b=GNCwZUfkfDDurtZ+dQwCd3wYCIOvQDrNveVImKc0hpedgwdh5iG3oBCe
   ykhQJDOaoC+CWmkcUV8HQ6Sc2egG3tLib+y81/ImXexPACILGkZ9+jpfv
   h3izRP5GO3FXKi/Jl/rW5hT0UobvYqi2UKE2krNbyeG4bgXNtZ5XiMhRX
   MgQd+rLoVlwThHYK7OTLQ7Nq/SUrf2u8E4yL5yOjNwyHwTF5DAaK2uxH6
   ufl9XZppQv8EFLowKhmsg40yWlUtjVHWUNg8Zk/B4OdWsN6q4XRvanKpQ
   ijqtGBbmr3w+V8otsrfhLpA+1DgDUZKz1E++c0HPneLRnZUc7hBOX97Zy
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="237384708"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="237384708"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 14:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="615712819"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2021 14:26:18 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myLg9-0005Gq-VL; Fri, 17 Dec 2021 22:26:17 +0000
Date: Sat, 18 Dec 2021 06:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.4 217/1768]
 drivers/media/i2c/adv7511-v4l2.c:427:2: error: void function
 'adv7511_set_rgb_quantization_mode' should not return a value
Message-ID: <202112180608.FPnIZOag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   abafefebd1f1e040eef74e4ab571ea08bf745641
commit: 9836a252284b997aacd6b86766514a0bb84b4f43 [217/1768] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: x86_64-randconfig-r013-20211214 (https://download.01.org/0day-ci/archive/20211218/202112180608.FPnIZOag-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9836a252284b997aacd6b86766514a0bb84b4f43
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.4
        git checkout 9836a252284b997aacd6b86766514a0bb84b4f43
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/i2c/ drivers/mtd/spi-nor/ drivers/spi/ drivers/usb/host/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/media/i2c/adv7511-v4l2.c:427:2: error: void function 'adv7511_set_rgb_quantization_mode' should not return a value [-Wreturn-type]
           return 0;
           ^      ~
>> drivers/media/i2c/adv7511-v4l2.c:2251:21: warning: no previous prototype for function 'adv7511_subdev' [-Wmissing-prototypes]
   struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
                       ^
   drivers/media/i2c/adv7511-v4l2.c:2251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
   ^
   static 
   1 warning and 1 error generated.


vim +/adv7511_set_rgb_quantization_mode +427 drivers/media/i2c/adv7511-v4l2.c

   421	
   422	static void adv7511_set_rgb_quantization_mode(struct v4l2_subdev *sd, struct v4l2_ctrl *ctrl)
   423	{
   424		struct adv7511_state *state = get_adv7511_state(sd);
   425	
   426	#ifdef XYLON_LOGICVC_INTG
 > 427		return 0;
   428	#endif
   429	
   430		/* Only makes sense for RGB formats */
   431		if (state->fmt_code != MEDIA_BUS_FMT_RGB888_1X24) {
   432			/* so just keep quantization */
   433			adv7511_csc_rgb_full2limit(sd, false);
   434			return;
   435		}
   436	
   437		switch (ctrl->val) {
   438		case V4L2_DV_RGB_RANGE_AUTO:
   439			/* automatic */
   440			if (state->dv_timings.bt.flags & V4L2_DV_FL_IS_CE_VIDEO) {
   441				/* CE format, RGB limited range (16-235) */
   442				adv7511_csc_rgb_full2limit(sd, true);
   443			} else {
   444				/* not CE format, RGB full range (0-255) */
   445				adv7511_csc_rgb_full2limit(sd, false);
   446			}
   447			break;
   448		case V4L2_DV_RGB_RANGE_LIMITED:
   449			/* RGB limited range (16-235) */
   450			adv7511_csc_rgb_full2limit(sd, true);
   451			break;
   452		case V4L2_DV_RGB_RANGE_FULL:
   453			/* RGB full range (0-255) */
   454			adv7511_csc_rgb_full2limit(sd, false);
   455			break;
   456		}
   457	}
   458	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
