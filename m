Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CC154449;
	Sat,  9 Nov 2024 16:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731168774; cv=none; b=YqdmaWdVem+cAsvUxR+eYxygaVyDwttA1h0fHrZvThcaztX2cRqbHDpJsDfpiAHUtTZSA4HeDYMDLqoi9B++1vmQPJ7wD5uVDVzGMFCroWXyS+a5TwTTnZIn4nqc6kw/qXy+yNr5dm7qE9SVIbC1jY3Ng/zEh87ep92BFLfwQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731168774; c=relaxed/simple;
	bh=VMDVqd8TxFUE0AbGld+JOgVsRRdkubjke5J41EAtTYc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJxSt3HBfDjU9wOxksZGlhOdXf0I4SaMXYLaoifzI0NuMBFYp270v58DvRFt9JbQyHbbw+WdOJcWdQppGwUD8/kxNIF/vWCqWA5yFgU8phS9sG9QzKJdrV4NtIo2Han+P7P2B9c2ItiMZNy/O0gKXAaOEFFVMmo2nqPWbSQzls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7CksHap; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7CksHap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731168773; x=1762704773;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VMDVqd8TxFUE0AbGld+JOgVsRRdkubjke5J41EAtTYc=;
  b=c7CksHapFoIdUdEpfPwJxhQW/JoCD9JsNdFwhPg2M3MOjNaa7+NhwxAZ
   DVNYkzMvd43Lwum71+tzqQgesFjK+YGQAhoKv5L9mbzGu3SR4mUUJfExZ
   0vYDWfPguopzowfX4uwSOwiQGmAe2M+hWNGYcWzaiYBf0VrrV+P6H8RNr
   geJ7Qi1snaEdWeeR8loeVqdha4YfOAUu0zN8SnwSUbhQJwnmDKzBX2vpV
   483CLGw+OVcOuZj6PYLSh10bn+9kxTnxLqz4qLHf6D2/ejmx7UtlLPj9w
   IPHNy/zr1FKg58K5ABQL1OPahQHOW2+CDDzpgMVptRmYO0wlSRe34zpun
   g==;
X-CSE-ConnectionGUID: 7aFLeRLjRYeoZZthcnmMzw==
X-CSE-MsgGUID: hU9MmSxqQNSBnRh/A+w8aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30995202"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30995202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 08:12:52 -0800
X-CSE-ConnectionGUID: SWhbRsybQEu0ygwyGvROrw==
X-CSE-MsgGUID: b+a+JSKPRSy7Y4U16KEM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="85640800"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2024 08:12:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9o4u-000sSI-0K;
	Sat, 09 Nov 2024 16:12:48 +0000
Date: Sun, 10 Nov 2024 00:12:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 9470/10559] ld.lld: error:
 vmlinux.a(init/main.o):(function run_init_process: .text.unlikely.+0x18):
 relocation R_RISCV_HI20 out of range: 527980 is not in [-524288, 524287];
 references '.L.str.86'
Message-ID: <202411100028.nlT3lqI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Rong Xu <xur@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Han Shen <shenhan@google.com>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 622240ea8d71a75055399fd4b3cc2b190e44d2e2 [9470/10559] vmlinux.lds.h: Adjust symbol ordering in text output section
config: riscv-randconfig-001-20241108 (https://download.01.org/0day-ci/archive/20241110/202411100028.nlT3lqI1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100028.nlT3lqI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100028.nlT3lqI1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function run_init_process: .text.unlikely.+0x18): relocation R_RISCV_HI20 out of range: 527980 is not in [-524288, 524287]; references '.L.str.86'
   >>> referenced by main.c:1382 (init/main.c:1382)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function run_init_process: .text.unlikely.+0x8e): relocation R_RISCV_HI20 out of range: 528086 is not in [-524288, 524287]; references 'envp_init'
   >>> referenced by main.c:1385 (init/main.c:1385)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function try_to_run_init_process: .text.unlikely.+0xd4): relocation R_RISCV_HI20 out of range: 527980 is not in [-524288, 524287]; references '.L.str.90'
   >>> referenced by main.c:1385 (init/main.c:1385)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_initcall_start_cb: .text.unlikely.+0x100): relocation R_RISCV_HI20 out of range: 527925 is not in [-524288, 524287]; references '.L.str.95'
   >>> referenced by main.c:0 (init/main.c:0)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_initcall_finish_cb: .text.unlikely.+0x13a): relocation R_RISCV_HI20 out of range: 527802 is not in [-524288, 524287]; references '.LCPI63_0'
   >>> referenced by main.c:1386 (init/main.c:1386)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_initcall_finish_cb: .text.unlikely.+0x150): relocation R_RISCV_HI20 out of range: 527980 is not in [-524288, 524287]; references '.L.str.96'
   >>> referenced by main.c:1386 (init/main.c:1386)
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
