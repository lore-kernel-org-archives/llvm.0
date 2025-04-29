Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E180277006;
	Tue, 29 Apr 2025 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911413; cv=none; b=tlUHBuGC9YJN8w19zhXPuYt7s+VA+ZEgE8e2QhSIFtaC8DaTbJa3Dx1ySBjQmSr0FYKFcZ4DAZf+YmhDUnVTkQQB/U5XoHc3+MZ6Iljd9YeB+lI+Io4/E8FFr3UIK2ZzkLxA/06BDMsfBJGferslfxRuFuNTP7mg1ZDyTpvIZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911413; c=relaxed/simple;
	bh=OzZCMPZ2U+7g6FUuTXnLRPG3EH5dDFgrLdpvWQscpfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/oZbCB7I+PE67Fj1W1xs+5ai2XORKimlNn6Zqw2vn4wHJmRfLoiZ2x0v6qUTqAWscIgk6cPhnJrYbZedySIUqM1N24ZrsE+6Jlkg7CZ84G3CopyXZlTZkSpKUm5aPXCg4uL7dSjFzNJpZiMsml2o2U49Z1IX3dXuMrYU3esurw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INlMMwTW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INlMMwTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745911412; x=1777447412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzZCMPZ2U+7g6FUuTXnLRPG3EH5dDFgrLdpvWQscpfQ=;
  b=INlMMwTWYvHwvkXX4PSJ5oI63fHmzRozCfgviOTCEHeY7EPIqYrtO1Sl
   WMixIA9Cpbo+BERGJrGGu46DcbZsVry2RYIhhO8ZcdKhVuxBcQTETx3qC
   0lF4OECLLs4NipBW9ZEZQpf8GzVZE6lszUmUVeHFY8SRNGLhLz6sWEkMR
   qIko/nweFXJG4WIV2Is/MynlWdjPSuVqoNRhVH3n2TcQxHro3tm1NSwGO
   eIbNMWXZe5CVayw46n9cbDPvp2wPinhCulYR+cNe8Clti7yjklkMbDTrR
   w49l+t8bZaUmP+NlKfwVTSfjpKCsO9+64WVXgN1EuJhwEwEUmRKXUpI7R
   A==;
X-CSE-ConnectionGUID: 7tJCOfUKTFqp36J3jyDeBw==
X-CSE-MsgGUID: ywCFehxsTRCdh3FlpfPXPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58887990"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58887990"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:23:32 -0700
X-CSE-ConnectionGUID: 1Zpa0B1ASPyr4/alDH8YIQ==
X-CSE-MsgGUID: tMV5u18aR6mL2qLtxWDnaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="156972462"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2025 00:23:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fJQ-0000Xn-1J;
	Tue, 29 Apr 2025 07:23:28 +0000
Date: Tue, 29 Apr 2025 15:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks 17/18]
 arch/arm64/kernel/entry.S:592:2: error: unrecognized instruction mnemonic
Message-ID: <202504291503.w9GAZmMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks
head:   6f50dac461ca66220a13a927db438e4a75708444
commit: 9f8b2eeb16285187ca7653f6e4ad94fdb43c9096 [17/18] HACK: aarch64 dynamic stack
config: arm64-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291503.w9GAZmMA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291503.w9GAZmMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291503.w9GAZmMA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/mm/fault.c:914:6: warning: no previous prototype for function 'do_stack_abort' [-Wmissing-prototypes]
     914 | void do_stack_abort(unsigned long far, struct pt_regs *regs)
         |      ^
   arch/arm64/mm/fault.c:914:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     914 | void do_stack_abort(unsigned long far, struct pt_regs *regs)
         | ^
         | static 
   1 warning generated.
--
>> arch/arm64/kernel/entry.S:592:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, t, 64, sync
    ^
   arch/arm64/kernel/entry.S:597:2: error: unrecognized instruction mnemonic
    kernel_ventry_el1_sync 1, h, 64, sync
    ^


vim +592 arch/arm64/kernel/entry.S

   582	
   583		.text
   584	
   585	/*
   586	 * Exception vectors.
   587	 */
   588		.pushsection ".entry.text", "ax"
   589	
   590		.align	11
   591	SYM_CODE_START(vectors)
 > 592		kernel_ventry_el1_sync	1, t, 64, sync		// Synchronous EL1t
   593		kernel_ventry	1, t, 64, irq		// IRQ EL1t
   594		kernel_ventry	1, t, 64, fiq		// FIQ EL1t
   595		kernel_ventry	1, t, 64, error		// Error EL1t
   596	
   597		kernel_ventry_el1_sync	1, h, 64, sync		// Synchronous EL1h
   598		kernel_ventry	1, h, 64, irq		// IRQ EL1h
   599		kernel_ventry	1, h, 64, fiq		// FIQ EL1h
   600		kernel_ventry	1, h, 64, error		// Error EL1h
   601	
   602		kernel_ventry	0, t, 64, sync		// Synchronous 64-bit EL0
   603		kernel_ventry	0, t, 64, irq		// IRQ 64-bit EL0
   604		kernel_ventry	0, t, 64, fiq		// FIQ 64-bit EL0
   605		kernel_ventry	0, t, 64, error		// Error 64-bit EL0
   606	
   607		kernel_ventry	0, t, 32, sync		// Synchronous 32-bit EL0
   608		kernel_ventry	0, t, 32, irq		// IRQ 32-bit EL0
   609		kernel_ventry	0, t, 32, fiq		// FIQ 32-bit EL0
   610		kernel_ventry	0, t, 32, error		// Error 32-bit EL0
   611	SYM_CODE_END(vectors)
   612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
