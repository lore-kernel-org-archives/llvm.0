Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CF230FC03;
	Fri, 30 Jan 2026 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769758191; cv=none; b=B7E+lGVJ9w/Z80pMZmnzKUBfX1GQQAqcO+CT6C9PxUC8jBVDrcChM3CIUAxDIrpNsmQMAoSdiTQnlHW5MiJCVHTbc1vxSZRS/xyxTwVUnUHUzWlkpzFmNgxqFgPIimvipyRpx6QSpBS70USrIYUhVAiHtUso51aFs1H4Upr7vIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769758191; c=relaxed/simple;
	bh=dxMiNmFVXvlVmQf4iWCNObk/9hfl2KT3dOnQzVN2vXs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CKyvqdMl0/7G+ThphFMUhPxqpP/SGeXsQ5HTBIj/O4quSOsgy6NXYZ4KflLnhALTqevkT7AduxcMTXHv6MHhs0JTzFBqA0Zv7DNe4c1XJE1rVnwAU0aN4BzX7rbZNEivYj9wAphVD9D3g3Zed/muxeqCIq5qCFn6qmWBcf0s8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/OSHdpE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/OSHdpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769758190; x=1801294190;
  h=date:from:to:cc:subject:message-id;
  bh=dxMiNmFVXvlVmQf4iWCNObk/9hfl2KT3dOnQzVN2vXs=;
  b=T/OSHdpEBjJKloZmqjnN6kslqtRfImwEihbjyb4qooP9gG8QPG3Vv9CA
   JdHJMhb2K4oqUC8GfclRNHKpYraKjo2aOlOznPPhhX40Jqinxt4bmT9rV
   DSmQAw07mR/3M8kQjo+Jzg5a600rqSzqTHLPHnQmqWQ9gOGZUjRwDzhZY
   nlddSI+yjCEishoYfSHcz8oQhhcSq3KU0iMLbZ22ce0A4QcN5kPHgoWsM
   St+WN8EUY+Jgeng4Z3/bv6W0K2sp7AvSDS3HiNqtjPucEJrpgk8OVbJ41
   LooUCC83aB8f/F3YY0VDwO5hlYGD59jxgBDmBbF2KZjknoWWyzV/jyfFM
   w==;
X-CSE-ConnectionGUID: ug+9I/C6QVOFmk+dnS4lxw==
X-CSE-MsgGUID: lmzUZNCLTO2AnPSbqVFfmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96470742"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="96470742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:29:41 -0800
X-CSE-ConnectionGUID: FX7eLx0TQqeX1fuaHqJWqw==
X-CSE-MsgGUID: GswcvOEUTuCcpjCUdJn+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239519033"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2026 23:29:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vliwi-00000000cJo-2rF9;
	Fri, 30 Jan 2026 07:29:36 +0000
Date: Fri, 30 Jan 2026 15:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/region_rework_v3 6/9]
 drivers/cxl/core/dax_region.c:94:26: error: call to undeclared function
 'mhp_get_default_online_type'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202601301511.YgB0Gubo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/region_rework_v3
head:   ef956221cc52b1c29b05280fcec99686d744d6b4
commit: 4fd6f53383d678673b9fd4df224a53c9da119f17 [6/9] cxl/core/region: move dax region device logic into dax_region.c
config: i386-buildonly-randconfig-003-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301511.YgB0Gubo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301511.YgB0Gubo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301511.YgB0Gubo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/dax_region.c:94:26: error: call to undeclared function 'mhp_get_default_online_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         cxlr_dax->online_type = mhp_get_default_online_type();
         |                                 ^
   1 error generated.


vim +/mhp_get_default_online_type +94 drivers/cxl/core/dax_region.c

    82	
    83	int devm_cxl_add_dax_region(struct cxl_region *cxlr,
    84				    enum dax_driver_type dax_driver)
    85	{
    86		struct cxl_dax_region *cxlr_dax;
    87		struct device *dev;
    88		int rc;
    89	
    90		cxlr_dax = cxl_dax_region_alloc(cxlr);
    91		if (IS_ERR(cxlr_dax))
    92			return PTR_ERR(cxlr_dax);
    93	
  > 94		cxlr_dax->online_type = mhp_get_default_online_type();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
