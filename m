Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A42F13AA2F;
	Wed, 15 Jan 2025 02:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736908598; cv=none; b=sfwle3++X9JXcwZ/BDy7Mg90GMco4SgCOysgVzfHXx+sdS1jn/DOG9AwClI/zw2J4+qTUmdRgm3LRMFfSrdIWoPXdf69mU44x5bssZRA+tdHsDP5JEQVG7k8ZP+PpSWCtxzSEa5nGkCSDRNg+4w/cwtyoRhlv/WJQIoZgf8yPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736908598; c=relaxed/simple;
	bh=PB75WLOE7w+/FRjSy1KFWk/24RfWKojRwtG8o7vKSnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CoLI7B0jSkzaydrbIbYLdoUK5qpde8nJscpEtMR0NUNwshKnT+jHzo4549QjiPqUzZWe+ePQlh6LHyheoyCxPD/RHpLPHnW0Tt19qpBgwgooyyQLka3sgoTDjT1m1km5vU1zSIlqfsCaprPjkfMD5UixxntNGVYLwJDRkn0uxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4xfopmy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4xfopmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736908597; x=1768444597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PB75WLOE7w+/FRjSy1KFWk/24RfWKojRwtG8o7vKSnQ=;
  b=Y4xfopmyhZ/D7Vp+woUU+38cxmYEdPBP2PI5qGogt+n9Cm/dFqjoL2YT
   T2c0FDqWbcwPZa32H5Ts0SvJYLceRbvJvB+EUyLpKShvjKXy7nZ/fyqNa
   8UYB0rhz1xXmLNyCe1ymITREUOr3B9YbZO+sFTPj2j8M9GIlACrJZFr+a
   JAOiujzL3ERObIFeRSPqU63tRAFibpcemFOVWkMx5eBkzl0X4ivPiFZGJ
   fz0QjVR+pf/aO+rU0z7eb4t4qCgt6UyrN1KXcAjsi0jWTUGbv0AVtGf9f
   KihTjGQlo+wCxk75Oo14QT74OOfhR9PodGFV1SDXQozurHJC/u5aRPyXC
   w==;
X-CSE-ConnectionGUID: KHsvF794SueSwFGAOo9klA==
X-CSE-MsgGUID: IaLaYNHQQvq8T2qI3RR9yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="41166572"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="41166572"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 18:36:36 -0800
X-CSE-ConnectionGUID: HdH7FbAaQ1iM3J/bEbAd7g==
X-CSE-MsgGUID: Fj+3LovjRba8Ux2fQwB43A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="109951253"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jan 2025 18:36:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXtGi-000PK9-2b;
	Wed, 15 Jan 2025 02:36:32 +0000
Date: Wed, 15 Jan 2025 10:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 331/503] ld.lld: error: undefined symbol:
 ulpi_write
Message-ID: <202501151038.bxIRLNf2-lkp@intel.com>
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
commit: d2979f2d14e0711384fca4ca5ae81afc00171254 [331/503] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: i386-buildonly-randconfig-006-20250114 (https://download.01.org/0day-ci/archive/20250115/202501151038.bxIRLNf2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501151038.bxIRLNf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151038.bxIRLNf2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ulpi_write
   >>> referenced by core.c:2526 (drivers/usb/dwc3/core.c:2526)
   >>>               drivers/usb/dwc3/core.o:(dwc3_suspend_common) in archive vmlinux.a
   >>> referenced by core.c:2612 (drivers/usb/dwc3/core.c:2612)
   >>>               drivers/usb/dwc3/core.o:(dwc3_resume_common) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
