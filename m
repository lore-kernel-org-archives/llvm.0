Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821ED1BB6A4;
	Mon,  9 Sep 2024 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893430; cv=none; b=KD2/9CkdYbnym5QxVtRLTUoIGMA7JVJ9t+VxXjrwiDLxwUFvRlJ4lVUnNMhAgL/QOPN5gi3vd8vB4A140IwH8yniOQrRpoTVnhaqb2Jg/hH3MH6cSQPrCT6lH7MKnYsbI1LppqKVDzbH8LBt1swF5s+1py5NIpIF8I1OAu3cQNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893430; c=relaxed/simple;
	bh=q/5IFEru2P7l8ViNJwF3RpUfJtfKZzHcq6cFGNC9lbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpFZ0w/lZ8jwKZNAoXbn7ycJEnPSkLTVXGVf0FNsnibfTYselmnCq5vZXdjLOp2AxMq4LJoSTDN0zxHvu8owifPLnYZTsgSibHsdS4DEjMcDFCcIffWxrM4xKUKq0SZWl1WGLH7shRooOXLKQPTH4LvoXupKC1MGZWia7sY5tMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvkTLNth; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvkTLNth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725893429; x=1757429429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/5IFEru2P7l8ViNJwF3RpUfJtfKZzHcq6cFGNC9lbY=;
  b=FvkTLNthn+QqVGrlTqoRanqgB+cJcK0VFIVgnV6p6G8KQX2Gte+lOlTD
   JfyC3gLJ/FPTLsPqSbUMQP+kuuWWsQQSmSOVTLrBrDBqny+h3c/Qn3Gim
   HbkTkZgifYt6qNZEchiwjYKb7kh2cY1PtFDn7Elztn4KhfZNiQjAHHUWP
   nvBBCAid5fm3tFhtSPF4MG8ch0skDSN9VEdrLcFoguSqHCDkJxa6Ql+vB
   i/rttccn5UUj3CP7C+QRR7zo9LegGt6lP37f6Ih8Zzkbw3e1nvt6o9l0q
   ilQpt4ZP0hDdoOjM7l1OESV/gFMePcZ6/tlP2adqBK+fu5vvJ+/JhQQxg
   Q==;
X-CSE-ConnectionGUID: alm9NGfgTi2OzSgI/GpYHA==
X-CSE-MsgGUID: NT8gLOKVRyarQ6RIv6nouA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24461195"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24461195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 07:50:26 -0700
X-CSE-ConnectionGUID: S5kefscKTW+J7iMaR/2J/Q==
X-CSE-MsgGUID: Y078pzOZR9eEfOtHH4/xkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="89978684"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2024 07:50:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snfih-000ErE-0u;
	Mon, 09 Sep 2024 14:50:23 +0000
Date: Mon, 9 Sep 2024 22:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 190/258]
 include/linux/mm.h:1200:17: error: use of undeclared identifier
 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
Message-ID: <202409092217.EIlshsGO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: a2a5fdffbb42082064006597ddabecccdb746d39 [190/258] vmalloc: is_vmalloc_addr_inlined()
config: i386-buildonly-randconfig-001-20240909 (https://download.01.org/0day-ci/archive/20240909/202409092217.EIlshsGO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092217.EIlshsGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092217.EIlshsGO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/tls/tls_strp.c:4:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
>> include/linux/mm.h:1200:17: error: use of undeclared identifier 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
   In file included from net/tls/tls_strp.c:4:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
>> include/linux/mm.h:1200:41: error: use of undeclared identifier 'VMALLOC_END'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
         |                                                KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
   2 errors generated.
--
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:12:
>> include/linux/mm.h:1200:17: error: use of undeclared identifier 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:12:
>> include/linux/mm.h:1200:41: error: use of undeclared identifier 'VMALLOC_END'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
         |                                                KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
   kernel/dma/direct.c:147:20: warning: shift count >= width of type [-Wshift-count-overflow]
     147 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 2 errors generated.


vim +1200 include/linux/mm.h

  1188	
  1189	/*
  1190	 * Determine if an address is within the vmalloc range
  1191	 *
  1192	 * On nommu, vmalloc/vfree wrap through kmalloc/kfree directly, so there
  1193	 * is no special casing required.
  1194	 */
  1195	#ifdef CONFIG_MMU
  1196	static inline bool is_vmalloc_addr_inlined(const void *x)
  1197	{
  1198		unsigned long addr = (unsigned long)kasan_reset_tag(x);
  1199	
> 1200		return addr >= VMALLOC_START && addr < VMALLOC_END;
  1201	}
  1202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
