Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE391F5838;
	Mon, 27 Oct 2025 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605442; cv=none; b=qIDK9IIhgLjmsZ5t1ZdbqG1NWesouhRiGeOH2ZmPSUIJZ3ZMPZK92+rPu5R19JUOXTV1UhG5a5VVXCG/11K+N1csakrLKEagd6wFYw59zt6VWCqwUC+zEZB6btXNW28/1llkF6q25iRKh0UKrpORNUrD+Yi/2ZjZVCTd3qNgcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605442; c=relaxed/simple;
	bh=4+YKRAK5ri69xzHl8EVT2JVTn9fyPAMLCyIbVKg4CSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SudPnOQYgAipNHmrvsusp6/TICNelrmoJERSsCRB3i/CPqyuWfu6Ip/IZeF1NBCPva72wWJc+z+bwxOPNdPKuvF3IsfsTs5jQ+VbwL8KIHgyTFEFpGUOVanU7V9QkHqo9MVu3ukCiIYk2+1rfYGiZjrAi55DuMmnM/+BVlzzOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IG3PItNL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IG3PItNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761605440; x=1793141440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+YKRAK5ri69xzHl8EVT2JVTn9fyPAMLCyIbVKg4CSk=;
  b=IG3PItNLEzjF6wB0jO+v2to3l1DpCi33rCEvX/2AlVpnPzDR09yCF5aE
   1ON52fzjvknfigHvx5lL8uB4S5NJwJkVq1s12zQVY1XWk0gMpz2T2bak4
   TveDuw2XgqbyizK3VttRGFeT4ph7DWEwLmA/UaFmzg2FdKkfvm9vTJyhS
   ehTsPSU3dtbE38JJfRB0j8ZE1OsN7RZSSUcVd2oBNavfADSE9EhJLy5ti
   KhYBSDP6W3lMIm9iY+QShCHgyK4bjha0wTZ+cUJU6BQeNyWbE0JbiAvxJ
   +NsqpG/Brz+zS5iOllNoR7tM+GTHtyuDlO+RyW+ZWHIY0jp0fMkhTkMIY
   g==;
X-CSE-ConnectionGUID: 4xRAx5V5Q/+QHDfXDLHVBw==
X-CSE-MsgGUID: 31GlCdf1RAeh1ysBJTBJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66313263"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="66313263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:50:39 -0700
X-CSE-ConnectionGUID: ppsrVJUoQMWCQYeDAI3dlQ==
X-CSE-MsgGUID: FpaWcr+cSX6LcnVSfxjpcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="190302136"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Oct 2025 15:50:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDW2n-000IYJ-2h;
	Mon, 27 Oct 2025 22:50:31 +0000
Date: Tue, 28 Oct 2025 06:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [tglx-devel:rseq/slice 41/75]
 arch/arm64/kernel/entry-common.c:103:2: error: call to undeclared function
 'exit_to_user_mode_prepare'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202510280614.DnTvmun1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   7b95ad81f6a1e0d08a1e481f74e83a8a49c3ec30
commit: 3eb85fe2798ad0f79547b94137bbeba7e2de0980 [41/75] entry: Split up exit_to_user_mode_prepare()
config: arm64-randconfig-001-20251027 (https://download.01.org/0day-ci/archive/20251028/202510280614.DnTvmun1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280614.DnTvmun1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280614.DnTvmun1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/entry-common.c:103:2: error: call to undeclared function 'exit_to_user_mode_prepare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     103 |         exit_to_user_mode_prepare(regs);
         |         ^
   arch/arm64/kernel/entry-common.c:103:2: note: did you mean '__exit_to_user_mode_prepare'?
   include/linux/irq-entry-common.h:215:29: note: '__exit_to_user_mode_prepare' declared here
     215 | static __always_inline void __exit_to_user_mode_prepare(struct pt_regs *regs)
         |                             ^
   1 error generated.


vim +/exit_to_user_mode_prepare +103 arch/arm64/kernel/entry-common.c

bc29b71f53b13c Mark Rutland 2021-08-02   93  
bc29b71f53b13c Mark Rutland 2021-08-02   94  /*
bc29b71f53b13c Mark Rutland 2021-08-02   95   * Handle IRQ/context state management when exiting to user mode.
bc29b71f53b13c Mark Rutland 2021-08-02   96   * After this function returns it is not safe to call regular kernel code,
59598b42eb52c7 Mukesh Ojha  2022-10-29   97   * instrumentable code, or any code which may trigger an exception.
bc29b71f53b13c Mark Rutland 2021-08-02   98   */
997d79eb938e98 Mark Rutland 2024-02-06   99  
b3cf07851b6c4a Jinjie Ruan  2025-08-15  100  static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
4d1c2ee2709fd6 Mark Rutland 2021-08-02  101  {
97d935faacde47 Mark Rutland 2024-02-06  102  	local_irq_disable();
ab1e29acdb33c9 Eric Chan    2023-05-31 @103  	exit_to_user_mode_prepare(regs);
b3cf07851b6c4a Jinjie Ruan  2025-08-15  104  	local_daif_mask();
e130338eed5de0 Mark Rutland 2021-08-02  105  	mte_check_tfsr_exit();
b3cf07851b6c4a Jinjie Ruan  2025-08-15  106  	exit_to_user_mode();
e130338eed5de0 Mark Rutland 2021-08-02  107  }
e130338eed5de0 Mark Rutland 2021-08-02  108  

:::::: The code at line 103 was first introduced by commit
:::::: ab1e29acdb33c971e1af8ed8ec427bd1deff5f32 arm64: lockdep: enable checks for held locks when returning to userspace

:::::: TO: Eric Chan <ericchancf@google.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
