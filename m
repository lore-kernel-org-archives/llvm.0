Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEB718A6DF;
	Sat, 15 Mar 2025 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742027155; cv=none; b=ET3m0UCpaW3jAROVZhTjPvdktd8/qXv98tKjuQbv6yDSPfAFcjXiY8hpxEOXraAnhK+XquB5JMc2YF8cngymWGYtPkIhRecJMGJVwpWhtiiAFmWhuosl3j8AGOezCMyL8mnlfoqN1TqGcSeLs7vOMLzVG3gyrbU22xxXdKQyKVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742027155; c=relaxed/simple;
	bh=VAD+24aLk/n0uWIqpG4ZF6+e0slFWlgGHkhRq8hLrzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfQNPgEQMf7pOVrJjiGx3FpOR8+Z6ihAimuxkXE503D8ZikogRYozDCtFsNa5/eNb6kX7CALdSKAVzS3N4DqhKROQLwAzMuSkOkeAeZUq/9VPb5Sj+SFmXQEmVa/0K/v338cOkpZYfR2p1m40vdkcysYXINsMDlpSIM9Wl4cmXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3gYWzGv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3gYWzGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742027152; x=1773563152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VAD+24aLk/n0uWIqpG4ZF6+e0slFWlgGHkhRq8hLrzM=;
  b=V3gYWzGvz+2S8y0eKOc6IINe9BPdsOy0WVOivRyq4W+9I/QCoNB91uws
   qz/D6hXtxO+nS3PEzzX5+ruuBenSpfuz+qarsmEbwEtdmZVyGqnaAkg2g
   NXsstjftqFHvgcjvBcn2qFBXUIFCXwXTGCssfEXWi7iBgQnHfaoUTcCaR
   oD1Q2r9H1MatSZJnFnSphoEer4KMeyF+g6tI/sDIAA73qVIeQBezgA/QN
   9pLqGBAunGs71abRdPi1XqS7lxEngc2IgCBSy2ECuHF+zD2vDanP30wwF
   KpndUvF0PtsYw9ISPxIDTKuB9ZrjC3EKt2NE8W7hlNIr2fTlQbAhPzTGr
   A==;
X-CSE-ConnectionGUID: 4PbNlCTqQLKs6CA+3hsN+w==
X-CSE-MsgGUID: Y0lIScdCSem3GeW1JYN9xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43388353"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43388353"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:25:51 -0700
X-CSE-ConnectionGUID: L+HmjBMOTGOBKuHNcILhPQ==
X-CSE-MsgGUID: //WxALmsQImSXr+Y9PlB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="125691057"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2025 01:25:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttMq4-000BA0-1a;
	Sat, 15 Mar 2025 08:25:48 +0000
Date: Sat, 15 Mar 2025 16:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 10/10]
 drivers/soc/aspeed/aspeed-p2a-ctrl.c:348:7: error: call to undeclared
 function 'of_reserved_mem_region_to_resource'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202503151645.kmsm3pS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   5b03bf12bca3de24640f5e388ef4d956cf22673e
commit: 6cc5107d1a7aa24dffaa093cfbeb387890c16970 [10/10] more driver cleanups
config: x86_64-buildonly-randconfig-005-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151645.kmsm3pS5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151645.kmsm3pS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151645.kmsm3pS5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/aspeed/aspeed-p2a-ctrl.c:348:7: error: call to undeclared function 'of_reserved_mem_region_to_resource'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     348 |         rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
         |              ^
   1 error generated.


vim +/of_reserved_mem_region_to_resource +348 drivers/soc/aspeed/aspeed-p2a-ctrl.c

   331	
   332	static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
   333	{
   334		struct aspeed_p2a_ctrl *misc_ctrl;
   335		struct device *dev;
   336		struct resource resm;
   337		int rc = 0;
   338	
   339		dev = &pdev->dev;
   340	
   341		misc_ctrl = devm_kzalloc(dev, sizeof(*misc_ctrl), GFP_KERNEL);
   342		if (!misc_ctrl)
   343			return -ENOMEM;
   344	
   345		mutex_init(&misc_ctrl->tracking);
   346	
   347		/* optional. */
 > 348		rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
   349		if (!rc) {
   350			misc_ctrl->mem_size = resource_size(&resm);
   351			misc_ctrl->mem_base = resm.start;
   352		}
   353	
   354		misc_ctrl->regmap = syscon_node_to_regmap(pdev->dev.parent->of_node);
   355		if (IS_ERR(misc_ctrl->regmap)) {
   356			dev_err(dev, "Couldn't get regmap\n");
   357			return -ENODEV;
   358		}
   359	
   360		misc_ctrl->config = of_device_get_match_data(dev);
   361	
   362		dev_set_drvdata(&pdev->dev, misc_ctrl);
   363	
   364		aspeed_p2a_disable_all(misc_ctrl);
   365	
   366		misc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
   367		misc_ctrl->miscdev.name = DEVICE_NAME;
   368		misc_ctrl->miscdev.fops = &aspeed_p2a_ctrl_fops;
   369		misc_ctrl->miscdev.parent = dev;
   370	
   371		rc = misc_register(&misc_ctrl->miscdev);
   372		if (rc)
   373			dev_err(dev, "Unable to register device\n");
   374	
   375		return rc;
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
