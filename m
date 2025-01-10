Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D397C211288;
	Fri, 10 Jan 2025 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525554; cv=none; b=a3JQ12P2CwQs7pSk97w+MsiiAZi5P8IrRxeFUKNbI4jv67/4EYwfb53EpJLsRwzRqi0d5HD+PmwOlki3dFh/MsGfjjoRym/ohQ9MfaSOiHjXP9EUeLrY4pFpP9cmzdjQ3CiHw8uaJs7gO2xkoFFY8ECIWgI3l88wlK7rFEcYP1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525554; c=relaxed/simple;
	bh=jE26LWlMjEZTX+f2EwU9W7vESBLJv57xK1fhSytYcu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2zNjqW2E3vIbeZxitM7Y6wMUQhDFWKpVsU2tFzAM746rkZCTJtYa1+k504OjHb2SSoe3lVnHyasVPt8GqUN1qAN4BNozbIJ17h5aN069UiKjYiGT5Oj3hlETr/VDhK/erFtp4nnXaDMWYB220U+qImtHeO+j+2djyn8lTJsID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2OkCOD1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2OkCOD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736525553; x=1768061553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jE26LWlMjEZTX+f2EwU9W7vESBLJv57xK1fhSytYcu4=;
  b=K2OkCOD1OeT+z9DmwEbxyh0t2dunGnEGea3cgKRIQf4ejuNOeWdXQ4X5
   Z9fZSv/1X2QS67O8zot0uGaoG4kk9gkncKrwNL64HivEgrv9wrBYq1n15
   PMS1KZlTxhTIHcA8e3bIJz9S18NNGEMKuNowq39vBzvtF6svNF39T4NPT
   dUxjKXlcdGCLAbUsXMoaUjg/ZIsh4Pe+fddNUjzkOBDL9JG0JjVEgVpSh
   xFMINt6Mw0w/gds87qkCvbnanC0YIZlNxcXggq2YaRnjvMN5U6iIr7ZpW
   Zfy8Fq9Ylk20tNVOcSJ49//B/vM4mNdyKtinKJGSDr5pm/WJw8aiM2GOS
   w==;
X-CSE-ConnectionGUID: P4NaVTQoR6izDGbiUKPhcA==
X-CSE-MsgGUID: DR/lH+/oSJqhHDUblT3IBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="39639340"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="39639340"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:12:32 -0800
X-CSE-ConnectionGUID: sx+iGlvkQ2itGRkH34/0EA==
X-CSE-MsgGUID: q01spXPuRPah++Hifr8f2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108815855"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jan 2025 08:12:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWHca-000JSK-0k;
	Fri, 10 Jan 2025 16:12:28 +0000
Date: Sat, 11 Jan 2025 00:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <min.li.xe@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 371/504] ./usr/include/linux/rsmu.h:88:2:
 error: unknown type name 'bool'
Message-ID: <202501110003.PwZyO9m1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: b77497260b398a80cfe434aec5106a46dcc21456 [371/504] misc: rsmu: add rsmu cdev driver
config: i386-buildonly-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250111/202501110003.PwZyO9m1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110003.PwZyO9m1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110003.PwZyO9m1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/rsmu.h:88:2: error: unknown type name 'bool'
      88 |         bool continuous;
         |         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
