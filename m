Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D37B195;
	Mon,  2 Sep 2024 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277017; cv=none; b=PuadjoamfmWVciw36uu9WwwKFHbnfupSGU7ZICCAmcni4EdLE5tSTW245b+AAvjKay46AFau3DEk41RfSaz0totsXgZXUiBAfR/Nr7ABgPzVNSVoWI4jhIqClRtphvvf7obS7lBfr+dYMc5Mcxvrt7aOQeRup/CyJ+o797fosJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277017; c=relaxed/simple;
	bh=np78Ags0a5gE0HETTzL/UxOEG6q1FqBn20k4ktX/kNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYox4HWEjoxDhKNJbjLn4EKE5QbjZ1wNJovNkKJuPt1FQ7aOeVi2pNu7DPqOYHwqaYY5GUYNJqj65J3RKh0IGh//eSPtSPHaPRj+CDe/WrQhga47qscCLeHFlBrkGHZssdH3Q63+eiGneUw/BwomdcSybQe74Nj4/g+QnBIcvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgwFozHL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgwFozHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725277015; x=1756813015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=np78Ags0a5gE0HETTzL/UxOEG6q1FqBn20k4ktX/kNY=;
  b=VgwFozHLUZDGqkabO3EMTHgfuH/gbz2511A+BsEg7Fmj0SyexU/d76Lj
   eRLkIHOH+7X+kzc+UbyQWUGBxWMy3xpnwa/iBaKKzNdD0UHUmRc8xin5H
   KrF5J8/j8NPtNSpUWI1OY/JRyvU2IoML8tG4ETrov+8N7hZ/rhn20nOS7
   7L3W9FlJiiAPeh0qiGESRqHsl2TSk+m7dhQNaoq7TNndk95qzjiZU84cR
   PK6OV2bCdwE60die1RsZbUh8kjOWGUraP1X/NAMNctbBYtQhBuugwWTy+
   u7gghZn/RP3IfLedyCbQW1svwqClEvJE5g9rTW2fJN4h2u7hTEPR2fWap
   w==;
X-CSE-ConnectionGUID: kSvHeNw5TJi5F5SFyghloQ==
X-CSE-MsgGUID: ZD6ugSOdSaOhysPKdqqPCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="49257581"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="49257581"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:36:54 -0700
X-CSE-ConnectionGUID: QA7XztkoTpi0YX8SyvOR3g==
X-CSE-MsgGUID: PTHLfATPTIq+LMph+3c3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="95397393"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Sep 2024 04:36:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl5MY-0005Nk-0b;
	Mon, 02 Sep 2024 11:36:50 +0000
Date: Mon, 2 Sep 2024 19:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 5/13] crypto/xor.c:98:4: error: expected ')'
Message-ID: <202409021941.ThGglQhp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   d63894f7f2633e98788b1a74a983e9dbea49d1b7
commit: 919add2736f64cbcbf2a7ec537e95ee652c9f8c3 [5/13] x86/alternative: Create symbols for special section entries
config: um-randconfig-002-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021941.ThGglQhp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021941.ThGglQhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021941.ThGglQhp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/xor.c:98:4: error: expected ')'
                           mb(); /* prevent loop optimization */
                           ^
   arch/x86/um/asm/barrier.h:15:14: note: expanded from macro 'mb'
   #define mb()    alternative("lock; addl $0,0(%%esp)", "mfence", X86_FEATURE_XMM2)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   crypto/xor.c:100:4: error: expected ')'
                           mb();
                           ^
   arch/x86/um/asm/barrier.h:15:14: note: expanded from macro 'mb'
   #define mb()    alternative("lock; addl $0,0(%%esp)", "mfence", X86_FEATURE_XMM2)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   2 errors generated.
--
   include/asm-generic/io.h:51:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
   #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:2: error: expected ')'
           __io_pbw();
           ^
   include/asm-generic/io.h:51:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
   #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:2: error: expected ')'
           __io_pbw();
           ^
   include/asm-generic/io.h:51:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
   #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:6:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from drivers/virtio/virtio_ring.c:7:
>> include/linux/virtio_ring.h:28:3: error: expected ')'
                   virt_mb();
                   ^
   include/asm-generic/barrier.h:213:36: note: expanded from macro 'virt_mb'
   #define virt_mb() do { kcsan_mb(); __smp_mb(); } while (0)
                                      ^
   include/asm-generic/barrier.h:85:20: note: expanded from macro '__smp_mb'
   #define __smp_mb()      mb()
                           ^
   arch/x86/um/asm/barrier.h:15:14: note: expanded from macro 'mb'
   #define mb()    alternative("lock; addl $0,0(%%esp)", "mfence", X86_FEATURE_XMM2)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:7:
   include/linux/virtio_ring.h:30:3: error: expected ')'
                   mb();
                   ^
   arch/x86/um/asm/barrier.h:15:14: note: expanded from macro 'mb'
   #define mb()    alternative("lock; addl $0,0(%%esp)", "mfence", X86_FEATURE_XMM2)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:7:
   include/linux/virtio_ring.h:36:3: error: expected ')'
                   virt_rmb();
                   ^
   include/asm-generic/barrier.h:214:38: note: expanded from macro 'virt_rmb'
   #define virt_rmb() do { kcsan_rmb(); __smp_rmb(); } while (0)
                                        ^
   include/asm-generic/barrier.h:89:21: note: expanded from macro '__smp_rmb'
   #define __smp_rmb()     rmb()
                           ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
   #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:7:
   include/linux/virtio_ring.h:38:3: error: expected ')'
                   dma_rmb();
                   ^
   include/asm-generic/barrier.h:77:19: note: expanded from macro 'dma_rmb'
   #define dma_rmb()       rmb()
                           ^
   arch/x86/um/asm/barrier.h:16:15: note: expanded from macro 'rmb'
   #define rmb()   alternative("lock; addl $0,0(%%esp)", "lfence", X86_FEATURE_XMM2)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:7:
   include/linux/virtio_ring.h:44:3: error: expected ')'
                   virt_wmb();
                   ^
   include/asm-generic/barrier.h:215:38: note: expanded from macro 'virt_wmb'
   #define virt_wmb() do { kcsan_wmb(); __smp_wmb(); } while (0)
                                        ^
   include/asm-generic/barrier.h:93:21: note: expanded from macro '__smp_wmb'
   #define __smp_wmb()     wmb()
                           ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
   #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/virtio/virtio_ring.c:7:
   include/linux/virtio_ring.h:46:3: error: expected ')'
                   dma_wmb();
                   ^
   include/asm-generic/barrier.h:81:19: note: expanded from macro 'dma_wmb'
   #define dma_wmb()       wmb()
                           ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
   #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
>> drivers/virtio/virtio_ring.c:871:3: error: expected ')'
                   virtio_store_mb(vq->weak_barriers,
                   ^
   include/linux/virtio_ring.h:52:3: note: expanded from macro 'virtio_store_mb'
                   virt_store_mb(*p, v); \
                   ^
   include/asm-generic/barrier.h:216:52: note: expanded from macro 'virt_store_mb'
   #define virt_store_mb(var, value) do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
                                                      ^
   include/asm-generic/barrier.h:127:66: note: expanded from macro '__smp_store_mb'
   #define __smp_store_mb(var, value)  do { WRITE_ONCE(var, value); __smp_mb(); } while (0)
                                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   12 warnings and 20 errors generated.
--
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:2: error: expected ')'
           __io_pbw();
           ^
   include/asm-generic/io.h:51:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
   #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/mtd/mtdchar.c:16:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:2: error: expected ')'
           __io_pbw();
           ^
   include/asm-generic/io.h:51:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:39:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   arch/x86/um/asm/barrier.h:17:15: note: expanded from macro 'wmb'
   #define wmb()   alternative("lock; addl $0,0(%%esp)", "sfence", X86_FEATURE_XMM)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   In file included from drivers/mtd/mtdchar.c:16:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from drivers/mtd/mtdchar.c:24:
>> include/linux/mtd/map.h:427:2: error: expected ')'
           mb();
           ^
   arch/x86/um/asm/barrier.h:15:14: note: expanded from macro 'mb'
   #define mb()    alternative("lock; addl $0,0(%%esp)", "mfence", X86_FEATURE_XMM2)
                   ^
   arch/x86/include/asm/alternative.h:277:23: note: expanded from macro 'alternative'
           asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
                                ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_ENTRY(ft_flags, 1)                                     \
           ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
           FAKE_SYMBOL(__alt_, 681f)                                             \
           ^
   12 warnings and 13 errors generated.
..


vim +98 crypto/xor.c

^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   81  
af7cf25dd15b74 crypto/xor.c     Jan Beulich       2012-10-11   82  static void __init
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   83  do_xor_speed(struct xor_block_template *tmpl, void *b1, void *b2)
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   84  {
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   85  	int speed;
10b0f78a732371 crypto/xor.c     Nathan Chancellor 2020-10-06   86  	int i, j;
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26   87  	ktime_t min, start, diff;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   88  
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   89  	tmpl->next = template_list;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   90  	template_list = tmpl;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   91  
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22   92  	preempt_disable();
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22   93  
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26   94  	min = (ktime_t)S64_MAX;
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26   95  	for (i = 0; i < 3; i++) {
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26   96  		start = ktime_get();
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26   97  		for (j = 0; j < REPS; j++) {
cfb28fde083761 crypto/xor.c     Bhaskar Chowdhury 2021-02-03  @98  			mb(); /* prevent loop optimization */
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16   99  			tmpl->do_2(BENCH_SIZE, b1, b2);
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  100  			mb();
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  101  		}
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  102  		diff = ktime_sub(ktime_get(), start);
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  103  		if (diff < min)
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  104  			min = diff;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  105  	}
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  106  
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22  107  	preempt_enable();
56a519913eeba2 crypto/xor.c     Jim Kukunas       2012-05-22  108  
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  109  	// bytes/ns == GB/s, multiply by 1000 to get MB/s [not MiB/s]
3c02e04fd4f571 crypto/xor.c     Kirill Tkhai      2020-12-31  110  	if (!min)
3c02e04fd4f571 crypto/xor.c     Kirill Tkhai      2020-12-31  111  		min = 1;
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  112  	speed = (1000 * REPS * BENCH_SIZE) / (unsigned int)ktime_to_ns(min);
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  113  	tmpl->speed = speed;
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  114  
c055e3eae0f133 crypto/xor.c     Ard Biesheuvel    2020-09-26  115  	pr_info("   %-16s: %5d MB/sec\n", tmpl->name, speed);
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  116  }
^1da177e4c3f41 drivers/md/xor.c Linus Torvalds    2005-04-16  117  

:::::: The code at line 98 was first introduced by commit
:::::: cfb28fde083761bfb839bc53059068bab5634b6a crypto: xor - Fix typo of optimization

:::::: TO: Bhaskar Chowdhury <unixbhaskar@gmail.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
