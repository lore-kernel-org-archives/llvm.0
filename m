Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3F2BB06;
	Fri,  5 Jul 2024 02:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720146898; cv=none; b=KrGdimRWE/FGY6LR7nQOHP3p4aMuMjnW4mbEpwuBht1slRVJQaypxTYNJMZ13HEJ3lQF/+0f5Zi2O0PYhuFFEz0IqTBtaoMaSywn9IGfdnvWBe3XVfjJHctCTg43KOXhYgAGPHP3RqR8SliPBBAG699c71YyVi3jDikSxkHIDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720146898; c=relaxed/simple;
	bh=rkVF/DAXfPHy18XqSPe0Nbqx52ncchR5iUUAGbwAGwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VkK23ggt94z0hSAj2n5ItnA1jg9CSeY0Bgdhrfha3LJurZh4Mcb/9so/V8cKzkA0HI51sEKOpIZFeoKQDYjxbqwieSLEPuQWA7/a0wehfE52ZnkDMnHYIieIA8emMuUnctGel+rabPlbIQ6VaOvy5WJFVi6ZS5YHMJwYj6wpep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDG5lisa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDG5lisa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720146896; x=1751682896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkVF/DAXfPHy18XqSPe0Nbqx52ncchR5iUUAGbwAGwQ=;
  b=cDG5lisagquHZxI8IXla3h6SFI858eM9oUnb+hZdBulfK1yNNHEBEmvX
   6BiFnO2VxMHtGmICfrEl96cBxcRcUnqOCPKBfpXpg3I3ULmkB20mZtoy+
   4m6jF+MwoC6YiolIPIorSmqGfg0JiuaXBJ3t3+u60LKBnjwwG/X7zCKZ+
   PLsWqJAlF8uMW4t642gSCwtAn7huZlEfDXQ1WZmSSiPIbmSkEY5l5gK/O
   ZfSyS1BLcQOmXTOCVWTpSgvdszvJQbz6S7K4J+wWT6FVHD/J1rdU4qh0t
   jRvjuAcgBXxDiaOSRSdfps+2fVLrTWP3wVBOlv1cuchxoRsxrnA9DLWUb
   A==;
X-CSE-ConnectionGUID: rvGqI5K+TL2bIIXKEHe4lw==
X-CSE-MsgGUID: EVloE7E/QyuBPsxIJcBb6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42853938"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="42853938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 19:34:56 -0700
X-CSE-ConnectionGUID: HkL/BSCqSCS9u/h6ZSz7JA==
X-CSE-MsgGUID: Jqb3rm9HQnaVCRSBUWSnhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47394565"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2024 19:34:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPYmi-000RoA-1L;
	Fri, 05 Jul 2024 02:34:52 +0000
Date: Fri, 5 Jul 2024 10:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 11/17]
 arch/arm64/kernel/signal32.c:454:24: error: use of undeclared identifier
 '__NR_compat32_restart_syscall'
Message-ID: <202407051021.yeRUriTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   25862feffc419d0d195fdb118ae11b9c11b437d3
commit: a4ffc1f764d6cb9456b93c264c6fce25bb38d7aa [11/17] arm64: rework compat syscall macros
config: arm64-randconfig-001-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051021.yeRUriTc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051021.yeRUriTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051021.yeRUriTc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/signal32.c:12:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/kernel/signal32.c:454:24: error: use of undeclared identifier '__NR_compat32_restart_syscall'
     454 |        regs->regs[7] = __NR_compat32_restart_syscall;
         |                        ^
   1 warning and 1 error generated.


vim +/__NR_compat32_restart_syscall +454 arch/arm64/kernel/signal32.c

   451	
   452	void compat_setup_restart_syscall(struct pt_regs *regs)
   453	{
 > 454	       regs->regs[7] = __NR_compat32_restart_syscall;
   455	}
   456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
