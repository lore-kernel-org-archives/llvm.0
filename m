Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB57348A;
	Mon, 18 Dec 2023 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OplEJaVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702936943; x=1734472943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VjJxzdXW+/fWISvEOVZvlsA4vZ683iGM3l1gbkEepgQ=;
  b=OplEJaVHA64A7EPeD8YxBwMTzr4cWMm9OqQbjAA/7yqtANpX/MAvkdPZ
   ERQPbMBAfiGk5gl5gQ3UThVZxIYPZ23CtzBWbVhC1qRSGhvhZWdC0ePaT
   kYvEV7O3UJPhKPwWdwfwXGrN9F2++qUlFiD2lTzg7/cV9O02+TPikPK3D
   pnokKnAI6q6v/tMA/l0hKG0SgNQdFAXK7TVm/+DZD3eMgA6/gUiM0e6vl
   OLpIAjNUcRdQMTrpW8VgQidgtkSjWLdJFRI89FhYW7PvxpjKjuTECBMUn
   ZPfy/25Y1Xk9qmtLEcVixpEbQUrqDnvs/tSHONs4R9lfp4yvgcfExohCC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="9019804"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="9019804"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 14:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="919409236"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="919409236"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2023 14:02:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFLgo-0004a9-3C;
	Mon, 18 Dec 2023 22:02:18 +0000
Date: Tue, 19 Dec 2023 06:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 23/49] arch/x86/um/sysrq_64.c:20:51: error:
 call to undeclared function 'task_pid_nr'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202312190526.m7j0Ti50-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   0e034194a81f95ba6377786660a88f5403fcbf19
commit: 3a152ecfd5ccaf1204e4b486600de199c2c0eadd [23/49] sched.h: move pid helpers to pid.h
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231219/202312190526.m7j0Ti50-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 5ac12951b4e9bbfcc5791282d0961ec2b65575e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190526.m7j0Ti50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190526.m7j0Ti50-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/um/sysrq_64.c:20:51: error: call to undeclared function 'task_pid_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      20 |         printk(KERN_INFO "Pid: %d, comm: %.20s %s %s\n", task_pid_nr(current),
         |                                                          ^
   1 error generated.


vim +/task_pid_nr +20 arch/x86/um/sysrq_64.c

^1da177e4c3f41 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  15  
9d1ee8ce92e16c arch/x86/um/sysrq_64.c     Richard Weinberger 2013-09-23  16  void show_regs(struct pt_regs *regs)
^1da177e4c3f41 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  17  {
^1da177e4c3f41 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  18  	printk("\n");
^1da177e4c3f41 arch/um/sys-x86_64/sysrq.c Linus Torvalds     2005-04-16  19  	print_modules();
95906b24fbe4d2 arch/um/sys-x86_64/sysrq.c Jeff Dike          2008-02-04 @20  	printk(KERN_INFO "Pid: %d, comm: %.20s %s %s\n", task_pid_nr(current),

:::::: The code at line 20 was first introduced by commit
:::::: 95906b24fbe4d22e5861f67fe1e8274c7ecfeda1 uml: style fixes in arch/um/sys-x86_64

:::::: TO: Jeff Dike <jdike@addtoit.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
