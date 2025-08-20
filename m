Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C411DDA18;
	Wed, 20 Aug 2025 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755711085; cv=none; b=Qc/Gzpcnj2C3tF4CNSfg8lnLsNZ3EsQklFVowj9o7/geqn53A4MlHfR1/hBIHoCRbUfsMrVEh/3w/xd67olfojynNfPBfes+spErWjO3TRrpw4mGQOclBzGjcjPn15mja/0ktV5nLFpam7C/5pdtw8+9RTHpfFx6xZQpyFqpVmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755711085; c=relaxed/simple;
	bh=9FU/rD+OvUi9vNaNTWD1C2htO+xZFlNFxse7JJikZb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIj+gIuYnV5zMeVmKa9B7z+yhnkEOygZcNwZenE3kHWpvFe1TOK9r6NTR2xIdlPxNHVpiSSbznkAFtNOETlcZaeV1AckNmE8zsFKwO1LuH06W/8sSLW7OSDy/mFNE2Ryg+Ygmv1sIrCD8B7zMVqPmfpDvM3A9uIY0BnEEqqJrUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d79Dv25I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d79Dv25I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755711084; x=1787247084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9FU/rD+OvUi9vNaNTWD1C2htO+xZFlNFxse7JJikZb0=;
  b=d79Dv25I9Q5DAbNQMy+6pmS4LpA6VRIcimOznByCms3Dc/hiWAQYoUEc
   1ahRmrHENc/+z6hN9R7C/eIR7uPfaafd6K/VoCZbLo/QAmpvQ3FEz1UMN
   Ojb/CW/mmbl3WMd+TPMrDslzLZkVCil7apnqJPqdKXMZVbI5TFnKs2Rh/
   nRKgYGBQaXoTjcNqxyeshsw1kZzYCm4NAm/5HMEgh36t03gknRTIEGWrQ
   hetj8ocGnx+vwq6sYATUT6FAL2P7OVsIjo3qzowIca+E4w5gRM4Pritbv
   Zv+0TKRJebEbBdpWZelzbva8IGu63hnO05tp8IqGKaN30+EJwjN9qUWRp
   A==;
X-CSE-ConnectionGUID: UfYpT2OYSsWm9JzY5k4zxg==
X-CSE-MsgGUID: n4QX2z5lT7Kw9b1JLetWjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61625294"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61625294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 10:31:24 -0700
X-CSE-ConnectionGUID: 7Rwz/G7HSci1Y/fSX48ZLw==
X-CSE-MsgGUID: 7n/6F3nNS5eMFGIui+oVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172607148"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 20 Aug 2025 10:31:22 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uomee-0001a3-0K;
	Wed, 20 Aug 2025 17:31:20 +0000
Date: Wed, 20 Aug 2025 19:31:00 +0200
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/core 29/41] arch/x86/kernel/uprobes.c:834:16:
 error: incompatible pointer types passing 'unsigned long *' to parameter of
 type 'u64 *' (aka 'unsigned long long *')
Message-ID: <202508201942.kN5khpRq-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250820/202508201942.kN5khpRq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201942.kN5khpRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201942.kN5khpRq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:834:16: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'u64 *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     834 |         if (shstk_pop(&sret) == 0 && sret != args.retaddr)
         |                       ^~~~~
   arch/x86/include/asm/shstk.h:40:34: note: passing argument to parameter 'val' here
      40 | static inline int shstk_pop(u64 *val) { return -ENOTSUPP; }
         |                                  ^
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
