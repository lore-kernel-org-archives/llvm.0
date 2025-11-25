Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013C23D7DA;
	Tue, 25 Nov 2025 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078840; cv=none; b=iaMHVbSsQwl0w9BJCb33PkVz6nSIDsebr8YdyVI38Ss/acEx2GT0D7jeHGw+KrugZfyHBG1uEwA6pJU2KPMXp2VT7R+x4StmqriFKQ70UfpkfN/0Imnp4YFnZlp9rz1vuJlSaNm5JyfOfZn1NchUqf8j1iunxaHtZ24Hj5bhkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078840; c=relaxed/simple;
	bh=kVQR02RTH7mH8PDMN1j8+pX3BxhuKzCcj0DKs6OSfpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8xE3KMqSAJ51G1HWugQmt2SHmPfGfk/o9HQvrfzCyJCmAwcmTxzGjIMHDlCOK+wHCfwH9cxeu841sx14ASrCBgKUdQX6ILOEKlACro+zVFf7uEHo/0ORcAcoCWvQwJ7iUStuDfpyzOxvkR/fla/i8iCRmbOEdKbM+97GZ4bAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9lLkQBq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9lLkQBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764078839; x=1795614839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kVQR02RTH7mH8PDMN1j8+pX3BxhuKzCcj0DKs6OSfpM=;
  b=D9lLkQBq0wscV9FG4M9gjDt9P+lz/+KHFJNnThhlpG61x7uAeCH2Jhr5
   +Q1SayyOpKaSEmj7TO0XYOcjpRviHEfuRYCJ6mfj5G1xo5WF8OBSJQIkB
   SuDfkARR6c+vqQoQNZhsCvZzLjUo+Y/hvRknHkIiyPPRmb6gOdbn4NoNW
   Mci00EP5bkk6PAn8UNzTWNn+frRRuHiMPC9+6dmLo4Hhs4aiiApFe9KyN
   bY8wfU0zj954zATm/aOiIjoHEhX57d0vB97hd/rd6Pm+W0JfJMZkIHEFe
   0i47s8by4cWlMMeT3Qpb9Fm6vn7QqJ4wga83YGGHXo/+jsPw/1oOQSrlJ
   w==;
X-CSE-ConnectionGUID: O4isPN5NTuOZJOpHBQGRTg==
X-CSE-MsgGUID: +O5QmnB+QDa78jv1K2+BEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802476"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65802476"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:53:49 -0800
X-CSE-ConnectionGUID: U9pX5sqwSgOFNRrr/cZRog==
X-CSE-MsgGUID: gsRXyMysSs+klHNG5SA9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="215991425"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2025 05:53:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNtUH-000000001qd-07gd;
	Tue, 25 Nov 2025 13:53:45 +0000
Date: Tue, 25 Nov 2025 21:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:randomize-kstack-siphash 1/1]
 arch/s390/include/asm/entry-common.h:57:2: error: call to undeclared
 function 'choose_random_kstack_offset'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202511252158.AzXWFYsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git randomize-kstack-siphash
head:   0783912db6e30339d55a5dc7eb6a696b440bedb3
commit: 0783912db6e30339d55a5dc7eb6a696b440bedb3 [1/1] HACK: use siphash to generate kstack offset per-task
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511252158.AzXWFYsv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252158.AzXWFYsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252158.AzXWFYsv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/traps.c:24:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:12:
>> arch/s390/include/asm/entry-common.h:57:2: error: call to undeclared function 'choose_random_kstack_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         choose_random_kstack_offset(get_tod_clock_fast());
         |         ^
   1 error generated.
--
   In file included from arch/s390/kernel/syscall.c:35:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:12:
>> arch/s390/include/asm/entry-common.h:57:2: error: call to undeclared function 'choose_random_kstack_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         choose_random_kstack_offset(get_tod_clock_fast());
         |         ^
>> arch/s390/kernel/syscall.c:89:2: error: call to undeclared function 'add_random_kstack_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      89 |         add_random_kstack_offset();
         |         ^
   2 errors generated.


vim +/choose_random_kstack_offset +57 arch/s390/include/asm/entry-common.h

56e62a73702836 Sven Schnelle 2020-11-21  53  
bae1cd368c45d1 Sven Schnelle 2021-04-29  54  static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
bae1cd368c45d1 Sven Schnelle 2021-04-29  55  						  unsigned long ti_work)
bae1cd368c45d1 Sven Schnelle 2021-04-29  56  {
6db1208bf95b4c Kees Cook     2024-06-19 @57  	choose_random_kstack_offset(get_tod_clock_fast());
bae1cd368c45d1 Sven Schnelle 2021-04-29  58  }
bae1cd368c45d1 Sven Schnelle 2021-04-29  59  

:::::: The code at line 57 was first introduced by commit
:::::: 6db1208bf95b4c091897b597c415e11edeab2e2d randomize_kstack: Remove non-functional per-arch entropy filtering

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Kees Cook <kees@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
