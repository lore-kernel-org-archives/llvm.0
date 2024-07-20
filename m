Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB037DF60;
	Sat, 20 Jul 2024 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721460967; cv=none; b=nOKatobEtYis4q0zPYvA+j0kdXRwgngHtu7ORMRQZ0wK+kErruf3JaPZp76VXZlxSjzQpveWIIC5rl9b9MO9KIYSgQDLY8yA/HvhdduPs3uKPtBTGLfgDdCQNIWgRYqrPF+JURCAZAATLzJJuXlIxlAxIahoTnb7zyHsQBJxwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721460967; c=relaxed/simple;
	bh=xvpRgUCibb886LkPZYqzwNG+fsqrV2sysg3ADbjOYMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C3VGnQPV/dnjKFRHVmgOcwAAoXU1SP/UEq+ijL0JYsTnRqb686Fz1gskjdk4Q11x9zDDRtUn85UzaFHzdTHq6JPH3rChrPpSeQzfZr9t+jR5CFMtVWGsG8AyHVf37+W5NULvyX7oiTRCFkDh24cSbWQSRCBTpM/riEuqZ5iOH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuYzAYxU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuYzAYxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721460965; x=1752996965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xvpRgUCibb886LkPZYqzwNG+fsqrV2sysg3ADbjOYMA=;
  b=UuYzAYxUJN9i84tjZv6XzrxUBBdpirOkXB1jwLd9Byq5gNNYXVICCkqv
   NR3qW8Innp+eVzESYnLdfQ+TV77MrhLJMZX9XEueFBQXuMaJqbJWF8//M
   flSF+3mp4CAPAPmmb3+JzX7lYBdjya2CcNXT5dZwfmxGsULjKd5Z5Jh4c
   BhKaww8XiANgtwySB77XMMkpXTGQzZM8+ZwAc0CQtAt7xX6C3GLj2qrXJ
   FzRMAV8EqJmavUCfH89gYs8RloNcp4Rj3inqhyxNdGn81UEx8qclWsKgj
   aSDRe0J85A/gegu762qhLbDPy+R6en/fIS3b6htFUIjTfHxOjqT9qPv/V
   A==;
X-CSE-ConnectionGUID: 5Wy7DocVTKqJs+NLtEwyBA==
X-CSE-MsgGUID: RCEkhX1YSrKFKV3zpLpAzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18931633"
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="18931633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 00:36:04 -0700
X-CSE-ConnectionGUID: TU2LB07ATHOlbT1MSNYLRw==
X-CSE-MsgGUID: o37qLNp7SPu+CT6PVYV9sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="56179322"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jul 2024 00:36:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV4dM-000iz8-11;
	Sat, 20 Jul 2024 07:36:00 +0000
Date: Sat, 20 Jul 2024 15:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 38/38] mm/memory.c:4650:21: error: incompatible
 pointer types assigning to 'struct ptdesc *' from 'pte_t *'
Message-ID: <202407201547.3RsdbScA-lkp@intel.com>
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
commit: b17c1bbf65811ff797f57b7ddc4fdf4b86d86030 [38/38] mm: convert vmf.prealloc_pte to struct ptdesc pointer
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407201547.3RsdbScA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201547.3RsdbScA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201547.3RsdbScA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
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
   mm/memory.c:440:25: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
   arch/s390/include/asm/pgalloc.h:129:27: note: passing argument to parameter 'pte' here
     129 |                                 pmd_t *pmd, pgtable_t pte)
         |                                                       ^
   mm/memory.c:448:17: error: incompatible pointer types initializing 'struct ptdesc *' with an expression of type 'pte_t *' [-Werror,-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                        ^        ~~~~~~~~~~~~~~~~~
>> mm/memory.c:4650:21: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pte_t *' [-Werror,-Wincompatible-pointer-types]
    4650 |                 vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
         |                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:5013:21: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pte_t *' [-Werror,-Wincompatible-pointer-types]
    5013 |                 vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
         |                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   15 warnings and 4 errors generated.


vim +4650 mm/memory.c

  4622	
  4623	/*
  4624	 * The mmap_lock must have been held on entry, and may have been
  4625	 * released depending on flags and vma->vm_ops->fault() return value.
  4626	 * See filemap_fault() and __lock_page_retry().
  4627	 */
  4628	static vm_fault_t __do_fault(struct vm_fault *vmf)
  4629	{
  4630		struct vm_area_struct *vma = vmf->vma;
  4631		struct folio *folio;
  4632		vm_fault_t ret;
  4633	
  4634		/*
  4635		 * Preallocate pte before we take page_lock because this might lead to
  4636		 * deadlocks for memcg reclaim which waits for pages under writeback:
  4637		 *				lock_page(A)
  4638		 *				SetPageWriteback(A)
  4639		 *				unlock_page(A)
  4640		 * lock_page(B)
  4641		 *				lock_page(B)
  4642		 * pte_alloc_one
  4643		 *   shrink_folio_list
  4644		 *     wait_on_page_writeback(A)
  4645		 *				SetPageWriteback(B)
  4646		 *				unlock_page(B)
  4647		 *				# flush A, B to clear the writeback
  4648		 */
  4649		if (pmd_none(*vmf->pmd) && !vmf->prealloc_pte) {
> 4650			vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
  4651			if (!vmf->prealloc_pte)
  4652				return VM_FAULT_OOM;
  4653		}
  4654	
  4655		ret = vma->vm_ops->fault(vmf);
  4656		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY |
  4657				    VM_FAULT_DONE_COW)))
  4658			return ret;
  4659	
  4660		folio = page_folio(vmf->page);
  4661		if (unlikely(PageHWPoison(vmf->page))) {
  4662			vm_fault_t poisonret = VM_FAULT_HWPOISON;
  4663			if (ret & VM_FAULT_LOCKED) {
  4664				if (page_mapped(vmf->page))
  4665					unmap_mapping_folio(folio);
  4666				/* Retry if a clean folio was removed from the cache. */
  4667				if (mapping_evict_folio(folio->mapping, folio))
  4668					poisonret = VM_FAULT_NOPAGE;
  4669				folio_unlock(folio);
  4670			}
  4671			folio_put(folio);
  4672			vmf->page = NULL;
  4673			return poisonret;
  4674		}
  4675	
  4676		if (unlikely(!(ret & VM_FAULT_LOCKED)))
  4677			folio_lock(folio);
  4678		else
  4679			VM_BUG_ON_PAGE(!folio_test_locked(folio), vmf->page);
  4680	
  4681		return ret;
  4682	}
  4683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
