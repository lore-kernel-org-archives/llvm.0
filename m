Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12BEC121;
	Wed, 23 Aug 2023 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692801485; x=1724337485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AMfIFq3CL/uGqPecJ3axZwqIc70e3d3WMpMZjzwXeLc=;
  b=PGl6cilV0oWjMopDsfbTunYGe339IDmwJfsMWOsBPPTUxFJlvx2MJUbh
   mWTnBjJ/Vrm6XApjwiSi1XYCfKu19qbGwOPJ5pM4dhKHQtKKWkqP67Joz
   5Aojdr5dFhTh/fYdZmrnrAyM8hQh0PiWNZFLeky+ewGBAfBhFbIWvGLOd
   DTy7eOUgApcEYsunHR1zhCl1WJ9uTZun+22HjBKTvkX3Qo0pUwonK1MAs
   jd6NUoV96DpkGVLYLaEkTMptfZEzcxVyuDM3xnCkRa1PcDaEzc3u+Q1YL
   b2bgb3/H4OdHgj8rtajMv0s+yMjVYSnHCcv++toGGrxZJhNrZETCR4h51
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377935522"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377935522"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 07:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730232684"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730232684"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 07:38:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYozj-0001He-0C;
	Wed, 23 Aug 2023 14:38:03 +0000
Date: Wed, 23 Aug 2023 22:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Huang Rui <ray.huang@amd.com>
Subject: [rui:upstream-for-pvh 2/8] include/xen/acpi.h:77:1: error: non-void
 function does not return a value
Message-ID: <202308232246.wtsaPVHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git upstream-for-pvh
head:   9f90729631a5322ef1c05c9654487fab82b71462
commit: 64cd1635a0c13a4fb8ca39a5a7aef75c943a81bf [2/8] xen/pvh: Map pirq for passthrough device on PVH dom0
config: x86_64-randconfig-r003-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232246.wtsaPVHk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232246.wtsaPVHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232246.wtsaPVHk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/pci_stub.c:23:
>> include/xen/acpi.h:77:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +77 include/xen/acpi.h

    58	
    59	static inline void xen_acpi_sleep_register(void)
    60	{
    61		if (xen_initial_domain()) {
    62			acpi_os_set_prepare_sleep(
    63				&xen_acpi_notify_hypervisor_sleep);
    64			acpi_os_set_prepare_extended_sleep(
    65				&xen_acpi_notify_hypervisor_extended_sleep);
    66	
    67			acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
    68		}
    69	}
    70	int xen_pvh_passthrough_gsi(struct pci_dev *dev);
    71	#else
    72	static inline void xen_acpi_sleep_register(void)
    73	{
    74	}
    75	static inline int xen_pvh_passthrough_gsi(struct pci_dev *dev)
    76	{
  > 77	}
    78	#endif
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
