Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D14185D;
	Sat,  2 Sep 2023 05:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693632971; x=1725168971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=87QQmU2C6Z9RmWs5uWLJ6n52UmZjsrxNuNfTRt5GDmI=;
  b=c+3vFMFaZxQuAkkhyVFyNXeW/JubB5Y4W/sDKcCs+kLOZgXJ9Ck5jXFo
   YbEjVQm8bvCrVXpRdjW3EJoeTBF9oZ2+27Fii8c7f7XHhXLwZ0iQKvWDV
   X7sCcr70hnOxAv1GF8of9BYs1KozCVUtdKmOfYGkqTvzViMI/oyY5L6E3
   7cN2g3joPur24QZ0Q936o2JrEDrpEHwpUj+fgltkSc7oSMYaVSxfIir1/
   Gt6u4vJIVdQLbOg23LUKZrSu8FBCd+Pr5nshrn831cS7FvxWGr77dyloS
   CY8r1EZsQ6ErgUZYsdlcX0/m68U5/mUnCFrL0KHBae97crCM+je8CaR94
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375252492"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="375252492"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 22:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="830334527"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="830334527"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2023 22:36:09 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcJIk-00021H-2n;
	Sat, 02 Sep 2023 05:36:06 +0000
Date: Sat, 2 Sep 2023 13:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 53/68] drivers/regulator/act8865-regulator.c:147:
 warning: cannot understand function prototype: 'struct act8865_platform_data
 '
Message-ID: <202309021320.CVZxVD53-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: f327da53dd2f08aba1fe28957fbe8fb26e489b15 [53/68] regulator: Use device_get_match_data()
config: i386-randconfig-016-20230902 (https://download.01.org/0day-ci/archive/20230902/202309021320.CVZxVD53-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021320.CVZxVD53-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021320.CVZxVD53-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/act8865-regulator.c:147: warning: cannot understand function prototype: 'struct act8865_platform_data '


vim +147 drivers/regulator/act8865-regulator.c

   141	
   142	/**
   143	 * act8865_platform_data - platform data for act8865
   144	 * @num_regulators: number of regulators used
   145	 * @regulators: pointer to regulators used
   146	 */
 > 147	struct act8865_platform_data {
   148		int num_regulators;
   149		struct act8865_regulator_data *regulators;
   150	};
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
