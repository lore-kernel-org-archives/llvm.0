Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2F26738D;
	Sat, 20 Dec 2025 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238422; cv=none; b=SJtW7TKtSqStCc58N1OX2SDG5qz8Z0ld/Zz/cXCspnrN3dtvGE2VV4UhhTNpIsl31eTtq6rsCom3mwHUJQKsD7XgIB1Umj0txkecCKZfkRKW8dZUJxWshI57WJ2H+bCD2lsq3GcFOx8oqLWdwPTOW+zHF8MyhaOCX53RAjxKVwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238422; c=relaxed/simple;
	bh=QQzS/BzYSOEpaGnxVz2p9RRclDFfbXTiNAZmPTP0+6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOGRcpSrpc4KtNmybkSSoPK9ZkfRzt+gqRPeaXtVFgmDIVHxIgxw0MxZikPA/IEXWX38OW0gRzd8iZhK2ETD0bOhC2ls5fJyCmBNrgfe9lQDkEYfERF8sD/GtboiV2e92TyEB6sLfJWIY1UMytYa9Kj67H6rLfcqTbAB9NlQGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URDJIjh3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URDJIjh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766238421; x=1797774421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQzS/BzYSOEpaGnxVz2p9RRclDFfbXTiNAZmPTP0+6g=;
  b=URDJIjh3rHPDD1J6U2uplfzzSQXmjUhfpERhalOiEr1e9qmpGQATPMVe
   SsFYWOjzcbgP84/2O8ARXALZrNKGtzu9YvRuhLCcae1uQpSqF/R0+LRiJ
   9F8th4Fxu8nvooff/ivu4J+3SorQTIFV08ETXyLodgi7DeDsslqmtYzXl
   14SqO7GfmyTzpQIGjg0RiWqN2mNhO5Y0QUpwk7ORB/NesLJ7zDpnANxhP
   E8HRn1ktUr4BInMZnB6WupznrrvSzg2AsH6oG/8UGeR6VUc6RWTd4Q2Sl
   Or+dWt53mpdhcVjPXzMU+5vT8a9ueMEjwDatiGqqmloxW46+m5VfCegOh
   w==;
X-CSE-ConnectionGUID: umiidhCbTcqZ0svStgSGiw==
X-CSE-MsgGUID: M5qFtsEoSdWpCnSI6bJxFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70743476"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70743476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:46:56 -0800
X-CSE-ConnectionGUID: +VhR/jCXTZuvCuwgUW1LWw==
X-CSE-MsgGUID: rBh87X97QBetVVoGo45qyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="229775589"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2025 05:46:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxIK-000000004a1-3pku;
	Sat, 20 Dec 2025 13:46:52 +0000
Date: Sat, 20 Dec 2025 21:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Serin Yeh <serin.yeh@intel.com>
Subject: [gdamjan:v6.19/thinkpad-x9-14 6/6]
 drivers/media/i2c/imx471.c:1053:1: warning: unused label 'error_power_off'
Message-ID: <202512202128.RJ8OLja9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gdamjan/linux v6.19/thinkpad-x9-14
head:   89f00ee2600546cc930a1fbad7d401bc134d54e4
commit: 89f00ee2600546cc930a1fbad7d401bc134d54e4 [6/6] Add IMX471 power management for correct behaviors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202128.RJ8OLja9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202128.RJ8OLja9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202128.RJ8OLja9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx471.c:1053:1: warning: unused label 'error_power_off' [-Wunused-label]
    1053 | error_power_off:
         | ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +/error_power_off +1053 drivers/media/i2c/imx471.c

   961	
   962	static int imx471_probe(struct i2c_client *client)
   963	{
   964		struct imx471 *imx471;
   965		bool full_power;
   966		int ret;
   967	
   968	
   969		/* Check HW config */
   970		ret = imx471_check_hwcfg(&client->dev);
   971		if (ret) {
   972			dev_err(&client->dev, "failed to check hwcfg: %d", ret);
   973			return ret;
   974		}
   975	
   976		imx471 = devm_kzalloc(&client->dev, sizeof(*imx471), GFP_KERNEL);
   977		if (!imx471)
   978			return -ENOMEM;
   979	
   980		mutex_init(&imx471->mutex);
   981	
   982		/* Initialize subdev */
   983		v4l2_i2c_subdev_init(&imx471->sd, client, &imx471_subdev_ops);
   984	
   985		ret = imx471_get_pm_resources(&client->dev);
   986		if (ret)
   987			return ret;
   988	
   989		full_power = acpi_dev_state_d0(&client->dev);
   990		if (full_power) {
   991			ret = imx471_power_on(&client->dev);
   992			if (ret) {
   993				dev_err(&client->dev, "failed to power on\n");
   994				return ret;
   995			}
   996	
   997			/* Check module identity */
   998			ret = imx471_identify_module(imx471);
   999			if (ret) {
  1000				dev_err(&client->dev, "failed to find sensor: %d", ret);
  1001				goto error_probe;
  1002			}
  1003		}
  1004	
  1005		/* Set default mode to max resolution */
  1006		imx471->cur_mode = &supported_modes[0];
  1007	
  1008		ret = imx471_init_controls(imx471);
  1009		if (ret) {
  1010			dev_err(&client->dev, "failed to init controls: %d", ret);
  1011			goto error_probe;
  1012		}
  1013	
  1014		/* Initialize subdev */
  1015		imx471->sd.internal_ops = &imx471_internal_ops;
  1016		imx471->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
  1017			V4L2_SUBDEV_FL_HAS_EVENTS;
  1018		imx471->sd.entity.ops = &imx471_subdev_entity_ops;
  1019		imx471->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1020	
  1021		/* Initialize source pad */
  1022		imx471->pad.flags = MEDIA_PAD_FL_SOURCE;
  1023		ret = media_entity_pads_init(&imx471->sd.entity, 1, &imx471->pad);
  1024		if (ret) {
  1025			dev_err(&client->dev, "failed to init entity pads: %d", ret);
  1026			goto error_handler_free;
  1027		}
  1028	
  1029		/* Set the device's state to active if it's in D0 state. */
  1030		if (full_power)
  1031			pm_runtime_set_active(&client->dev);
  1032		pm_runtime_enable(&client->dev);
  1033		pm_runtime_idle(&client->dev);
  1034	
  1035		ret = v4l2_async_register_subdev_sensor(&imx471->sd);
  1036		if (ret < 0)
  1037			goto error_media_entity_pm;
  1038	
  1039		dev_info(&client->dev, "imx471 probe successfully\n");
  1040		return 0;
  1041	
  1042	error_media_entity_pm:
  1043		pm_runtime_disable(&client->dev);
  1044		pm_runtime_set_suspended(&client->dev);
  1045		media_entity_cleanup(&imx471->sd.entity);
  1046	
  1047	error_handler_free:
  1048		v4l2_ctrl_handler_free(imx471->sd.ctrl_handler);
  1049	
  1050	error_probe:
  1051		mutex_destroy(&imx471->mutex);
  1052	
> 1053	error_power_off:
  1054		imx471_power_off(&client->dev);
  1055	
  1056		return ret;
  1057	}
  1058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
