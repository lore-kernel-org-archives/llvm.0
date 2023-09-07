Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405713AC1;
	Thu,  7 Sep 2023 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694124971; x=1725660971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4b4lyxIV/a+GwUu9bLZLE7kHovIKqrEIgLWgm2AvXzw=;
  b=gnpgYhs+WXcyW5vcStU/0GvZi7RdC6Drv/tkWvlShUcAMWo+GV0II1Az
   dGwHzeLv+Fj9CkaWXnuuT1GIMr6m6YQrSzuhfCNudTIXTazNxbuicTpOo
   zzEJmVwJ+gIUNfMicMmPkzSeG6UH7Vz8VAOLYZlqXJ0cCkHWFIZjx1ZuI
   /VFaY5Q4qM+4QLod8ftvCu7xwVJ5n4k4S8BS/OJITtI6JcTTfGU5FFqGR
   z5BIpPDxBeVGmo620JPSZGxTKsr1djEnwFyy4cyH5eohBIX52pZ9FdJ2o
   5z5yT260RzM9JO/oWTtSOzfrmGsxyHu9dIdojDFxdQHYC4S/wv1LVIkoH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362553520"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="362553520"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 15:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="735693008"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="735693008"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Sep 2023 15:15:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeNHg-0001dT-1G;
	Thu, 07 Sep 2023 22:15:32 +0000
Date: Fri, 8 Sep 2023 06:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-ia64@vger.kernel.org
Subject: [aegl:resctrl2_v65 3/4] fs/resctrl2/arch/x86/amd_smba.c:243:32:
 warning: unused variable 'smba_feature'
Message-ID: <202309080600.4w3asiAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_v65
head:   13c888afbee9f7da0a4a969617dea9889da9d711
commit: 75c85a7905a138996d3d1309cc87798db5979de0 [3/4] resctrl2: AMD Slow Memory Bandwidth Allocation
config: x86_64-randconfig-r011-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080600.4w3asiAW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080600.4w3asiAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080600.4w3asiAW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl2/arch/x86/amd_smba.c:243:32: warning: unused variable 'smba_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id smba_feature[] = {
                                  ^
   1 warning generated.


vim +/smba_feature +243 fs/resctrl2/arch/x86/amd_smba.c

   242	
 > 243	static const struct x86_cpu_id smba_feature[] = {
   244		X86_MATCH_FEATURE(X86_FEATURE_SMBA, 0),
   245		{ },
   246	};
   247	MODULE_DEVICE_TABLE(x86cpu, smba_feature);
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
