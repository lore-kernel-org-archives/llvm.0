Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B79719CD13;
	Mon, 21 Jul 2025 05:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753076081; cv=none; b=gPuaURaQ9Yp2N8auVSmWy3hPXP+v7aXB4OLqejdSKLuvQPSZ/cN7uu0eRPwYzyAOrMgmWluhqP1dF0I1dsljK3PSGo4HZOHQGBEK9T7T0Bm2JHfEqxj8JTLnwL6KIZDgMbAoJEV5r3P1QsknXu8gZRTU52LiXyQSvc9QCmPtn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753076081; c=relaxed/simple;
	bh=XGXu/wO9nYShvMUa0IDG8A8G8PArW8cixwgSLtnXG00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHuulQYLmZ50vHGr440CzQPeq6lcAJQA/MCBQefeftXiWEzAUAFckpBQXQiPgu2aZ5OUetOXFilIh13/gMa8t7qS73wETbo9GDVBlR2O8YGcB79AzcbATSQm9KfMz0x2aqHAbyceetUY6SsmGAiihq/OLYxhzFgDnsQYIL/4VuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivx88oRh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivx88oRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753076080; x=1784612080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XGXu/wO9nYShvMUa0IDG8A8G8PArW8cixwgSLtnXG00=;
  b=ivx88oRh0NCXi/k5gJ7Rwcbfj/I1tRjSppBwaeeo2rmFmmtXzXvokmlW
   CoefqsB7HNIzR8Ll/Vl9sfWRtuLQqlIJg69pIditXn0J4ma2fKtxlrUXr
   OoEExltihrEO6vNNPrm/r0dSCfFjkefWpBfDymHH7uQyzMM0p03cBbKkQ
   rCrp68A17e0AxRdN4IttT1jQadc0YAfTOuV5mAIQ0MvxAQYFccYZKZmHX
   2tX3b+PqM5hdZzCy/ETxnT53qewe8LghleWyJPjzD+G/9kpLuejeTyBeF
   DN5tu6mujJlcW4j6SftzAt1krP/lnBMYFhHH6sQINMUHKfN50xb6/deFh
   A==;
X-CSE-ConnectionGUID: Atb1NqFXTAaqcG9ph0ToMg==
X-CSE-MsgGUID: Eex6et9eTHWbPEet1hF2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="54383847"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="54383847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 22:34:39 -0700
X-CSE-ConnectionGUID: wNbuxMf2RzSCDN27LWa6Rw==
X-CSE-MsgGUID: DJ1J8PMsSR2ro81sUuacZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="162957432"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jul 2025 22:34:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udjAZ-000GVx-0u;
	Mon, 21 Jul 2025 05:34:35 +0000
Date: Mon, 21 Jul 2025 13:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 6/7] pinctrl-scmi: Add GPIO support
Message-ID: <202507211253.ssxpkznO-lkp@intel.com>
References: <bd79aa90-73f7-4d7b-a340-539b52a73bcf@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd79aa90-73f7-4d7b-a340-539b52a73bcf@sabinyo.mountain>

Hi Dan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.16-rc7 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/firmware-arm_scmi-move-boiler-plate-code-into-the-get-info-functions/20250721-034113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/bd79aa90-73f7-4d7b-a340-539b52a73bcf%40sabinyo.mountain
patch subject: [PATCH RFC v2 6/7] pinctrl-scmi: Add GPIO support
config: s390-randconfig-002-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211253.ssxpkznO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211253.ssxpkznO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211253.ssxpkznO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/core.c:959:8: error: call to undeclared function 'pin_config_get_for_pin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     959 |         ret = pin_config_get_for_pin(pctldev, pin, config);
         |               ^
   1 error generated.


vim +/pin_config_get_for_pin +959 drivers/pinctrl/core.c

   940	
   941	/**
   942	 * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
   943	 * @gc: GPIO chip structure from the GPIO subsystem
   944	 * @offset: hardware offset of the GPIO relative to the controller
   945	 * @config: the configuration to query.  On success it holds the result
   946	 */
   947	int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
   948	{
   949		struct pinctrl_gpio_range *range;
   950		struct pinctrl_dev *pctldev;
   951		int ret, pin;
   952	
   953		ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
   954		if (ret)
   955			return ret;
   956	
   957		mutex_lock(&pctldev->mutex);
   958		pin = gpio_to_pin(range, gc, offset);
 > 959		ret = pin_config_get_for_pin(pctldev, pin, config);
   960		mutex_unlock(&pctldev->mutex);
   961	
   962		if (ret)
   963			return ret;
   964	
   965		*config = pinconf_to_config_argument(*config);
   966	
   967		return 0;
   968	}
   969	EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
   970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
