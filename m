Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC5BA50;
	Wed, 10 Apr 2024 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712721398; cv=none; b=go2gNqDxwBVJSjfgwqYRdU0+ZfePSUk+7kWDg8AX1Vr3F89Wya52MJSpeUN301qiy0N+LUsQKljqlIKXfH0f7ridTW+PdmFWX2Wa8A2z6fDDkHqWZhU3RyLpnjLCmHoWpE689Y+ZZoggNd009ma9OIVuhy71uOpN9C9/XTOrmvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712721398; c=relaxed/simple;
	bh=jBUyUHzXJqiXF/+3/vD7c2n4Aa+hDWuYW8SzIS5MCOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tl6Cs1lxFHsfiVwbtT6xFFeix2yhtxBmHAkE5QNwqH4YyqJXU12cEdEIDij41uBneZO6sounrxFHRRXswvNH7YYNMp2RkUmI5PWCUDL9y5yHlph6sMmdVRBLLpugw8GQcBsn8hYAIpuR7c13OQfO7WglChOUuSxXDdjNREYOumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1vRn4W+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1vRn4W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712721395; x=1744257395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBUyUHzXJqiXF/+3/vD7c2n4Aa+hDWuYW8SzIS5MCOI=;
  b=S1vRn4W+WU5GkSOTadnK9Ap1QVMM4Vb5vjiPjVR7xR+3ljNFB8WbnerK
   0NT7vzwFUvMruI3CkJ+B0MxxUGreWrqRGumIAfCbLz46+idNgVPJuoFii
   X6JCtNFL04mBo3oRGrh2792wRUFc1Ipbz/67bwJfbzcOWHPcLL9pLCg6R
   d9yiohsofb6FqZzQPPUeUnaadjHREFEFhwK/rGYH8UZ2I6ti1vbTINPKP
   Ps9v438YeRTsLwlH+pGZXZB+SCmoPAUUpQYdhvNMz2iftYWT9R41ZsOyR
   s794V8CYnCqO9y99EI2NKhJ/GovQWgn6aPCsGnRlu5GsfayXAmW56cqnP
   Q==;
X-CSE-ConnectionGUID: N/5kiJFHTHSaj7DcYEkv7Q==
X-CSE-MsgGUID: gxyYPU8hS4SaGArv6q2uzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11030723"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11030723"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 20:56:34 -0700
X-CSE-ConnectionGUID: EhjJNzb5RzunD9bNhSUq6g==
X-CSE-MsgGUID: fYN2qyhQSQKiEgpg77/UxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20308513"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2024 20:56:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruP4Z-0006lu-0T;
	Wed, 10 Apr 2024 03:56:31 +0000
Date: Wed, 10 Apr 2024 11:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 21/22] mm/execmem.c:192:2: error: call to
 undeclared function 'flush_tlb_kernel_range'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202404101125.Ne2NU3YV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   a14551111ff8bbf3c520771e89892d599463da71
commit: 85e04aa7ae67c997077a12fc9e6ed04fbc2d6975 [21/22] execmem: add support for cache of large ROX pages
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240410/202404101125.Ne2NU3YV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101125.Ne2NU3YV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101125.Ne2NU3YV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/execmem.c:3:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/execmem.c:11:
   In file included from mm/internal.h:12:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/execmem.c:11:
   In file included from mm/internal.h:12:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/execmem.c:11:
   In file included from mm/internal.h:12:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> mm/execmem.c:192:2: error: call to undeclared function 'flush_tlb_kernel_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     192 |         flush_tlb_kernel_range(start, end);
         |         ^
   7 warnings and 1 error generated.


vim +/flush_tlb_kernel_range +192 mm/execmem.c

   166	
   167	static int execmem_cache_populate(struct execmem_range *range, size_t size)
   168	{
   169		unsigned long vm_flags = VM_FLUSH_RESET_PERMS | VM_ALLOW_HUGE_VMAP;
   170		unsigned long start, end;
   171		struct vm_struct *vm;
   172		size_t alloc_size;
   173		int err = -ENOMEM;
   174		void *p;
   175	
   176		alloc_size = round_up(size, PMD_SIZE);
   177		p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
   178		if (!p)
   179			return err;
   180	
   181		vm = find_vm_area(p);
   182		if (!vm)
   183			goto err_free_mem;
   184	
   185		/* fill memory with invalid instructions */
   186		execmem_invalidate(p, alloc_size, /* writable = */ true);
   187	
   188		start = (unsigned long)p;
   189		end = start + alloc_size;
   190	
   191		vunmap_range_noflush(start, end);
 > 192		flush_tlb_kernel_range(start, end);
   193	
   194		/* FIXME: handle direct map alias */
   195	
   196		err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
   197					       PMD_SHIFT);
   198		if (err)
   199			goto err_free_mem;
   200	
   201		err = execmem_cache_add(p, alloc_size);
   202		if (err)
   203			goto err_free_mem;
   204	
   205		return 0;
   206	
   207	err_free_mem:
   208		vfree(p);
   209		return err;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
