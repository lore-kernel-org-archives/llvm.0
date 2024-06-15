Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CFD17BB6;
	Sat, 15 Jun 2024 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718462244; cv=none; b=oBwEOztMLAWMXFjUn1DNV+nHHF4alPvJJFVSMbKjH1Co1/hC8ix0rGxh5ViVsOyV2kn6sANspCr9k2jvyOhl/E/zGBVpM2plyRCaF0sm1CzQ+7BjpRfUUIAZJH5HPdkAEFB8cAU4J740y/oCQD5T0BIdiqPCfSLUNpmUQ8dP12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718462244; c=relaxed/simple;
	bh=MKVxvS2/HovPtnDMLu179z601iEVS0BEy0RDlCq6b0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeS131OrxOPlM69fC/fDwpQPkH/yQklvLaX+IjPXOoEjHniqzmW14R6yidysoiUjQSPpNwGqWC0thdfzyvw2fReakenvI+e4iNqySarkRsp8PzDLyQDyrJwNXH66T2qtlgSvj5ZLD0MWx4J/rB7jt6SYzr7EyiW6gU94QLiTriA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljZ+cKVT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljZ+cKVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718462243; x=1749998243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKVxvS2/HovPtnDMLu179z601iEVS0BEy0RDlCq6b0M=;
  b=ljZ+cKVTlIPe6/tyIoha6f5rgx4PCBOV3llvkf7MwSSxgqRlw9nATzxV
   SaxuqyGg3BXTtR3MMJkL/Fv+vFNxmbg6XjMxha0TsjpY3BMYf9ZahY5cC
   ZeOXbcZMwz9N0d7kEht6g/l/fXAHGWXuH2IkyGeweQvynNMxgQckSwBoG
   icWW4OjmLr//XQv8nT5vFqYc6JtA+Uzmkdf3Shm0Si1RZDPYZN7eYtpST
   pCb+wZ+snCCAyLLRUnnaWIua0iBXnLse516WbeQHG9rynrvgy1n+Pi5tT
   J2sg87nHDnBTDl3UtpDI4YdYTV09GniII/Mz9GzB89T0b1pbV1r28BU06
   g==;
X-CSE-ConnectionGUID: LgMu1N7CRG6rkivCKT2GfA==
X-CSE-MsgGUID: KJn0RGrpRHy89LH8mkYzPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="37869939"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="37869939"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 07:37:22 -0700
X-CSE-ConnectionGUID: q7c1du4/SGKzWvU/jwasEw==
X-CSE-MsgGUID: K5BHr9kdTtS20QxbZZQzag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="45709166"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jun 2024 07:37:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIUWt-00007G-0T;
	Sat, 15 Jun 2024 14:37:19 +0000
Date: Sat, 15 Jun 2024 22:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:nxp/v6.10/dev/rpi-cam-mipi 46/81]
 drivers/media/i2c/ar0144.c:470:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202406152210.BoPs7o2U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.10/dev/rpi-cam-mipi
head:   5a42e32f7a80b2729b81fa757c9531a7ec7127f9
commit: a082838244bc3478b888d88e932e5afe6a361b49 [46/81] media: i2c: ar0144: Refactor s_stream
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240615/202406152210.BoPs7o2U-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152210.BoPs7o2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152210.BoPs7o2U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ar0144.c:470:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     470 |         if (enable) {
         |             ^~~~~~
   drivers/media/i2c/ar0144.c:489:9: note: uninitialized use occurs here
     489 |         return ret;
         |                ^~~
   drivers/media/i2c/ar0144.c:470:2: note: remove the 'if' if its condition is always true
     470 |         if (enable) {
         |         ^~~~~~~~~~~
     471 |                 ret = pm_runtime_resume_and_get(sensor->dev);
     472 |                 if (ret < 0)
     473 |                         goto unlock;
     474 | 
     475 |                 ret = ar0144_start_streaming(sensor, state);
     476 |                 if (ret) {
     477 |                         dev_err(sensor->dev, "Failed to start streaming: %d\n",
     478 |                                 ret);
     479 |                         pm_runtime_put_sync(sensor->dev);
     480 |                 }
     481 |         } else {
         |           ~~~~~~
     482 |                 ar0144_stop_streaming(sensor);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     483 |                 pm_runtime_mark_last_busy(sensor->dev);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     484 |                 pm_runtime_put_autosuspend(sensor->dev);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     485 |         }
         |         ~
   drivers/media/i2c/ar0144.c:466:9: note: initialize the variable 'ret' to silence this warning
     466 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +470 drivers/media/i2c/ar0144.c

   457	
   458	/* -----------------------------------------------------------------------------
   459	 * V4L2 subdev operations
   460	 */
   461	
   462	static int ar0144_s_stream(struct v4l2_subdev *subdev, int enable)
   463	{
   464		struct ar0144 *sensor = to_ar0144(subdev);
   465		struct v4l2_subdev_state *state;
   466		int ret;
   467	
   468		state = v4l2_subdev_lock_and_get_active_state(subdev);
   469	
 > 470		if (enable) {
   471			ret = pm_runtime_resume_and_get(sensor->dev);
   472			if (ret < 0)
   473				goto unlock;
   474	
   475			ret = ar0144_start_streaming(sensor, state);
   476			if (ret) {
   477				dev_err(sensor->dev, "Failed to start streaming: %d\n",
   478					ret);
   479				pm_runtime_put_sync(sensor->dev);
   480			}
   481		} else {
   482			ar0144_stop_streaming(sensor);
   483			pm_runtime_mark_last_busy(sensor->dev);
   484			pm_runtime_put_autosuspend(sensor->dev);
   485		}
   486	
   487	unlock:
   488		v4l2_subdev_unlock_state(state);
   489		return ret;
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
