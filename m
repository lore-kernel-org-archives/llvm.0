Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6915BE;
	Sat,  6 Jan 2024 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiYkgs55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704540214; x=1736076214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=na2IvgtcsxM8r4u0dVnCU1Paxkw5pEKmSUMQNQ7GYXw=;
  b=iiYkgs55Pj7hywSyJHFCuUT/tJ+ktYTGo5BZD50P+rgUIgMHi2MtobDv
   hZVSaIny2BEvRGmdjylOWVYUa4myg2O0jcykrLEY7Eun41C32EZF8Zuew
   S8yG4iEMdTQROv1I5tOZp2DopE1N04Vri3AoweicjxC8zr2uTM1a+N3I0
   iu6I8ezyTDZxqE3H5zGem8puPQIbme7c/UqUdbED75SsRO1VXKmFwk5I8
   tkrFhlB2et40ZHz6GaUE+UvoBwh189SAgy21ON87gBy1OQ7bjOqkgJ6NO
   LRhtq72zUyzECewyOJ46MccKFhBDoQSF7ejCPrq6ACfSzN9rPaGj/fgh2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="396535243"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="396535243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 03:23:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="15472699"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2024 03:23:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM4lw-0002Pa-10;
	Sat, 06 Jan 2024 11:23:24 +0000
Date: Sat, 6 Jan 2024 19:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/powercap/dtpm.c:602: warning: Function parameter or member
 'dtpm_match_table' not described in 'dtpm_create_hierarchy'
Message-ID: <202401061934.0O0E30H8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95c8a35f1c017327eab3b6a2ff5c04255737c856
commit: 3759ec678e8944dc2ea70cab77a300408f78ae27 powercap/drivers/dtpm: Add hierarchy creation
date:   1 year, 11 months ago
config: i386-randconfig-003-20240105 (https://download.01.org/0day-ci/archive/20240106/202401061934.0O0E30H8-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061934.0O0E30H8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401061934.0O0E30H8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/powercap/dtpm.c:602: warning: Function parameter or member 'dtpm_match_table' not described in 'dtpm_create_hierarchy'
>> drivers/powercap/dtpm.c:602: warning: Excess function parameter 'hierarchy' description in 'dtpm_create_hierarchy'


vim +602 drivers/powercap/dtpm.c

   574	
   575	/**
   576	 * dtpm_create_hierarchy - Create the dtpm hierarchy
   577	 * @hierarchy: An array of struct dtpm_node describing the hierarchy
   578	 *
   579	 * The function is called by the platform specific code with the
   580	 * description of the different node in the hierarchy. It creates the
   581	 * tree in the sysfs filesystem under the powercap dtpm entry.
   582	 *
   583	 * The expected tree has the format:
   584	 *
   585	 * struct dtpm_node hierarchy[] = {
   586	 *	[0] { .name = "topmost", type =  DTPM_NODE_VIRTUAL },
   587	 *	[1] { .name = "package", .type = DTPM_NODE_VIRTUAL, .parent = &hierarchy[0] },
   588	 *	[2] { .name = "/cpus/cpu0", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
   589	 *	[3] { .name = "/cpus/cpu1", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
   590	 *	[4] { .name = "/cpus/cpu2", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
   591	 *	[5] { .name = "/cpus/cpu3", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
   592	 *	[6] { }
   593	 * };
   594	 *
   595	 * The last element is always an empty one and marks the end of the
   596	 * array.
   597	 *
   598	 * Return: zero on success, a negative value in case of error. Errors
   599	 * are reported back from the underlying functions.
   600	 */
   601	int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 > 602	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
