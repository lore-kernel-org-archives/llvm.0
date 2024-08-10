Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2551BF4E2;
	Sat, 10 Aug 2024 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723295835; cv=none; b=NN8bOiTlOM1zF2gFSfCkkl5JYzms4pktqzGMesh0LM1WtBTMmNf/GOU2Zvn4KXxYm+Qn7eiKza3lCyYdzh+p2LMXC+kX53QDndgym4flvV+LbvIEiHjanMXby5V6kAEB9QgZ6Kcb3e4ONioZKshfejOa9MdC7E2v1hBFeB3pIPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723295835; c=relaxed/simple;
	bh=EpB1uQoTSHXG3ZUeO1pMFzRIm1KZC9L1WipVrLDZVg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deO2GZruauDW8E631J+SdV8s2j3X9+HAtPtfI2dd6+XaLqVvp1D7fZV20QSIh3ZZ/DLZVOeDF3ZKttZzgikXHOISi7l/pAnSU1WUcChMRjk6D83C/cqMM5yyJih5KKvupIhE2KI4dCVn3Pk4Lp//TGq97Q/o0Scz8POBcYV+/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7EtYVi1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7EtYVi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723295833; x=1754831833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EpB1uQoTSHXG3ZUeO1pMFzRIm1KZC9L1WipVrLDZVg4=;
  b=h7EtYVi1yfPFOeu7UmsKMj/hld01yl3tIIGlgyJpVBnl68OvlnkkbEeQ
   rX3eQC7Fwqs74H3Hrdrk6Zisy0xb/xamlwT7P/6LW2PzC4vOsMj1mi94T
   /wL45tWrvMhS6KErqivKs7xgPAm6FBh1qKcUvmMJNNWwxj5WoilpJEZUo
   7qYUHrdKg8U/5LIr+6fBayFVylT81HKHgGyiO/+hH2uXMw4OqVvcLNUXx
   RihbUXzVt9n7r/ZTMJCsD3oR8V7+sRc0za93WM2hJSioTRY9BnBB/Qcup
   Io+xsw0kaw5LhIGfYERNL+xTJzt5sAeAL6kkgykDpY+7wviQLev1pbuEs
   g==;
X-CSE-ConnectionGUID: CVV2NVpVSsO77MwzWWbW6w==
X-CSE-MsgGUID: NqIRgEwmRKuTkwMDQ0S6yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32608768"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="32608768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 06:17:12 -0700
X-CSE-ConnectionGUID: jOSjrw22TvmqixQelh7Kzw==
X-CSE-MsgGUID: DQ1sfXXzS0uIfEU32cBHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57726139"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 10 Aug 2024 06:17:11 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sclxx-0009xD-1W;
	Sat, 10 Aug 2024 13:17:05 +0000
Date: Sat, 10 Aug 2024 21:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: kaiyang2@cs.cmu.edu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm,memcg: provide per-cgroup counters for NUMA balancing
 operations
Message-ID: <202408102136.3slnnqT9-lkp@intel.com>
References: <20240809212115.59291-1-kaiyang2@cs.cmu.edu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809212115.59291-1-kaiyang2@cs.cmu.edu>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/kaiyang2-cs-cmu-edu/mm-memcg-provide-per-cgroup-counters-for-NUMA-balancing-operations/20240810-115614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240809212115.59291-1-kaiyang2%40cs.cmu.edu
patch subject: [PATCH] mm,memcg: provide per-cgroup counters for NUMA balancing operations
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240810/202408102136.3slnnqT9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408102136.3slnnqT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408102136.3slnnqT9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2199:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
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
>> mm/memory.c:5376:34: error: use of undeclared identifier 'NUMA_HINT_FAULTS'
    5376 |         count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
         |                                         ^
   15 warnings and 1 error generated.


vim +/NUMA_HINT_FAULTS +5376 mm/memory.c

  5366	
  5367	int numa_migrate_prep(struct folio *folio, struct vm_fault *vmf,
  5368			      unsigned long addr, int page_nid, int *flags)
  5369	{
  5370		struct vm_area_struct *vma = vmf->vma;
  5371	
  5372		/* Record the current PID acceesing VMA */
  5373		vma_set_access_pid_bit(vma);
  5374	
  5375		count_vm_numa_event(NUMA_HINT_FAULTS);
> 5376		count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
  5377		if (page_nid == numa_node_id()) {
  5378			count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
  5379			*flags |= TNF_FAULT_LOCAL;
  5380		}
  5381	
  5382		return mpol_misplaced(folio, vmf, addr);
  5383	}
  5384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
