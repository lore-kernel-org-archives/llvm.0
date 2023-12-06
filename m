Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A98495F0;
	Wed,  6 Dec 2023 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8Bib3IN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701889937; x=1733425937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyn7kQ/YKbbAVIJOWPsCMekPVsyc7HiSXO19E7SObCQ=;
  b=U8Bib3INQT/0E7Jf1tSvMRh8GgoMd1+ZPIKtRSSrQF9YdBXmBYxQk9QW
   ihTpxs7JRxrfs+xrLvgs2t6EocooJA2cO17K1QzbnaITb/iyOPY6j/KSM
   NF1Hr/0jw7Q/wCQ7jTAfj5sewRck9K+RmG9YiFGR+9ui5yk/NiMi2MZH7
   qHMhpKELXlOhuU0THKhR4NpelyydaUEe4fpXRE1ATL0eLALJL+79ntLnX
   hWYY4lHrOcrKPVOvYxYoLI3V2vSzTVd7D0wJtCuuIYYahuKbYPuYQ+cRN
   rGUpF59WaEjI2LKrW9Wf8SiEBbQYcckeJLSD00rUY/yHG+btl42toTA4M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393841153"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="393841153"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 11:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837423406"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="837423406"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2023 11:12:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAxJd-000BJS-1U;
	Wed, 06 Dec 2023 19:12:13 +0000
Date: Thu, 7 Dec 2023 03:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/overflow 2/3] drivers/perf/arm_pmuv3.c:653:3: error: call
 to undeclared function 'write_pmovsset'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202312070310.UwUHziXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/overflow
head:   f3b357f85dad79444f2d0c645833fb947de1e88d
commit: 7ba6f752673580876865a00a76702eb2cea8565f [2/3] arm_pmu: rework overflow handling
config: arm-randconfig-001-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070310.UwUHziXk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070310.UwUHziXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070310.UwUHziXk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm_pmuv3.c:653:3: error: call to undeclared function 'write_pmovsset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   write_pmovsset(BIT(counter));
                   ^
   drivers/perf/arm_pmuv3.c:653:3: note: did you mean 'write_pmovsclr'?
   arch/arm/include/asm/arm_pmuv3.h:180:20: note: 'write_pmovsclr' declared here
   static inline void write_pmovsclr(u32 val)
                      ^
   1 error generated.


vim +/write_pmovsset +653 drivers/perf/arm_pmuv3.c

   646	
   647	static inline void armv8pmu_enable_event_irq(struct perf_event *event)
   648	{
   649		u32 counter = ARMV8_IDX_TO_COUNTER(event->hw.idx);
   650		armv8pmu_enable_intens(BIT(counter));
   651	
   652		if (local64_read(&event->hw.period_left) <= 0) {
 > 653			write_pmovsset(BIT(counter));
   654			isb();
   655		}
   656	}
   657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
