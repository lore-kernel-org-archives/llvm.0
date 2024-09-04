Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4085339E;
	Wed,  4 Sep 2024 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725421884; cv=none; b=OnNz+FmxGypLo3clJwDzX/i71Wz7uLdpMB3aFKbdcFA+Fqy6Y/6f852DpQ2SoV+rl9eMX7aeE5vinIDdQ+S1hsGGWB10NUfiUrACfsTPkLkgmZty0MNLNoUbHg8BR8ssMZamjxhzGJ3jqpOM3Rv1aAHubCbvfZNLKU5gndCvi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725421884; c=relaxed/simple;
	bh=DnHTatMJj3klOqnCSicamLzKNrCvsAVVR3vfVbi2DRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTOGzIxqXsoMlJ353d5MzwvK1GgU9018M/LkKXy2CT0kIWAZ5dh4DkIxVB//+SP9/8mBVZZDEyxFCJ/QgELUlV8qhPgJ0MFaN4MS/ujkwSXXLtmV0JbCPDbtWVpf+tkCrCGBxQcDJrQkO/lUgzfinrxcmv8YK2+0VR/IvSMfiHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXK2gZLH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXK2gZLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725421882; x=1756957882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DnHTatMJj3klOqnCSicamLzKNrCvsAVVR3vfVbi2DRQ=;
  b=LXK2gZLHnBkeLMLIg28moUJyaA5IGXu23xc/WGxs0D3rDUABkb2jixxO
   kVNHhidZ5fux/twWvYljce/Az1EdKFlqdtFeQrkwv/UH9AHwCYQ1WykPJ
   5KJe8PBlD3BF33h+PdWhgGGdrTvAIpjLMIuPv+n0UOCJ+7XUs7VXzMw7I
   khUP6t3dCJN5FLdld+OGp5PtPOYhz5m5yB2rhjyStYg2tS4A1edJdCLPE
   hYJjksmfqHLn/NgLC1xTyWs3PgmKDF6el5Qo1x25vzcLVaIUvXOB1qctW
   lmVK69iVDgKUl/imnukzPMN9RFF9UA7ZUPLyNWbT3nS4lSzTsOwp4ca9P
   A==;
X-CSE-ConnectionGUID: WW1c74aJTtu3Orcucen/aQ==
X-CSE-MsgGUID: UlvtJnCrR/y44L7Ld6lcJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="26970076"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="26970076"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 20:50:33 -0700
X-CSE-ConnectionGUID: vI6+5iU1QBSkYgFfIA3/jA==
X-CSE-MsgGUID: 5tc0q4oERD+PrFwXRKkdlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65186583"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2024 20:49:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slh1d-0007W0-0i;
	Wed, 04 Sep 2024 03:49:45 +0000
Date: Wed, 4 Sep 2024 11:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 28/31] include/asm-generic/io.h:195:2: error:
 expected ')'
Message-ID: <202409041100.Y71WlJ1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   b99f69f0fc6671bbc510435aadcf25aacf016c38
commit: 7bc1bcb1cd875350948f43c77c9895173bd22012 [28/31] x86/alternative: Create symbols for special section entries
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240904/202409041100.Y71WlJ1S-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041100.Y71WlJ1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041100.Y71WlJ1S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:195:2: error: expected ')'
     195 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:210:2: error: expected ')'
     210 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:225:2: error: expected ')'
     225 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:253:2: error: expected ')'
     253 |         __io_bw();
         |         ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
      39 | #define __io_bw()      wmb()
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
   In file included from kernel/exec_domain.c:19:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:195:2: error: expected ')'
     195 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/exec_domain.c:19:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:210:2: error: expected ')'
     210 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/exec_domain.c:19:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:225:2: error: expected ')'
     225 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/exec_domain.c:19:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:253:2: error: expected ')'
     253 |         __io_bw();
         |         ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
      39 | #define __io_bw()      wmb()
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
   In file included from kernel/panic.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:195:2: error: expected ')'
     195 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/panic.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:210:2: error: expected ')'
     210 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/panic.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:225:2: error: expected ')'
     225 |         __io_ar(val);
         |         ^
   include/asm-generic/io.h:30:25: note: expanded from macro '__io_ar'
      30 | #define __io_ar(v)      rmb()
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
   In file included from kernel/panic.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:253:2: error: expected ')'
     253 |         __io_bw();
         |         ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
      39 | #define __io_bw()      wmb()
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
   In file included from kernel/panic.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
..


vim +195 include/asm-generic/io.h

cd24834130ac65 Jan Glauber        2012-11-29  180  
9216efafc52ff9 Thierry Reding     2014-10-01  181  /*
9216efafc52ff9 Thierry Reding     2014-10-01  182   * {read,write}{b,w,l,q}() access little endian memory and return result in
9216efafc52ff9 Thierry Reding     2014-10-01  183   * native endianness.
9216efafc52ff9 Thierry Reding     2014-10-01  184   */
3f7e212df82ca0 Arnd Bergmann      2009-05-13  185  
9216efafc52ff9 Thierry Reding     2014-10-01  186  #ifndef readb
9216efafc52ff9 Thierry Reding     2014-10-01  187  #define readb readb
9216efafc52ff9 Thierry Reding     2014-10-01  188  static inline u8 readb(const volatile void __iomem *addr)
3f7e212df82ca0 Arnd Bergmann      2009-05-13  189  {
032d59e1cde9dd Sinan Kaya         2018-04-05  190  	u8 val;
032d59e1cde9dd Sinan Kaya         2018-04-05  191  
5e5ff73c2e5863 Sai Prakash Ranjan 2022-10-17  192  	log_read_mmio(8, addr, _THIS_IP_, _RET_IP_);
032d59e1cde9dd Sinan Kaya         2018-04-05  193  	__io_br();
032d59e1cde9dd Sinan Kaya         2018-04-05  194  	val = __raw_readb(addr);
abbbbc83a210e9 Will Deacon        2019-02-22 @195  	__io_ar(val);
5e5ff73c2e5863 Sai Prakash Ranjan 2022-10-17  196  	log_post_read_mmio(val, 8, addr, _THIS_IP_, _RET_IP_);
032d59e1cde9dd Sinan Kaya         2018-04-05  197  	return val;
3f7e212df82ca0 Arnd Bergmann      2009-05-13  198  }
3f7e212df82ca0 Arnd Bergmann      2009-05-13  199  #endif
3f7e212df82ca0 Arnd Bergmann      2009-05-13  200  

:::::: The code at line 195 was first introduced by commit
:::::: abbbbc83a210e95e2ae4ee71e50930a8cec6f081 asm-generic/io: Pass result of I/O accessor to __io_[p]ar()

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
