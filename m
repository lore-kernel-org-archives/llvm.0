Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9A1CCCC;
	Sat, 12 Aug 2023 21:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691875826; x=1723411826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Knkcmt8dTVrq8tl7N9v/v3k4Vq5sQ8tVkqMab9ylok=;
  b=UP86eUyt1LMgJ5+A0PO0ojzbJu7sUNIXl95LBp1bgYka2m5ov8BY41Le
   fDqAdYHGBpybO6XMPMTCYK4xVoEXgxMUAfTnJT+uoygBsYGtzCP7Zj7Jx
   gTlXn6yDepY2ufx13pVznIMA7HCMh5fyoU7JqJD8Vg67VzxWVB94JowMv
   R5WM1idnXO2eSjnoNz+w/0MX99FTDgj8vLhCZY5GI7J5ep9hwG2CQhQ/y
   Wmxf9V+nWJGfV2yVIhu2l8oIQ4Sh2gcmYwVWCnVYpViYQBviLiZTK5HHT
   iYQXEIMOysdFPvmrdITbqE9NPHcqeMCzw3A2nQ2EOnQGegw6SbJliysLx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="370751182"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="370751182"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 14:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="768017118"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="768017118"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Aug 2023 14:30:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUwBi-0008nE-35;
	Sat, 12 Aug 2023 21:30:22 +0000
Date: Sun, 13 Aug 2023 05:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 10/20] arch/x86/kernel/sev.c:185:30: warning: no
 previous prototype for function 'sev_snp_current_doorbell_page'
Message-ID: <202308130530.BrX4dW2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   a8a44aa58e6c9eac7cdbb142e11b3ac894404756
commit: 65f17da72a5e7625d2cb608eabf084e53f9286dc [10/20] x86/sev: Add AMD sev-snp enlightened guest support on hyperv
config: x86_64-randconfig-x002-20230812 (https://download.01.org/0day-ci/archive/20230813/202308130530.BrX4dW2r-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130530.BrX4dW2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130530.BrX4dW2r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/sev.c:185:30: warning: no previous prototype for function 'sev_snp_current_doorbell_page' [-Wmissing-prototypes]
   struct sev_hv_doorbell_page *sev_snp_current_doorbell_page(void)
                                ^
   arch/x86/kernel/sev.c:185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sev_hv_doorbell_page *sev_snp_current_doorbell_page(void)
   ^
   static 
   arch/x86/kernel/sev.c:237:4: error: call to undeclared function 'sysvec_irq_move_cleanup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           sysvec_irq_move_cleanup(regs);
                           ^
   arch/x86/kernel/sev.c:284:37: error: use of undeclared identifier 'vector'
                                   panic("Unexpected vector %d\n", vector);
                                                                   ^
   arch/x86/kernel/sev.c:413:30: warning: variable 'data' set but not used [-Wunused-but-set-variable]
           struct sev_es_runtime_data *data;
                                       ^
   2 warnings and 2 errors generated.


vim +/sev_snp_current_doorbell_page +185 arch/x86/kernel/sev.c

   184	
 > 185	struct sev_hv_doorbell_page *sev_snp_current_doorbell_page(void)
   186	{
   187		return &this_cpu_read(snp_runtime_data)->hv_doorbell_page;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
