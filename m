Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F4381E8C;
	Sun, 13 Sep 2026 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334587; cv=none; b=oelUPGPcWMPbuHZM4cvlClEPVO22oYJ5nL9ml+CNTYunE4ZxCb2NUWtAbUtfsOxbDJ5lQcfsBrdqrmRkIWCNqwRkCz48Q3Cs8VUXd23ck9cm+GYLpGdTcUw5BD+4dABDKoZCtrYSGuE54CFT8BTY1Msys4wfZD4xeAjI/RpY+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334587; c=relaxed/simple;
	bh=Vl4WVa/uXNcMY4R1Cndk8tNxDV7ocK3aLy9gMhb647M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OlX4rhsgTUK5PovtfWvWkr73Pb4xSrElLS/MGFsRJ1iP3AZHTjDzPnnJCMJZb8g1F2sIadLBwDknYwiPvUT5b0dlLin7D5tjHIW5GUrxYj+R0jtDz81BYjR+Axtl+LN3LAXdXBB1MqLaIRJlTYbMhAQ7dTn3x2N4fVIjFKRTxYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFpz6iTm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFpz6iTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789334584; x=1820870584;
  h=date:from:to:cc:subject:message-id;
  bh=Vl4WVa/uXNcMY4R1Cndk8tNxDV7ocK3aLy9gMhb647M=;
  b=XFpz6iTmkmCBJjmzQXi/0N3WyM1XO4AcrB2GO2PjUN4l7CnwGwo+x0jf
   Mqp5Mf1aMrcpOPQUZaJrRG9+0abk467FCsnxng+AXrrW7JUY66qyC5JbD
   ZwnUewY7Y0Riwhbo5x+KDasZsSsJkfcUu0yWUCr3GthYeWm+315azsQ5V
   nAJjaNfSpvL48CFA3ablTkpnBbuy7I+a8vm+kZ4wyADHAtioJfQUrgDrR
   ikDxHSo1chNpdhFYm3yzwwZCIqGR3c074HcWK3hHt6XZbF/Qc57OL/28y
   cmNeHQP9JcXio88TXmBprjDm2jswFGdxhi2T6CJi5CgVk8KWhTORMGhTR
   Q==;
X-CSE-ConnectionGUID: UHY7Fuz7SPO8Lk5po4dVIQ==
X-CSE-MsgGUID: xUGmseVNTaOh518Bl0oEmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88841324"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="88841324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 14:23:04 -0700
X-CSE-ConnectionGUID: CELMMIA/SOSYH/QTUh3SAg==
X-CSE-MsgGUID: oQDSM8TBQjyeXkVZJaQ6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="272441200"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2026 14:23:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5rf9-000000001KR-2Cy9;
	Sun, 13 Sep 2026 21:22:59 +0000
Date: Mon, 14 Sep 2026 05:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: [sailus-media-tree:metadata 79/169]
 drivers/media/platform/nxp/imx95-csi-formatter.c:527:14: error: incompatible
 function pointer types initializing 'int (*)(struct v4l2_subdev *, const
 struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)' with an expre...
Message-ID: <202609140557.zQdCENMs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   357c2e168b861a3df80c68a9c44de9c9c282ec46
commit: cd854e06923fe7a8c466ef89a0308bcab2adf45e [79/169] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: arm64-randconfig-002-20260914 (https://download.01.org/0day-ci/archive/20260914/202609140557.zQdCENMs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140557.zQdCENMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140557.zQdCENMs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx95-csi-formatter.c:527:14: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     527 |         .set_fmt                = csi_formatter_subdev_set_fmt,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +527 drivers/media/platform/nxp/imx95-csi-formatter.c

3652add7e9b01d Guoniu Zhou 2026-07-28  523  
3652add7e9b01d Guoniu Zhou 2026-07-28  524  static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
3652add7e9b01d Guoniu Zhou 2026-07-28  525  	.enum_mbus_code		= csi_formatter_subdev_enum_mbus_code,
3652add7e9b01d Guoniu Zhou 2026-07-28  526  	.get_fmt		= v4l2_subdev_get_fmt,
3652add7e9b01d Guoniu Zhou 2026-07-28 @527  	.set_fmt		= csi_formatter_subdev_set_fmt,
3652add7e9b01d Guoniu Zhou 2026-07-28  528  	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
3652add7e9b01d Guoniu Zhou 2026-07-28  529  	.set_routing		= csi_formatter_subdev_set_routing,
3652add7e9b01d Guoniu Zhou 2026-07-28  530  	.enable_streams		= csi_formatter_subdev_enable_streams,
3652add7e9b01d Guoniu Zhou 2026-07-28  531  	.disable_streams	= csi_formatter_subdev_disable_streams,
3652add7e9b01d Guoniu Zhou 2026-07-28  532  };
3652add7e9b01d Guoniu Zhou 2026-07-28  533  

:::::: The code at line 527 was first introduced by commit
:::::: 3652add7e9b01d6ea4d3d4ff3ade8f60084867f6 media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

:::::: TO: Guoniu Zhou <guoniu.zhou@nxp.com>
:::::: CC: Hans Verkuil <hverkuil+cisco@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
