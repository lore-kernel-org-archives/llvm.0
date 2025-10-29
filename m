Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD6324B25;
	Wed, 29 Oct 2025 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737198; cv=none; b=BgTDStQSgycpC+f0heafvl8w6v+PRWL+DuyfiHKUHQv0WDvdKxFgzsVwPkH+WQaeq9Ekv5H1O3Jp0kDsZHNPL9bBxTj1yHZXqOQVhd/am7iNtNvf4pG416mtHkVl8zIxcec6Zqia+ZRS0ca01jUfjruheKQbIqX/yL/b/bL3D90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737198; c=relaxed/simple;
	bh=mZTyVJUiMvkTq4TfSpRLwzS9CdopbfzeUc0c4VuMUnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyDKMgA1qLp+qvFcI+2t3SSj7Pzia+hMduF2OsMQonWn1mgqlUQf48mxcGL6d8xwJm+6j7mbDXexeQmH0M19KrZIBg0T6Dptj3W4PWsfWRToA0VmXem5yjxCSDF1K3eJPBocdwHjrcERBqhib7j8Izn77zt9GU2+dIfiCaeywg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLbZILqt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLbZILqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761737196; x=1793273196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZTyVJUiMvkTq4TfSpRLwzS9CdopbfzeUc0c4VuMUnI=;
  b=cLbZILqtod0zI8Pb+j72g8qjY/KRWuHU8Vek+CYYavTGcWy8XdQFG6fQ
   R1jM3Dd8ljEqb7Ua/BkHg0H7dCKjQmlfKJxs3XKOZDEr32mICAgw34Idj
   SWe1aBJuRe91hfKPelPWvy/kUSf1o3PNOn0+D4H3kp6OgIbUwlEm+q7JD
   pUtIvBUeM207tUcuK9HsjsFPwtVI9foVRZpnRNDbbEgqiHmUejSRTP94F
   RwZuKKwPkeQfPIIpyodEcTkWtsEUTM5vjdNcPBdG8FpaEv5DKh4qwB/De
   7BzPdpYW1uHuf0HZcXl8xYiDVeV8zij/Kutst+GXQ7uWMEoBmBQj/iQ5C
   w==;
X-CSE-ConnectionGUID: GPgbrqAaTjm6ybjCz0ApvQ==
X-CSE-MsgGUID: Lj2mPZl0Qo6DDDaZthMLIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="62881775"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="62881775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:26:33 -0700
X-CSE-ConnectionGUID: Rs7aoKhzTmiWrby1j9QXrA==
X-CSE-MsgGUID: Nt+gUwiLRvKxQSyQzi0vVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="216493123"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2025 04:26:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE4Jn-000KYT-2H;
	Wed, 29 Oct 2025 11:26:22 +0000
Date: Wed, 29 Oct 2025 19:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [tip:perf/core 18/20] arch/x86/include/asm/unwind_user.h:16:12:
 error: no member named 'flags' in 'struct pt_regs'
Message-ID: <202510291919.FFGyU7nq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
head:   c69993ecdd4dfde2b7da08b022052a33b203da07
commit: 49cf34c0815f93fb2ea3ab5cfbac1124bd9b45d0 [18/20] unwind_user/x86: Enable frame pointer unwinding on x86
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20251029/202510291919.FFGyU7nq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291919.FFGyU7nq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291919.FFGyU7nq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:108:
   In file included from include/linux/unwind_deferred.h:6:
   In file included from include/linux/unwind_user.h:6:
>> arch/x86/include/asm/unwind_user.h:16:12: error: no member named 'flags' in 'struct pt_regs'
      16 |         if (regs->flags & X86_VM_MASK)
         |             ~~~~  ^
>> arch/x86/include/asm/unwind_user.h:16:20: error: use of undeclared identifier 'X86_VM_MASK'
      16 |         if (regs->flags & X86_VM_MASK)
         |                           ^~~~~~~~~~~
   2 errors generated.


vim +16 arch/x86/include/asm/unwind_user.h

     6	
     7	#define ARCH_INIT_USER_FP_FRAME(ws)			\
     8		.cfa_off	=  2*(ws),			\
     9		.ra_off		= -1*(ws),			\
    10		.fp_off		= -2*(ws),			\
    11		.use_fp		= true,
    12	
    13	static inline int unwind_user_word_size(struct pt_regs *regs)
    14	{
    15		/* We can't unwind VM86 stacks */
  > 16		if (regs->flags & X86_VM_MASK)
    17			return 0;
    18	#ifdef CONFIG_X86_64
    19		if (!user_64bit_mode(regs))
    20			return sizeof(int);
    21	#endif
    22		return sizeof(long);
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
