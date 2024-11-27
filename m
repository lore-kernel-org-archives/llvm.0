Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4311442E8;
	Wed, 27 Nov 2024 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732720846; cv=none; b=D1SS9cOqMz0Qq/1ukQPvwBpnFaqN6HEGH7oQQP4ixbm6uA/rwFtirglYt3GnbUb7Tvy4mdJ42UNru8kgSXC/Z1yUyhYqE7+MXlXeaQDf9frNIT26xXtSbe2HhahhzGCzP+5NGWV0RrD2X+5NkjLH+zz+dyHOqH/O9BosuWZuyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732720846; c=relaxed/simple;
	bh=n0/SUhxzcytFkVLLE/6zlX/5We5Kd5llWnOLeTY7sTk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evVOugo2MPQAMyrj7CLuGSXdIsUH+GKLt8PW6KcJP7vfDHNux309uu2qcsAZtlMbvUYAZfAvTJZnHXSU43LR3E6Oq3meqxkvAGxbxjtjFnc730jDuoM3xzRIcFhdwLnCoSxr9emXWD8wBtH1CA55vb5AUmbNmgJxSvW8ppkC6mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lx2Z7xdZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx2Z7xdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732720845; x=1764256845;
  h=date:from:cc:subject:message-id:mime-version;
  bh=n0/SUhxzcytFkVLLE/6zlX/5We5Kd5llWnOLeTY7sTk=;
  b=lx2Z7xdZJDKFp5byT0cuHLSkX1qtiHVuzl6IJZ3HBVoICPvigtE7aIgB
   lHQvirQBSIGbfh1+328KUNoOimieiI3fopxlgOZn5lMuvSVFYJXSTGWpY
   LTeLz9eCxGH/l4VxzCXpfkEOSOu7CeHJLzPzPgHkfH7Ji4c0Pal3slndU
   7lZ0JMEVT6KVGnQgORMn58RlClv3DVk2dKtR1Y3OfgA4AogWAb0dE2Wbk
   EUBvjQh0xJ9xxA4u0ycAz89vaSUmGbV4pZHDFTj4yMoybbyY+FSbaB/Kp
   mio2CRbNB3rCNH5gDCLCTkw/S0mpZLU6Gl0jLGGGCV6JCMgk4roy7dkdN
   w==;
X-CSE-ConnectionGUID: FtFUFmyURT6s0ElgLtpL6w==
X-CSE-MsgGUID: JaiDKD07TxmYm6l3uKE1+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36717134"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36717134"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 07:20:44 -0800
X-CSE-ConnectionGUID: Vzwx8e4eRZibZwFKKIdvWQ==
X-CSE-MsgGUID: 34+f+u+cQ6GMrQghhSXWDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91597561"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2024 07:20:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGJqL-00085T-13;
	Wed, 27 Nov 2024 15:20:41 +0000
Date: Wed, 27 Nov 2024 23:19:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:static-key-noinstr 7/7] vmlinux.o: warning: objtool:
 intel_idle+0x4c: mds_idle_clear: non-RO static key usage in noinstr
Message-ID: <202411272322.ViuHjFki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-noinstr
head:   51fd13276df848dcb320bf7ff423f73364b06266
commit: 51fd13276df848dcb320bf7ff423f73364b06266 [7/7] objtool: Add noinstr validation for static branches/calls
config: x86_64-randconfig-012-20241127 (https://download.01.org/0day-ci/archive/20241127/202411272322.ViuHjFki-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411272322.ViuHjFki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411272322.ViuHjFki-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sched_clock_noinstr+0x0: pv_sched_clock: non-RO static call usage in noinstr
   vmlinux.o: warning: objtool: local_clock_noinstr+0x0: __sched_clock_stable: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: default_idle+0x0: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: arch_cpu_idle+0x0: x86_idle: non-RO static call usage in noinstr
   vmlinux.o: warning: objtool: mwait_idle+0x3c: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x78: mds_idle_clear: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: intel_idle+0x4c: mds_idle_clear: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: intel_idle_s2idle+0x5d: mds_idle_clear: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: intel_idle_xstate+0x55: mds_idle_clear: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: intel_idle_ibrs+0x55: mds_idle_clear: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: intel_idle_irq+0x4c: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: acpi_idle_do_entry+0x9: perf_lopwr_cb: non-RO static call usage in noinstr
   vmlinux.o: warning: objtool: acpi_safe_halt+0x11: mds_idle_clear: non-RO static key usage in noinstr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
