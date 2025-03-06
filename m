Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6A1362;
	Thu,  6 Mar 2025 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741242263; cv=none; b=WmLnXOoTlWBTtiErQfh3cvEuWMh7WqPaPe/fgM13mCgPjGKtNlrMAVqfpq7sAJex/+bCPDpOJHf0X26hrHPRFszp5F8+gg7sJ0hOqTweM2n7nNN4m76SnCWNPKk6WFEr2s1/kxJEODVgQChFLWpWxG/Deve3mxr0uuCSjv9LcsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741242263; c=relaxed/simple;
	bh=VMqR5wSuecyxCUNcfNDXFVK7cRxAQR0NMycu8BrK/ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdVkjp8BeUWWSHjbJwS5gKtvGi6wfFudkooWO/7dyqVETDQJLFp3HHQmggLmfX9IX7GoQIYpxn5reh9zLF5m0TfAh56oIyA7UYBt9Sff4hBl9CXkB+rP9RCvFPSt7PRyGXG15mm7Uf9rvH2I+Do9TsrwtOSeOErr9JFPp8+/EQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ga/4fCaQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ga/4fCaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741242262; x=1772778262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMqR5wSuecyxCUNcfNDXFVK7cRxAQR0NMycu8BrK/ec=;
  b=ga/4fCaQJknXxMc2BPWUgbAUiwHt0qvhCWmy75Dcs6EdEfdppMjHOzWR
   1i4GPpJ3AeX9RhQzn+6lesP8LEmES3RNTeVPsq32+A5kIiaiMAAKuYkft
   ubiIR3CclavDgMD4WvSGt403mfqYvobTuMY4iuJuycZUnpBAmOwybs2UY
   fRXPqU4FDbILbd6JnPnjN2wK0swfNXkyksQrZw+AhW6W3tqkZpBWGfloo
   ALhtEEucNDMPRF+dSBto2IfFiuO2VnctB3Hk8XxNXJVy/HyxKkXy5KD21
   +Rh/Yv6MewdYYYtU2siM4rzT2k3ezeTjWJayf6rbwCuPgC7V0D8Oyw3Aa
   g==;
X-CSE-ConnectionGUID: 4hZdKbhcR2KdOHR/zu/Wgw==
X-CSE-MsgGUID: Ni5NWubfSTSRL8J19Rnftg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29822331"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="29822331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 22:24:22 -0800
X-CSE-ConnectionGUID: I+UmkSV7Rm2zsrG2X10UkQ==
X-CSE-MsgGUID: 1jGBBUwKRoqYxmzbwnBonA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="118728627"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2025 22:24:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq4eY-000Mco-1y;
	Thu, 06 Mar 2025 06:24:18 +0000
Date: Thu, 6 Mar 2025 14:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/scx-dlserver-boost 7/7] ld.lld: error: undefined
 symbol: ext_server_init
Message-ID: <202503061435.RrUQMfco-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   bac6d97ec2be6650f81c945564fcb76669ef4251
commit: bac6d97ec2be6650f81c945564fcb76669ef4251 [7/7] Add a DL server for sched_ext tasks
config: x86_64-buildonly-randconfig-004-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061435.RrUQMfco-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061435.RrUQMfco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061435.RrUQMfco-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ext_server_init
   >>> referenced by core.c:8620 (kernel/sched/core.c:8620)
   >>>               vmlinux.o:(sched_init)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
