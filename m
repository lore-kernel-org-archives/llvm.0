Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C452BDC3D;
	Mon, 12 Jan 2026 22:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258176; cv=none; b=CRRlIs80JCq6ikpTjXKQny32rWRmrI8Q5rmneyDL+BEO3iAeRvO7zrHzjAe6ELZnK7Z/LW6X12MdCcuyikw+QNvYDmh2CjDNAvV2R5avV4GrkrluwZIu5NdgH7V4ckkJdP7WtMLi+5FOoRQ1NhWnK2wMbKEaWU0uUFIak6i7IQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258176; c=relaxed/simple;
	bh=qdlAi7Xd86aU0w//s/dluMuWX1c843d/fyoLkDm3CYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O+7Gzlv1dWcu1ZW+y8C+jhOaWwtDpeGzCyfjG45PCKQfrHFSWyQ82lngnrPYUYtZs5MqRcX7ix9MN0B1H3I3JC9ukeY7sfX3nkIzhY6MC3jiMfswvVtC/rIPgbZbQQiWs+/RMl+nQy4ZbeCQatkoM5IGx6pH+OupRWy8f0LQMkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPsv+Ubt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPsv+Ubt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768258164; x=1799794164;
  h=date:from:to:cc:subject:message-id;
  bh=qdlAi7Xd86aU0w//s/dluMuWX1c843d/fyoLkDm3CYc=;
  b=HPsv+UbtW3hW73zowKu5V7nqYh0jkttH7WHgLt4QZlBhfvDAUn7ksCVW
   1J8t5tLMHmkGZ2pHs//nFM7I/3BEHT02oHRcpFjbENmhE+hXTpJVF3IFT
   OB3B1P8ypUtsH1vKCa03fmUJTnzFvMkgJ5R/9jkzw006dTvYX5Lj2ZJ5h
   bVvMrYOskc2WnRYg8AJOzCG0dD79bTfAGsffVRSsS45ZmPZRFuB5Ce8N0
   X1z92PcEshuWd9KG2VJ2Wyn1CZ7Vx99BshIGoBafCaRqzBD1yl0SlkQS4
   7uFfpbEj2oIp97ozmWq9A/l6TL9+KTSgCoDdu8hJVW+1tmMjIkLkWh6Yu
   Q==;
X-CSE-ConnectionGUID: D515VCAFRdGeS4A8nb0Frw==
X-CSE-MsgGUID: GfdbMOr8QnyRsQQm8+82BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69439084"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69439084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 14:49:23 -0800
X-CSE-ConnectionGUID: +DJjZPgNTkOMGTLDuFCvww==
X-CSE-MsgGUID: +twLTypjTrCn46F0A6Q6Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204867843"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2026 14:49:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfQit-00000000Dx7-0j4E;
	Mon, 12 Jan 2026 22:49:19 +0000
Date: Tue, 13 Jan 2026 06:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/urgent 2/2] arch/x86/mm/extable.c:414:7:
 error: call to undeclared function 'handle_bug'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202601130649.JANvnxPo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   695d896472d6543523de43110b0016b8b4469643
commit: 695d896472d6543523de43110b0016b8b4469643 [2/2] x86_64/bug: Handle __WARN_printf() trap in early_fixup_exception()
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260113/202601130649.JANvnxPo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130649.JANvnxPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130649.JANvnxPo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/extable.c:414:7: error: call to undeclared function 'handle_bug'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     414 |                 if (handle_bug(regs))
         |                     ^
   1 error generated.


vim +/handle_bug +414 arch/x86/mm/extable.c

   376	
   377	/* Restricted version used during very early boot */
   378	void __init early_fixup_exception(struct pt_regs *regs, int trapnr)
   379	{
   380		/* Ignore early NMIs. */
   381		if (trapnr == X86_TRAP_NMI)
   382			return;
   383	
   384		if (early_recursion_flag > 2)
   385			goto halt_loop;
   386	
   387		/*
   388		 * Old CPUs leave the high bits of CS on the stack
   389		 * undefined.  I'm not sure which CPUs do this, but at least
   390		 * the 486 DX works this way.
   391		 * Xen pv domains are not using the default __KERNEL_CS.
   392		 */
   393		if (!xen_pv_domain() && regs->cs != __KERNEL_CS)
   394			goto fail;
   395	
   396		/*
   397		 * The full exception fixup machinery is available as soon as
   398		 * the early IDT is loaded.  This means that it is the
   399		 * responsibility of extable users to either function correctly
   400		 * when handlers are invoked early or to simply avoid causing
   401		 * exceptions before they're ready to handle them.
   402		 *
   403		 * This is better than filtering which handlers can be used,
   404		 * because refusing to call a handler here is guaranteed to
   405		 * result in a hard-to-debug panic.
   406		 *
   407		 * Keep in mind that not all vectors actually get here.  Early
   408		 * page faults, for example, are special.
   409		 */
   410		if (fixup_exception(regs, trapnr, regs->orig_ax, 0))
   411			return;
   412	
   413		if (trapnr == X86_TRAP_UD) {
 > 414			if (handle_bug(regs))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
