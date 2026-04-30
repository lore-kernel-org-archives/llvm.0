Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4154635A38C;
	Thu, 30 Apr 2026 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531616; cv=none; b=fRZMNDU1Mnq5c5tvdPUmQqkYnOKhq/k/1nvyMwXcGDO10hMbWV056EZ5wxBSRNGRxL6jFK+yyuvbtV8NFZgj6V0dLbVnyS3fJHhDaDRj/GVqoOX9CsaQToVXOqFy3zcYBQZpphI79o7g2COlEmvu7dVN7SqIKBd9efCcyFyzynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531616; c=relaxed/simple;
	bh=sqg/lDZK+vKtoPCPvi8wbSkEBm0uZsEqRbg1l7i6TQM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bWp8J8Q/3eqZ5y8qxPpIWd4Q1mxoK5W1zynda+kWR7dsroU8JZgQ05ZgmAmTU8NpKYxV4O4qWm+Z4MWgjfip4jMZ1JcmLIoPestnHUtpMM3L0vZa4JzqzVmSnMlDZLDnRxngaUbNIdMhLt+qQjzBqoZ5TU5pqM08ZZ1LVtNozXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYwwdlF0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYwwdlF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777531615; x=1809067615;
  h=date:from:to:cc:subject:message-id;
  bh=sqg/lDZK+vKtoPCPvi8wbSkEBm0uZsEqRbg1l7i6TQM=;
  b=dYwwdlF0UxcM8bBW2Ml46ui3Q1GEI182ZA/lAWplTbUw476LaaFBlxbn
   XWOD+NFlUz9hcPodl/8KGz7shX8D6e7/vxm6D10ckYTQSjfR+8cZWbwRn
   sjn9UnGGoDVCryt8zB0RvN8zyWCqTHN+N6Qm/DFQH1f1EoFtZVwxkBg3j
   /0/p4GzRdUSysNeNYNUTnNxHWrdUncA/dKVrH3z2wJh50wlnrlb8bZqYS
   pgcHRhjCThjhXYHokTOsq4RWJvnOd8kcrRDb4mHN/LoQTyVES8XOGwf91
   h0M2lXxoRDz+AWoSnKHyMwxcOfWFs7FgaCNFuqPn1Q2aba911UNLDdc7y
   g==;
X-CSE-ConnectionGUID: I3E5YxF8RPC6+Y5I89Hxmw==
X-CSE-MsgGUID: iWTFaEGLR2CGHY8q+rrt3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89165238"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89165238"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:46:54 -0700
X-CSE-ConnectionGUID: mYuBgSCRQ4OVX+JWkao7lw==
X-CSE-MsgGUID: yO78XjzPRbGf1z1NMnLrUg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2026 23:46:53 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wILAg-00000000C40-1Zjd;
	Thu, 30 Apr 2026 06:46:50 +0000
Date: Thu, 30 Apr 2026 14:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org
Subject: Warning: drivers/hwmon/yogafan.c:2 This comment starts with
 '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604301429.UUK5MS9i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sergio,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57b8e2d666a31fa201432d58f5fe3469a0dd83ba
commit: c67c248ca406a86cf8b20bf1b3af5e7f3e36581f hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
date:   4 weeks ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260430/202604301429.UUK5MS9i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301429.UUK5MS9i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c67c248ca406 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301429.UUK5MS9i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hwmon/yogafan.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
