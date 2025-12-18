Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C97262A;
	Thu, 18 Dec 2025 00:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766016867; cv=none; b=FLpVs0yY8KEfinIISAodwc4FH88+38RbxMMF+lmdyvUb9zqerGyexpQlY/+wNBXi0khgli5ZWgWXm6io4JThdJAVhD8s/Wzrmbb8oZBv+Ls0mYGHTZLH5DFxf+Y8xISvzlosUYQGNGTTcV4xH/JtoW4bCCzvTw3c3ecyDzNxvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766016867; c=relaxed/simple;
	bh=0b7/3CwzVnZOpi0LeK3zfJkbQ+5B4MaSmC2+84NhRBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNA0LRKgPipVN9GhprU32nuEFomHfxTw4iNZKS0iY2WsVdz7Y6WFGnnItMk3FL/qARvvORrRB/Pvj5Y5R36M6onialyCdKi5lefp+S7KluTz+XBlZd2t+mbYN2TF7YN63QG+oaNTU/ZQ/SkNLt3ecYQobMAgMvHt6LA3DDC2hQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A40oIujO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A40oIujO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766016865; x=1797552865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0b7/3CwzVnZOpi0LeK3zfJkbQ+5B4MaSmC2+84NhRBg=;
  b=A40oIujOGLcWnfFD77ylLZANygeaUuLKiABtWnqBN68/eZ9l6R0zicWy
   d5sPDbXBQLJpwea51UkGXNJU7qVWwKXjXAzZT8ERUaG/oOEa7MdwDJdEv
   UucSbkkQIOrj6TE/h+ROMlnbgvwG8U+I6+GkqWSJdXKALazY0dVKnDeE9
   vgw8bdpigIGiDlDXaTrytBPIZMybB06ShUQseDsEr8SiD51AsuwplaQSf
   sarqVDTrxI4VBNYox1whC+W87eQWemTKmaSKw7XTc2Cb3BkzCuGWHXb50
   ELjvUGRw7KOg9e8fpzCi3efo3FGdaLrB+jUhsvTYgP8YyPd7vdkWPExE7
   Q==;
X-CSE-ConnectionGUID: C6lUB/2MTsipSh0W7jZVOw==
X-CSE-MsgGUID: YagI3lOeT7+ttfCbbFOWSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78280118"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78280118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 16:14:22 -0800
X-CSE-ConnectionGUID: XOM0/7baTsupiC32TzGLRQ==
X-CSE-MsgGUID: YE0ifpsrTlCbF/Zx2bn+bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229483045"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Dec 2025 16:14:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW1es-000000001NL-3hri;
	Thu, 18 Dec 2025 00:14:18 +0000
Date: Thu, 18 Dec 2025 08:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:x86/irq 2/3] arch/x86/kernel/irq.c:461:24: error: call to
 undeclared function '__this_cpu_ptr'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202512180805.DvPn2cDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/irq
head:   64d4c88270cf90089434e3db67ed443fd982a9a2
commit: 329e2051476858f264e2c217c6db4e68e203d5db [2/3] x86/irq: Cleanup posted MSI code
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251218/202512180805.DvPn2cDt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180805.DvPn2cDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180805.DvPn2cDt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/irq.c:461:24: error: call to undeclared function '__this_cpu_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     461 |         struct pi_desc *pid = __this_cpu_ptr(&posted_msi_pi_desc);
         |                               ^
>> arch/x86/kernel/irq.c:461:18: error: incompatible integer to pointer conversion initializing 'struct pi_desc *' with an expression of type 'int' [-Wint-conversion]
     461 |         struct pi_desc *pid = __this_cpu_ptr(&posted_msi_pi_desc);
         |                         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/__this_cpu_ptr +461 arch/x86/kernel/irq.c

   454	
   455	/*
   456	 * For MSIs that are delivered as posted interrupts, the CPU notifications
   457	 * can be coalesced if the MSIs arrive in high frequency bursts.
   458	 */
   459	DEFINE_IDTENTRY_SYSVEC(sysvec_posted_msi_notification)
   460	{
 > 461		struct pi_desc *pid = __this_cpu_ptr(&posted_msi_pi_desc);
   462		struct pt_regs *old_regs = set_irq_regs(regs);
   463	
   464		/* Mark the handler active for intel_ack_posted_msi_irq() */
   465		__this_cpu_write(posted_msi_handler_active, true);
   466		inc_irq_stat(posted_msi_notification_count);
   467		irq_enter();
   468	
   469		/*
   470		 * Loop only MAX_POSTED_MSI_COALESCING_LOOP - 1 times here to take
   471		 * the final handle_pending_pir() invocation after clearing the
   472		 * outstanding notification bit into account.
   473		 */
   474		for (int i = 1; i < MAX_POSTED_MSI_COALESCING_LOOP; i++) {
   475			if (!handle_pending_pir(pid->pir, regs))
   476				break;
   477		}
   478	
   479		/*
   480		 * Clear the outstanding notification bit to rearm the notification
   481		 * mechanism.
   482		 */
   483		pi_clear_on(pid);
   484	
   485		/*
   486		 * Clearing the ON bit can race with a notification. Process the
   487		 * PIR bits one last time so that handling the new interrupts is
   488		 * not delayed until the next notification happens.
   489		 */
   490		handle_pending_pir(pid->pir, regs);
   491	
   492		apic_eoi();
   493		irq_exit();
   494		__this_cpu_write(posted_msi_handler_active, false);
   495		set_irq_regs(old_regs);
   496	}
   497	#endif /* X86_POSTED_MSI */
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
