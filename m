Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875E9DDAB;
	Wed,  3 Dec 2025 01:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764724622; cv=none; b=iJdsD6w8r6RdrEqSi2OYoEUPt1rFrMsjZf3QYG6gWhZ51D/wFFcH6nH0uMV8y1fHhaaSX6Ninw5LaKjxxMQP2yZAPf1Pxm49xqKLyvB7/tNUu1EnlMKHBfu6BaI9MHYzmMS8ZXO+HkJlZgYrIBDq+oj9RKr3r2V8F0aZcYLJsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764724622; c=relaxed/simple;
	bh=MLYxDX/3fNdtrknl7370CzhghL682Ko9AD2VBiMczLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4jK+i6wS4yHEgz8aRyaGP/8MZ8X5I6Jodibf4Ww0HEcrRS2IVvzNeZYSUvI+tX1Ja2URUReypQTB4Apa0ypvZbaEdaP0DoEIq0A0bfHGDcB7GYr8Jf6tpNL9cZRq/5yWJ7o64W0MpV5jCWVU7J19NjP4WvmgKDMGrW8YAEfVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvhYZe9G; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvhYZe9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764724621; x=1796260621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLYxDX/3fNdtrknl7370CzhghL682Ko9AD2VBiMczLE=;
  b=AvhYZe9G4mo/eceRA/djVqhp473SVSnPnJJW1GUuVa2Iyg0PucH2E7Xu
   fdPG6z7dfDuwk5+5zLt9S7Uovq7ykranrX4CACXo3MhSO2jYIh+L7slhq
   xDS5Zk+purAz3kI6Z8uV5KlUPohR7JflZEcsfgPHh87HF9cn0LAfDVD6d
   oMGRH0GQzYwr6pKpJccgeGWNCGGaJGeY/qjiLFwhRrgFGas6G/Znc2Nig
   VHDEFR7ETsr8XxqbTnrkDmSS1vy78jEhHdg3j1c6irEWLneWdkafY12Tm
   31UF/7hp4ZYVNyWoieBA4lWTCwAVkgOGhUTf4huD705dzP1//oNZilnIB
   w==;
X-CSE-ConnectionGUID: mhN0N9T0TOuFY1acvXa4kw==
X-CSE-MsgGUID: O5ezjdtPQs67TqiN49xYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66750484"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66750484"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 17:17:01 -0800
X-CSE-ConnectionGUID: oJYxlz7LTLabY3IcnAdJ8w==
X-CSE-MsgGUID: g9Gyj+W9Q965i/Hkh8N+pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="199014498"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 17:16:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQbUG-00000000AMF-1trT;
	Wed, 03 Dec 2025 01:16:56 +0000
Date: Wed, 3 Dec 2025 09:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [linux-next:master 12337/13055] drivers/vfio/pci/xe/main.c:555:2:
 error: call to undeclared function 'INTEL_WCL_IDS'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202512030951.SoXeWc1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 2e38c50ae4929f0b954fee69d428db7121452867 [12337/13055] vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251203/202512030951.SoXeWc1k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030951.SoXeWc1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030951.SoXeWc1k-lkp@intel.com/

Note: the linux-next/master HEAD 47b7b5e32bb7264b51b89186043e1ada4090b558 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/xe/main.c:555:2: error: call to undeclared function 'INTEL_WCL_IDS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     555 |         INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
         |         ^
   drivers/vfio/pci/xe/main.c:555:16: error: use of undeclared identifier 'INTEL_PCI_VFIO_DEVICE'
     555 |         INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
         |                       ^
>> drivers/vfio/pci/xe/main.c:559:1: error: definition of variable with array type needs an explicit size or an initializer
     559 | MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
         | ^
   include/linux/module.h:261:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
     261 | static typeof(name) __mod_device_table(type, name)                      \
         |                     ^
   include/linux/module.h:253:2: note: expanded from macro '__mod_device_table'
     253 |         __PASTE(__mod_device_table__,   \
         |         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:152:1: note: expanded from here
     152 | __mod_device_table__kmod_xe_vfio_pci__pci__xe_vfio_pci_table
         | ^
   3 errors generated.


vim +/INTEL_WCL_IDS +555 drivers/vfio/pci/xe/main.c

   552	
   553	static const struct pci_device_id xe_vfio_pci_table[] = {
   554		INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
 > 555		INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
   556		INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
   557		{}
   558	};
 > 559	MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
