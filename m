Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1931A63A9;
	Wed, 15 Jan 2025 01:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736902886; cv=none; b=uh2j+kuc0XPuoBd6S43c+ZPIUbvtrMqxmvOkmgu9oo+d2HW5oYDXkTTKb6cV7/4T2wVOI8DuOvoWEBORQrmOLBYrcU4rtmQKChScI46I18hGt1FtBASnqKikl9lCGNmfiLuls2YvuWGhC0yKvJlrBaQbn6NX1oyJWMAsAUBKolI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736902886; c=relaxed/simple;
	bh=GC5kqXpiPPHlUkljBXkFPKUgNYKp9H2Vuz12foOZBJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWOle8bZKm3fPqt2nZhv4KIgm2mDdFUgRk2LYm4VXpRwjGswdYu+7BVVfPopVM4u01Eu3ef0dErTJLyP38GZY7f/HtYnUtErhADc31LwHsOKs1MsFzEKIIq3uEygZQCCCVLx41LXpTasE3QgzuoTbwttuf2RvJ0IH/DKKo2asLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoTflGGX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoTflGGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736902885; x=1768438885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GC5kqXpiPPHlUkljBXkFPKUgNYKp9H2Vuz12foOZBJs=;
  b=VoTflGGX6VxPbuwi788S63gDoSpHgc5CP3H/v+8wiMwb5bXiNhSSwAC7
   rCF2QJlgeTSXaXQJlPCmdFhkgcG3fpWp4Vz9zQxpKiQT9wk7DR2wpIUTX
   HSJOKGTRK3WCjoA5XIvfM1SPnCZDASdnSkwx+6DCmlqvdVe92G+twEjb+
   IEhk5a54SN7Jdzfh4E8GyYGoVu2vn/jknR5EANUQZvE460BGisy0zciLX
   MwPFlygbMJGnnUczNAh5IthF70SmyTIQsCU1y1qtKzEgJAlXlks2RY+dl
   xKgGzxZqfc2rCjP10ZXP13QVxk2rPMfmgR+ks6JEd2GTiuANFm4EQgaK5
   A==;
X-CSE-ConnectionGUID: Lff5DGs+R/OuG/XMn8iQxA==
X-CSE-MsgGUID: QoPAwrQaR7K/AqUT3+a1WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36918726"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="36918726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:01:25 -0800
X-CSE-ConnectionGUID: uWstmVRBQBW0JbNwz6mnng==
X-CSE-MsgGUID: NbBgi4TgSm2qv715CSSHJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="105055347"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2025 17:01:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXrmZ-000PFZ-30;
	Wed, 15 Jan 2025 01:01:19 +0000
Date: Wed, 15 Jan 2025 09:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 331/504] ERROR: modpost: "ulpi_write"
 [drivers/usb/dwc3/dwc3.ko] undefined!
Message-ID: <202501150809.Id0SsfQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   816b29d4609d74a6a2e3290af1ef0061f2976e6c
commit: ba5e49ae789e8f4cf738103c73ca1bd9952c6e7c [331/504] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: x86_64-buildonly-randconfig-006-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150809.Id0SsfQS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150809.Id0SsfQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150809.Id0SsfQS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "ulpi_write" [drivers/usb/dwc3/dwc3.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
