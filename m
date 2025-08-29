Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B6729AB05;
	Fri, 29 Aug 2025 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458150; cv=none; b=IbAkCPBQQALhqgdiSkrEBeoNwQBABamL3pjXkIAUjU8TMK75WgYpaOkQKTFnH9h1de/sqPVfdqq9b9tO6Kwdui6s0tHXoNw98PumvoSTalQ9VgOOZRe0TSmkONXtqVvd0UNVvwkfzmx7HfddwsR0MnsUVynwMMgp+0YWOeR0KOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458150; c=relaxed/simple;
	bh=SQSLpphWMykoH8kPT+YLQiiyooXF3JILysK635wGNzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EBFy6UjIDtOsxPkO2hzQMmz+38lhJ/3oLLXuWTNFGIA5kDComHWIzQ9WvKFi0DKykTYVm3qgzECRYuAL6eLrsUZNnzCeTBlLCTocsz8em9KZTeKs4bzDdbnriq/UpYLJ3LuNVpP63Ts8tgNSE0elZEnHir9DFUdSEdfyjubL/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8HUVDZe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8HUVDZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756458149; x=1787994149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQSLpphWMykoH8kPT+YLQiiyooXF3JILysK635wGNzY=;
  b=Q8HUVDZedqDzabILUTG2W3Lh5vTZnLsTIXs+7uQFUuRQiHkAbfyMLRtI
   0l0sQsy/2ExZg80E44u04bBTyV+qfMYrPWiAtZNzZ7MnKnC1eH+tKXUfE
   FzakZo8BL4tyYHj32hYVdQas9YNtY1cGKK8cmL37xjdhKknnQP8sbppwa
   mpUJrELcDJ6gh0xaLGP4hqsnkB97OFTTtbBcIj/IeA6Dw6rF1d0N7e7GG
   mx8sYW6gy17ajR0ioqt3LzqsLImbM+rQZ9TSlgpFBL55CHOSqsFtMpVZg
   AAhEuS8o8qd5kecuWIQOAwzmdpZJ74Hx18ZMSGL8wX8jHQ+sliLeHozpU
   A==;
X-CSE-ConnectionGUID: 7g9pXrg4QfK+R2xptlEVSg==
X-CSE-MsgGUID: Ty8QGnA+QZq1weXXQ0Os4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76194205"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="76194205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:02:28 -0700
X-CSE-ConnectionGUID: zfWFgw45QrCRaPZffBQEBA==
X-CSE-MsgGUID: WLxkSuu8S4KbhA37pGGcVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="201275238"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Aug 2025 02:02:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urv03-000UaZ-0w;
	Fri, 29 Aug 2025 09:02:23 +0000
Date: Fri, 29 Aug 2025 17:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [sre-misc:thinkpad-t14s-x1e 43/95]
 drivers/media/platform/qcom/camss/camss-csiphy.c:821:59: warning: variable
 'ret' is uninitialized when used here
Message-ID: <202508291618.jy0uNieL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   9dd4135e4233415f1082b5addd91211121dad8af
commit: 3fa94f0306a4a32794678ae6022ae7b0fe768316 [43/95] media: qcom: camss: Add support for PHY API devices
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250829/202508291618.jy0uNieL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291618.jy0uNieL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291618.jy0uNieL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-csiphy.c:821:59: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     821 |                 dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
         |                                                                         ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:808:9: note: initialize the variable 'ret' to silence this warning
     808 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +821 drivers/media/platform/qcom/camss/camss-csiphy.c

   794	
   795	/*
   796	 * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
   797	 * @csiphy: CSIPHY device
   798	 * @res: CSIPHY module resources table
   799	 * @id: CSIPHY module id
   800	 *
   801	 * Return 0 on success or a negative error code otherwise
   802	 */
   803	int msm_csiphy_subdev_init(struct camss *camss,
   804				   struct csiphy_device *csiphy,
   805				   const struct camss_subdev_resources *res, u8 id)
   806	{
   807		struct device *dev = camss->dev;
   808		int ret;
   809	
   810		csiphy->camss = camss;
   811		csiphy->id = id;
   812		csiphy->cfg.combo_mode = 0;
   813		csiphy->res = &res->csiphy;
   814	
   815		snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d",
   816			 csiphy->id);
   817	
   818		csiphy->phy = devm_phy_get(dev, csiphy->name);
   819	
   820		if (IS_ERR(csiphy->phy)) {
 > 821			dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
   822			return PTR_ERR(csiphy->phy);
   823		}
   824	
   825		ret = phy_init(csiphy->phy);
   826		if (ret)
   827			dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
   828	
   829		return ret;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
