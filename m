Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D5125D2;
	Fri, 25 Aug 2023 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692991023; x=1724527023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NwNOp5ObJawmkCtx0reRMWPpn4TZiTct6jKZA2CxKQ0=;
  b=KQOpxKqMuTcMRbMQ3VJoQOkR8cFhKTmw9w5QI+YwhYjMuhA+mll0V0eU
   LKvdV+meyOdURurWQIdUqMR0V3gUqyonIzWQNpjCRxb6ZH1wrvblau0CK
   inuMZ8pKYWa1Vm159Y0tSFWSgXj63Opi/KJxORCljz0+wtCtDbaAr424j
   l+vFStYoITUf81YxUM/JwYkkFcoAXYhOqtYOwjGn1zGC2TQwm91S9Vdfx
   NneEf2thAs3lT8tnaSjbvvc4DBqJZMcC6lI7vI2e/nq9jjwt+51LA0O3L
   C1aPEgxPee31okjJ8LeC36DBuDsawkwvGBohVWX4M+pndowmD0H+mewcA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="438724669"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="438724669"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 12:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="740715774"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="740715774"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Aug 2023 12:16:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZcIl-0003vr-0a;
	Fri, 25 Aug 2023 19:16:59 +0000
Date: Sat, 26 Aug 2023 03:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linuxppc:next-test 85/129] arch/powerpc/xmon/xmon.c:489:12: error:
 stack frame size (2160) exceeds limit (2048) in 'xmon_core'
Message-ID: <202308260344.Vc4Giuk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
commit: 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb [85/129] Revert "powerpc/xmon: Relax frame size for clang"
config: powerpc64-randconfig-r006-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260344.Vc4Giuk7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260344.Vc4Giuk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260344.Vc4Giuk7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/xmon/xmon.c:489:12: error: stack frame size (2160) exceeds limit (2048) in 'xmon_core' [-Werror,-Wframe-larger-than]
   static int xmon_core(struct pt_regs *regs, volatile int fromipi)
              ^
   1 error generated.


vim +/xmon_core +489 arch/powerpc/xmon/xmon.c

5c699396f5f6cf arch/powerpc/xmon/xmon.c Anton Blanchard      2020-06-30  488  
a2305e3de81939 arch/powerpc/xmon/xmon.c Arnd Bergmann        2021-04-29 @489  static int xmon_core(struct pt_regs *regs, volatile int fromipi)
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  490  {
a2305e3de81939 arch/powerpc/xmon/xmon.c Arnd Bergmann        2021-04-29  491  	volatile int cmd = 0;
a2305e3de81939 arch/powerpc/xmon/xmon.c Arnd Bergmann        2021-04-29  492  	struct bpt *volatile bp;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  493  	long recurse_jmp[JMP_BUF_LEN];
69393cb03ccdf2 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  494  	bool locked_down;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  495  	unsigned long offset;
f13659e0b39075 arch/powerpc/xmon/xmon.c Anton Blanchard      2007-03-21  496  	unsigned long flags;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  497  #ifdef CONFIG_SMP
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  498  	int cpu;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  499  	int secondary;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  500  #endif
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  501  
f13659e0b39075 arch/powerpc/xmon/xmon.c Anton Blanchard      2007-03-21  502  	local_irq_save(flags);
a71d64b4dc4067 arch/powerpc/xmon/xmon.c Anton Blanchard      2014-08-05  503  	hard_irq_disable();
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  504  
69393cb03ccdf2 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  505  	locked_down = xmon_is_locked_down();
69393cb03ccdf2 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  506  
aaf06665f7ea3e arch/powerpc/xmon/xmon.c Naveen N. Rao        2019-06-27  507  	if (!fromipi) {
ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  508  		tracing_enabled = tracing_is_on();
ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  509  		tracing_off();
aaf06665f7ea3e arch/powerpc/xmon/xmon.c Naveen N. Rao        2019-06-27  510  	}
ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  511  
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  512  	bp = in_breakpoint_table(regs->nip, &offset);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  513  	if (bp != NULL) {
59dc5bfca0cb6a arch/powerpc/xmon/xmon.c Nicholas Piggin      2021-06-18  514  		regs_set_return_ip(regs, bp->address + offset);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  515  		atomic_dec(&bp->ref_count);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  516  	}
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  517  
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  518  	remove_cpu_bpts();
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  519  

:::::: The code at line 489 was first introduced by commit
:::::: a2305e3de819394a7adf68078964a92d06f9db33 powerpc: mark local variables around longjmp as volatile

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
