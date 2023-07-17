Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86D111A3;
	Mon, 17 Jul 2023 23:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689636977; x=1721172977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oeh7BOVkTlsNsIPJuGEy4n659sbqetmKl//Rn6rrUWk=;
  b=J3ThGbyR0xFp8NonZMLQ7e2xWGsxK3QJAPkNR+f7mMFbYyHmFEgFKXKT
   HskoAz1Lgy80cWFSKNpdfPsZo8uRKzad2x/JXFT7TgEVWSR+LJv2Gkj+q
   MLrekjiqV0XIwggTS3yDQpCFqOnelpksmFMUQkmo1Tb6bspJgBjAkqreN
   KzH0M0rAd1UhIRZecSy7oozQCE5ty3cRIBKIuDfls88ZwLP/4VnOgLNvn
   NGPsB8uCnjxtbdzXOxI2AxCdud6dLH3FxDabBZI/u1d2qezT7cUdc+s7X
   6Wid4RxW9x577sczwsWqIm6S4mDdqDgjyB400sTh0ua4DwnAdQLEZgsCA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452441186"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="452441186"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 16:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1054056723"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="1054056723"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jul 2023 16:36:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLXlE-0009zu-09;
	Mon, 17 Jul 2023 23:36:12 +0000
Date: Tue, 18 Jul 2023 07:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 209/215] mm/mmap.c:2430:29: error: assigning to
 'lockdep_map_p' from incompatible type 'void *'
Message-ID: <202307180750.Dk6xL6nG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   75ac3c8cee9c94691bc9001fcfb6214ae812bfa8
commit: f40b24c7c416b304b93115d66d02dc54e5d2f7d1 [209/215] mm/mmap: change detached vma locking scheme
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230718/202307180750.Dk6xL6nG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180750.Dk6xL6nG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180750.Dk6xL6nG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mmap.c:14:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/mmap.c:14:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/mmap.c:14:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> mm/mmap.c:2430:29: error: assigning to 'lockdep_map_p' from incompatible type 'void *'
    2430 |         mt_detach.ma_external_lock = NULL;
         |                                    ^ ~~~~
   12 warnings and 1 error generated.


vim +2430 mm/mmap.c

  2403	
  2404	/*
  2405	 * do_vmi_align_munmap() - munmap the aligned region from @start to @end.
  2406	 * @vmi: The vma iterator
  2407	 * @vma: The starting vm_area_struct
  2408	 * @mm: The mm_struct
  2409	 * @start: The aligned start address to munmap.
  2410	 * @end: The aligned end address to munmap.
  2411	 * @uf: The userfaultfd list_head
  2412	 * @unlock: Set to true to drop the mmap_lock.  unlocking only happens on
  2413	 * success.
  2414	 *
  2415	 * Return: 0 on success and drops the lock if so directed, error and leaves the
  2416	 * lock held otherwise.
  2417	 */
  2418	static int
  2419	do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
  2420			    struct mm_struct *mm, unsigned long start,
  2421			    unsigned long end, struct list_head *uf, bool unlock)
  2422	{
  2423		struct vm_area_struct *prev, *next = NULL;
  2424		struct maple_tree mt_detach;
  2425		int count = 0;
  2426		int error = -ENOMEM;
  2427		unsigned long locked_vm = 0;
  2428		MA_STATE(mas_detach, &mt_detach, 0, 0);
  2429		mt_init_flags(&mt_detach, vmi->mas.tree->ma_flags & MT_FLAGS_LOCK_MASK);
> 2430		mt_detach.ma_external_lock = NULL;
  2431	
  2432		/*
  2433		 * If we need to split any vma, do it now to save pain later.
  2434		 *
  2435		 * Note: mremap's move_vma VM_ACCOUNT handling assumes a partially
  2436		 * unmapped vm_area_struct will remain in use: so lower split_vma
  2437		 * places tmp vma above, and higher split_vma places tmp vma below.
  2438		 */
  2439	
  2440		/* Does it split the first one? */
  2441		if (start > vma->vm_start) {
  2442	
  2443			/*
  2444			 * Make sure that map_count on return from munmap() will
  2445			 * not exceed its limit; but let map_count go just above
  2446			 * its limit temporarily, to help free resources as expected.
  2447			 */
  2448			if (end < vma->vm_end && mm->map_count >= sysctl_max_map_count)
  2449				goto map_count_exceeded;
  2450	
  2451			error = __split_vma(vmi, vma, start, 0);
  2452			if (error)
  2453				goto start_split_failed;
  2454	
  2455			vma = vma_iter_load(vmi);
  2456		}
  2457	
  2458		prev = vma_prev(vmi);
  2459		if (unlikely((!prev)))
  2460			vma_iter_set(vmi, start);
  2461	
  2462		/*
  2463		 * Detach a range of VMAs from the mm. Using next as a temp variable as
  2464		 * it is always overwritten.
  2465		 */
  2466		for_each_vma_range(*vmi, next, end) {
  2467			/* Does it split the end? */
  2468			if (next->vm_end > end) {
  2469				error = __split_vma(vmi, next, end, 0);
  2470				if (error)
  2471					goto end_split_failed;
  2472			}
  2473			vma_start_write(next);
  2474			mas_set_range(&mas_detach, next->vm_start, next->vm_end - 1);
  2475			error = mas_store_gfp(&mas_detach, next, GFP_KERNEL);
  2476			if (error)
  2477				goto munmap_gather_failed;
  2478			vma_mark_detached(next, true);
  2479			if (next->vm_flags & VM_LOCKED)
  2480				locked_vm += vma_pages(next);
  2481	
  2482			count++;
  2483			if (unlikely(uf)) {
  2484				/*
  2485				 * If userfaultfd_unmap_prep returns an error the vmas
  2486				 * will remain split, but userland will get a
  2487				 * highly unexpected error anyway. This is no
  2488				 * different than the case where the first of the two
  2489				 * __split_vma fails, but we don't undo the first
  2490				 * split, despite we could. This is unlikely enough
  2491				 * failure that it's not worth optimizing it for.
  2492				 */
  2493				error = userfaultfd_unmap_prep(next, start, end, uf);
  2494	
  2495				if (error)
  2496					goto userfaultfd_error;
  2497			}
  2498	#ifdef CONFIG_DEBUG_VM_MAPLE_TREE
  2499			BUG_ON(next->vm_start < start);
  2500			BUG_ON(next->vm_start > end);
  2501	#endif
  2502		}
  2503	
  2504		if (vma_iter_end(vmi) > end)
  2505			next = vma_iter_load(vmi);
  2506	
  2507		if (!next)
  2508			next = vma_next(vmi);
  2509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
