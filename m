Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A415B5;
	Wed, 23 Aug 2023 02:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692757372; x=1724293372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zUVVxQQqoWa9xgcpsVmq6jZEMao8ZF1XFIFFPegnBjk=;
  b=Yb098f0KrVwDyv7m83oD0NFjbWyurqnHRdzxZ4gKf8m6ESAQJ7su3B6U
   QjBMcnhkAUR0E0qm1jjKPM2fTpDvQIuoCqOT1iXcDv7zt28cGP0nIPmZB
   uLAcd8PiljY0hl3RPpflvfyQAuVvInufoF4jgT2xmwy6wzK6yAlUN2Ks9
   mbaM9dqEhLj2HCypuIe5Lfuk31PsRkSLL0XNiswgot9SflpOPR0p+APTJ
   /L1FUcBVPo9SdeCNDOAQNZmCEt04rxVe7lvrOs0EC9stdqZJ218D2ycqW
   gwDyjG6fEf9suAIJBREwbo3HhkCgZ4A7bzHrUbSFsWDxIk4t7kgh/JMTW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="353600323"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="353600323"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 19:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="736463528"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="736463528"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Aug 2023 19:22:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYdWA-0000ku-0K;
	Wed, 23 Aug 2023 02:22:46 +0000
Date: Wed, 23 Aug 2023 10:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-hans 69/76]
 drivers/platform/x86/mlx-platform.c:6484:36: warning: unused variable
 'mlxplat_acpi_table'
Message-ID: <202308231011.pa9xg8sF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   96ed86ea9042b105f7a4cf311e6a6f7e220820ed
commit: e2185e8f37ef41517778b6f4d58815c7a27e85cc [69/76] platform: mellanox: mlx-platform: Introduce ACPI init flow
config: x86_64-buildonly-randconfig-004-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231011.pa9xg8sF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231011.pa9xg8sF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231011.pa9xg8sF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/mlx-platform.c:6484:36: warning: unused variable 'mlxplat_acpi_table' [-Wunused-const-variable]
   static const struct acpi_device_id mlxplat_acpi_table[] = {
                                      ^
   1 warning generated.


vim +/mlxplat_acpi_table +6484 drivers/platform/x86/mlx-platform.c

  6483	
> 6484	static const struct acpi_device_id mlxplat_acpi_table[] = {
  6485		{ "MLNXBF49", 0 },
  6486		{}
  6487	};
  6488	MODULE_DEVICE_TABLE(acpi, mlxplat_acpi_table);
  6489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
