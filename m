Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3222483CD1;
	Fri, 19 Apr 2024 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713529268; cv=none; b=IjQ2Af5HYE0MBayTOPy45bHZM9cigYuZDw+7b/xp/yJrgeqvaP6jgT1PSM8s11ET490+3aBRK83w5h319SJgADzGcSJuj1g5FER4a8G/hZtVDvS0vjhWBBL8qZ+Io4sMFuF2PWZPxLWKdTiUnNgE8j/cSdKmPm1g5vyG5dg8DYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713529268; c=relaxed/simple;
	bh=uhdxFZeWKaT44wbbmePzXoHI40n5M1uKEIqSSEAisDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+IUZIWTe0XIcFtYqrYdBiW27z4yctwHskVin52DHU2O6W/bn4Oh/OYfLgdzCtvWqRPd9SJK8CQd2cksbzN4VA6thZf1NeAR+pH5Q51Waac2Pwfll4+NJBBLcvDBMhDFk06FtrACjaPLoHgo4EyrDoZro0lmP2YHRhNSwh5FMeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5PIeDna; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5PIeDna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713529266; x=1745065266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uhdxFZeWKaT44wbbmePzXoHI40n5M1uKEIqSSEAisDM=;
  b=e5PIeDnatB4QRMOUYFy0CzdW77NbEdHSV+lzG64tQegnqXoDV/m1MHbL
   c8+XjWhM1WpTWfhdIVI2WJwP5QJNj3XCg16jPuEmj4NebKS00Im+eyqsT
   hwHla/L/wWqsNKKDb6Pr6Sed0eyKkxGUuvTAD/ET9H195Fzq2z0UdUmi3
   YVPBHKEumeRN8HS1d2MvhSH8DTYbvWHTaoRVOawXk3NGYssEKDxGBf4wO
   +Zl9UE+jk7ixwAxKW2ZHOP7/Pjj1J1Y9sC0eJlJe4f/PhfebUjG6YlaIq
   b2IbLEsy1X4XwwqA70Joq3Yq28eNQxtTKn+ItKjypN+caBOcGOOs0GHln
   A==;
X-CSE-ConnectionGUID: 0mIGwV0GQGejrf2NRc7hWg==
X-CSE-MsgGUID: K97pe3c7RSK/BU56qzEYlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8987627"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8987627"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 05:20:52 -0700
X-CSE-ConnectionGUID: PzRNU5bcRY2aTO8P0Tv2XA==
X-CSE-MsgGUID: IX0i+GmwSs2bz+hgJy7Uxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="28091630"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Apr 2024 05:20:52 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxnEX-000A1W-1s;
	Fri, 19 Apr 2024 12:20:49 +0000
Date: Fri, 19 Apr 2024 20:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:bhi-fixes 5/5]
 ./arch/x86/include/generated/asm/syscalls_64.h:61:1: error: type specifier
 missing, defaults to 'int'; ISO C99 and later do not support implicit int
Message-ID: <202404192021.XXwb0Rqd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git bhi-fixes
head:   477bedf59d1fe82d8ad1014e8e7f4a50d4e68c1f
commit: 477bedf59d1fe82d8ad1014e8e7f4a50d4e68c1f [5/5] fix
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240419/202404192021.XXwb0Rqd-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404192021.XXwb0Rqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404192021.XXwb0Rqd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/um/sys_call_table_64.c:22:
   ./arch/x86/include/generated/asm/syscalls_64.h:61:20: error: expected parameter declarator
   __SYSCALL_NORETURN(60, sys_exit)
                      ^
   ./arch/x86/include/generated/asm/syscalls_64.h:61:20: error: expected ')'
   ./arch/x86/include/generated/asm/syscalls_64.h:61:19: note: to match this '('
   __SYSCALL_NORETURN(60, sys_exit)
                     ^
>> ./arch/x86/include/generated/asm/syscalls_64.h:61:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Werror,-Wimplicit-int]
   __SYSCALL_NORETURN(60, sys_exit)
   ^
   int
   ./arch/x86/include/generated/asm/syscalls_64.h:61:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   __SYSCALL_NORETURN(60, sys_exit)
                     ^
                                  void
   ./arch/x86/include/generated/asm/syscalls_64.h:61:33: error: expected ';' after top level declarator
   __SYSCALL_NORETURN(60, sys_exit)
                                   ^
                                   ;
   ./arch/x86/include/generated/asm/syscalls_64.h:232:20: error: expected parameter declarator
   __SYSCALL_NORETURN(231, sys_exit_group)
                      ^
   ./arch/x86/include/generated/asm/syscalls_64.h:232:20: error: expected ')'
   ./arch/x86/include/generated/asm/syscalls_64.h:232:19: note: to match this '('
   __SYSCALL_NORETURN(231, sys_exit_group)
                     ^
   ./arch/x86/include/generated/asm/syscalls_64.h:232:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Werror,-Wimplicit-int]
   __SYSCALL_NORETURN(231, sys_exit_group)
   ^
   int
   ./arch/x86/include/generated/asm/syscalls_64.h:232:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   __SYSCALL_NORETURN(231, sys_exit_group)
                     ^
                                         void
   ./arch/x86/include/generated/asm/syscalls_64.h:232:40: error: expected ';' after top level declarator
   __SYSCALL_NORETURN(231, sys_exit_group)
                                          ^
                                          ;
   In file included from arch/x86/um/sys_call_table_64.c:30:
   ./arch/x86/include/generated/asm/syscalls_64.h:61:24: error: use of undeclared identifier 'sys_exit'
   __SYSCALL_NORETURN(60, sys_exit)
                          ^
   arch/x86/um/sys_call_table_64.c:33:32: error: invalid application of 'sizeof' to an incomplete type 'const sys_call_ptr_t[]' (aka 'long (*const[])(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long)')
   int syscall_table_size = sizeof(sys_call_table);
                                  ^~~~~~~~~~~~~~~~
   12 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
