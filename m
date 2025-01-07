Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111E273F9;
	Tue,  7 Jan 2025 23:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736293011; cv=none; b=CEdzCvVU2RKrRXPMBq0r+9v1i3lcOn1UDwM94J0K7jWGW/oaPH8FwYhkSmdJQ8rkCMZgXpqTWF8XWuzK9gEmjIl0etKouGxKHu0KFI8ZGMvIxUZffown8vZZBmwcA0BBoshr0chCDWiW5k7oVOz3xl+xvRkJbqmdJ1DxYUg3tK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736293011; c=relaxed/simple;
	bh=7R7v+XYw4lp/IhiOxWRP6AuO1XusZVh4w7DYtfw8NkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eBNFQF3kuBFvnovQYEGdWOt2H9v3VJUyrYiffUZ4b9ZEfZGRTQkoF+sVUUZWFC0HWnws6gflx7f+zAxCi3bGMCYr8pr6F2f1LRZMLZ5LvpejI6iwsnJ5DjWGntXAH302GsfBYk9Xzl7j2DBgOavYjGstqd6gvq5vLKo4fgvejjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfxoipU/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfxoipU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736293010; x=1767829010;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7R7v+XYw4lp/IhiOxWRP6AuO1XusZVh4w7DYtfw8NkQ=;
  b=XfxoipU/asldMcCnJW8tw0YIsAi0i1vDlNs2+fPmpovLvtGuJBEAQpV3
   rZsW1iICoK6/YPVHtnpL4ibpiBxFg2KkqKLY+oBTfagXL2v9ctSulPEFb
   tUOEqAtkDOO0G1j1RyP+kEXfqk3nedD562Ao439mV5+DxMv8aI7onh0Gh
   KluC5STacu1uPwg4KPM1J2xE2WOHhKa1Lb/b5l6B+MgMFG9+N9ehq0JhU
   EBZRNeGzZB6uQNc/Y5fvQMCwUgI5EohnJmL/vqaV6juFAe3fA5C/F2ycZ
   zRQ+hVHS62YlxgxNT9Rwpx5vHzRnT0Zx7lio6DFO3prRJS+ByRujG8xvW
   g==;
X-CSE-ConnectionGUID: jwXG4VWWQDKkE6NsYQ8cwg==
X-CSE-MsgGUID: nSykan4cTZ+z6o2qw3LOIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36663747"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36663747"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 15:36:49 -0800
X-CSE-ConnectionGUID: PNDSr7o8RrKMi1lV3E7r8Q==
X-CSE-MsgGUID: d71GWURTQ8G+TDNBl1stYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133798486"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jan 2025 15:36:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVJ7t-000FN9-1k;
	Tue, 07 Jan 2025 23:36:45 +0000
Date: Wed, 8 Jan 2025 07:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 41/64]
 drivers/video/fbdev/udlfb.c:1485:14: error: use of undeclared identifier
 'edid_show'
Message-ID: <202501080738.Xew3cYke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   1c76e0940bd2d02a30ddaf76ef5bcb648c3fffb1
commit: 57cb559ad9c6a7e5d0f0eb96f05c4eeba5bf2bd2 [41/64] udlfb
config: hexagon-randconfig-002-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080738.Xew3cYke-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080738.Xew3cYke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080738.Xew3cYke-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/udlfb.c:1485:14: error: use of undeclared identifier 'edid_show'
    1485 |         .read_new = edid_show,
         |                     ^
>> drivers/video/fbdev/udlfb.c:1486:15: error: use of undeclared identifier 'edid_store'; did you mean 'edid_attr'?
    1486 |         .write_new = edid_store
         |                      ^~~~~~~~~~
         |                      edid_attr
   drivers/video/fbdev/udlfb.c:1481:35: note: 'edid_attr' declared here
    1481 | static const struct bin_attribute edid_attr = {
         |                                   ^
   2 errors generated.


vim +/edid_show +1485 drivers/video/fbdev/udlfb.c

7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson  2010-02-15  1480  
598b2eedfc3fbe drivers/video/fbdev/udlfb.c   Bhumika Goyal    2017-08-18  1481  static const struct bin_attribute edid_attr = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson  2010-02-15  1482  	.attr.name = "edid",
66cf911986d082 drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh 2024-11-17  1483  	.attr.mode = 0600,
b9f03a3cd06c6f drivers/video/udlfb.c         Paul Mundt       2011-01-06  1484  	.size = EDID_LENGTH,
59aa03ac70cccf drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh 2024-12-15 @1485  	.read_new = edid_show,
59aa03ac70cccf drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh 2024-12-15 @1486  	.write_new = edid_store
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson  2010-02-15  1487  };
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson  2010-02-15  1488  

:::::: The code at line 1485 was first introduced by commit
:::::: 59aa03ac70cccf8b40f49311d2bccba8ff5f12e6 fbdev: udlfb: Use const 'struct bin_attribute' callback

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
