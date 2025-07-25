Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EFE2EAD06;
	Fri, 25 Jul 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454499; cv=none; b=Ar1EwX4zgCa7/SyqN4jCMsK82lgWWNwkTKImnoiasE8z2MVVj5QmZMPWzARdOuvmTZtUnOgp0m8v9bGDM1NaqXvUOTDCiHMpuwpJGRimvAkoJvgvNkiA6O2ux+ZXE2akQtXz8Qqonfi1q3ES1uRwWXw/oHuI6k+KfmP0sFAIG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454499; c=relaxed/simple;
	bh=zxqNZoD65D5FEUVj5H8lz7BfvSm4D0uBgGBLul7vaFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZfaMNNfAvPejHwaY+w9qMqkoNhNvk5/TYUEZY+3vZB4TBSCf2S7CuaRDOTAMTWVzHJAcVGVs14OvHC7qcG10tSmygkQnAoZu9jm6/z5N7USPTuokmOsDRZmUEPEVbLkwxUeB7kK6nuEdRqTjWpLpC3NOBoKh41JWuwh7lX8Mle8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBfF2gG0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBfF2gG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753454498; x=1784990498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxqNZoD65D5FEUVj5H8lz7BfvSm4D0uBgGBLul7vaFk=;
  b=jBfF2gG07oJY/8UDSTv22b+mMy54zyoJCguauzA+fV9W0QM9UPgLplFW
   8FynVTPJiZwG8PZ1yRUNkf0Uj9zFQoNatm9HALzyYhMjo2jV1m/nOuRjP
   hSQeDVy/NvUrCIRVaqQFQCuIdTBetUZcob7zk7a/mGWJNjGEmjtNIXRnW
   zm6YAvjn/pkVvCSixWS7HZc7ypO3oD9PyKlFPkgo4W7gWFuwXalh8ILG+
   q44lk3p7j4rMrykEMC7yeAlZ/RYYDYQaD4znTniCO+Vygny0FAWK2fBaF
   grPYeErob6/GCsa06KDjyG3xwM6nwQD1XAkTA9pOuRzIsT/fnkIWn1ggT
   Q==;
X-CSE-ConnectionGUID: VZxfAxwIS12N+RmslhULEA==
X-CSE-MsgGUID: TaPKhi1eRzGV049JXHxb3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="66359943"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66359943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 07:41:36 -0700
X-CSE-ConnectionGUID: SJZaR0dzTV2tZ3SXfg4DJg==
X-CSE-MsgGUID: 4MBOpP4jS4ClwiIMbA6gEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161288071"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Jul 2025 07:41:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufJc4-000LMx-1w;
	Fri, 25 Jul 2025 14:41:32 +0000
Date: Fri, 25 Jul 2025 22:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v2 5/6] drivers/accel/ethos/ethos_job.c:274:12: error:
 call to undeclared function 'FIELD_GET'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202507252225.ncNAG0Oa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v2
head:   266bf4a44880c642834f9845da0f333518302046
commit: 2c820216b368dd70d8d895d15626d90653232e79 [5/6] ethos: Increase the job timeout and don't reset if still running
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250725/202507252225.ncNAG0Oa-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507252225.ncNAG0Oa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507252225.ncNAG0Oa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/ethos/ethos_job.c:274:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     274 |         running = FIELD_GET(STATUS_STATE_RUNNING, readl_relaxed(dev->regs + NPU_REG_STATUS));
         |                   ^
   1 error generated.


vim +/FIELD_GET +274 drivers/accel/ethos/ethos_job.c

   268	
   269	static enum drm_gpu_sched_stat ethos_job_timedout(struct drm_sched_job *bad)
   270	{
   271		struct ethos_device *dev = to_ethos_job(bad)->dev;
   272		u32 running;
   273	
 > 274		running = FIELD_GET(STATUS_STATE_RUNNING, readl_relaxed(dev->regs + NPU_REG_STATUS));
   275		if (running)
   276			return DRM_GPU_SCHED_STAT_NOMINAL;
   277	
   278		drm_sched_stop(&dev->sched, bad);
   279	
   280		dev_err(dev->base.dev, "NPU sched timed out - cmdstream offset: 0x%x\n",
   281			readl_relaxed(dev->regs + NPU_REG_QREAD));
   282	
   283		/*
   284		 * Remaining interrupts have been handled, but we might still have
   285		 * stuck jobs. Let's make sure the PM counters stay balanced by
   286		 * manually calling pm_runtime_put_noidle().
   287		 */
   288		scoped_guard(mutex, &dev->job_lock) {
   289			if (dev->in_flight_job)
   290				pm_runtime_put_noidle(dev->base.dev);
   291	
   292			dev->in_flight_job = NULL;
   293		}
   294	
   295		/* Proceed with reset now. */
   296		pm_runtime_force_suspend(dev->base.dev);
   297		pm_runtime_force_resume(dev->base.dev);
   298	
   299		/* Restart the scheduler */
   300		drm_sched_start(&dev->sched, 0);
   301	
   302		return DRM_GPU_SCHED_STAT_NOMINAL;
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
