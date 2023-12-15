Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB837470;
	Fri, 15 Dec 2023 05:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FI8j/K6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702618578; x=1734154578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rViiAjwa8iV1XLWPfT3TONDHVDBYoCb/76Lo0/wh+mw=;
  b=FI8j/K6pAlwwbIgMKUNb5jHZTm3sLIGmLiBGepEGIFilXtwr+NyBHUG0
   84gApEzDdSuaRg2fmGqx8iivyXj84n+6YtkqBcb9nHqVvl6qQEQSoSbU2
   sV5evdUq3mjmZPS1XNspxQHDuXIKbPMk9b9sLg7BtYIF4JnaHnKqd5xFE
   tF7qTyq1X/YqIpE5mErpt9qqQCP5iUHlpNXa0QkcsFZ/ginXFCZApb3Sb
   PIF15y9c71+E2OAZMILHB6bOAZELEieZdAaYGnlUY0mtyS2BWAi/blF5T
   fftTHLGQN1u+ZcVY4GjxJBZMCc/Kk3NDjqBOM6N6CY0LF8j8UcTxR5NDz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2320285"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="2320285"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 21:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947839454"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="947839454"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 21:36:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE0rr-000N9M-2u;
	Fri, 15 Dec 2023 05:36:12 +0000
Date: Fri, 15 Dec 2023 13:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.7-rc5 127/138]
 drivers/media/i2c/ap1302.c:30:29: warning: unused variable 'normal_i2c'
Message-ID: <202312151327.Staxtl6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.7-rc5
head:   b8cd563c115473e27fa4778c1eca7b25f6f9a7ee
commit: 7da5b55865db90b714879aed9c29a75411767c9f [127/138] media: i2c: ap1302: Getting the thing to probe
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231215/202312151327.Staxtl6s-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151327.Staxtl6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151327.Staxtl6s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ap1302.c:30:29: warning: unused variable 'normal_i2c' [-Wunused-const-variable]
   static const unsigned short normal_i2c[] = { 0x00, I2C_CLIENT_END };
                               ^
   1 warning generated.


vim +/normal_i2c +30 drivers/media/i2c/ap1302.c

    29	
  > 30	static const unsigned short normal_i2c[] = { 0x00, I2C_CLIENT_END };
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
