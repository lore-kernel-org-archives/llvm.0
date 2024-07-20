Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE13DDA5;
	Sat, 20 Jul 2024 05:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721454483; cv=none; b=cR8nGkeLaCrzxz/6A27BrLg8gmRB2AXpNwHWUTpIDI05VbjlXVb+mHnODAbolNgYUT2Eo6jSDU8+4KeRxgiZBubXdejlQfayJA16+xqDEnriEzLpjpckJ8YGPoks7WxEhR+Z4cDIC1TiOiUY6Wha6VLFpelBlkWuC1PUV5w2PwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721454483; c=relaxed/simple;
	bh=rlqAZr4qc4ECM4HJvR/zxrnXaLOvLRLQJR7fA8T7cSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWEq2FjXxUbh1NpvJvSbSv64uJJgx9+OO/gRDo71coOO/rp1s0i++1pyvtgtVS638I5srvcx/816aZ/CBFr3tu6Q1/ofWltxZXM0VIQKelw1mqT9oUvDOCHKleCmuXzjGdgtgKqMSI1u3IE4hxqe9PkrFOn0LrnFiAsCIX8KfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2130NaB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2130NaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721454482; x=1752990482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlqAZr4qc4ECM4HJvR/zxrnXaLOvLRLQJR7fA8T7cSo=;
  b=a2130NaB6ByDfSb+Rl6EY13rQT6lEF7iDRAF8owu01YmnjIkOzq6Vpgw
   Z/cSWhORNMwRG7c8JwTqq4Lr6YBAE+8F0mfz/wv7T0lNxXUnGlI64dO6y
   PT0/O2qOjhXZ3mgnpv2qLarCTDAPlwjYyuDd28nXEPlKwejfFRz8uQ4QD
   +oq3Ow2lvQO2H2QvtxnJOGXHn45a02VbzWEmCOaQp/j2teoH2I62WxgUh
   e4RQxGGzRHtwejjC1ybMgxb/SwBaeDJFm3njorUsegCcZ1rVJ8wvpZZvy
   YIO0ay3RpTynzJ3iWFs3XDL/NrkLLuqvTXGIqrftI0y0YwtDKEHVAInQB
   g==;
X-CSE-ConnectionGUID: uzCFq7WBTiSlkmKg9faO0Q==
X-CSE-MsgGUID: OsphIgB7Q+iTavsWG3Rr8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30473958"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="30473958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 22:47:59 -0700
X-CSE-ConnectionGUID: IwfPlaqWS8av2qfpVMTrxg==
X-CSE-MsgGUID: BdkMvVxpQ7esgP/RlrhZJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="82373669"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jul 2024 22:47:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV2wm-000itA-12;
	Sat, 20 Jul 2024 05:47:56 +0000
Date: Sat, 20 Jul 2024 13:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 36/38] mm/memory.c:440:3: error: 'struct ptdesc
 *' and 'typeof (mem_map)' (aka 'struct page *') are not pointers to
 compatible types
Message-ID: <202407201315.bbYlzWBh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   b17c1bbf65811ff797f57b7ddc4fdf4b86d86030
commit: 46417a6009d8064f174e7987dae8288f5cd9c4eb [36/38] pass ptdesc to pmd_populate
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407201315.bbYlzWBh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201315.bbYlzWBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201315.bbYlzWBh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/memory.c:440:3: error: 'struct ptdesc *' and 'typeof (mem_map)' (aka 'struct page *') are not pointers to compatible types
     440 |                 pmd_populate(mm, pmd, page_ptdesc(*pte));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/um/include/asm/pgalloc.h:20:24: note: expanded from macro 'pmd_populate'
      19 |         set_pmd(pmd, __pmd(_PAGE_TABLE +                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      20 |                 ((unsigned long long)page_to_pfn(pte) <<        \
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      21 |                         (unsigned long long) PAGE_SHIFT)))
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:19:53: note: expanded from macro '__page_to_pfn'
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                         ^ ~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/pgtable-nop4d.h:41:38: note: expanded from macro '__p4d'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                                  ^
   arch/um/include/asm/page.h:88:30: note: expanded from macro '__pgd'
      88 | #define __pgd(x) ((pgd_t) { (x) } )
         |                              ^
   arch/um/include/asm/pgtable-2level.h:37:47: note: expanded from macro 'set_pmd'
      37 | #define set_pmd(pmdptr, pmdval) (*(pmdptr) = (pmdval))
         |                                               ^~~~~~
   12 warnings and 1 error generated.


vim +440 mm/memory.c

   419	
   420	void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
   421	{
   422		spinlock_t *ptl = pmd_lock(mm, pmd);
   423	
   424		if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
   425			mm_inc_nr_ptes(mm);
   426			/*
   427			 * Ensure all pte setup (eg. pte page lock and page clearing) are
   428			 * visible before the pte is made visible to other CPUs by being
   429			 * put into page tables.
   430			 *
   431			 * The other side of the story is the pointer chasing in the page
   432			 * table walking code (when walking the page table without locking;
   433			 * ie. most of the time). Fortunately, these data accesses consist
   434			 * of a chain of data-dependent loads, meaning most CPUs (alpha
   435			 * being the notable exception) will already guarantee loads are
   436			 * seen in-order. See the alpha page table accessors for the
   437			 * smp_rmb() barriers in page table walking code.
   438			 */
   439			smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
 > 440			pmd_populate(mm, pmd, page_ptdesc(*pte));
   441			*pte = NULL;
   442		}
   443		spin_unlock(ptl);
   444	}
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
