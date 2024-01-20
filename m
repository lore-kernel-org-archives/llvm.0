Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4211172C;
	Sat, 20 Jan 2024 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705782056; cv=none; b=ECVMPEntkgcLoVAFVUn0VVgNwugBMR/oUEoTkzUZCZ9ByleliChy6pfDHLvALtXKCng2mm3zyla5gbY6i67l6GqBaF6J1LW+Jfl348OE4g3hG8fBHw6Dd1t1qCF5Rpmm6nr8fO+oXhOReb6m0vAmxZeSSPz2EYm+HsU2+P9KYlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705782056; c=relaxed/simple;
	bh=dGGE84YgPkEQ7MOT5i3/GSDTWHliWLQFAKaRbRJYeWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+AYbY4m+0YYcRgLpyNONnk/BDrX2hUotEhLPHBFRFId8mz6aIZOy3M8eS89B7TAsp+p2sEFvKU2Rondgu8T1xMNv+vbdf2r4MiTyaZD0BaKKJT/JctWQDEobVzkExK7j09M/iLTK9guLGhnispD9nCkp4CrX0yf6Cv04z78/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThasR/al; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThasR/al"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705782054; x=1737318054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGGE84YgPkEQ7MOT5i3/GSDTWHliWLQFAKaRbRJYeWg=;
  b=ThasR/alR0Y5JoO6hSn+HjuRaIXnKqeWBZiIcMZDSbDlujjxrMXgjmtN
   nSvOPXfm+GXVG88AHP7Tqah9MZAtUmY+IXCmzj7CsgOLU5wFdeE+gPqVU
   bsnMyqSnjd+MFtjY6rctckU7lb26gHBJHmppDiKLhWAIE4uoJOhozAsGt
   UKJSZJm6qzzSYxv0XL/wgF+m3Fs2Bqa3owWI+nwKzkKM6jKJSVtSiUesu
   C3pnGpNPDojvd3RGT+s+366Pd9+ycdoExLS9knY0QXZiWCf1W74VOu4c2
   qNoEdYRiI6dY056zHFUrOneLuTXrYRS0NK8Vorp4E3a+g/2HsP7ISHl0Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="487111246"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="487111246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 12:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="941460"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2024 12:20:52 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRHph-0005Pq-2L;
	Sat, 20 Jan 2024 20:20:49 +0000
Date: Sun, 21 Jan 2024 04:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 52/54] drivers/gpu/drm/drm_mipi_dsi.c:1421:42: error:
 use of undeclared identifier 'mipi_dsi_of_notifier'
Message-ID: <202401210400.XksXjSht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   6a64fb8a7a10a804baffc30e4a05d56bf6d8ab91
commit: 1d5d5d0fe3f1402cf026845df7bbe19d70a47071 [52/54] drm/mipi-dsi: Add OF notifier handler
config: i386-randconfig-001-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210400.XksXjSht-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210400.XksXjSht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210400.XksXjSht-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dsi.c:1421:42: error: use of undeclared identifier 'mipi_dsi_of_notifier'
    1421 |                 WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
         |                                                        ^
   1 error generated.


vim +/mipi_dsi_of_notifier +1421 drivers/gpu/drm/drm_mipi_dsi.c

  1417	
  1418	static int __init mipi_dsi_bus_init(void)
  1419	{
  1420		if (IS_ENABLED(CONFIG_OF_DYNAMIC))
> 1421			WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
  1422		return bus_register(&mipi_dsi_bus_type);
  1423	}
  1424	postcore_initcall(mipi_dsi_bus_init);
  1425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
