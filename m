Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CCD5F541;
	Sat,  3 Feb 2024 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706975404; cv=none; b=CKiFjmNbCM5XZeJQggYtgT86NMlKQ4PUQ6pv9AQtxwQzRnCJS6yJ4vAa18mEelOFavXyJR2kAWtV+xTUUPIoq8TnixBmbPFX8LTqkfPhd2Dn8cQeV+27vuWZ8i0DXVfurS17LONRHQRgXK/cc0lFSAQshF5Gsv9IDXLud19Xero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706975404; c=relaxed/simple;
	bh=eEIlu6iOpWDSGBxXYedMj2U9Fb+5ZdsArlnPevOF2Js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZ8q0tqQrMQ9/ZouPL9lleoM7EFg4NRTnwJUNQjIuCh4nYQDF98VzdJY7GU+3+xwhkE+6I382xRvyCBsqM0SlCMlQaLTL/tOXvN0mwYy2ILderu+q0CkRarj2MB1Ek4WsQkn4uPcw1ZeyYYJZBwtOXOw8MUdnh3FCrRHlXEERJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOS1I+qA; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOS1I+qA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706975402; x=1738511402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eEIlu6iOpWDSGBxXYedMj2U9Fb+5ZdsArlnPevOF2Js=;
  b=UOS1I+qAObo2HIpH3DQApnd7DAcG9Yj3pR00CU35NquYrxo2XvH7VNeV
   fUwkgRmm0Sq3Dnylz6vdzOasrDkxYNBiKXeweGmqmHJbdwPDPcad4tji5
   FTFV8JTyiOJU5X9qPzct6HdAUQnuNgnCDkaTQHGei3qxV+vZ1YfzcqbRX
   O+3OYzN5xJgpTSCTK4ZziEXbi3HQ9HHJxKQuK/vKZfMcWg+DNINRYbbFU
   Webg7KLCBsnYHrd926b/jVYo6NrnPga0f0qSj5KB2NmrGjvwXx64S/YoS
   pDgt04CABfTIhJ33l9Ff6/eE3gqgvFHEgq2q7XubpmhG8mjHAOEKegDak
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="435465051"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="435465051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 07:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="338669"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2024 07:50:01 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWIHF-0005FS-2W;
	Sat, 03 Feb 2024 15:49:57 +0000
Date: Sat, 3 Feb 2024 23:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_flush_icache_all_fix_v1 18/18]
 arch/riscv/kernel/hibernate.c:156:20: error: too few arguments to function
 call, single argument 'use_ipi' was not specified
Message-ID: <202402032344.QSafQm0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_flush_icache_all_fix_v1
head:   9648694de57e4a30580faa2b4cc178c7d7f72511
commit: 9648694de57e4a30580faa2b4cc178c7d7f72511 [18/18] RISC-V: Don't use IPIs in flush_icache_all() when patching text
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402032344.QSafQm0x-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032344.QSafQm0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032344.QSafQm0x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/hibernate.c:156:20: error: too few arguments to function call, single argument 'use_ipi' was not specified
     156 |                 flush_icache_all();
         |                 ~~~~~~~~~~~~~~~~ ^
   arch/riscv/include/asm/cacheflush.h:52:6: note: 'flush_icache_all' declared here
      52 | void flush_icache_all(bool use_ipi);
         |      ^                ~~~~~~~~~~~~
   1 error generated.


vim +/use_ipi +156 arch/riscv/kernel/hibernate.c

c0317210012e3b Sia Jee Heng 2023-03-30  144  
c0317210012e3b Sia Jee Heng 2023-03-30  145  int swsusp_arch_suspend(void)
c0317210012e3b Sia Jee Heng 2023-03-30  146  {
c0317210012e3b Sia Jee Heng 2023-03-30  147  	int ret = 0;
c0317210012e3b Sia Jee Heng 2023-03-30  148  
c0317210012e3b Sia Jee Heng 2023-03-30  149  	if (__cpu_suspend_enter(hibernate_cpu_context)) {
c0317210012e3b Sia Jee Heng 2023-03-30  150  		sleep_cpu = smp_processor_id();
c0317210012e3b Sia Jee Heng 2023-03-30  151  		suspend_save_csrs(hibernate_cpu_context);
c0317210012e3b Sia Jee Heng 2023-03-30  152  		ret = swsusp_save();
c0317210012e3b Sia Jee Heng 2023-03-30  153  	} else {
c0317210012e3b Sia Jee Heng 2023-03-30  154  		suspend_restore_csrs(hibernate_cpu_context);
c0317210012e3b Sia Jee Heng 2023-03-30  155  		flush_tlb_all();
c0317210012e3b Sia Jee Heng 2023-03-30 @156  		flush_icache_all();
c0317210012e3b Sia Jee Heng 2023-03-30  157  
c0317210012e3b Sia Jee Heng 2023-03-30  158  		/*
c0317210012e3b Sia Jee Heng 2023-03-30  159  		 * Tell the hibernation core that we've just restored the memory.
c0317210012e3b Sia Jee Heng 2023-03-30  160  		 */
c0317210012e3b Sia Jee Heng 2023-03-30  161  		in_suspend = 0;
c0317210012e3b Sia Jee Heng 2023-03-30  162  		sleep_cpu = -EINVAL;
c0317210012e3b Sia Jee Heng 2023-03-30  163  	}
c0317210012e3b Sia Jee Heng 2023-03-30  164  
c0317210012e3b Sia Jee Heng 2023-03-30  165  	return ret;
c0317210012e3b Sia Jee Heng 2023-03-30  166  }
c0317210012e3b Sia Jee Heng 2023-03-30  167  

:::::: The code at line 156 was first introduced by commit
:::::: c0317210012e3b985779ddd92a7c5db8424e1e97 RISC-V: Add arch functions to support hibernation/suspend-to-disk

:::::: TO: Sia Jee Heng <jeeheng.sia@starfivetech.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
