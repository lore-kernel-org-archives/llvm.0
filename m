Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D9F2CA5;
	Fri, 24 May 2024 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716592253; cv=none; b=pd0Z0pXboLRSKXR06MOtqshkNKizCJEGVu7hYSW0Az07QIAQoWkscLzEw89RG8wUTy19BxAhfiG31hg5vDvqG/p5bPIJLFhQxT2xYGKsnnb0ij2aYEOaHHp1bPQszJ5vye9h7lB8wykPmGh6LDa8GSZptNuUPwe/NTzlDQEoVSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716592253; c=relaxed/simple;
	bh=vyNIuuHbhcX7e6T/hd8nT49a18JY+hxW0O83GOsDZBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LnmsZadi54F84Sywn9mKSyi4CEipEPcKZ1hexKqRVFxnBqGyrygZgipJKSU6Km8WI2/sPvt+SQAu/ZwIem4y1P3L40dWC5LwkjBPkIK1dFmid5lSGHysKIENLl7c1Ok8v0Td5VBqFK0n05jHuaGjyqWngwq2Erv/l3ImtSke2Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiHSeqLR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiHSeqLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716592250; x=1748128250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vyNIuuHbhcX7e6T/hd8nT49a18JY+hxW0O83GOsDZBE=;
  b=fiHSeqLRqxNPspCLTM8jpbV5JIMYf8Lg+ySgLKkknCELAmw9kT+LC28b
   ntaupV9YX0LLl4AvQ+GC2Zk+zfdz8xLCI1bXTXkJSwyeDAxfntjegGHQX
   a71f/ZxPv42wJxbh7/6ve1c5xSO6xlR4wweyeXkcpbzzb551svYlYbax/
   iamhXjiSCTEjNptSCnQEx1JCOmDCnvgzFapjqp+qZRx/DuT0HxfpGJ0BY
   zxeC2nnw5fjh0bTiAytDfn/fXoxpm1buSmXiSbnkeSMJ9rpPloaVoJIKp
   BMAksWKE1CIIo2nlQw7ZWP4twv91pvW0+YQ4H+bX1Xsz5WNMGC4jPJrrE
   g==;
X-CSE-ConnectionGUID: dD06ge9oS0uB4JTUFNyC7A==
X-CSE-MsgGUID: ibIdvC6kT3GRc9OYdKLZBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12858388"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="12858388"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 16:10:50 -0700
X-CSE-ConnectionGUID: KEOL4qxbSmaDxhrajlFU9Q==
X-CSE-MsgGUID: pPv3If+dQvyC8tUNo0lT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="38952737"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 May 2024 16:10:49 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAe3i-0005zn-0r;
	Fri, 24 May 2024 23:10:46 +0000
Date: Sat, 25 May 2024 07:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 2/2] drivers/gpu/drm/xe/xe_guc.c:630:6: warning:
 variable 'count' is uninitialized when used here
Message-ID: <202405250703.KsT3CS4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   5cef84939723f96352d7087b0ea596a65fb972c6
commit: b0ac1b42dbdcc990ad32d6f8107a1d5214c33e67 [2/2] drm/xe/guc: Port over the slow GuC loading support from i915
config: x86_64-randconfig-002-20240525 (https://download.01.org/0day-ci/archive/20240525/202405250703.KsT3CS4D-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250703.KsT3CS4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250703.KsT3CS4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_guc.c:630:6: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
     630 |                           count, xe_guc_pc_get_act_freq(guc_pc),
         |                           ^~~~~
   drivers/gpu/drm/xe/xe_gt_printk.h:29:35: note: expanded from macro 'xe_gt_dbg'
      29 |         xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
         |                                          ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_printk.h:14:69: note: expanded from macro 'xe_gt_printk'
      14 |         drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
         |                                                                            ^~~~~~~~~~~
   include/drm/drm_print.h:522:59: note: expanded from macro 'drm_dbg'
     522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/drm/drm_print.h:504:63: note: expanded from macro 'drm_dbg_driver'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |                                                                      ^~~~~~~~~~~
   include/drm/drm_print.h:422:39: note: expanded from macro 'drm_dev_dbg'
     422 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc.c:594:11: note: initialize the variable 'count' to silence this warning
     594 |         int count;
         |                  ^
         |                   = 0
   1 warning generated.


vim +/count +630 drivers/gpu/drm/xe/xe_guc.c

   586	
   587	static void guc_wait_ucode(struct xe_guc *guc)
   588	{
   589		struct xe_gt *gt = guc_to_gt(guc);
   590		struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
   591		ktime_t before, after, delta;
   592		int load_done;
   593		u32 status = 0;
   594		int count;
   595		u64 delta_ms;
   596		u32 before_freq;
   597	
   598		before_freq = xe_guc_pc_get_act_freq(guc_pc);
   599		before = ktime_get();
   600		/*
   601		 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
   602		 * It could return a thousand intermediate stages at random times. Instead, must
   603		 * manually track the total time taken and locally implement the timeout.
   604		 */
   605		do {
   606			u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
   607	
   608			/*
   609			 * Wait for any change (intermediate or terminal) in the status register.
   610			 * Note, the return value is a don't care. The only failure code is timeout
   611			 * but the timeouts need to be accumulated over all the intermediate partial
   612			 * timeouts rather than allowing a huge timeout each time. So basically, need
   613			 * to treat a timeout no different to a value change.
   614			 */
   615			xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
   616					   last_status, 1000 * 1000, &status, false);
   617	
   618			after = ktime_get();
   619			delta = ktime_sub(after, before);
   620			delta_ms = ktime_to_ms(delta);
   621	
   622			load_done = guc_load_done(status);
   623			if (load_done != 0)
   624				break;
   625	
   626			if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
   627				break;
   628	
   629			xe_gt_dbg(gt, "load still in progress, count = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
 > 630				  count, xe_guc_pc_get_act_freq(guc_pc),
   631				  guc_pc_get_cur_freq(guc_pc), status,
   632				  REG_FIELD_GET(GS_BOOTROM_MASK, status),
   633				  REG_FIELD_GET(GS_UKERNEL_MASK, status));
   634		} while (1);
   635	
   636		if (load_done != 1) {
   637			u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
   638			u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
   639	
   640			xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
   641				  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
   642				  guc_pc_get_cur_freq(guc_pc), load_done);
   643			xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
   644				  REG_FIELD_GET(GS_MIA_IN_RESET, status),
   645				  bootrom, ukernel,
   646				  REG_FIELD_GET(GS_MIA_MASK, status),
   647				  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
   648	
   649			switch (bootrom) {
   650			case XE_BOOTROM_STATUS_NO_KEY_FOUND:
   651				xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
   652					  xe_mmio_read32(gt, GUC_HEADER_INFO));
   653				break;
   654	
   655			case XE_BOOTROM_STATUS_RSA_FAILED:
   656				xe_gt_err(gt, "firmware signature verification failed\n");
   657				break;
   658	
   659			case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
   660				xe_gt_err(gt, "firmware production part check failure\n");
   661				break;
   662			}
   663	
   664			switch (ukernel) {
   665			case XE_GUC_LOAD_STATUS_EXCEPTION:
   666				xe_gt_err(gt, "firmware exception. EIP: %#x\n",
   667					  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
   668				break;
   669	
   670			case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
   671				xe_gt_err(gt, "illegal register in save/restore workaround list\n");
   672				break;
   673	
   674			case XE_GUC_LOAD_STATUS_HWCONFIG_START:
   675				xe_gt_err(gt, "still extracting hwconfig table.\n");
   676				break;
   677			}
   678	
   679			xe_device_declare_wedged(gt_to_xe(gt));
   680		} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
   681			xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, count = %d]\n",
   682				   delta_ms, status, count);
   683			xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
   684				   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
   685				   before_freq, xe_gt_throttle_get_limit_reasons(gt));
   686		} else {
   687			xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, count = %d\n",
   688				  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
   689				  before_freq, status, count);
   690		}
   691	}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
