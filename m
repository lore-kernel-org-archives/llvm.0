Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD771DA0F7;
	Fri, 13 Sep 2024 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726234921; cv=none; b=e7vSscCNgSFdBB7jrIa4wRRRS+sGLG4HF/mjlX6DKHzwncuKI+RZKLqgbBKOrIgUrIoq1SZAHAe6M7X8xCpjCDAUzbJ8nGY4eGascTDXM0gpFqW/XDPKWOT748DWyh62nXqT1hHxPKnc/nIFCsnfL2zgKDx5u72CVT+mtaYk6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726234921; c=relaxed/simple;
	bh=U+bbOOvxssnVT4S/oUYfmd9S8aRUStj0T43Lm3BGZhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3b2DhgXPA1dzMIIU/xEpx69fPvI5uh9CYaJUQt9dyjgFIOnBOSyv917x8Osc76c3sUgcM958LbEpcgmlSHXchrLdvT37lOumubiK+5HaRKBFgR1Yx2DkLGawojdLRNh3K+pmfuJF76xOPoV+W9NiLWW1xpF/CfQPWYs2b3H3lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rqtsapwi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rqtsapwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726234920; x=1757770920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+bbOOvxssnVT4S/oUYfmd9S8aRUStj0T43Lm3BGZhw=;
  b=Rqtsapwi5DxSI69hGs1ZBBtzxaKTcZT/WDDF+2XsJeEK6Xq/6aNwqLSH
   LEky9pGTcUugJ3oSxS859+bNitzMOBFjI7rsKl/JGTtoC92fUZLa+w3VR
   fxOL6sgl2vj5dU5VCnVwyBaz3BHPAMGq0ItQiHHOHMS55KTJitb0O2Eua
   A9NuDJQOHZ8q/Cn5I3yPlK9Yi1Fr5mE0d0ip89OmpE44TXKD22aN9tT2b
   O9eFviwSEA3fLgx+En6aWBPcFrJXtKBXan8WVFa8bm90QwoSQ9hXnuCB8
   APybHgqCgfcCoOogsi0KtVYbHwApb7rxdrAAkBylb42x2jRlHbHGn7uMg
   w==;
X-CSE-ConnectionGUID: WziPArWGRMO2M4s0cGuOlA==
X-CSE-MsgGUID: GtYfUtmiR8WTK2zhIztg/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36269347"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="36269347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 06:41:59 -0700
X-CSE-ConnectionGUID: +niJY8QLSG6+LDc5PRH5fA==
X-CSE-MsgGUID: KPZe3LNoR1q7DSqLyE4vyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="98890506"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Sep 2024 06:41:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp6Yc-0006Xs-2q;
	Fri, 13 Sep 2024 13:41:54 +0000
Date: Fri, 13 Sep 2024 21:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [anna-maria-devel:timers/misc 6/15]
 include/asm-generic/delay.h:61:26: error: call to undeclared function
 'DIV_ROUND_UP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409132123.33tT1ILn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git timers/misc
head:   d8b99542c586f757608f98bb341fb75cbf96619d
commit: c774df411d1da02f75334976241deb88f8b9e256 [6/15] delay: Rework udelay and ndelay
config: i386-buildonly-randconfig-005-20240913 (https://download.01.org/0day-ci/archive/20240913/202409132123.33tT1ILn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409132123.33tT1ILn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409132123.33tT1ILn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/reboot_fixups_32.c:11:
   In file included from arch/x86/include/asm/delay.h:5:
>> include/asm-generic/delay.h:61:26: error: call to undeclared function 'DIV_ROUND_UP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |                         __const_udelay(usec * UDELAY_CONST_MULT);
         |                                               ^
   include/asm-generic/delay.h:21:43: note: expanded from macro 'UDELAY_CONST_MULT'
      21 | #define UDELAY_CONST_MULT       ((unsigned long)DIV_ROUND_UP(1ULL << 32, USEC_PER_SEC))
         |                                                 ^
   include/asm-generic/delay.h:79:26: error: call to undeclared function 'DIV_ROUND_UP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                         __const_udelay(nsec * NDELAY_CONST_MULT);
         |                                               ^
   include/asm-generic/delay.h:22:43: note: expanded from macro 'NDELAY_CONST_MULT'
      22 | #define NDELAY_CONST_MULT       ((unsigned long)DIV_ROUND_UP(1ULL << 32, NSEC_PER_SEC))
         |                                                 ^
   In file included from arch/x86/kernel/reboot_fixups_32.c:12:
   In file included from include/linux/pci.h:2075:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/reboot_fixups_32.c:12:
   In file included from include/linux/pci.h:2075:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/reboot_fixups_32.c:12:
   In file included from include/linux/pci.h:2075:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/reboot_fixups_32.c:12:
   In file included from include/linux/pci.h:2075:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/reboot_fixups_32.c:12:
   In file included from include/linux/pci.h:2075:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/reboot_fixups_32.c:12:
   In file included from include/linux/pci.h:2075:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1127:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];


vim +/DIV_ROUND_UP +61 include/asm-generic/delay.h

    29	
    30	/**
    31	 * udelay - Inserting a delay based on microseconds with busy waiting
    32	 * @usec:	requested delay in microseconds
    33	 *
    34	 * When delaying in an atomic context ndelay(), udelay() and mdelay() are the
    35	 * only valid variants of delaying/sleeping to go with.
    36	 *
    37	 * When inserting delays in non atomic context which are shorter than the time
    38	 * which is required to queue e.g. an hrtimer and to enter then the scheduler,
    39	 * it is also valuable to use udelay(). But is not simple to specify a generic
    40	 * threshold for this which will fit for all systems, but an approximation would
    41	 * be a threshold for all delays up to 10 microseconds.
    42	 *
    43	 * When having a delay which is larger than the architecture specific
    44	 * %MAX_UDELAY_MS value, please make sure mdelay() is used. Otherwise a overflow
    45	 * risk is given.
    46	 *
    47	 * Please note that ndelay(), udelay() and mdelay() may return early for several
    48	 * reasons (https://lists.openwall.net/linux-kernel/2011/01/09/56):
    49	 *
    50	 * #. computed loops_per_jiffy too low (due to the time taken to execute the
    51	 *    timer interrupt.)
    52	 * #. cache behaviour affecting the time it takes to execute the loop function.
    53	 * #. CPU clock rate changes.
    54	 */
    55	static __always_inline void udelay(unsigned long usec)
    56	{
    57		if (__builtin_constant_p(usec)) {
    58			if (usec >= DELAY_CONST_MAX)
    59				__bad_udelay();
    60			else
  > 61				__const_udelay(usec * UDELAY_CONST_MULT);
    62		} else {
    63			__udelay(usec);
    64		}
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
