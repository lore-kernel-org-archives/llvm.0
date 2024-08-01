Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127411366;
	Thu,  1 Aug 2024 04:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722487586; cv=none; b=QZF7styj4Jaw9dCCE5S/lubyhEVuMKfg4rVEOyKNWqEq31avFg+QcwcsSsL6zaxWs1GsxTJVHm5THObSUZXAF7haR99rdg1uEdPCwBxQy0e6y7TYeQn2B/yLRjlarPZOznQTDd7ku6vCKLq5wMO/S2su4h+v5aF1QtvwqVAwG8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722487586; c=relaxed/simple;
	bh=JBEu5Ij36/Sctto1OawigLJFifCHV0+7KD59bZi5Fi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Srw5EAKAWAr7zN9Ix4W/IzVuivtZcAsgeuJlFV6vylKF8RTkM9hp4vKTmULZNYyiJSOp/z/MxQpVg4pZjbaWHFmIWqEBu8Km5DE+HPsqXBgaN0HC34Cl3EaqEgHm3yUteayK/AIiyc//5ZMsD7Crh74u7HyfvTnUWipYDSVocNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCAmPqMm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCAmPqMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722487584; x=1754023584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JBEu5Ij36/Sctto1OawigLJFifCHV0+7KD59bZi5Fi0=;
  b=OCAmPqMmlU/osgeXhAwI5H+PEcBeFepb7xTaezfD8M86vwEsHYxUPr1u
   HYj4Y7H/+Cx16oxFdTePk8x4/DtPR1AVEULDSLGt0tcshfnbeK9QC1Suw
   rxV9EMndz41REITmwLvxxnN1T4UVE9RiXJZXvCIOyIGCiXs8RoE2TbKj0
   /Iwld+5wz37i5DwUpTKNSxZNdhrkjn4krI+FVr29T5xozY6YNusRacirT
   K3qH6Ch5+YsUnWX/UglSwUr4S2WPyzp+0Tg4nlrnYSDvbc2iUN61+guTN
   3vI6aLzhfSzweq6aqlTJt1kopTmJv45wzJ0yz7Ewt1QH0lfLTpx95l8hj
   A==;
X-CSE-ConnectionGUID: 45I7Rz+SQ6aT+8L8mk9GTw==
X-CSE-MsgGUID: 66myjzXNSUWrBTAqjn61DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20100831"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20100831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 21:46:17 -0700
X-CSE-ConnectionGUID: bESPIa49T9KBHpgYAXsg0A==
X-CSE-MsgGUID: bTq5u5DTSJmo12SqyACh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59555444"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2024 21:46:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZNhd-000vCo-1g;
	Thu, 01 Aug 2024 04:46:13 +0000
Date: Thu, 1 Aug 2024 12:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 6/10] include/asm-generic/io.h:194:2: error:
 expected ')'
Message-ID: <202408011211.pJJWZX9D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   ed5f5967ff0f4b9bb6043fb7318dec6faa560cf6
commit: 2d3b706310cf49738d509258593dcd2e5a7251d5 [6/10] x86/alternative: Create symbols for special section entries
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240801/202408011211.pJJWZX9D-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011211.pJJWZX9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011211.pJJWZX9D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/buildid.c:7:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:194:2: error: expected ')'
     194 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/buildid.c:7:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:209:2: error: expected ')'
     209 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/buildid.c:7:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:224:2: error: expected ')'
     224 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/buildid.c:7:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:252:2: error: expected ')'
     252 |         __io_bw();
         |         ^
   include/asm-generic/io.h:38:24: note: expanded from macro '__io_bw'
      38 | #define __io_bw()      wmb()
         |                        ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
      17 | #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/buildid.c:7:
   In file included from include/linux/pagemap.h:11:
--
>> lib/klist.c:197:3: error: expected ')'
     197 |                 mb();
         |                 ^
   arch/x86/um/asm/barrier.h:15:14: note: expanded from macro 'mb'
      15 | #define mb()    alternative("lock; addl $0,0(%%esp)", "mfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   1 error generated.
--
   In file included from lib/logic_pio.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:194:2: error: expected ')'
     194 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/logic_pio.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:209:2: error: expected ')'
     209 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/logic_pio.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:224:2: error: expected ')'
     224 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/logic_pio.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:252:2: error: expected ')'
     252 |         __io_bw();
         |         ^
   include/asm-generic/io.h:38:24: note: expanded from macro '__io_bw'
      38 | #define __io_bw()      wmb()
         |                        ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
      17 | #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from lib/logic_pio.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:264:2: error: expected ')'
     264 |         __io_bw();
         |         ^
   include/asm-generic/io.h:38:24: note: expanded from macro '__io_bw'
      38 | #define __io_bw()      wmb()
         |                        ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
      17 | #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
--
   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:194:2: error: expected ')'
     194 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:209:2: error: expected ')'
     209 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:224:2: error: expected ')'
     224 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:29:25: note: expanded from macro '__io_ar'
      29 | #define __io_ar(v)      rmb()
         |                         ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
      16 | #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:252:2: error: expected ')'
     252 |         __io_bw();
         |         ^
   include/asm-generic/io.h:38:24: note: expanded from macro '__io_bw'
      38 | #define __io_bw()      wmb()
         |                        ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
      17 | #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
         |                 ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
     277 |         asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
..


vim +194 include/asm-generic/io.h

cd24834130ac65 Jan Glauber        2012-11-29  179  
9216efafc52ff9 Thierry Reding     2014-10-01  180  /*
9216efafc52ff9 Thierry Reding     2014-10-01  181   * {read,write}{b,w,l,q}() access little endian memory and return result in
9216efafc52ff9 Thierry Reding     2014-10-01  182   * native endianness.
9216efafc52ff9 Thierry Reding     2014-10-01  183   */
3f7e212df82ca0 Arnd Bergmann      2009-05-13  184  
9216efafc52ff9 Thierry Reding     2014-10-01  185  #ifndef readb
9216efafc52ff9 Thierry Reding     2014-10-01  186  #define readb readb
9216efafc52ff9 Thierry Reding     2014-10-01  187  static inline u8 readb(const volatile void __iomem *addr)
3f7e212df82ca0 Arnd Bergmann      2009-05-13  188  {
032d59e1cde9dd Sinan Kaya         2018-04-05  189  	u8 val;
032d59e1cde9dd Sinan Kaya         2018-04-05  190  
5e5ff73c2e5863 Sai Prakash Ranjan 2022-10-17  191  	log_read_mmio(8, addr, _THIS_IP_, _RET_IP_);
032d59e1cde9dd Sinan Kaya         2018-04-05  192  	__io_br();
032d59e1cde9dd Sinan Kaya         2018-04-05  193  	val = __raw_readb(addr);
abbbbc83a210e9 Will Deacon        2019-02-22 @194  	__io_ar(val);
5e5ff73c2e5863 Sai Prakash Ranjan 2022-10-17  195  	log_post_read_mmio(val, 8, addr, _THIS_IP_, _RET_IP_);
032d59e1cde9dd Sinan Kaya         2018-04-05  196  	return val;
3f7e212df82ca0 Arnd Bergmann      2009-05-13  197  }
3f7e212df82ca0 Arnd Bergmann      2009-05-13  198  #endif
3f7e212df82ca0 Arnd Bergmann      2009-05-13  199  

:::::: The code at line 194 was first introduced by commit
:::::: abbbbc83a210e95e2ae4ee71e50930a8cec6f081 asm-generic/io: Pass result of I/O accessor to __io_[p]ar()

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
