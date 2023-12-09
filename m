Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F707F8;
	Sat,  9 Dec 2023 01:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKrqRR4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702086354; x=1733622354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Vaf5gx74n8FhA9EzwZRq7WzZJkAdCqWsTVXNewQ4ic=;
  b=iKrqRR4wlNhCb0LpLr1FqIxkg6EDzDZqpMsC4VpfQQkm78xN/8aYw55T
   BwY9w45e2ICNqF30O5UZ8YI8Iz5IWVHHiXyAzD1Uo3uTSRr1arPnhOCLf
   Jh9uenqLx6wCMVHxzt2g55HG6OLp1rJvrbSTvJS27DhC0jJuXqn0JrXJ3
   zmjbsNDeG9eXCieb/v1H1fU+kg+gxrGbC3j7h5WjM6Qh/k+4qRg5GGFaF
   rkxLi0LBAHN7DowOacBj5uQnB/6d5Slf2BjhTTt1s6CIRHYezCe8WSdA7
   LLvHuT6BolA8NQQSy6hxKB7EfqU0xgbkUx07FukW8IrVytWxQlNkXowyJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1305748"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1305748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 17:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="13676925"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2023 17:45:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBmPV-000EfG-0A;
	Sat, 09 Dec 2023 01:45:41 +0000
Date: Sat, 9 Dec 2023 09:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [linux-next:master 4096/6165] ld.lld: error: undefined symbol:
 auxiliary_device_init
Message-ID: <202312090903.MPKQWRgF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
commit: c5d296bad640b190c52ef7508114d70e971a4bba [4096/6165] usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
config: x86_64-randconfig-002-20231209 (https://download.01.org/0day-ci/archive/20231209/202312090903.MPKQWRgF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090903.MPKQWRgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090903.MPKQWRgF-lkp@intel.com/

Note: the linux-next/master HEAD bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: auxiliary_device_init
   >>> referenced by aux-bridge.c:63 (drivers/gpu/drm/bridge/aux-bridge.c:63)
   >>>               vmlinux.o:(drm_aux_bridge_register)
--
>> ld.lld: error: undefined symbol: __auxiliary_device_add
   >>> referenced by aux-bridge.c:70 (drivers/gpu/drm/bridge/aux-bridge.c:70)
   >>>               vmlinux.o:(drm_aux_bridge_register)
--
>> ld.lld: error: undefined symbol: __auxiliary_driver_register
   >>> referenced by aux-bridge.c:136 (drivers/gpu/drm/bridge/aux-bridge.c:136)
   >>>               vmlinux.o:(drm_aux_bridge_drv_init)
--
>> ld.lld: error: undefined symbol: auxiliary_driver_unregister
   >>> referenced by aux-bridge.c:136 (drivers/gpu/drm/bridge/aux-bridge.c:136)
   >>>               vmlinux.o:(drm_aux_bridge_drv_exit)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
   Selected by [y]:
   - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
