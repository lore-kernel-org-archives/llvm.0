Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6A12E7372;
	Fri,  2 Oct 2026 04:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914675; cv=none; b=tX53c+kVOiwLwbJL2fMtrmGmSCcHpKI5kHOiqe0yPBKygfdr5llgJJsdc8igoYDi5O6j96ESgz55tSF5sipy2D8eiufC+894UPVjMHgIjo8VUK6BL0MPVT7MXwc6fQRlPt87/VHnz+K8cU7Q4PHy3DTQJPIdjMtDEPD5pGcQMK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914675; c=relaxed/simple;
	bh=c/lAI9wlRcUeB0dGTkZrXB811Mc44bCRa3YpHtZnnVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U/IQpnk97m7WVRJKQY08Z8pg3rpHOMg6XUKVLxJAL1jocyWRIDEPCoZTOpkvP0Pq+2HU2grzDGfGZPvjU71zaD2vOi9uoHfcqoFHxWT00SKG29Rm7L33I/nkMAgsy9kUBpnylGLpvHPhADxOjR+PEJ0ZDlteMSjYLUsV78Mnfz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrkRq3XK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrkRq3XK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790914673; x=1822450673;
  h=date:from:to:cc:subject:message-id;
  bh=c/lAI9wlRcUeB0dGTkZrXB811Mc44bCRa3YpHtZnnVA=;
  b=VrkRq3XKKYFddESUDvK3v3VYRD/DzU4EK3wKmtvM8s9WKmr+hSUKGbB1
   We1cSxv6FRNbn59d31TAARAgj3EmnktPxq+NYaX0LczQ2ejHqVp6+mCT2
   0KBlMrvZxQSODFCCif0vT98X4BR3lD6nu/30lfX1wTEieeVhLxkc2LbHr
   To0r1rp+D2s54VdTwgAsaTEquAf3H1GnrCwkMgxv1Huoho+dsx5JbHTRt
   qjwecfHYU6DQPrJPxlCgG7dUcmtQjbDS9mkRWEt7neT8tr3D7e1G8reF0
   JZ5zzVUjgr2Htr/cun1oTUHUHZ+kUMvOSJoN14WH5J/6pEeYycsfT2Hw9
   w==;
X-CSE-ConnectionGUID: 3h+LNoVdRA+1Lzy0BXaGUg==
X-CSE-MsgGUID: Bc9y6tafSm6hXLDnXLHljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94167811"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94167811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:17:50 -0700
X-CSE-ConnectionGUID: T3OH3OgCRUGdnghnNvll2w==
X-CSE-MsgGUID: UrAFK42HSVqwRr3ZYQ5/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279462405"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 21:17:49 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUiQ-000000000P5-2Bjx;
	Fri, 02 Oct 2026 04:17:46 +0000
Date: Fri, 02 Oct 2026 06:17:19 +0200
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 60/87]
 arch/riscv/kernel/process.c:207:2: error: call to undeclared function
 'flush_ptrace_hw_breakpoint'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202610020620.pgRcphRg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 2aa069bfc965618a567482f16f10c8098c358d01 [60/87] riscv: ptrace support for hardware break/watchpoints
config: riscv-randconfig-2001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020620.pgRcphRg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020620.pgRcphRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020620.pgRcphRg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:207:2: error: call to undeclared function 'flush_ptrace_hw_breakpoint'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         flush_ptrace_hw_breakpoint(current);
         |         ^
   1 error generated.


vim +/flush_ptrace_hw_breakpoint +207 arch/riscv/kernel/process.c

   183	
   184	void flush_thread(void)
   185	{
   186	#ifdef CONFIG_FPU
   187		/*
   188		 * Reset FPU state and context
   189		 *	frm: round to nearest, ties to even (IEEE default)
   190		 *	fflags: accrued exceptions cleared
   191		 */
   192		fstate_off(current, task_pt_regs(current));
   193		memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
   194	#endif
   195	#ifdef CONFIG_RISCV_ISA_V
   196		/* Reset vector state */
   197		riscv_v_vstate_ctrl_init(current);
   198		riscv_v_vstate_off(task_pt_regs(current));
   199		kfree(current->thread.vstate.datap);
   200		memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
   201		clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
   202	#endif
   203	#ifdef CONFIG_RISCV_ISA_SUPM
   204		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
   205			envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_0);
   206	#endif
 > 207		flush_ptrace_hw_breakpoint(current);
   208	}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
