Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C94D1FF61E;
	Thu, 26 Mar 2026 03:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495138; cv=none; b=f9jLzUCLr0MwDd9B4dr1Ly7W/OSGw/eqcjPY5uczvFvRuId4ZGfVRMCK34hH9Dl8bmg1YIH2shm09LKIW3cPcloD7JYld5o07NqLDIN+HyXgwUgioz7mCh5UFGjjBKDtr3Wxpod3SSRJlI8uSsOpSjQ02zPbPU9U11AfwDwlzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495138; c=relaxed/simple;
	bh=dJUg5gPxDIq34osx4R7Q4lZhpTg3RWPl4Bs4TJJV6K8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FtPiesLMWtNXSnnIEVu2xsmvUQjK30FPWX6vwoFYr58M9VtvfK9dRCDTG/KCsx4dvgP7BVPT4bY3CPdgN5SgWxfvzIkPKRdYdYJrvAaTizwTsP9CUVlhBWimD2liqwUZptFHCGOSYK70PJTA72wwuZ80jvKGv0mu8IoZMDNk0Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6xPwdLe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6xPwdLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774495137; x=1806031137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dJUg5gPxDIq34osx4R7Q4lZhpTg3RWPl4Bs4TJJV6K8=;
  b=O6xPwdLe49lAVGGaIb62t6ynm2N+1CwEAwyr30F9KTJVY3Yt9DEDkfYO
   VSSR+A8EbcuUSf7hJOYtPBv7vSzg9V3hzL5126J2riPWm6mo4Evsawz1t
   PR3d9rzA0oFV2pZNvgYSFRoNj7Kn+UtYwJDyuFkxntuWYQvPuXJS/bowH
   Z5T3xCbX4cy3eZIxKn412VraeAsPOakzN6ttAAS3NXw2ycJR2knBvjENE
   xkQd7Rq1YRrnrCiPTesrapNZ+xcGQLXG+llV6EhTZITW+ox/oJsqHzIx1
   cdpvi2Lhytdf1KwNhvrFr8Q6tVWjQquKDTkwbsOk+fRjlxCffjnDAVWrQ
   Q==;
X-CSE-ConnectionGUID: bH+V8pRoTAqIibW/7skEzA==
X-CSE-MsgGUID: 8nVgSiIVR/CBtsU7Xyz07Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75430636"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75430636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 20:18:56 -0700
X-CSE-ConnectionGUID: AnMrPLw0Qsyoffpa+2lESQ==
X-CSE-MsgGUID: hSJ0ZBvaSpad+jbNVRc1Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220029339"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 20:18:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bFD-0000000083F-3gqt;
	Thu, 26 Mar 2026 03:18:51 +0000
Date: Thu, 26 Mar 2026 11:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 3/18]
 arch/arm/kernel/signal.c:143:15: error: variable 'aux' set but not used
Message-ID: <202603261127.DR8KsiwA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   6816331cc815bfc31edb2ff1aaad0d882f0bf92b
commit: fb3ab97786e927b684927c71a78479a10f6d2995 [3/18] run-tests
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260326/202603261127.DR8KsiwA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261127.DR8KsiwA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261127.DR8KsiwA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/signal.c:143:15: error: variable 'aux' set but not used [-Werror,-Wunused-but-set-variable]
     143 |         char __user *aux;
         |                      ^
   1 error generated.


vim +/aux +143 arch/arm/kernel/signal.c

82c6f5a5b3e91e Imre Deak      2010-04-11  135  
^1da177e4c3f41 Linus Torvalds 2005-04-16  136  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  137   * Do a signal return; undo the signal stack.  These are aligned to 64-bit.
^1da177e4c3f41 Linus Torvalds 2005-04-16  138   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  139  
680714844fd1dc Russell King   2006-06-15  140  static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
^1da177e4c3f41 Linus Torvalds 2005-04-16  141  {
c32cd419d6650e Russell King   2018-07-09  142  	struct sigcontext context;
ce184a0dee92a0 Dave Martin    2017-06-30 @143  	char __user *aux;
680714844fd1dc Russell King   2006-06-15  144  	sigset_t set;
680714844fd1dc Russell King   2006-06-15  145  	int err;
680714844fd1dc Russell King   2006-06-15  146  
680714844fd1dc Russell King   2006-06-15  147  	err = __copy_from_user(&set, &sf->uc.uc_sigmask, sizeof(set));
77097ae503b170 Al Viro        2012-04-27  148  	if (err == 0)
101d9b0dedbc9e Matt Fleming   2012-03-05  149  		set_current_blocked(&set);
^1da177e4c3f41 Linus Torvalds 2005-04-16  150  
c32cd419d6650e Russell King   2018-07-09  151  	err |= __copy_from_user(&context, &sf->uc.uc_mcontext, sizeof(context));
c32cd419d6650e Russell King   2018-07-09  152  	if (err == 0) {
c32cd419d6650e Russell King   2018-07-09  153  		regs->ARM_r0 = context.arm_r0;
c32cd419d6650e Russell King   2018-07-09  154  		regs->ARM_r1 = context.arm_r1;
c32cd419d6650e Russell King   2018-07-09  155  		regs->ARM_r2 = context.arm_r2;
c32cd419d6650e Russell King   2018-07-09  156  		regs->ARM_r3 = context.arm_r3;
c32cd419d6650e Russell King   2018-07-09  157  		regs->ARM_r4 = context.arm_r4;
c32cd419d6650e Russell King   2018-07-09  158  		regs->ARM_r5 = context.arm_r5;
c32cd419d6650e Russell King   2018-07-09  159  		regs->ARM_r6 = context.arm_r6;
c32cd419d6650e Russell King   2018-07-09  160  		regs->ARM_r7 = context.arm_r7;
c32cd419d6650e Russell King   2018-07-09  161  		regs->ARM_r8 = context.arm_r8;
c32cd419d6650e Russell King   2018-07-09  162  		regs->ARM_r9 = context.arm_r9;
c32cd419d6650e Russell King   2018-07-09  163  		regs->ARM_r10 = context.arm_r10;
c32cd419d6650e Russell King   2018-07-09  164  		regs->ARM_fp = context.arm_fp;
c32cd419d6650e Russell King   2018-07-09  165  		regs->ARM_ip = context.arm_ip;
c32cd419d6650e Russell King   2018-07-09  166  		regs->ARM_sp = context.arm_sp;
c32cd419d6650e Russell King   2018-07-09  167  		regs->ARM_lr = context.arm_lr;
c32cd419d6650e Russell King   2018-07-09  168  		regs->ARM_pc = context.arm_pc;
c32cd419d6650e Russell King   2018-07-09  169  		regs->ARM_cpsr = context.arm_cpsr;
c32cd419d6650e Russell King   2018-07-09  170  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  171  
^1da177e4c3f41 Linus Torvalds 2005-04-16  172  	err |= !valid_user_regs(regs);
^1da177e4c3f41 Linus Torvalds 2005-04-16  173  
ce184a0dee92a0 Dave Martin    2017-06-30  174  	aux = (char __user *) sf->uc.uc_regspace;
^1da177e4c3f41 Linus Torvalds 2005-04-16  175  #ifdef CONFIG_IWMMXT
ce184a0dee92a0 Dave Martin    2017-06-30  176  	if (err == 0)
ce184a0dee92a0 Dave Martin    2017-06-30  177  		err |= restore_iwmmxt_context(&aux);
^1da177e4c3f41 Linus Torvalds 2005-04-16  178  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  179  #ifdef CONFIG_VFP
82c6f5a5b3e91e Imre Deak      2010-04-11  180  	if (err == 0)
ce184a0dee92a0 Dave Martin    2017-06-30  181  		err |= restore_vfp_context(&aux);
^1da177e4c3f41 Linus Torvalds 2005-04-16  182  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  183  
^1da177e4c3f41 Linus Torvalds 2005-04-16  184  	return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  185  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  186  

:::::: The code at line 143 was first introduced by commit
:::::: ce184a0dee92a0a333236a26478e304dca29a3df ARM: 8687/1: signal: Fix unparseable iwmmxt_sigframe in uc_regspace[]

:::::: TO: Dave Martin <Dave.Martin@arm.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
