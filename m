Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69340263F4A;
	Tue, 11 Mar 2025 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719099; cv=none; b=J1STtRjHPUI75J4Z3raT4Oz8ULuC7waC7KfRUTREXZIEvbOgUV/yXOv1t5Anpuape4/e2T8KXRQX53zYWUb+FdPGS6/W+UDiYgE80ob8Zl9t7r2fmD4PHAS6IR7EvC3ElDvSdJUOoBxpnEr6KurRY5FtcdqiokxFoI/SesednAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719099; c=relaxed/simple;
	bh=0g1jCi5NVQXMubGoM5yAkKgLfclqBv+8eH6YzJG9i4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fNxygdrRITsmAHEGR5AydRT109JySjT78aJ9fZOLSgT6en0M+Lc7PZSct0qBzugG0+jBMHVrY+6c4muG9T9izu4enBEGdCvgT+Gy+c5vz62pB5VQ9PrVHK5KzCAwzu3Z62wbNsiU6L9EQddNeca9LaPc9lh7S3JheAuKE0mDqPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZD+3II92; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZD+3II92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741719097; x=1773255097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0g1jCi5NVQXMubGoM5yAkKgLfclqBv+8eH6YzJG9i4w=;
  b=ZD+3II92cCnYhMNwx9Ew44DyHTUd4/HoDyiO6BlJfxN9Jh0u5hCf1JWz
   bb663elgFR4MISdiXiycctDNTgoJaQd9YObNWb4uEBYbJR7du/KJzwWb1
   Woz6LhhRsKa54RfO1xohvwVPmcTVgElE7mPRXWY9PUpKRR2lvopJaQ0sU
   NhsX43++o3/9Gg05cPR6U8004/NgSYTrNI2giodFJcSlsV/8J5UDKedlt
   OUksqM/51h0zyJdK+u7TdpnEpBmJYI3MYTwJQPiQ5PQ09sFkE+/XZhEvf
   qNT9memVlmEfqK7gJt/EtUu2S9W2kM/cB3GRZAXQZkieko6MMjtSQFRpA
   g==;
X-CSE-ConnectionGUID: RklVcqpwR8SoWGdVhRWkaw==
X-CSE-MsgGUID: PujLgW9OQXeH02kEIrzlNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42628797"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="42628797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 11:51:37 -0700
X-CSE-ConnectionGUID: fpTPj/xLTo2kxCwUX4Pfnw==
X-CSE-MsgGUID: 3wC0oPQpR7WQwPShptVDFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="120636712"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2025 11:51:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts4hO-0007k9-0J;
	Tue, 11 Mar 2025 18:51:30 +0000
Date: Wed, 12 Mar 2025 02:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:16: error: implicit declaration of
 function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'?
Message-ID: <202503120216.Q70Jt5uf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Puranjay,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d872d51bc9d7b899c1f61534e3dbde72613f627
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   10 months ago
config: riscv-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120216.Q70Jt5uf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120216.Q70Jt5uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120216.Q70Jt5uf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:138:16: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Wimplicit-function-declaration]
     138 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                ftrace_get_regs
>> include/linux/ftrace.h:138:16: error: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
     138 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=834438071
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=834438071
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=834438071
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=834438071
   make: Target 'prepare' not remade because of errors.


vim +138 include/linux/ftrace.h

d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  132) 
d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  133) static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  134) {
d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  135) 	if (!fregs)
d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  136) 		return NULL;
d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  137) 
02a474ca266a47e Steven Rostedt (VMware  2020-10-27 @138) 	return arch_ftrace_get_regs(fregs);
d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  139) }
d19ad0775dcd64b Steven Rostedt (VMware  2020-10-28  140) 

:::::: The code at line 138 was first introduced by commit
:::::: 02a474ca266a47ea8f4d5a11f4ffa120f83730ad ftrace/x86: Allow for arguments to be passed in to ftrace_regs by default

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
