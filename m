Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E9D16FF37;
	Mon,  3 Nov 2025 23:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762210859; cv=none; b=RGDQOaBpA+umbpK7FHhGGuj5Ksj8mzrSTVvOPHTRctmxIkbVemyqWnmP4Kc1VEsb/f+YXydt5LrDCKa5qhzv0M27EBW7UBSBWKv3LvF+ImQeF95aaOJ0XFtpyOTmjQtRneTOOmX/FvKAQGcYzWqz2i9dEUeFKcmHFeQIejy0x2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762210859; c=relaxed/simple;
	bh=5KqGULnjnq5rfmsfJI/7KgYs/lFiuNT10uQColkp9iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YuymxacozM7ZNwN9MOJDWPsdHLjzzgD3QwuKNsF+XtlKxm5f0MmW9f/KCzcSY2TyZKxr0BsngKnwWr4hzeyYo5dkMRyenfW32zz7jHOdzHlSfu4Wr8KwXG+JNJpz/RdH7G5mcTp2pn+WPPipu/+t6KSosUNusvgahNziATOoOHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuALwkEh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuALwkEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762210858; x=1793746858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5KqGULnjnq5rfmsfJI/7KgYs/lFiuNT10uQColkp9iE=;
  b=ZuALwkEhnW3ukah6n+Gm5IgalJQmZqQuIaXPFJk6FfagvSR8JS/7R+hv
   YVrhiKyjAt/rR8JmSlGAKdCLTYBFYQyx804p6YYM1GZi+A9Bdgfjm/KBE
   9y2Byd70ksSaK//y730wUzZsCqNbIfSxsFPhJFShABaXYdRg3vAk8f7so
   ZCdcExkIB/yS4Y0jzKBP8J+7q08oSBX29dVqLBWWvz/BmTYRkYzWE3WQh
   SJasr29na5Ta37SreALkDbMxQHumyrluv7IxHOcajzjuxZlV3HzROeFRy
   sQF54YnsrdfuQ3SXvwm1KoSQqISg1zh17mPzMWxEDIjICih2ee0mjcVTR
   Q==;
X-CSE-ConnectionGUID: Ds1eIsAlRQ+ypyYsb76Mhg==
X-CSE-MsgGUID: WrgrZv0pSU61F/IRcpc+Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="86922475"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="86922475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 15:00:57 -0800
X-CSE-ConnectionGUID: AkkNBOMzTpSCNIYb2KPlYA==
X-CSE-MsgGUID: IgiwBGu+SfSnyOSec7K9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="191310550"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Nov 2025 15:00:56 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG3XI-000QbA-09;
	Mon, 03 Nov 2025 23:00:40 +0000
Date: Tue, 4 Nov 2025 07:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 11/11] ld.lld: error: duplicate symbol:
 ntfs_setattr
Message-ID: <202511040600.B94gJtrb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   823d97fda02f76457c2e14196ebe718b9601f40c
commit: 823d97fda02f76457c2e14196ebe718b9601f40c [11/11] ntfsplus: add Kconfig and Makefile
config: riscv-randconfig-001-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040600.B94gJtrb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040600.B94gJtrb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040600.B94gJtrb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: ntfs_setattr
   >>> defined at file.c
   >>>            fs/ntfs3/file.o:(ntfs_setattr) in archive vmlinux.a
   >>> defined at file.c
   >>>            fs/ntfsplus/file.o:(.text+0x8) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: ntfs_getattr
   >>> defined at file.c
   >>>            fs/ntfs3/file.o:(ntfs_getattr) in archive vmlinux.a
   >>> defined at file.c
   >>>            fs/ntfsplus/file.o:(.text+0x28e) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: ntfs_ioctl
   >>> defined at file.c
   >>>            fs/ntfs3/file.o:(ntfs_ioctl) in archive vmlinux.a
   >>> defined at file.c
   >>>            fs/ntfsplus/file.o:(.text+0x34a) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: ntfs_special_inode_operations
   >>> defined at namei.c
   >>>            fs/ntfs3/namei.o:(ntfs_special_inode_operations) in archive vmlinux.a
   >>> defined at file.c
   >>>            fs/ntfsplus/file.o:(.rodata+0x380) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: ntfs_listxattr
   >>> defined at xattr.c
   >>>            fs/ntfs3/xattr.o:(ntfs_listxattr) in archive vmlinux.a
   >>> defined at ea.c
   >>>            fs/ntfsplus/ea.o:(.text+0x810) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: ntfs_xattr_handlers
   >>> defined at xattr.c
   >>>            fs/ntfs3/xattr.o:(ntfs_xattr_handlers) in archive vmlinux.a
   >>> defined at ea.c
   >>>            fs/ntfsplus/ea.o:(.rodata+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
