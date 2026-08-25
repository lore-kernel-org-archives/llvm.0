Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9CF3D0BE4;
	Tue, 25 Aug 2026 07:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641970; cv=none; b=fXK2yNv6HMucu/5uyNC8aMkMXgY60bToqdcmyR5bXQaoPTeav8+K4/fn7LV7MxXzNhqTDb3138/Y8V+Nsx+YCMHYFu6QeP99EKUYFwlsN8oQWiV6oMTC3iBUCpd4FL0HeezS9DdiZDjj30qmTDYIv54Yyaz9Nmv1BRlkHe7xH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641970; c=relaxed/simple;
	bh=wAJFSNQPmnCBjZ28cGYqTUCHCunQXd+/We0PP3JkjjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZLPJnQpx19WoY9b7DEQIcFG0WimHL2oi0V/kFMAAwpGhXVrWY+TFzxEMomqunlhtYmWE161QGSRk0zCwD0yWL5pvHAEOU0VJjrKOPYDcZ94a+jUMlhF4ev5ay7AVfp/hleaCc73pwu1n79x9X4jJwh4bTzlI8g35znGujMlXPVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ML+GDB1i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ML+GDB1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787641969; x=1819177969;
  h=date:from:to:cc:subject:message-id;
  bh=wAJFSNQPmnCBjZ28cGYqTUCHCunQXd+/We0PP3JkjjE=;
  b=ML+GDB1i7ZTPi8J1DyaL8XXpC21KN2SsDntUVKpndy2ENxlcvmNj1eYO
   iG0GGXJJC882ExljfsgI3GINygVn3Cq/g9Mc3Ec5wOkhBTKibsr0ej0rP
   2vJzV1kgmDtPiv8qOlYjJRU/W/yQZ4C7NllMUO4jvYrLO2maC9sCYbm1V
   zrUss9z+xXc349d4BUHGalILbMGGGdNAC5E8l1/YRGbZgN/TXQTJ4UIML
   tRzLwgt+nvXhw2vD+2MOdP11QtdmA05Bf5R78aQG7bADHlfmZTCvfRYF7
   4hlWYZcX2U5DrCpiW9QTAY2hqWfvwtsIFcmPIqiWkgFeN088BBPi5AXST
   w==;
X-CSE-ConnectionGUID: qXWgYe1IToKhbdWj4w/PSw==
X-CSE-MsgGUID: nRQv1wxNRqyFb8vaHOhJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98437658"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98437658"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:12:44 -0700
X-CSE-ConnectionGUID: aJu6lp8wT4u4WZuGcctW3g==
X-CSE-MsgGUID: ipfZARNLSjCqczqiSW15ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="265892772"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2026 00:12:43 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wylKq-000000005CZ-3AYW;
	Tue, 25 Aug 2026 07:12:40 +0000
Date: Tue, 25 Aug 2026 15:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: [sailus-media-tree:frame-desc 28/38]
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:52:33: warning:
 format specifies type 'void *' but the argument has type 'long'
Message-ID: <202608251501.bsoTG84r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git frame-desc
head:   7c1e8e3f907ccd6c51f2c23e1a4ac09b6d4b1f04
commit: d4fcc2fd2e12bdb46cd8a49eff24056dd12ad846 [28/38] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
config: arm64-randconfig-002-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251501.bsoTG84r-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251501.bsoTG84r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251501.bsoTG84r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:52:33: warning: format specifies type 'void *' but the argument has type 'long' [-Wformat]
      51 |                         "failed to get frame descriptor from '%s':%u: %pe\n",
         |                                                                       ~~
         |                                                                       %ld
      52 |                         remote_sd->name, remote_pad, PTR_ERR(fd));
         |                                                      ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +52 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c

    27	
    28	static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
    29						  struct v4l2_subdev_state *state,
    30						  struct v4l2_subdev *remote_sd,
    31						  u32 remote_pad, unsigned int port)
    32	{
    33		struct mxc_isi_dev *isi = xbar->isi;
    34		const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
    35		const struct v4l2_mbus_framefmt *fmt;
    36	
    37		if (!gasket_ops)
    38			return 0;
    39	
    40		/*
    41		 * Configure and enable the gasket with the frame size and CSI-2 data
    42		 * type. For YUV422 8-bit, enable dual component mode unconditionally,
    43		 * to match the configuration of the CSIS.
    44		 */
    45	
    46		struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
    47			v4l2_subdev_get_frame_desc(remote_sd, remote_pad,
    48						   V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);
    49		if (IS_ERR(fd)) {
    50			dev_err(isi->dev,
    51				"failed to get frame descriptor from '%s':%u: %pe\n",
  > 52				remote_sd->name, remote_pad, PTR_ERR(fd));
    53			return PTR_ERR(fd);
    54		}
    55	
    56		if (fd->num_entries != 1) {
    57			dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
    58				remote_sd->name, remote_pad);
    59			return -EINVAL;
    60		}
    61	
    62		fmt = v4l2_subdev_state_get_format(state, port, 0);
    63		if (!fmt)
    64			return -EINVAL;
    65	
    66		gasket_ops->enable(isi, fd, fmt, port);
    67		return 0;
    68	}
    69	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
