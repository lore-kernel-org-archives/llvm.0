Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422C37649C;
	Tue,  7 Apr 2026 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534334; cv=none; b=Jc9qpvzcY9dAh96uom9ZTIckNYcLueHw/1XlMIbHpslMBfKf2zWlg8p50iSm6eAjPwz7I1jXOtlqleBOSvZn90LyTkbXMTUiKaIL9Lx04GgDseaRzmyPlxxw8Tp7xwZ38Hd7cO1ogIeXmgTz1EBhXTua2WvjvCnCYuGKfSiAWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534334; c=relaxed/simple;
	bh=IQA0E1S57UssQ5S2QxG8lEfu3P4TekTUbNgZuZlGPm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V5+kwI+thSCmlA+QWDCdD8797fUok+TvTIu9WMtKU2inGXpnpEHDnlDHoCncHwFSqDiikkVUIY9ys9JiRU5g5ZPkdrDtEBXE868VqnfDoPrGqSD1/dRic64Ajuzj+XQ3xGLG6yZFF4MxByRGfpWvU8kiZy/ySG31qXLz/aKLhUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ijse3UYb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ijse3UYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534334; x=1807070334;
  h=date:from:to:cc:subject:message-id;
  bh=IQA0E1S57UssQ5S2QxG8lEfu3P4TekTUbNgZuZlGPm4=;
  b=Ijse3UYb6jUtpoo8n7S9fGesXRQMM6uJh8V1mpjOVC8YzyTGOlXoeJgi
   lWtuw5tw/Xc1tNO5Km2HIOECf8viaT1sHnrIuHHt/mXMxXhj0Q5IY3GH0
   RgSg7rbO1FG3APog1+R9qZ/O41kEWR2QD0R+vI7ABTzISfrrVZcZHR4QU
   sZeMO+UbeCBxKHxXidjq23dPGKkCLTBdaB44J1dSaUvVIJjpoTb2JD8jB
   qc5pd7+ctOO9RAXI1vvHeEJiunavDlXbdmR/5dx1MHsOYITgjf7jea5/N
   B6xfdV7z61V745o9wbEYazBYpairAQzf/03NERTM+hel5hjK11zPYZSo4
   Q==;
X-CSE-ConnectionGUID: Amu6sB+uRY2f0/Pv8iQu+w==
X-CSE-MsgGUID: 8q5I0zeGRVGcHAu5QBeO5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76369560"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76369560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:58:37 -0700
X-CSE-ConnectionGUID: TPdbgu0sQee/PLnPBkxHsg==
X-CSE-MsgGUID: Ai0CIIJiR3C65JhbZu0f+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232091299"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:58:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xaD-00000000069-0cTK;
	Tue, 07 Apr 2026 03:58:33 +0000
Date: Tue, 07 Apr 2026 11:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 23/42]
 arch/loongarch/kernel/switch.S:28:18: error: operand must be a symbol with
 modifier (e.g. %pc_lo12) or an integer in the range
Message-ID: <202604050903.azdEMqcN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   a33008fc8f2cf78de0ed73dc9b1dc6a46d278287
commit: 4f3f9133e70fced7e1ed07a143160017a3c88e12 [23/42] bcachefs: fix use-after-free in ec_block_endio()
config: loongarch-randconfig-001-20260405 (https://download.01.org/0day-ci/archive/20260405/202604050903.azdEMqcN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050903.azdEMqcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050903.azdEMqcN-lkp@intel.com/

Note: the bcachefs/bcachefs-testing HEAD a33008fc8f2cf78de0ed73dc9b1dc6a46d278287 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/switch.S:28:18: error: operand must be a symbol with modifier (e.g. %pc_lo12) or an integer in the range [-2048, 2047]
    ld.d $r20, $r5, 5640
                    ^


vim +28 arch/loongarch/kernel/switch.S

803b0fc5c3f2ba Huacai Chen 2022-05-31  12  
803b0fc5c3f2ba Huacai Chen 2022-05-31  13  /*
803b0fc5c3f2ba Huacai Chen 2022-05-31  14   * task_struct *__switch_to(task_struct *prev, task_struct *next,
613d4164f5a503 Huacai Chen 2025-01-25  15   *			    struct thread_info *next_ti, void *sched_ra, void *sched_cfa)
803b0fc5c3f2ba Huacai Chen 2022-05-31  16   */
803b0fc5c3f2ba Huacai Chen 2022-05-31  17  	.align	5
803b0fc5c3f2ba Huacai Chen 2022-05-31  18  SYM_FUNC_START(__switch_to)
803b0fc5c3f2ba Huacai Chen 2022-05-31  19  	csrrd	t1, LOONGARCH_CSR_PRMD
803b0fc5c3f2ba Huacai Chen 2022-05-31  20  	stptr.d	t1, a0, THREAD_CSRPRMD
803b0fc5c3f2ba Huacai Chen 2022-05-31  21  
803b0fc5c3f2ba Huacai Chen 2022-05-31  22  	cpu_save_nonscratch a0
803b0fc5c3f2ba Huacai Chen 2022-05-31  23  	stptr.d	ra, a0, THREAD_REG01
93a4fa622eb061 Qing Zhang  2022-08-06  24  	stptr.d a3, a0, THREAD_SCHED_RA
93a4fa622eb061 Qing Zhang  2022-08-06  25  	stptr.d a4, a0, THREAD_SCHED_CFA
09f33601bf940f Huacai Chen 2022-12-10  26  #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_SMP)
09f33601bf940f Huacai Chen 2022-12-10  27  	la	t7, __stack_chk_guard
09f33601bf940f Huacai Chen 2022-12-10 @28  	LONG_L	t8, a1, TASK_STACK_CANARY

:::::: The code at line 28 was first introduced by commit
:::::: 09f33601bf940f955c10a6e75a1c1b7bcadee5e2 LoongArch: Add basic STACKPROTECTOR support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
