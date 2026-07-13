Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9286368D59;
	Mon, 13 Jul 2026 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925973; cv=none; b=HpRD1zNlxk5oJykKyJqqLV2bSO3PjuLn4J3dMpSHs1nXp82uto2GLdj28ZtxBqyNdpbcsZB3zQUQPHyGEzowOeImcewB3Mr6S1a461mXD1EjslzwzFeJgPP4PazZ6l8i9zEnTZMU/hvFC+TquYGCXsynnBvB62mf0fRafiBTRm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925973; c=relaxed/simple;
	bh=9aDqEAatbo9RVG/eVSKvbXhZyFpON7dIHvdZmx9VQqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ImCJ1aYG/UiMJTye6S6Y24YUGqSfIzJ6yHZI1l3TK563vIDIWkUycQsrbngVD0JVA1kMtYQ1sZ4xEq08LQsc18RtkYYURerjMPQmgC5QrIgG0WzzubPIGIX90IVff3Jxa8mWPELX48PvY4ub9QLr59zEdQon+dAwJhSCpZTrwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPJWc4mS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPJWc4mS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783925972; x=1815461972;
  h=date:from:to:cc:subject:message-id;
  bh=9aDqEAatbo9RVG/eVSKvbXhZyFpON7dIHvdZmx9VQqw=;
  b=ZPJWc4mSaqK+4hG+n2lRGSfB05jhe/HvgYiODP4vNhoQO7WSs+SDd5Wp
   C1n2Rh8VdU/cdEAYd4XBuiVhGpR9JXSMbN808pRhBCcpjdtEv/dk57pdV
   Zv9RsGYlzSRqj161ti33Usb+1Gg62OoPj6556KVeW2L27qLBmrIuG/jZ3
   Z1vcZI/t57Y3YZ1fuo+uj9p89QlxiRwgxscZzRy50U6hyCZFp0/bo387c
   /w9YQIFHjlBtcMS54+MYLWIAp8gRMIaKl6WXrkJl24XF/+km0Yq+Hhd+l
   jPVyOxigZvMyCDQdu0vHOqphFh/cV6iKi1l24iOIGkrVG5G6acSggwm1P
   Q==;
X-CSE-ConnectionGUID: caDT+2i7Qwm+2nM8FhUfdw==
X-CSE-MsgGUID: 4M/Xww3KTu2SwQwrRWU1Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84306502"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84306502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 23:59:32 -0700
X-CSE-ConnectionGUID: lJREyGopQb+Lq3u+1VUdWw==
X-CSE-MsgGUID: 1ffdpYe9TK2extN1ge2MNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293665216"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jul 2026 23:59:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjAdQ-00000000LTR-0WhH;
	Mon, 13 Jul 2026 06:59:24 +0000
Date: Mon, 13 Jul 2026 14:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:entry/rework 18/21]
 kernel/entry/syscall-common.c:32:2: error: call to undeclared function
 '__audit_syscall_entry'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607131454.nwgaxB2K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry/rework
head:   1454229eb369ff115a01917755f196188bdc74ee
commit: ddef2cc738735c0da1c43b05bbeab690c76f961e [18/21] entry: Rework syscall_audit_enter()
config: powerpc-mpc512x_defconfig (https://download.01.org/0day-ci/archive/20260713/202607131454.nwgaxB2K-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131454.nwgaxB2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131454.nwgaxB2K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/entry/syscall-common.c:32:2: error: call to undeclared function '__audit_syscall_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      32 |         __audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
         |         ^
   kernel/entry/syscall-common.c:32:2: note: did you mean 'audit_syscall_entry'?
   include/linux/audit.h:614:20: note: 'audit_syscall_entry' declared here
     614 | static inline void audit_syscall_entry(int major, unsigned long a0,
         |                    ^
   1 error generated.


vim +/__audit_syscall_entry +32 kernel/entry/syscall-common.c

    25	
    26	void syscall_enter_audit(struct pt_regs *regs)
    27	{
    28		long syscall = syscall_get_nr(current, regs);
    29		unsigned long args[6];
    30	
    31		syscall_get_arguments(current, regs, args);
  > 32		__audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
