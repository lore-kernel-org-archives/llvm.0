Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E11E376C;
	Wed, 15 Oct 2025 00:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760489979; cv=none; b=EvXr7AK91BZlSrfUP/zA67P6LB0i6oLThmEuARu2c6UakNH5NfM3UQ+9wJU+jVYJKtOy2nq9Pxcyf5W80vsd7Born4v4WxgfxbtVLBpKnIXWByboI72OF5NehrOwp9lTKkG/foN1cbvDO7YgNzkqFmiut9AE722RaYmAYes6rWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760489979; c=relaxed/simple;
	bh=Q1fbDyIjqeakGas54iko0lTkoqqWOkTYGl7Ig4gaC2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXlw1eMFmvbOOpDoOapJTf2eRhpXB522BUUfgRqrhTN2roRcaOQGylC4s4a3edAgBwvl0/CFd1KlpB4JodDNbnD3SBy+vnC1fOEUwYtsYzxe2yi2TQTVmvXGUc93oX5pkHUg2gJbYt/dhsu4iIWWbAQ16R8pStSaIKk/J3AcDaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyPTfdcw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyPTfdcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760489978; x=1792025978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1fbDyIjqeakGas54iko0lTkoqqWOkTYGl7Ig4gaC2A=;
  b=gyPTfdcw7X7+D/boKJCyd1aESUkaaQk35s/pBF9tEghUIBa9i7Wby/UW
   6ZlR+I/AXAjciKn7fnJNThkjPA9FIXl4OjlLeDVpHZ0StqGJm7JaU5m4f
   BO1B5tFC6ZECbiZ6lgo42cDETGm7IY7yk9TF7kqDKIfWXZARud6pqB+rU
   YEEQIOXvcPDd6o+IXSh8YPVKOGTfENRps5AJrubnK4SWb56ThE/2ahoq2
   JGZ3zjPEKtdtfnwup5gNFLh8yyMojPeOXcJnLvZkAxU7LfkOijbZAFbHS
   Z0XLm+oxj3mLDsz7rPxNijJdaUMGTljTZvXgH0DIMc3Rsxp/TuKGDMMhf
   g==;
X-CSE-ConnectionGUID: g4V9Ac/WS1W4QI+KWbYaLg==
X-CSE-MsgGUID: MVWD83dhTrq1B/QX4p7K6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62694058"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62694058"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 17:59:36 -0700
X-CSE-ConnectionGUID: MJqVRDj2QDOHR3aqCHmTmQ==
X-CSE-MsgGUID: bgfZj1WwTzW8PxaiPJGeAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="187117736"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2025 17:59:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8prY-0003K1-0Y;
	Wed, 15 Oct 2025 00:59:32 +0000
Date: Wed, 15 Oct 2025 08:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:for-kernelci 6/13] include/linux/pgtable.h:237:2:
 error: call to undeclared function 'arch_enter_lazy_mmu_mode'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202510150845.bOLBMSFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kevin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git for-kernelci
head:   cde5afc166019bb0b077b88d78b3706ede96628a
commit: 3763e0f7bacf2669411cf2e580ca62e64eafb813 [6/13] mm: introduce generic lazy_mmu helpers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251015/202510150845.bOLBMSFb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150845.bOLBMSFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150845.bOLBMSFb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:31:
>> include/linux/pgtable.h:237:2: error: call to undeclared function 'arch_enter_lazy_mmu_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     237 |         arch_enter_lazy_mmu_mode();
         |         ^
>> include/linux/pgtable.h:242:2: error: call to undeclared function 'arch_leave_lazy_mmu_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     242 |         arch_leave_lazy_mmu_mode();
         |         ^
   include/linux/pgtable.h:247:2: error: call to undeclared function 'arch_leave_lazy_mmu_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     247 |         arch_leave_lazy_mmu_mode();
         |         ^
   include/linux/pgtable.h:252:2: error: call to undeclared function 'arch_enter_lazy_mmu_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |         arch_enter_lazy_mmu_mode();
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/boot/startup/sme.c:38:
   In file included from include/linux/mm.h:36:


vim +/arch_enter_lazy_mmu_mode +237 include/linux/pgtable.h

   214	
   215	/*
   216	 * A facility to provide lazy MMU batching.  This allows PTE updates and
   217	 * page invalidations to be delayed until a call to leave lazy MMU mode
   218	 * is issued.  Some architectures may benefit from doing this, and it is
   219	 * beneficial for both shadow and direct mode hypervisors, which may batch
   220	 * the PTE updates which happen during this window.  Note that using this
   221	 * interface requires that read hazards be removed from the code.  A read
   222	 * hazard could result in the direct mode hypervisor case, since the actual
   223	 * write to the page tables may not yet have taken place, so reads though
   224	 * a raw PTE pointer after it has been modified are not guaranteed to be
   225	 * up to date.
   226	 *
   227	 * In the general case, no lock is guaranteed to be held between entry and exit
   228	 * of the lazy mode. So the implementation must assume preemption may be enabled
   229	 * and cpu migration is possible; it must take steps to be robust against this.
   230	 * (In practice, for user PTE updates, the appropriate page table lock(s) are
   231	 * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
   232	 * and the mode cannot be used in interrupt context.
   233	 */
   234	#ifdef CONFIG_ARCH_LAZY_MMU
   235	static inline void lazy_mmu_mode_enable(void)
   236	{
 > 237		arch_enter_lazy_mmu_mode();
   238	}
   239	
   240	static inline void lazy_mmu_mode_disable(void)
   241	{
 > 242		arch_leave_lazy_mmu_mode();
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
