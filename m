Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E864D;
	Tue,  5 Sep 2023 03:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693885806; x=1725421806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cn7W/YAYWmxJnCIjQr336nffQQoNy539OejDD1bHlOI=;
  b=LfmgLcGhsNwCa07D2oAur0ZIq1xnu+5lGAjoUtk+f9OG9UmWsZOxeKL9
   XS6ZxuGZeOOzBcdXUmfkesqO5KQRScM/QYCRKriK8cdahjUL3FpSXSO1/
   +07wAvf0FVKF3ZQ5OTw3HG4yD8pJKI7TeOjLCE6FLQ7TA2G1pOA1/XRHN
   BKZZLbU8FF+/2XV9LMZMKBgIUkTATf8AOLgpa9bHMIOObplgHS6oycl8J
   wg5IVhVPYRmAz+2aRFQqrgZnookdal5sCTI7SzkFAfnBBcJQGDE4eZNvl
   d/yX9Ab3k/07pXpv1/7q6zHMuv10zQTYtATYBwd8bLobAMM8+uC9mAbwy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="357004286"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="357004286"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 20:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="770178452"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="770178452"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Sep 2023 20:50:02 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdN4i-0001Ch-1x;
	Tue, 05 Sep 2023 03:50:00 +0000
Date: Tue, 5 Sep 2023 11:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 15/21]
 arch/s390/kernel/rethook.c:6:6: error: conflicting types for
 'arch_rethook_prepare'
Message-ID: <202309051123.fsfIP5N3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   dfbc336030a06d337cd7c979774eb34c741db6e9
commit: 21f9b814d7f9703d6118985b1499f2c1b89f3343 [15/21] fprobe: rethook: Use ftrace_regs in fprobe exit handler and rethook
config: s390-randconfig-r036-20230905 (https://download.01.org/0day-ci/archive/20230905/202309051123.fsfIP5N3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051123.fsfIP5N3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051123.fsfIP5N3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/rethook.c:6:6: error: conflicting types for 'arch_rethook_prepare'
       6 | void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
         |      ^
   include/linux/rethook.h:73:6: note: previous declaration is here
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^
>> arch/s390/kernel/rethook.c:16:6: error: conflicting types for 'arch_rethook_fixup_return'
      16 | void arch_rethook_fixup_return(struct pt_regs *regs,
         |      ^
   include/linux/rethook.h:88:6: note: previous declaration is here
      88 | void arch_rethook_fixup_return(struct ftrace_regs *regs,
         |      ^
>> arch/s390/kernel/rethook.c:29:36: error: incompatible pointer types passing 'struct pt_regs *' to parameter of type 'struct ftrace_regs *' [-Werror,-Wincompatible-pointer-types]
      29 |         return rethook_trampoline_handler(regs, regs->gprs[15]);
         |                                           ^~~~
   include/linux/rethook.h:92:62: note: passing argument to parameter 'regs' here
      92 | unsigned long rethook_trampoline_handler(struct ftrace_regs *regs,
         |                                                              ^
   3 errors generated.


vim +/arch_rethook_prepare +6 arch/s390/kernel/rethook.c

1a280f48c0e403 Vasily Gorbik 2023-01-17   5  
1a280f48c0e403 Vasily Gorbik 2023-01-17  @6  void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
1a280f48c0e403 Vasily Gorbik 2023-01-17   7  {
1a280f48c0e403 Vasily Gorbik 2023-01-17   8  	rh->ret_addr = regs->gprs[14];
1a280f48c0e403 Vasily Gorbik 2023-01-17   9  	rh->frame = regs->gprs[15];
1a280f48c0e403 Vasily Gorbik 2023-01-17  10  
1a280f48c0e403 Vasily Gorbik 2023-01-17  11  	/* Replace the return addr with trampoline addr */
1a280f48c0e403 Vasily Gorbik 2023-01-17  12  	regs->gprs[14] = (unsigned long)&arch_rethook_trampoline;
1a280f48c0e403 Vasily Gorbik 2023-01-17  13  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  14  NOKPROBE_SYMBOL(arch_rethook_prepare);
1a280f48c0e403 Vasily Gorbik 2023-01-17  15  
1a280f48c0e403 Vasily Gorbik 2023-01-17 @16  void arch_rethook_fixup_return(struct pt_regs *regs,
1a280f48c0e403 Vasily Gorbik 2023-01-17  17  			       unsigned long correct_ret_addr)
1a280f48c0e403 Vasily Gorbik 2023-01-17  18  {
1a280f48c0e403 Vasily Gorbik 2023-01-17  19  	/* Replace fake return address with real one. */
1a280f48c0e403 Vasily Gorbik 2023-01-17  20  	regs->gprs[14] = correct_ret_addr;
1a280f48c0e403 Vasily Gorbik 2023-01-17  21  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  22  NOKPROBE_SYMBOL(arch_rethook_fixup_return);
1a280f48c0e403 Vasily Gorbik 2023-01-17  23  
1a280f48c0e403 Vasily Gorbik 2023-01-17  24  /*
1a280f48c0e403 Vasily Gorbik 2023-01-17  25   * Called from arch_rethook_trampoline
1a280f48c0e403 Vasily Gorbik 2023-01-17  26   */
1a280f48c0e403 Vasily Gorbik 2023-01-17  27  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs)
1a280f48c0e403 Vasily Gorbik 2023-01-17  28  {
1a280f48c0e403 Vasily Gorbik 2023-01-17 @29  	return rethook_trampoline_handler(regs, regs->gprs[15]);
1a280f48c0e403 Vasily Gorbik 2023-01-17  30  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  31  NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
1a280f48c0e403 Vasily Gorbik 2023-01-17  32  

:::::: The code at line 6 was first introduced by commit
:::::: 1a280f48c0e403903cf0b4231c95b948e664f25a s390/kprobes: replace kretprobe with rethook

:::::: TO: Vasily Gorbik <gor@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
