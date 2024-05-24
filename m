Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A9179B7;
	Fri, 24 May 2024 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716572575; cv=none; b=IAqVj+0vA8UNuX2DZTKe++hIHaJQ1AuC7Terfo7Z4vUQhY1bbcpPBxsSWzAIgM+1gcKTbQKnrRDyYQ5XLwM63peCRx9bPultfkOtsg3/TJUi0waHN85fLRXmSspBe5vW/a6geU9DYjmSv0OkS1ZPG1ya5TYxpuVXEyzax7QWB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716572575; c=relaxed/simple;
	bh=awMtDSyPKE+tfIOSuaMnm2Mx4i+BJ3dwl5PPpNh59+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwLAqvBJKhmkDBxHrBgOgs0aObLzPDokfvMgYhZcdAFo9lxppo2FMdBUPz3TnkDsUsEdg44Soj0f9E1zxKQaDzTxcmvSwfFgnLbEk43kYJNqqbnO48bTfo7yr9UhkN3YWdKlvyrb+1wYEGs3JnTnt80SwD0IUCivPS09N7E+hHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHSPtZCE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHSPtZCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716572573; x=1748108573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awMtDSyPKE+tfIOSuaMnm2Mx4i+BJ3dwl5PPpNh59+c=;
  b=LHSPtZCEPtCX41JWHcPXA5PVkHDGFxcH22AONqA8mzKCwf6egaBAJU21
   rOJtgo5KTmojUxyXU6pOeSAx7jDKk9swqgvj5QgnJqWUZC1p5NjsJPNCf
   MqNFyJWkAjOjhvIVuU8xZSxoR2L5k///5GHd3ldW9urldyGVfH5AG8fIC
   KkIMP5B90rxQ1wMrb/9SULA328X3kA04lC892lBLsguue6w0UgK+8QMz+
   zjYmYvOnYco2vVoZUXdzAkrhZbqhfnegYfeDriUX5xjT6BWmUEZUNpFeK
   sI1By7ENRi4Gib2zE3pJGPJqQPVkiwCWn20xNeorn//L6h3s91gu7joC8
   g==;
X-CSE-ConnectionGUID: nb2ww6DsQvuwTc3FvljcqA==
X-CSE-MsgGUID: lJsjZ1odS06HOESY/ZpJNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12835626"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="12835626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 10:42:52 -0700
X-CSE-ConnectionGUID: xXI+NACvRQu97lsLVZkE7w==
X-CSE-MsgGUID: K91/Xs+hTN+XJtt4ZbjsxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34613836"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2024 10:42:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAYwJ-0005kd-2J;
	Fri, 24 May 2024 17:42:47 +0000
Date: Sat, 25 May 2024 01:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 2/2] drivers/gpu/drm/xe/xe_guc.c:630:6: error:
 variable 'count' is uninitialized when used here
Message-ID: <202405250151.IbH0l8FG-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240525/202405250151.IbH0l8FG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250151.IbH0l8FG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250151.IbH0l8FG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_guc.c:6:
   In file included from drivers/gpu/drm/xe/xe_guc.h:9:
   In file included from drivers/gpu/drm/xe/xe_gt.h:11:
   In file included from drivers/gpu/drm/xe/xe_device.h:11:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_guc.c:6:
   In file included from drivers/gpu/drm/xe/xe_guc.h:9:
   In file included from drivers/gpu/drm/xe/xe_gt.h:11:
   In file included from drivers/gpu/drm/xe/xe_device.h:11:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_guc.c:6:
   In file included from drivers/gpu/drm/xe/xe_guc.h:9:
   In file included from drivers/gpu/drm/xe/xe_gt.h:11:
   In file included from drivers/gpu/drm/xe/xe_device.h:11:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/xe/xe_guc.c:630:6: error: variable 'count' is uninitialized when used here [-Werror,-Wuninitialized]
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
   18 errors generated.


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
