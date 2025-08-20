Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96AE335BAA;
	Wed, 20 Aug 2025 21:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726027; cv=none; b=q79DI6aoHcN6JzL0HS4FfZSZT22QAKtf4ERxyIA4KX0e3i6GeOXxefE7FEMfVQ67nmTJ9JXaSz+bXX0sRJBb/W/XBNwY91Xpq6x+dpp73ZL+08f4aWl4IWp+PrLH8f71gzWNnXSE/ej5jEOwiWscPM5P+yZmCd2F1YjaDvrRDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726027; c=relaxed/simple;
	bh=aqrzuja6PkdBjHdKKBqgqK5rjzETuEpzr+JbKNliyDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGPFicrP0rPtExiUTnal31VW7NUxNMNR0kt+UgcY80MR6r6T9PT/fzZeyyDEYcJTvOGOul6yBr8Xq+SrVV/tTESG+VbZkYQZl6mA19ysML3FM+UmQGFM1OBziamxCK1reTm/VJuHDiM/v2gnBNm6g7VVF7xlVZnYYa6JkRFXqck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXdkDdKO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXdkDdKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755726025; x=1787262025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aqrzuja6PkdBjHdKKBqgqK5rjzETuEpzr+JbKNliyDQ=;
  b=MXdkDdKOnBMyQm2bqZWnnnFgCRLEADktCEyLHEiout08QUVmghdwc9AU
   W4991QjIk8mRr181WbqhyiMvqFHgMogHhTzwEmyLCEegzVfYSXRk+xCre
   TRuRXul9pLl9hSekskXN52Dk1PJbjs/aEcQjRJtP8fLR9M62LsGxVyccy
   mSzQGWuzNeXCbTHFDxhTFg1FRZ/XJNLU+4E708gUW2y2s39ZtQXOfIpbu
   Uf1MqGdmqM1do7bLRfaWPa2eFBMfQ0gNMTELHFkz8x1Zkgyz+/ebQllTH
   MH+HWmdIm/nR9uLP8Xe9dRkegatFgdqcJY3PIOo/cLvefuF4EUZ9jgfGw
   Q==;
X-CSE-ConnectionGUID: P3gc8Z6CRteVVHwhiVD8wQ==
X-CSE-MsgGUID: EMZDrOCGSeOm+9SfH5F2oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58075777"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58075777"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 14:40:25 -0700
X-CSE-ConnectionGUID: sN8PLPyXRAG60IreOnKWrQ==
X-CSE-MsgGUID: Od1r34daTTCon8kbzxMmAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172659357"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Aug 2025 14:40:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoqWu-000JhD-34;
	Wed, 20 Aug 2025 21:39:50 +0000
Date: Thu, 21 Aug 2025 05:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/core 29/41] arch/x86/kernel/uprobes.c:834:16:
 error: incompatible pointer types passing 'unsigned long *' to parameter of
 type 'u64 *' (aka 'unsigned long long *')
Message-ID: <202508210550.rgoAtXMe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   44711c518722e9e0594d07e7f7af72ec9d48c1dd
commit: 89f3fe617685431a4d82091c95ab14dd0d3b8dd6 [29/41] uprobes/x86: Fix shadow stack
config: x86_64-buildonly-randconfig-003-20250821 (https://download.01.org/0day-ci/archive/20250821/202508210550.rgoAtXMe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210550.rgoAtXMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210550.rgoAtXMe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:834:16: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'u64 *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     834 |         if (shstk_pop(&sret) == 0 && sret != args.retaddr)
         |                       ^~~~~
   arch/x86/include/asm/shstk.h:26:20: note: passing argument to parameter 'val' here
      26 | int shstk_pop(u64 *val);
         |                    ^
   1 error generated.


vim +834 arch/x86/kernel/uprobes.c

   802	
   803	SYSCALL_DEFINE0(uprobe)
   804	{
   805		struct pt_regs *regs = task_pt_regs(current);
   806		struct uprobe_syscall_args args;
   807		unsigned long ip, sp, sret;
   808		int err;
   809	
   810		/* Allow execution only from uprobe trampolines. */
   811		if (!in_uprobe_trampoline(regs->ip))
   812			goto sigill;
   813	
   814		err = copy_from_user(&args, (void __user *)regs->sp, sizeof(args));
   815		if (err)
   816			goto sigill;
   817	
   818		ip = regs->ip;
   819	
   820		/*
   821		 * expose the "right" values of ax/r11/cx/ip/sp to uprobe_consumer/s, plus:
   822		 * - adjust ip to the probe address, call saved next instruction address
   823		 * - adjust sp to the probe's stack frame (check trampoline code)
   824		 */
   825		regs->ax  = args.ax;
   826		regs->r11 = args.r11;
   827		regs->cx  = args.cx;
   828		regs->ip  = args.retaddr - 5;
   829		regs->sp += sizeof(args);
   830		regs->orig_ax = -1;
   831	
   832		sp = regs->sp;
   833	
 > 834		if (shstk_pop(&sret) == 0 && sret != args.retaddr)
   835			goto sigill;
   836	
   837		handle_syscall_uprobe(regs, regs->ip);
   838	
   839		/*
   840		 * Some of the uprobe consumers has changed sp, we can do nothing,
   841		 * just return via iret.
   842		 */
   843		if (regs->sp != sp) {
   844			/* skip the trampoline call */
   845			if (args.retaddr - 5 == regs->ip)
   846				regs->ip += 5;
   847			return regs->ax;
   848		}
   849	
   850		regs->sp -= sizeof(args);
   851	
   852		/* for the case uprobe_consumer has changed ax/r11/cx */
   853		args.ax  = regs->ax;
   854		args.r11 = regs->r11;
   855		args.cx  = regs->cx;
   856	
   857		/* keep return address unless we are instructed otherwise */
   858		if (args.retaddr - 5 != regs->ip)
   859			args.retaddr = regs->ip;
   860	
   861		if (shstk_push(args.retaddr) == -EFAULT)
   862			goto sigill;
   863	
   864		regs->ip = ip;
   865	
   866		err = copy_to_user((void __user *)regs->sp, &args, sizeof(args));
   867		if (err)
   868			goto sigill;
   869	
   870		/* ensure sysret, see do_syscall_64() */
   871		regs->r11 = regs->flags;
   872		regs->cx  = regs->ip;
   873		return 0;
   874	
   875	sigill:
   876		force_sig(SIGILL);
   877		return -1;
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
