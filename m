Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299871;
	b=y5X8TD08x/pRSp7UzddIw8KEQZ96IhAbff0oMkkCYEPOxgBA7xv2Y+kj9A6pAl+hvqoi
	 bZHKe7zMNxxzgTxWWgexjVu4j7gvd/gfUwAirE0oEibKG9apv5HQkPLKeZLJ1be9brsGZ
	 wjM1Fl/81wbhQ82ScPXseiBxOd6wg9+/1u/1EFTKsL9FiYdjBAG61QUuVbpnLe7L1sn+d
	 kiGCj9jzJ9jnBu2SD1Zi/d3H+dFyaqhxvgDvmlP5y76h8Dqj8onCf5HSxggz3T7m9FVMz
	 tfAPkNHy3GE6iiKb5vdd/mur4BftsX6G9C0SB5YgnqCCFSUb5bYti6m8Mb6Jee/GJuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299871;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+nNBvGC3LE+4yf9NqrZuh6V+wkr3F4ReuVmyHCKbe8Y=;
	b=ySgotkytHg8kjXovLA2ySjUsId78kbxAGwsj54zTL7IwAM19aMSdU/3L9R12MKm7jgC+
	 X3VrxgrEIHXXj2Rid1zX7RgIcitc684jI6+sz2qQXaM+1C4yRaA+n9+aTwfuz8/lquaQ9
	 EkWChAA95BG3ILkD4oL+jwcNmEUEgJKwAfegs9q5YEl+e8b0C2eKCfkFtq+Rz8h1T2HW/
	 pLqpyS87mzB8VMheCuzhiLWm1kdVbik9iz3UIaZY04uK+oLXAsz3+okzBvyd/ju3I+fnk
	 D4czLFCR1cFGv1heEAGVkXK/Sp5EQhrRVVU8jGaglvsRA59UCJQdhEB0nWpQZc5aPCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VaT/nUUJ";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B43606A320;
	Thu, 29 Oct 2026 18:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B43606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VaT/nUUJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793299869; x=1824835869;
  h=date:from:to:cc:subject:message-id;
  bh=0hfTqC1AyX/Wji9VKTp4nM+fWucGw5F/TISOAoFUGiw=;
  b=VaT/nUUJIjeRtaXHCeO0JjjUpBJYIRs9Qwkme36k4SyOjwZYgYp4qwTx
   lsaniI8ByMOPirHQtFrZaDot2tbw0zmnNW54JXAFgIEfAaeMraWTRWdWP
   HJrRnv/dJP4dHAkoI7150O2RdlLH/UOcIM4lRhmC+wk2a+j0534U/OXlO
   1gl2d79kuEQla//jeMCo4C5QepZkZcpJHJu6FnLaDyWe41jtTgwAimgRK
   nxuRGminilFoUfrvwAlM5ZUxRE3Eh01yTOKeWdqipl41+Rgapxl4CUN2H
   yWEaDdEu5qusu52OyAuKVCyYrFtjoHEUgLdofIn3aNinPD5NF9QokkAk2
   A==;
X-CSE-ConnectionGUID: P4uhp7ejRCWGsZODBwp/8w==
X-CSE-MsgGUID: hzwcJk/LTtKVP+Qlzoq0wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1933196"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1933196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 11:51:09 -0700
X-CSE-ConnectionGUID: 2aeo37elTHOfGDyPOR9Xug==
X-CSE-MsgGUID: rGl/k9TMR8+jTWuxFpBQnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5310886"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2026 11:51:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMVDN-000000005Jh-1hHo;
	Thu, 29 Oct 2026 18:51:05 +0000
Date: Thu, 29 Oct 2026 19:50:56 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 3/5]
 arch/x86/entry/syscall_32.c:48:2: error: call to undeclared function
 'instrumentation_weak'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610291903.ejeEAxv0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   57a2da426dba48424406ee52c0c931c6d024138a
commit: 2414544a36dd483763751772609d05b965acee6e [3/5] x86_64/entry: Make syscall dispatch noinstr
config: i386-randconfig-2000-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291903.ejeEAxv0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291903.ejeEAxv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291903.ejeEAxv0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/entry/syscall_32.c:48:2: error: call to undeclared function 'instrumentation_weak'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      48 |         instrumentation_weak();
         |         ^
   1 error generated.


vim +/instrumentation_weak +48 arch/x86/entry/syscall_32.c

    44	
    45	/* The unsigned int @nr argument is intentional as it creates denser code in a 64-bit build */
    46	static noinstr long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
    47	{
  > 48		instrumentation_weak();
    49		switch (nr) {
    50		#include <asm/syscalls_32.h>
    51		default: return __ia32_sys_ni_syscall(regs);
    52		}
    53	}
    54	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
