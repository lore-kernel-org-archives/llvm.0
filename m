Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03004ADDB1;
	Thu, 11 Jun 2026 18:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201665; cv=none; b=J81KinZnXGMIOrocmY1tlFSaaVPKqw+Z2jrEMZa6gDi8ehufKgUdEciVo0wBVKRIWC94spxSnOAoKEz7rl5TLUVw+1s3DM0HEVvG6XOEP6AbV9qsqbM3ZwD3IEbCDqkZPjh39kMp2vDvuQU4EGqPEUund7TO14WgNrxbQ0MGTPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201665; c=relaxed/simple;
	bh=5NaNkXMxeTVuncMtZJRv8HCHV83M6xaKqTseLXL1sEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jQu06nc0BE4bXWLPQIenQLiqZ29N3/7ELk099uj3O8WvvyYDbi12Z3sTcToe15wgrWYApcUl0OCFbFLrXAQugNkb5yF5/zHSpUtHHmJ2H2M4GjQfUHxEY2GSrITIisnmk8ki2d0/6fl3cjxdy3x6tzcuYItK64fDDNDGj3HjvR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuHYrJ7g; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuHYrJ7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781201661; x=1812737661;
  h=date:from:to:cc:subject:message-id;
  bh=5NaNkXMxeTVuncMtZJRv8HCHV83M6xaKqTseLXL1sEY=;
  b=VuHYrJ7gR6HuarhXslMWQE9WuMQi1mwRaiaDAM5MoXtitxeG6+kscsJ2
   IfZ5tVIT69nyMBupbytWMP31JW5/eT337ZNdrirw6XP2uttNWmfFvlyew
   /STF1Kk1qW9gLbnDaMQI4zgVuUUpNmPEU7yM8bTp5jD+d7gbg7lJhj60F
   IRtU+36Fp/SNZbq40GDtRcl3cZt5BHpJjvupKmebv3q+5gS7gscZGoTjB
   OqaLtreR4E9V440aE12/P4ZIogV/P5HZSqJMkVgy8V1D0uzzSX2KOehj2
   152pdKAcaLO5f6oFxiLnE2mianNMO3EeECv+wZLDj4yV6SvflU1o8kFc7
   Q==;
X-CSE-ConnectionGUID: Tj2lQk3zQ5Wtxr1Fq0qONw==
X-CSE-MsgGUID: HLgPRxtxSHSYB1wkmGp5pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99446010"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99446010"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:14:21 -0700
X-CSE-ConnectionGUID: GN6Ax1eMSue9NyogvV0U0w==
X-CSE-MsgGUID: +SqQDROHQueSBXj82C91JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270225437"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 11:14:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXjuy-00000000Ndq-2frj;
	Thu, 11 Jun 2026 18:14:16 +0000
Date: Fri, 12 Jun 2026 02:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Warning: drivers/usb/misc/usbio.c:117 struct member
 'nr_i2c_buses' not described in 'usbio_device'
Message-ID: <202606120202.S3B5c4hl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Israel,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 121a0f839dbb397af5fabb701cea3e9983223e50 usb: misc: Add Intel USBIO bridge driver
date:   9 months ago
config: x86_64-randconfig-072-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120202.S3B5c4hl-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120202.S3B5c4hl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120202.S3B5c4hl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/misc/usbio.c:117 struct member 'nr_i2c_buses' not described in 'usbio_device'
   Warning: drivers/usb/misc/usbio.c:117 struct member 'i2cs' not described in 'usbio_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
