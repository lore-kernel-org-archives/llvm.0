Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675621C6A1;
	Thu, 26 Sep 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337897; cv=none; b=B4FyBEfYrc8l/hnCZGyuuFSV7pPWJ4j8TL0b1ep6vI8DCPbNO6DDosxFQBzNH+0lHB6uu1spwqzy7zy+foGGywaCibtNVRPBW8AFHI8iQEAQlnqdPYY7VYCLJcwPeEjxmjG6quu+CVCI2RpepHu9Sz96lRZzosPHovlXgIb3oRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337897; c=relaxed/simple;
	bh=m/LrqfL8hXhFwiWZ9YEyjK6Y66c1GUaPc/hAPMb/Aag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vE7ObTxMpSUlT12Wd5uIx3GkmIG33zHTfMVXo3OAjArfi+sapWdXhMsS7vK89dqS0Go85RK374gEAG3B0ppZ/Ci7L/YNEKFa3Jly4eMGTB6j+xkSRm4cqrbAA4sWO1DSikWg9IxRAkA2WM+Ps+F8UO7ul5yVECfiNjaFEZZAXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGjZnP9T; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGjZnP9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727337896; x=1758873896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/LrqfL8hXhFwiWZ9YEyjK6Y66c1GUaPc/hAPMb/Aag=;
  b=XGjZnP9TO31KzGvXJpFoEackR/e16hEjVio/v1g3Pd7ml0bXv9AdD7Zh
   nFv4nY6KzDH/omZoBBXqA3ez4kcafb0xcJyjk13Z9UNj4zDINNHkAC9LO
   5DKkmxkSih5WcqaMiDr4Um+orh63FanKkcjccMTv6kNmrNFYxigsdED4o
   K5vVCcWSrmdT/IM8B6SWCscgfCudh5Z3K2/8fWvYon6VhoT5H7b7KcwHA
   aOFMocixLhvu7Z9hvuD+tTILPdXte0OoXlLzG9u2BDq6YjybDV9UkC1TD
   4dpwUPuw4zCIMqXcIYKveBlrLn2+Iz0EO/u63VtQZdJvGG1QvSHoi/K5L
   Q==;
X-CSE-ConnectionGUID: gurWWXI8TK+1fq2vqu5Rtg==
X-CSE-MsgGUID: N7sOZcauTzmIl8a1Iy8p6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26571770"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="26571770"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 01:04:55 -0700
X-CSE-ConnectionGUID: l1ItZSClQkijrJDDfbjlIw==
X-CSE-MsgGUID: Dzv70dGeSUK5r/XeGkZ08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="76425616"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2024 01:03:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stjSm-000KQh-1T;
	Thu, 26 Sep 2024 08:03:00 +0000
Date: Thu, 26 Sep 2024 16:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 41/47]
 drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning: unused
 variable 'st7701s_ids'
Message-ID: <202409261611.bjSvt9pC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 51bda0979ee92a0aac9def03dd9716f7b032d4bb [41/47] drm/panel: Add driver for ST7701s DPI LCD panel
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240926/202409261611.bjSvt9pC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261611.bjSvt9pC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261611.bjSvt9pC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning: unused variable 'st7701s_ids' [-Wunused-const-variable]
     426 | static const struct spi_device_id st7701s_ids[] = {
         |                                   ^~~~~~~~~~~
   1 warning generated.


vim +/st7701s_ids +426 drivers/gpu/drm/panel/panel-sitronix-st7701s.c

   425	
 > 426	static const struct spi_device_id st7701s_ids[] = {
   427		{ "st7701s" },
   428		{ }
   429	};
   430	MODULE_DEVICE_TABLE(spi, st7701s_ids);
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
