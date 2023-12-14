Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5C1EB55;
	Thu, 14 Dec 2023 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AD4tro6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702555662; x=1734091662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ze5IBXIP01BTnm8/V6iaukToTzI2L0r+CCiP+rUdP+0=;
  b=AD4tro6OlUmu/M+zAIG7iH9rtC1CNMeimGk7m4bspxJglOK24znYaLQO
   mnNOsE5ZOOi2/BdolU3PijS15tnNCkorOwHk/Yd/FS9Hc7jnNhGcPKVMt
   PL7YG/qfPJz+krLPN0KpHpGOXaTnWXoobiFNTsdt3y0h2SJ1KY76bMJlB
   xip6hwrgkyKjL9lfttSYCm6SWq63lz3EjJe+sIV1OJgR+YPLhEf2wxBlK
   qot+XlXYVr8vA/HfT4GS3Vm/mQAVOQWFIN3kvHIhqMD6sUk/dkNCoLluF
   cxzaOQcb1p8sKSls7jraA20hOucuMHYZp0R70Uz9TQ36Rh9pq4CZ47Tps
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="374617401"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="374617401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 04:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774350345"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="774350345"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Dec 2023 04:07:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDkV8-000M1r-14;
	Thu, 14 Dec 2023 12:07:38 +0000
Date: Thu, 14 Dec 2023 20:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-2023-12-13 8/9] include/linux/cxl-event.h:150:76:
 warning: non-void function does not return a value
Message-ID: <202312142030.cDyPhCew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-2023-12-13
head:   effd1d38713375ee60e89f1bef31eea1ba668304
commit: 3394ce85e912b328886077c5a439c65284767bb8 [8/9] firmware/efi: Process CXL Component Events
config: i386-randconfig-011-20231214 (https://download.01.org/0day-ci/archive/20231214/202312142030.cDyPhCew-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142030.cDyPhCew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142030.cDyPhCew-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/core/regs.c:7:
   In file included from drivers/cxl/cxlmem.h:9:
>> include/linux/cxl-event.h:150:76: warning: non-void function does not return a value [-Wreturn-type]
   static inline int cxl_cper_register_notifier(cxl_cper_notifier notifier) { }
                                                                              ^
   include/linux/cxl-event.h:151:78: warning: non-void function does not return a value [-Wreturn-type]
   static inline int cxl_cper_unregister_notifier(cxl_cper_notifier notifier) { }
                                                                                ^
   2 warnings generated.


vim +150 include/linux/cxl-event.h

   142	
   143	typedef void (*cxl_cper_notifier)(enum cxl_event_type type,
   144					  struct cxl_cper_event_rec *rec);
   145	
   146	#ifdef CONFIG_UEFI_CPER
   147	int cxl_cper_register_notifier(cxl_cper_notifier notifier);
   148	int cxl_cper_unregister_notifier(cxl_cper_notifier notifier);
   149	#else
 > 150	static inline int cxl_cper_register_notifier(cxl_cper_notifier notifier) { }
   151	static inline int cxl_cper_unregister_notifier(cxl_cper_notifier notifier) { }
   152	#endif
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
