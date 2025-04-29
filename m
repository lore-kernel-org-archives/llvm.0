Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EDB26B09D;
	Tue, 29 Apr 2025 21:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961203; cv=none; b=G2JPJ1CagUpsndDh022FE3Q5+OaX0q5xzc9nqwFj2wOvyRRbJE+mKx1ehFk5/i+hZ9EPdQoY+XFJPcgOq2+yLQI4V8UZ1IDnsoV/FXJrnvevW8ZfxTOHRYbkqppwuHKGGlJ9cRmszZkMpl/WTlANFwdeKI3n+QOrP7yj00G5Pzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961203; c=relaxed/simple;
	bh=bTN0JkUWPSVCZQRsauTJMMOzu5Ap0cjC8JTZw2v8txk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFqQQgxt/NpGsUb/+n7ufVdXma7d6hnQaRBShJpb7cMabqOg6pCMFRc+x62gRy0fJpcVYUHEwoBt/DnZNOL2vMAjjR65qfo7t9huZ6jxc51MthmjCNOqSDzW1018wXNSeymmvGVpeGr2IYaiXM+jqbZ7tXziDDtLgIyusCHItBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELwkq01w; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELwkq01w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745961201; x=1777497201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bTN0JkUWPSVCZQRsauTJMMOzu5Ap0cjC8JTZw2v8txk=;
  b=ELwkq01w7RrAc2c9bm9aJJrb8tD0fir5mvZVJQAK1GndA/k2CNNeCtKr
   8mBLDAWzUTbtKnZKiGk3AKr7g3JKL9+ARN50gfRCBSQl3JLHYT7zcx/Be
   repvxX7oEyBfe0/NFRQDCskjIOK3GyKjbOx42ALYV6sBcc9MZbv2yDM6M
   kIx0Hhtv7GFtsXZrRUduDjeqzcvJhoDrHgPnVuJiEmv9CadvgNJWllfiC
   K//nVBobKpULjPEIM3UqZUYbWGL83ijmFJMmTMLHmpEq2FvJtUfE/rJ78
   hHL7liaqxtGeIxhJIXhjR11EOvTfFPWgp55hXaJJkROAAx/92di3iHWgb
   A==;
X-CSE-ConnectionGUID: VSmE5HJbTIScsEiGjWmujw==
X-CSE-MsgGUID: bXgcUkUsQEacofyhIN1qsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50261627"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="50261627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 14:13:20 -0700
X-CSE-ConnectionGUID: diJ3Yh5WR+SCH7A4r9IhNw==
X-CSE-MsgGUID: 8+5E6udMTz26XcIOTQF/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134926499"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2025 14:13:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9sGS-0002x9-22;
	Tue, 29 Apr 2025 21:13:16 +0000
Date: Wed, 30 Apr 2025 05:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V1 6/6] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <202504300415.c8gU3WVo-lkp@intel.com>
References: <20250428152225.66044-9-mchauras@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428152225.66044-9-mchauras@linux.ibm.com>

Hi Mukesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20250428-232533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250428152225.66044-9-mchauras%40linux.ibm.com
patch subject: [RFC V1 6/6] powerpc: Enable Generic Entry/Exit for syscalls.
config: powerpc-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300415.c8gU3WVo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300415.c8gU3WVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300415.c8gU3WVo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/interrupt.c:212:16: error: use of undeclared identifier 'local_paca'
     212 |         if (unlikely((local_paca->generic_fw_flags & GFW_RESTORE_ALL) == GFW_RESTORE_ALL)) {
         |                       ^
   arch/powerpc/kernel/interrupt.c:214:3: error: use of undeclared identifier 'local_paca'
     214 |                 local_paca->generic_fw_flags &= ~GFW_RESTORE_ALL;
         |                 ^
   2 errors generated.
--
>> arch/powerpc/kernel/signal.c:376:2: error: use of undeclared identifier 'local_paca'
     376 |         local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
         |         ^
   1 error generated.


vim +/local_paca +212 arch/powerpc/kernel/interrupt.c

   153	
   154	/*
   155	 * This should be called after a syscall returns, with r3 the return value
   156	 * from the syscall. If this function returns non-zero, the system call
   157	 * exit assembly should additionally load all GPR registers and CTR and XER
   158	 * from the interrupt frame.
   159	 *
   160	 * The function graph tracer can not trace the return side of this function,
   161	 * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
   162	 */
   163	notrace unsigned long syscall_exit_prepare(unsigned long r3,
   164						   struct pt_regs *regs,
   165						   long scv)
   166	{
   167		unsigned long ti_flags;
   168		unsigned long ret = 0;
   169		bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
   170	
   171		kuap_assert_locked();
   172	
   173		regs->result = r3;
   174	
   175		ti_flags = read_thread_flags();
   176	
   177		if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
   178			if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
   179				r3 = -r3;
   180				regs->ccr |= 0x10000000; /* Set SO bit in CR */
   181			}
   182		}
   183	
   184		if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
   185			if (ti_flags & _TIF_RESTOREALL)
   186				ret = _TIF_RESTOREALL;
   187			else
   188				regs->gpr[3] = r3;
   189			clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
   190		} else {
   191			regs->gpr[3] = r3;
   192		}
   193	
   194		if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
   195			ret |= _TIF_RESTOREALL;
   196		}
   197	
   198	again:
   199		syscall_exit_to_user_mode(regs);
   200	
   201		user_enter_irqoff();
   202		if (!prep_irq_for_enabled_exit(true)) {
   203			user_exit_irqoff();
   204			local_irq_enable();
   205			local_irq_disable();
   206			goto again;
   207		}
   208	
   209		/* Restore user access locks last */
   210		kuap_user_restore(regs);
   211	
 > 212		if (unlikely((local_paca->generic_fw_flags & GFW_RESTORE_ALL) == GFW_RESTORE_ALL)) {
   213			ret |= _TIF_RESTOREALL;
   214			local_paca->generic_fw_flags &= ~GFW_RESTORE_ALL;
   215		}
   216	#ifdef CONFIG_PPC64
   217		regs->exit_result = ret;
   218	#endif
   219	
   220		return ret;
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
