Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2EC20DD48;
	Mon, 24 Nov 2025 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979370; cv=none; b=pPosr+nS+xqqgqIWhitxqGdpgNEJ/2iLR5QFo5aNGT1EtQG/DEOLN9Iy+3D0DnYCjmxIdSa3fXOU38dYEYHAd+WYLIhHjwWNjwJitr3BSxVo+sm4NWG44vekLyt8sP+7TtVntV85sT27zZbE9Sm2nmm+VobG+GBjxNPB8GQclKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979370; c=relaxed/simple;
	bh=DTFw3k7qEjJdnZhYCzQ9pQORoY0avXgMR64Ah6mGnc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=olIUAoHc1AtuogKbOguNcDO/pxIwazP6sAiFws0/U5bOc/5jfZFXDYUhdBdmS41YmPGUxz/Zm/78NMrB7wK0ebPSHXx/ub2oOMmcYPxnuocz4eHMznoadtC4HwluFCDLh5efiwefo1rL7cm+cqaaBF8phlIUAa4VFBPlTWlFm7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8nqhQV4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8nqhQV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763979366; x=1795515366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DTFw3k7qEjJdnZhYCzQ9pQORoY0avXgMR64Ah6mGnc0=;
  b=T8nqhQV4GFQJnZ15MgUrbkUWhEfFUFJxMqKyVRkPxAwOV08tkMWRHagj
   kO12W0yf0c2iUCKUnF1eFQjc6Of2/Kp3V5psorjOA3ICluCJxjlBYs7PH
   /qtIgCqtcMF+ZUtTArASg6feamUArSqi3c45h01OnMm/mfbvu+Fj6ZcI3
   W4lbjBPftD4z8IgCLRIJ2SU0kXDreBdsAnF0QepMbZ08eM//GebdoNMJn
   +WK5hnIQBaiwNwYmccgWor2h4FDrAl/dQKJB2NxSom0G4+aaWzaIc0s4H
   b4NkgfymqH5nhwb2LVgQOUVilwdBe9ke4g5D/Yf/WH8zX/JwAEG9LHxlF
   w==;
X-CSE-ConnectionGUID: p7GVkU9RSayS4KskwSGOqw==
X-CSE-MsgGUID: NpRFN+ImTgiPvlTPXOP0LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65913715"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65913715"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:16:01 -0800
X-CSE-ConnectionGUID: +/GUvwj+Tyu9coVJklRKqA==
X-CSE-MsgGUID: pL0b2kqXQTCw+S+7FdcsiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="215637336"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2025 02:15:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNTbw-000000000al-3EVj;
	Mon, 24 Nov 2025 10:15:56 +0000
Date: Mon, 24 Nov 2025 18:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 8/9]
 include/linux/poll.h:134:27: warning: division by zero is undefined
Message-ID: <202511241800.PrXnjz3Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git more-at-least-decorations-v1
head:   da707520ed1dbaed0ef9666f7adfac8910423a1f
commit: 9d0bb6f6867eb6f640c52bfaa09a8de6a181c921 [8/9] lib/crypto: sha1: Add at_least decoration to fixed-size array params
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20251124/202511241800.PrXnjz3Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241800.PrXnjz3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241800.PrXnjz3Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from kernel/bpf/core.c:22:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from kernel/bpf/core.c:22:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from kernel/bpf/core.c:22:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from kernel/bpf/core.c:22:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from kernel/bpf/core.c:22:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from kernel/bpf/core.c:22:
   In file included from include/linux/filter.h:11:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from kernel/bpf/core.c:3234:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:384:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
>> include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:12: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                          ^~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:23: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                                     ^~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   65 warnings and 5 errors generated.


vim +134 include/linux/poll.h

7a163b2195cda0c Al Viro 2018-02-01  129  
7a163b2195cda0c Al Viro 2018-02-01  130  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0c Al Viro 2018-02-01  131  {
7a163b2195cda0c Al Viro 2018-02-01  132  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0c Al Viro 2018-02-01  133  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0c Al Viro 2018-02-01 @134  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0c Al Viro 2018-02-01  135  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0c Al Viro 2018-02-01  136  #undef M
7a163b2195cda0c Al Viro 2018-02-01  137  }
7a163b2195cda0c Al Viro 2018-02-01  138  #undef __MAP
7a163b2195cda0c Al Viro 2018-02-01  139  
7a163b2195cda0c Al Viro 2018-02-01  140  

:::::: The code at line 134 was first introduced by commit
:::::: 7a163b2195cda0cddf47b5caf14a7229d4e2bea3 unify {de,}mangle_poll(), get rid of kernel-side POLL...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
