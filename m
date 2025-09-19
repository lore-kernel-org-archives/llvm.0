Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58F26159E;
	Fri, 19 Sep 2025 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758308841; cv=none; b=D0BQzPO37n9mAg8WrU68faZfqvp0tSa7agJI10sUN9tDdzQuLSD2s+oW0Ok+lDwVySTtqnLHT+ejfh3W3o363iz+fhTH+8mT01i0KnfuyZeEjaipkivCLUayPyduZbA0Q1bJ/mrsOf6kTgUB2Up5iuR3ZYUtYG6mCJOf//PMVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758308841; c=relaxed/simple;
	bh=LW48S4uyqsP2anVFl9ThZDkyI7bm02DxcWz8y9TYf0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePILnZNPWeTSJmVbwYGd/WAfAYD/7uNZTZ5q96IZy+RNXGx7xUygv46h2dX9sZzJd5cSvnkf4IoiGk6mcQ5wEg075RGU2WLmNo9MGpuFZmHALJMTZhsjxrsuVox9DjXLOVkYgLu+0ye9gFfy/GTsOCZ8Fqm/+7E90lWnBunSOrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGpjJzkV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGpjJzkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758308839; x=1789844839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LW48S4uyqsP2anVFl9ThZDkyI7bm02DxcWz8y9TYf0I=;
  b=gGpjJzkVM5rgrqEQHoVIyDVG9jglmzV2pITP6nGW6F8cbtZfYBlUb+8X
   9gDs0Yhibgobc3n2bKw26ak6q7fmVAzMgaUf6LMDZG8SJs/RqBlbxOk5F
   ugFx9/na7SIcGXmUGLkkInAbhcjOezowv/i0IQME9D4tOWtWdokTEMGcp
   AV3UJ08Igk5n2/QDPRzgbHugyOrsYlcCH5WhElD2oH5QamAIsS5e50XLM
   ni44c4JT7qvCXKcPoC4oxSMEO9KNVuIOE6PSNgaHd3CqKSLFEjfd6w02P
   yrXlS8g0dnEBkuv6ZXxapuB01zypVuRw/WKoTR0Exrd7Tf8EC/PIycUQy
   w==;
X-CSE-ConnectionGUID: eSP4PqYLRtq/Go6T5GCgyA==
X-CSE-MsgGUID: 8VaBf0UVRae+HfgTsx1lNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60722928"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60722928"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 12:07:18 -0700
X-CSE-ConnectionGUID: jyrNteZXSmaGWOvZngKJVw==
X-CSE-MsgGUID: JWokkk6RR12oTUjqURTc2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="206655343"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Sep 2025 12:07:17 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzgRu-0004in-2a;
	Fri, 19 Sep 2025 19:07:14 +0000
Date: Sat, 20 Sep 2025 03:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v3 3/3] drivers/accel/ethosu/ethosu_job.c:288:15:
 warning: variable 'cmdaddr' is uninitialized when used here
Message-ID: <202509200336.qVmS3UG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v3
head:   6bafb6b0701a741e75c9f159f3b6e8cf07d48b55
commit: 6bafb6b0701a741e75c9f159f3b6e8cf07d48b55 [3/3] accel: Add Arm Ethos-U NPU driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250920/202509200336.qVmS3UG9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200336.qVmS3UG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200336.qVmS3UG9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/ethosu/ethosu_job.c:288:15: warning: variable 'cmdaddr' is uninitialized when used here [-Wuninitialized]
     288 |                                                  reg != cmdaddr,
         |                                                         ^~~~~~~
   include/linux/iopoll.h:194:47: note: expanded from macro 'readl_relaxed_poll_timeout'
     194 |         readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_us)
         |                                                      ^~~~
   include/linux/iopoll.h:135:29: note: expanded from macro 'readx_poll_timeout'
     135 |         read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, addr)
         |                                    ^~~~
   include/linux/iopoll.h:47:7: note: expanded from macro 'read_poll_timeout'
      47 |                 if (cond) \
         |                     ^~~~
   drivers/accel/ethosu/ethosu_job.c:279:13: note: initialize the variable 'cmdaddr' to silence this warning
     279 |         u32 cmdaddr;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/cmdaddr +288 drivers/accel/ethosu/ethosu_job.c

   272	
   273	static enum drm_gpu_sched_stat ethosu_job_timedout(struct drm_sched_job *bad)
   274	{
   275		struct ethosu_job *job = to_ethosu_job(bad);
   276		struct ethosu_device *dev = job->dev;
   277		bool running;
   278		u32 *bocmds = to_drm_gem_dma_obj(job->cmd_bo)->vaddr;
   279		u32 cmdaddr;
   280	
   281		running = FIELD_GET(STATUS_STATE_RUNNING, readl_relaxed(dev->regs + NPU_REG_STATUS));
   282		if (running) {
   283			int ret;
   284			u32 reg = readl_relaxed(dev->regs + NPU_REG_QREAD);
   285	
   286			ret = readl_relaxed_poll_timeout(dev->regs + NPU_REG_QREAD,
   287							 reg,
 > 288							 reg != cmdaddr,
   289							 USEC_PER_MSEC, 100 * USEC_PER_MSEC);
   290	
   291			/* If still running and progress is being made, just return */
   292			if (!ret)
   293				return DRM_GPU_SCHED_STAT_NO_HANG;
   294		}
   295	
   296		cmdaddr = readl_relaxed(dev->regs + NPU_REG_QREAD);
   297		dev_err(dev->base.dev, "NPU sched timed out: NPU %s, cmdstream offset 0x%x: 0x%x\n",
   298			running ? "running" : "stopped",
   299			cmdaddr, bocmds[cmdaddr / 4]);
   300	
   301		drm_sched_stop(&dev->sched, bad);
   302	
   303		/*
   304		 * Remaining interrupts have been handled, but we might still have
   305		 * stuck jobs. Let's make sure the PM counters stay balanced by
   306		 * manually calling pm_runtime_put_noidle().
   307		 */
   308		scoped_guard(mutex, &dev->job_lock) {
   309			if (dev->in_flight_job)
   310				pm_runtime_put_noidle(dev->base.dev);
   311	
   312			dev->in_flight_job = NULL;
   313		}
   314	
   315		/* Proceed with reset now. */
   316		pm_runtime_force_suspend(dev->base.dev);
   317		pm_runtime_force_resume(dev->base.dev);
   318	
   319		/* Restart the scheduler */
   320		drm_sched_start(&dev->sched, 0);
   321	
   322		return DRM_GPU_SCHED_STAT_RESET;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
