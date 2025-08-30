Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153C42DC344;
	Sat, 30 Aug 2025 19:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756581053; cv=none; b=hUkutrJQ9PBEpSKELC1ad4Vao0cVDTCFzx21ecIxC4wbT1PHd+Fyy5sU0E9Nni6q26QJoTYqZCcOPsLWlGycAu1/EJvf7EBFgwMnL+rZIbTia6hf51tO2xi9R3bchnSCKxV3t/1LGl6GZ27t8sE5t+IwFX5HT2YjMU+rgJmRPXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756581053; c=relaxed/simple;
	bh=HSxwq/sv5bGv5zvi1+pAo8mM20+0b8sh/zp9ljjKZgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUiOxgkIJzctJ2Rm3+2mIWTd7vukzIbZ7e9fmon0EeIA/5olGHGpa1pCA0UDisIeq6Buyojmls+K0a5e3dwaJfI59iekVPyhbgVsX/1nsBRcWuccCEtXdZK/YDrDBV5GsQ0P7WJxJuMdJcAwL9JPbyjP9OOjeIaUgVDwiDu0VL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edbh42JA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edbh42JA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756581052; x=1788117052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSxwq/sv5bGv5zvi1+pAo8mM20+0b8sh/zp9ljjKZgA=;
  b=edbh42JAo+xGAkCCZ1Ubj9ZJXAlm2bC0d3EFjY9tyLFvGmgPaxy9PvmK
   TGyqf1tLFDWcPxY3jHh1CeXG2oSl5Tkh/YdZUELmKVnoch//F4SXs11VZ
   frWt/bc50QnWOcuGUvejv3X4sMsEkE9NX7fZdTFWhYy+vEDERJp/dAmGE
   /+W5KzX9DBtrs/QWjE0BbV5YiA7AHnbHjyATUHnUwbfc6w1zxrJfcAbkB
   O7y1RGnNgOz9U0Cy/exd2+OCwjQtRAQDxXw4bidDLhnWBQOIHaAUkkvIt
   GC2AmicfeaeY3t3xA2qJREbjY/RihqN7X53izbT/8P6JEhUv+SnyPw9Ek
   Q==;
X-CSE-ConnectionGUID: f3tBWCQVSxW8eiWX6LHB5w==
X-CSE-MsgGUID: cdMCch2YS0eNRp+26YlyHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69938556"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69938556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 12:10:50 -0700
X-CSE-ConnectionGUID: gY+YP60GTgeA7lRfyz234A==
X-CSE-MsgGUID: OeY8ZE0BSHS9GzRB/M6wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="207784669"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2025 12:10:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usQyL-000VdZ-1Y;
	Sat, 30 Aug 2025 19:10:45 +0000
Date: Sun, 31 Aug 2025 03:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [akpm-mm:mm-unstable 140/221] arch/um/include/asm/kasan.h:29:2:
 error: UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!
Message-ID: <202508310221.jSUso3QB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6531c300923e1b222e7cac7b74975ddf686aba96
commit: cf803b1aeda8859efc50696db9bd11577571e5c1 [140/221] kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
config: um-randconfig-001-20250831 (https://download.01.org/0day-ci/archive/20250831/202508310221.jSUso3QB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310221.jSUso3QB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310221.jSUso3QB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:260:
   In file included from include/linux/kasan.h:21:
>> arch/um/include/asm/kasan.h:29:2: error: UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!
      29 | #error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!
         |  ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:7:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];


vim +29 arch/um/include/asm/kasan.h

    27	
    28	#if defined(CONFIG_STATIC_LINK) && defined(CONFIG_KASAN_INLINE)
  > 29	#error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!
    30	#endif
    31	#else
    32	static inline void kasan_init(void) { }
    33	#endif /* CONFIG_KASAN */
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
