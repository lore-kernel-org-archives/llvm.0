Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB24483A9;
	Wed,  2 Sep 2026 22:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389532; cv=none; b=imQp+4zdVXPATtr1S44Op93bq+w8gCzVqMB4dW1xiXcntrRdoSxJFb8cBTvpW+R9txj/UQa2HGYzgHNJUIpCuBmcyNHwXHsk3vkedkqaHK+Y8ewDk+2SiFBl/bg9caewZfC8vSKEfXbANg77x+ZbQMQ9uAhoDRZEfnqo3WljzBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389532; c=relaxed/simple;
	bh=BVmFMFNSxftFfT7qBqqyRae/F23uC1uC0v2EDldNVOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kCAEz8NIGShDRUjYcitjJCIUeUwSoqgXbWZgTo9mmRTG2/EWx1YuUg1mv2I7DoxQHXkdYMCNHc9jI9btHtHHdpkUtkydp2eeOff2DCSuG9GU6o00jry1AGFwcDUAOYjIrNowjmuyaR2RFwUhlXSfGjJoADFsZkUh9Sy1Vzke8qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqPF/crL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqPF/crL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788389528; x=1819925528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVmFMFNSxftFfT7qBqqyRae/F23uC1uC0v2EDldNVOw=;
  b=EqPF/crLzxs5qWkJtCwxnEeWjoCRNKL0bHYXn3rJgkNKJKixNy7AOnll
   cJ5QQuwk4+ZfDcbxrd/tHJTT7wgL/zGE9sZJLRxrN5gsaj0NSmtYnXx/5
   rP8MpVX8EGP9bCbrTEWuERgxcanBg2jR0h6qA/bwBzJtp61h6D7aj5q+B
   LTWF40WYndL5ez8yMm1MjbT+BZTI2gyhZl7UfqM4MuqmgyAc7q7bQtZNk
   oe/LOd8Ku35qdVGr0rTcqTVjFJxk6UbgxSgBdoVL4wpUBWuSWOSnob842
   mXCqc/tSmlMZxJg8Zm9FMURcQOuqbjSdwM+DZkB3UBq6hPBCQEiLnSGO9
   w==;
X-CSE-ConnectionGUID: y4Gva1NDSxSlqsPtjV7JpA==
X-CSE-MsgGUID: 8qLbL+zASc6p+F26w8jf5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89072662"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="89072662"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 15:52:04 -0700
X-CSE-ConnectionGUID: fH+u2O+ZTJqHpdChIcglGA==
X-CSE-MsgGUID: VY6D0wLKTre/zfrUvHLFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265220949"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2026 15:52:02 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1toF-000000003Po-1rMj;
	Wed, 02 Sep 2026 22:51:59 +0000
Date: Thu, 03 Sep 2026 06:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 70/131]
 drivers/rpmsg/zx29_smd.c:51:13: warning: variable 'huh' set but not used
Message-ID: <202609030640.2vjAUQKU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   4132307830800b020a6d29d27cb3fec3cb5fbb90
commit: f845ca09dab5001db7890c5242662a1ad134fcf3 [70/131] Even more working rpmsg
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609030640.2vjAUQKU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c2cffa015e9549aafba9e514384b08204c7cc4b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030640.2vjAUQKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030640.2vjAUQKU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg/zx29_smd.c:189:13: warning: unused function 'zx29_smd_release_device' [-Wunused-function]
     189 | static void zx29_smd_release_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/rpmsg/zx29_smd.c:51:13: warning: variable 'huh' set but not used [-Wunused-but-set-global]
      51 | static u32 *huh;
         |             ^
   2 warnings generated.


vim +/huh +51 drivers/rpmsg/zx29_smd.c

    50	
  > 51	static u32 *huh;
    52	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
