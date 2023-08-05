Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF41FA0;
	Sat,  5 Aug 2023 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691225846; x=1722761846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daZzvfluiBs9yJ+QCZ+QfiTUJiCWR2HuRfhTf5Oie9U=;
  b=BbNKmhlkJ4nviOgZHqdHh2zmd2huYEVPnku1L3aQnRnDNLO11R8rs1Qv
   VHoypwQ4xVk4BYhUEY/neXUk+eKspx0RTn6VDAUYdieQOBHJS7wCbncnS
   6Qu1lD4b2m/3U49BL9/vL+szzi37TImvPmaDJVwZTCKL1vOgw/K6wS3uz
   a3GLJQtPdhZZAF+viiLvbPowPvHUB++sB67D8unHZSGYdsNHFfdYwHeG+
   GM2lmCI4B8r9/ByAGVRCMgARz0huQqg/sJZRBPHjoutCeETPmBqOEKZXM
   ce99U644p3UEhU3ar+PGFeyErWIvIqFz9NNEOwD8mfsPkfzC7U96pMlZ6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373959427"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="373959427"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 01:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733550611"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="733550611"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Aug 2023 01:57:24 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSD6B-0003QB-1V;
	Sat, 05 Aug 2023 08:57:23 +0000
Date: Sat, 5 Aug 2023 16:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 8/8] arch/x86/kernel/cpu/mshyperv.c:583:26:
 error: no member named 'r8' in 'struct pt_regs'
Message-ID: <202308051623.AsakMFiD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   3a5274c555c28bd6906103b0d9bbfd6e9e9df1ff
commit: 3a5274c555c28bd6906103b0d9bbfd6e9e9df1ff [8/8] x86/hyperv: Add hyperv-specific handling for VMMCALL under SEV-ES
config: i386-randconfig-r015-20230731 (https://download.01.org/0day-ci/archive/20230805/202308051623.AsakMFiD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051623.AsakMFiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051623.AsakMFiD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mshyperv.c:583:26: error: no member named 'r8' in 'struct pt_regs'
           ghcb_set_r8(ghcb, regs->r8);
                             ~~~~  ^
   1 error generated.


vim +583 arch/x86/kernel/cpu/mshyperv.c

   577	
   578	static void hv_sev_es_hcall_prepare(struct ghcb *ghcb, struct pt_regs *regs)
   579	{
   580		/* RAX and CPL are already in the GHCB */
   581		ghcb_set_rcx(ghcb, regs->cx);
   582		ghcb_set_rdx(ghcb, regs->dx);
 > 583		ghcb_set_r8(ghcb, regs->r8);
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
