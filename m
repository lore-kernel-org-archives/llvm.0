Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE995233928;
	Mon, 13 Jul 2026 04:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917921; cv=none; b=uhVKJHtlv4NZqDa+vBJU6AHqPCdbr7LC48TQFg0tMGSk6VsGo0MjmuzAzv8GpXnSOMQGlcAV8XtKsoGuBa4mCEh7Pnl8SMTpQ68nG/QsdXt3UVRvK/3VBoz2UaUZYIFhXo3r2qGytJJ9LUNDCd7jadaCLzbn4bRJYk8kLBUmZHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917921; c=relaxed/simple;
	bh=F6ciM0lvHbhnxl6Bm9DQ1C/gXXl2IIcOnB2hSCm4Onk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n7kxyHUHhJmI/MuRPU4Mjeh80oJWxisoBQ1mH/bmNZHvXH4tJw3bgpR3og5t5XE/q39PspPn101LwwNWHwJL6r9TbwAp64/2lc65LzqcTgANkSfGFzbkHIKqsa4Kuw/+UkIFDgrr8r71nbJ2zptSbIszM/izPEWuPYWbc2DtYcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+JaCBm4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+JaCBm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783917918; x=1815453918;
  h=date:from:to:cc:subject:message-id;
  bh=F6ciM0lvHbhnxl6Bm9DQ1C/gXXl2IIcOnB2hSCm4Onk=;
  b=b+JaCBm4yXsnPezjKM5iotfY9eM1zHEzGOSPYMjaqAPIWDIb4+XxyToI
   EJ/urgj5zCXYbAKucsh2BnKY/x7STSq4IQDt+nHoaArGo7XmnLeOdrTX5
   gFbeB73rCPEqXPjvIVYoUmFdyHstGzFsKEtZJCJbCqjhENyBlnVBXXJcG
   uIQynbT/uC6VbwJRB55jlTTMqCLJ5bd4eKWGdyHi08SOK8Gl6p+vPJjTI
   JMg+l6jhV44ZDvmd4Gmc0U9Glp3aVxE+odmvucWJEGa4dwm+VQu9q+s7W
   N3rgeFJspWdpJV6YGZK+lt73ME57cLWjMJzLk7aoO3xpRu4U9kmnlgCjx
   g==;
X-CSE-ConnectionGUID: YY5RZ4NMTPiJpSndTfI+cg==
X-CSE-MsgGUID: S+OVIHkiSVeI4SMpHmu7Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="102069946"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="102069946"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 21:45:16 -0700
X-CSE-ConnectionGUID: L+udsOsCR+y5gXV77Ncpbg==
X-CSE-MsgGUID: ibsw+P4KS+6frJGZ/Ftd/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254932171"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Jul 2026 21:45:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj8XX-00000000LNs-1woa;
	Mon, 13 Jul 2026 04:45:11 +0000
Date: Mon, 13 Jul 2026 12:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [boqun:rust-rcu 14/27] rust/helpers/interrupt.c:17:9:
 warning: static function 'arch_local_save_flags' is used in an inline
 function with external linkage
Message-ID: <202607131219.euJHPSJ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-rcu
head:   dcecd5f6e71e2437c8abe333ee2426fbe63e6398
commit: 27e30521043c39ca18ea3e28f825f9c7bd30b580 [14/27] rust: Introduce interrupt module
config: s390-randconfig-002-20260713 (https://download.01.org/0day-ci/archive/20260713/202607131219.euJHPSJ5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131219.euJHPSJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131219.euJHPSJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:68:
>> rust/helpers/interrupt.c:17:9: warning: static function 'arch_local_save_flags' is used in an inline function with external linkage [-Wstatic-in-inline]
      17 |         return irqs_disabled();
         |                ^
   include/linux/irqflags.h:256:3: note: expanded from macro 'irqs_disabled'
     256 |                 raw_local_save_flags(_flags);           \
         |                 ^
   include/linux/irqflags.h:184:11: note: expanded from macro 'raw_local_save_flags'
     184 |                 flags = arch_local_save_flags();        \
         |                         ^
   rust/helpers/interrupt.c:15:1: note: use 'static' to give inline function 'rust_helper_irqs_disabled' internal linkage
      15 | __rust_helper bool rust_helper_irqs_disabled(void)
         | ^
         | static 
   rust/helpers/helpers.c:38:23: note: expanded from macro '__rust_helper'
      38 | #define __rust_helper __always_inline
         |                       ^
   include/linux/compiler_attributes.h:55:41: note: expanded from macro '__always_inline'
      55 | #define __always_inline                 inline __attribute__((__always_inline__))
         |                                         ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   arch/s390/include/asm/irqflags.h:46:48: note: 'arch_local_save_flags' declared here
      46 | static arch_local_irq_attributes unsigned long arch_local_save_flags(void)
         |                                                ^
   1 warning generated.
--
   In file included from rust/helpers/helpers.c:68:
>> rust/helpers/interrupt.c:17:9: warning: static function 'arch_local_save_flags' is used in an inline function with external linkage [-Wstatic-in-inline]
   17 |         return irqs_disabled();
   |                ^
   include/linux/irqflags.h:256:3: note: expanded from macro 'irqs_disabled'
   256 |                 raw_local_save_flags(_flags);           \
   |                 ^
   include/linux/irqflags.h:184:11: note: expanded from macro 'raw_local_save_flags'
   184 |                 flags = arch_local_save_flags();        \
   |                         ^
   rust/helpers/interrupt.c:15:1: note: use 'static' to give inline function 'rust_helper_irqs_disabled' internal linkage
   15 | __rust_helper bool rust_helper_irqs_disabled(void)
   | ^
   | static
   rust/helpers/helpers.c:38:23: note: expanded from macro '__rust_helper'
   38 | #define __rust_helper __always_inline
   |                       ^
   include/linux/compiler_attributes.h:55:41: note: expanded from macro '__always_inline'
   55 | #define __always_inline                 inline __attribute__((__always_inline__))
   |                                         ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
   235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
   |                ^
   arch/s390/include/asm/irqflags.h:46:48: note: 'arch_local_save_flags' declared here
   46 | static arch_local_irq_attributes unsigned long arch_local_save_flags(void)
   |                                                ^
   1 warning generated.
   warning: 1 warning emitted


vim +/arch_local_save_flags +17 rust/helpers/interrupt.c

    14	
    15	__rust_helper bool rust_helper_irqs_disabled(void)
    16	{
  > 17		return irqs_disabled();

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
