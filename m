Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D921DE8A8;
	Wed, 19 Feb 2025 17:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739987968; cv=none; b=CM0QGpQOcv+fLlCqIpORSIORCgF7w3FS5mKzorWEJz4Uk9tP+Ixh/XRm9gBb4mmbWR+KoL5+H/151BPXPM8i4ESiY2XldR5vliHCgZ/FR4/4WUgcAzlSJN1UhgPLb8gu49xw9alDFystTs1M9WvUw3tkzDu3Rqh6ya08y9YrxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739987968; c=relaxed/simple;
	bh=dZRPlTg8UwRQsvICOzZrnxpjLEsnFkHU87BP1KT3JfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSUZ3nTeOPkExK2fCW/QmxPHLGRdGtdYW3hjJHeHwUqeQw3pd8BVcm2b0t/K5UM4E5fIR0mN9MKnFBzZrT9/pF8DLJCSEhpV4NyUt83h885joEisol/QEYRl4uTjNNCVvQQ1OQ+75J4p4r5cqkwKZDKmrQOBmm5g/5lc+Qt3h8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fs89mG5z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fs89mG5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739987967; x=1771523967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZRPlTg8UwRQsvICOzZrnxpjLEsnFkHU87BP1KT3JfA=;
  b=Fs89mG5zJ+tMWt/tN36P581+eU+MIqHzIqPuC/imSO6UynwnRuFrtcwX
   mqaK6yAD55DAku9pGFxUPrNpKFpRLjkANRd5GSP7y03K5189ly/EOlDja
   sH79WXTgYAW6SymB0Ybi9Al+y7i02QYY8mTFxEQQGvFBjb3IWh5oEyiog
   5irFyJrArTP/Zd9TmujfrQY/cL75rOsuDgoD0Cbas9rIMXCwiGlWGK1oC
   3OaSL1dtot68WRbxPAjie9V2S/3VVGXZfNvq8Qs+ifz8x3X14db3+Nb5N
   PTv25CYygjcVjpHxG16GJ1rrsCCiF8f2+AWOkzgDCeKNoSW8iCZrBiDat
   Q==;
X-CSE-ConnectionGUID: zPVfjeCkR6+F4HT/a0ySNQ==
X-CSE-MsgGUID: p++PNxokQYev+/2vctcIOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44508069"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44508069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 09:59:25 -0800
X-CSE-ConnectionGUID: bMFkRCDDQl+JuIoQya6e0A==
X-CSE-MsgGUID: 6lzyRyhlQ5KfUfVG4K+gNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119992342"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Feb 2025 09:37:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tko12-0003FZ-0k;
	Wed, 19 Feb 2025 17:37:44 +0000
Date: Thu, 20 Feb 2025 01:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/i2c/i2c-core-base.c:1420:12: warning: stack frame size
 (1040) exceeds limit (1024) in 'i2c_do_add_adapter'
Message-ID: <202502200154.kBYwSZGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
commit: 3bfa08fe9ec8dd79e183c88e1275be74191e7bc8 Revert "i2c: Replace list-based mechanism for handling auto-detected clients"
date:   2 weeks ago
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20250220/202502200154.kBYwSZGe-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200154.kBYwSZGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200154.kBYwSZGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.c:1420:12: warning: stack frame size (1040) exceeds limit (1024) in 'i2c_do_add_adapter' [-Wframe-larger-than]
    1420 | static int i2c_do_add_adapter(struct i2c_driver *driver,
         |            ^
   1 warning generated.


vim +/i2c_do_add_adapter +1420 drivers/i2c/i2c-core-base.c

9c1600eda42e52 drivers/i2c/i2c-core.c David Brownell 2007-05-01  1419  
69b0089a6750a0 drivers/i2c/i2c-core.c Jean Delvare   2009-12-06 @1420  static int i2c_do_add_adapter(struct i2c_driver *driver,
69b0089a6750a0 drivers/i2c/i2c-core.c Jean Delvare   2009-12-06  1421  			      struct i2c_adapter *adap)
026526f5afcd42 drivers/i2c/i2c-core.c Jean Delvare   2008-01-27  1422  {
4735c98f8447ac drivers/i2c/i2c-core.c Jean Delvare   2008-07-14  1423  	/* Detect supported devices on that bus, and instantiate them */
4735c98f8447ac drivers/i2c/i2c-core.c Jean Delvare   2008-07-14  1424  	i2c_detect(adap, driver);
4735c98f8447ac drivers/i2c/i2c-core.c Jean Delvare   2008-07-14  1425  
026526f5afcd42 drivers/i2c/i2c-core.c Jean Delvare   2008-01-27  1426  	return 0;
026526f5afcd42 drivers/i2c/i2c-core.c Jean Delvare   2008-01-27  1427  }
026526f5afcd42 drivers/i2c/i2c-core.c Jean Delvare   2008-01-27  1428  

:::::: The code at line 1420 was first introduced by commit
:::::: 69b0089a6750a0435570df3ba8456c77b352af55 i2c: Refactor for_each callbacks

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Jean Delvare <khali@linux-fr.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
