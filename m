Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8556E1111;
	Fri,  8 Sep 2023 02:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694139889; x=1725675889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AACIgoRMA6S0P2z6aevBgcmvr/dHpIzhLw/Za3zWxFc=;
  b=RJDe4slHd9twYBSfjqeo71YS/MNYZ/A9vjlwj5gVMNm5i1/s4i4Kcbxx
   w6zrmSyhIfW7itOUSyRa5HHBkQyAwINU+k2hCLsXeAf6UmhOxcrCAr4Hs
   7Ad7+CCQAJf+347tPhMATjGuRbSI8tNUX/dpdScbmAszaaQIwCCRumpSM
   eYT/wfSPlQxOGTvnhlyKdJN8XSy1amLN4wBqTbCf2q+9l7ZQEKenbsoUS
   bwPKNphVdKT18t/VkjTpfKHj8uX8Ht4gYL9r8ntY9PuRRJ49VAYzK005q
   e6p8PexYRPCihFkH0zTOmJr17Zd/krpgyUqRxu0P7h3c0/kT4Q84K8cAl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362597257"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="362597257"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 19:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807781841"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="807781841"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2023 19:24:45 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeRAo-0001pr-2O;
	Fri, 08 Sep 2023 02:24:42 +0000
Date: Fri, 8 Sep 2023 10:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 2/4] kernel/fork.c:939:2: error: implicit
 declaration of function 'mm_free_rmap_id' is invalid in C99
Message-ID: <202309081027.tRNUzl73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   17125381adce3cd008977d62b31863b283bf75bb
commit: 1730d1c9fe15d22df5daa27747c938e2093f1541 [2/4] rmap_id per MM
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309081027.tRNUzl73-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081027.tRNUzl73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081027.tRNUzl73-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   kernel/fork.c:833:9: warning: 'mm_alloc_rmap_id' macro redefined [-Wmacro-redefined]
   #define mm_alloc_rmap_id(mm)
           ^
   kernel/fork.c:832:9: note: previous definition is here
   #define mm_alloc_rmap_id(mm)    (0)
           ^
>> kernel/fork.c:939:2: error: implicit declaration of function 'mm_free_rmap_id' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mm_free_rmap_id(mm);
           ^
   kernel/fork.c:939:2: note: did you mean 'mm_free_pgd'?
   kernel/fork.c:801:20: note: 'mm_free_pgd' declared here
   static inline void mm_free_pgd(struct mm_struct *mm)
                      ^
   kernel/fork.c:1321:26: error: expected expression
           if (mm_alloc_rmap_id(mm))
                                   ^
   kernel/fork.c:1322:22: error: expected ';' after goto statement
                   goto fail_no_rmapid
                                      ^
                                      ;
   kernel/fork.c:1343:2: error: implicit declaration of function 'mm_free_rmap_id' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mm_free_rmap_id(mm);
           ^
   kernel/fork.c:1322:8: error: use of undeclared label 'fail_no_rmapid'
                   goto fail_no_rmapid
                        ^
   13 warnings and 5 errors generated.


vim +/mm_free_rmap_id +939 kernel/fork.c

   923	
   924	/*
   925	 * Called when the last reference to the mm
   926	 * is dropped: either by a lazy thread or by
   927	 * mmput. Free the page directory and the mm.
   928	 */
   929	void __mmdrop(struct mm_struct *mm)
   930	{
   931		BUG_ON(mm == &init_mm);
   932		WARN_ON_ONCE(mm == current->mm);
   933	
   934		/* Ensure no CPUs are using this as their lazy tlb mm */
   935		cleanup_lazy_tlbs(mm);
   936	
   937		WARN_ON_ONCE(mm == current->active_mm);
   938		mm_free_pgd(mm);
 > 939		mm_free_rmap_id(mm);
   940		destroy_context(mm);
   941		mmu_notifier_subscriptions_destroy(mm);
   942		check_mm(mm);
   943		put_user_ns(mm->user_ns);
   944		mm_pasid_drop(mm);
   945		mm_destroy_cid(mm);
   946		percpu_counter_destroy_many(mm->rss_stat, NR_MM_COUNTERS);
   947	
   948		free_mm(mm);
   949	}
   950	EXPORT_SYMBOL_GPL(__mmdrop);
   951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
