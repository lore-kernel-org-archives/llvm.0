Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BF720FB;
	Sat, 12 Aug 2023 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691840416; x=1723376416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vtuqva1iB2s/LBo/3YGv/27P37ds7er84l05hq0Br4U=;
  b=TJSM2+Ey4piX44QDc+1KKVuRpv2d8CxNiUAEi5to2cniJY7f6vCgMa2+
   xcAaOoPtKu7iq+ACanaTrhSdnTck3c1Qa+sPhfyQjTkTspK9PMYdUtgpv
   9Sl2rf/X1+wcDGI0RG/GiTH9O24GhcXRT4aoSwbO6/sIT01pPBMKoyk3a
   ZGXteEwxR/0226TaHgEvbdDGbhTVbeRzNHN5J4SuHOKGCbXFuZvP2zRwd
   IlJmczHX3G4PRO2LIR3K2zQQ4ZaXdgiA3ufK1duS7vV5SEjTwXVv8u6Mu
   NSF/v+hypeFqSS+H8/D+WI4tHWagDDEvRmKhacQDyPFru1QG5m/LZUtJ1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374588234"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="374588234"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 04:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798304333"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="798304333"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Aug 2023 04:40:13 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUmya-0008Xs-1K;
	Sat, 12 Aug 2023 11:40:12 +0000
Date: Sat, 12 Aug 2023 19:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:34: error: call to
 undeclared function 'vma_is_tcp'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202308121909.XNYBtqNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   5fb2ea3111f4ecc6dc4891ce5b00f0217aae9a04
commit: 4aaa60dad4d1c96151dec51098aed866bb6e867d [219/240] mm: allow per-VMA locks on file-backed VMAs
config: s390-randconfig-r044-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121909.XNYBtqNI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121909.XNYBtqNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121909.XNYBtqNI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:83:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:83:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:83:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/memory.c:5410:34: error: call to undeclared function 'vma_is_tcp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5410 |         if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
         |                                         ^
   mm/memory.c:5410:34: note: did you mean 'vma_is_dax'?
   include/linux/fs.h:2990:20: note: 'vma_is_dax' declared here
    2990 | static inline bool vma_is_dax(const struct vm_area_struct *vma)
         |                    ^
   12 warnings and 1 error generated.


vim +/vma_is_tcp +5410 mm/memory.c

c2508ec5a58db6 Linus Torvalds     2023-06-15  5382  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5383  #ifdef CONFIG_PER_VMA_LOCK
50ee3253720614 Suren Baghdasaryan 2023-02-27  5384  /*
50ee3253720614 Suren Baghdasaryan 2023-02-27  5385   * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
50ee3253720614 Suren Baghdasaryan 2023-02-27  5386   * stable and not isolated. If the VMA is not found or is being modified the
50ee3253720614 Suren Baghdasaryan 2023-02-27  5387   * function returns NULL.
50ee3253720614 Suren Baghdasaryan 2023-02-27  5388   */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5389  struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
50ee3253720614 Suren Baghdasaryan 2023-02-27  5390  					  unsigned long address)
50ee3253720614 Suren Baghdasaryan 2023-02-27  5391  {
50ee3253720614 Suren Baghdasaryan 2023-02-27  5392  	MA_STATE(mas, &mm->mm_mt, address, address);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5393  	struct vm_area_struct *vma;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5394  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5395  	rcu_read_lock();
50ee3253720614 Suren Baghdasaryan 2023-02-27  5396  retry:
50ee3253720614 Suren Baghdasaryan 2023-02-27  5397  	vma = mas_walk(&mas);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5398  	if (!vma)
50ee3253720614 Suren Baghdasaryan 2023-02-27  5399  		goto inval;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5400  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5401  	if (!vma_start_read(vma))
50ee3253720614 Suren Baghdasaryan 2023-02-27  5402  		goto inval;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5403  
657b5146955eba Jann Horn          2023-07-26  5404  	/*
657b5146955eba Jann Horn          2023-07-26  5405  	 * find_mergeable_anon_vma uses adjacent vmas which are not locked.
657b5146955eba Jann Horn          2023-07-26  5406  	 * This check must happen after vma_start_read(); otherwise, a
657b5146955eba Jann Horn          2023-07-26  5407  	 * concurrent mremap() with MREMAP_DONTUNMAP could dissociate the VMA
657b5146955eba Jann Horn          2023-07-26  5408  	 * from its anon_vma.
657b5146955eba Jann Horn          2023-07-26  5409  	 */
657b5146955eba Jann Horn          2023-07-26 @5410  	if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
657b5146955eba Jann Horn          2023-07-26  5411  		goto inval_end_read;
657b5146955eba Jann Horn          2023-07-26  5412  
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5413  	/*
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5414  	 * Due to the possibility of userfault handler dropping mmap_lock, avoid
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5415  	 * it for now and fall back to page fault handling under mmap_lock.
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5416  	 */
657b5146955eba Jann Horn          2023-07-26  5417  	if (userfaultfd_armed(vma))
657b5146955eba Jann Horn          2023-07-26  5418  		goto inval_end_read;
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5419  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5420  	/* Check since vm_start/vm_end might change before we lock the VMA */
657b5146955eba Jann Horn          2023-07-26  5421  	if (unlikely(address < vma->vm_start || address >= vma->vm_end))
657b5146955eba Jann Horn          2023-07-26  5422  		goto inval_end_read;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5423  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5424  	/* Check if the VMA got isolated after we found it */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5425  	if (vma->detached) {
50ee3253720614 Suren Baghdasaryan 2023-02-27  5426  		vma_end_read(vma);
52f238653e452e Suren Baghdasaryan 2023-02-27  5427  		count_vm_vma_lock_event(VMA_LOCK_MISS);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5428  		/* The area was replaced with another one */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5429  		goto retry;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5430  	}
50ee3253720614 Suren Baghdasaryan 2023-02-27  5431  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5432  	rcu_read_unlock();
50ee3253720614 Suren Baghdasaryan 2023-02-27  5433  	return vma;
657b5146955eba Jann Horn          2023-07-26  5434  
657b5146955eba Jann Horn          2023-07-26  5435  inval_end_read:
657b5146955eba Jann Horn          2023-07-26  5436  	vma_end_read(vma);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5437  inval:
50ee3253720614 Suren Baghdasaryan 2023-02-27  5438  	rcu_read_unlock();
52f238653e452e Suren Baghdasaryan 2023-02-27  5439  	count_vm_vma_lock_event(VMA_LOCK_ABORT);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5440  	return NULL;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5441  }
50ee3253720614 Suren Baghdasaryan 2023-02-27  5442  #endif /* CONFIG_PER_VMA_LOCK */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5443  

:::::: The code at line 5410 was first introduced by commit
:::::: 657b5146955eba331e01b9a6ae89ce2e716ba306 mm: lock_vma_under_rcu() must check vma->anon_vma under vma lock

:::::: TO: Jann Horn <jannh@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
