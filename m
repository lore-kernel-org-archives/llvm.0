Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A37AD35;
	Fri, 19 Apr 2024 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713529255; cv=none; b=Co8ShAb6EnfNXvMPeUsFfDoo9umOUY4S/0zKpMxLMSvaWhWlpQyhaVpnTTLttYs3g4pC6i8ZDwblgYnh/uNqOiXX/ZxNCOAd4eVZJJBjPCp/jA1oyf18/NA8G8WoXFwUy5Fd/86Xor2qEwNecxV4wn+QdfeHtjoIjq22Xu0BCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713529255; c=relaxed/simple;
	bh=6xBnzCLa//+DsQYGaLlm/n5/5rucgxU+termpR/7ER4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhYDOaLqusHj4vTILEpj2FH7ZbXuAAfkzfRJ88jRPC2+QJp4svUANitHKbQ28OEM0rirS1/zK2ZfkabZO9qjmIo7PVp3BUWydtXH2ReJVgMGoZaQkoAKuqH6BjuDYn5rpFKNALNVfCK2izz1IK9PimMHoSCw8cFSD0xBvrrViBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMHs48tP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMHs48tP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713529253; x=1745065253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xBnzCLa//+DsQYGaLlm/n5/5rucgxU+termpR/7ER4=;
  b=fMHs48tPqYbAeqP3tBc30njKiJXi+CQzEmHb8bS6fWBj5OWklxMVMKHg
   eVHYsLnBsCg9k3i6We50HXdGhJ4eJkJ34QSBm2Atp3PWVOrv9ixmJvoh3
   QSURwE+J+1A78iTIKEL+6BVVhM3bSoOuWMgGja0DVkVcWW2V2Y0VBItRw
   KBYmurEzY3kKZEgghpqzVjhYdwerbex5vjLX45FeG2lNDbGjrkofDnElp
   jvuCQZ1FhhA+9MFJqfRWyl1IYXndtQQ9PUZeG5E2es15nwEYEDDnIldJx
   afSm/O1Vt6fgdfRumznpoy42uu+WdE8t+mtffJjpomfs6JhGSgafP1nr+
   A==;
X-CSE-ConnectionGUID: vfAbhNbwTDekFD8Ae+fzQQ==
X-CSE-MsgGUID: OSNe7zG5SneLJTT2Bv9/AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12960600"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12960600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 05:20:53 -0700
X-CSE-ConnectionGUID: JyDrWnyhTIO0aeYfPzatYg==
X-CSE-MsgGUID: YnbtquaRT36l7s2BlMJS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23936711"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Apr 2024 05:20:51 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxnEX-000A1U-1l;
	Fri, 19 Apr 2024 12:20:49 +0000
Date: Fri, 19 Apr 2024 20:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:bhi-fixes 5/5]
 ./arch/x86/include/generated/asm/syscalls_64.h:61:24: error: use of
 undeclared identifier 'sys_exit'
Message-ID: <202404192055.POZkulIt-lkp@intel.com>
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
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240419/202404192055.POZkulIt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404192055.POZkulIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404192055.POZkulIt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/um/sys_call_table_64.c:22:
>> ./arch/x86/include/generated/asm/syscalls_64.h:61:20: error: expected parameter declarator
      61 | __SYSCALL_NORETURN(60, sys_exit)
         |                    ^
>> ./arch/x86/include/generated/asm/syscalls_64.h:61:20: error: expected ')'
   ./arch/x86/include/generated/asm/syscalls_64.h:61:19: note: to match this '('
      61 | __SYSCALL_NORETURN(60, sys_exit)
         |                   ^
>> ./arch/x86/include/generated/asm/syscalls_64.h:61:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      61 | __SYSCALL_NORETURN(60, sys_exit)
         | ^
         | int
>> ./arch/x86/include/generated/asm/syscalls_64.h:61:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      61 | __SYSCALL_NORETURN(60, sys_exit)
         |                   ^            
         |                                void
>> ./arch/x86/include/generated/asm/syscalls_64.h:61:33: error: expected ';' after top level declarator
      61 | __SYSCALL_NORETURN(60, sys_exit)
         |                                 ^
         |                                 ;
   ./arch/x86/include/generated/asm/syscalls_64.h:232:20: error: expected parameter declarator
     232 | __SYSCALL_NORETURN(231, sys_exit_group)
         |                    ^
   ./arch/x86/include/generated/asm/syscalls_64.h:232:20: error: expected ')'
   ./arch/x86/include/generated/asm/syscalls_64.h:232:19: note: to match this '('
     232 | __SYSCALL_NORETURN(231, sys_exit_group)
         |                   ^
   ./arch/x86/include/generated/asm/syscalls_64.h:232:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     232 | __SYSCALL_NORETURN(231, sys_exit_group)
         | ^
         | int
   ./arch/x86/include/generated/asm/syscalls_64.h:232:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     232 | __SYSCALL_NORETURN(231, sys_exit_group)
         |                   ^                   
         |                                       void
   ./arch/x86/include/generated/asm/syscalls_64.h:232:40: error: expected ';' after top level declarator
     232 | __SYSCALL_NORETURN(231, sys_exit_group)
         |                                        ^
         |                                        ;
   In file included from arch/x86/um/sys_call_table_64.c:30:
>> ./arch/x86/include/generated/asm/syscalls_64.h:61:24: error: use of undeclared identifier 'sys_exit'
      61 | __SYSCALL_NORETURN(60, sys_exit)
         |                        ^
>> arch/x86/um/sys_call_table_64.c:33:32: error: invalid application of 'sizeof' to an incomplete type 'const sys_call_ptr_t[]' (aka 'long (*const[])(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long)')
      33 | int syscall_table_size = sizeof(sys_call_table);
         |                                ^~~~~~~~~~~~~~~~
   12 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
