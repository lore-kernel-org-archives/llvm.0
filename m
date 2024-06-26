Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3B67345E;
	Wed, 26 Jun 2024 23:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719443275; cv=none; b=bT7iIiQ6RCgMcFOUpgJsaLM+NG4e7Nf02+tfaEWijpm/JXh626imnnd2bibOsxVtzfRyGsofrG+jvfNsDE8EYE3Fc0CJle1dsAyMRoAwbn7BWoQyf0g9L5TErLhXIJ93tfgYXw96pMwQYS9VPmV2oJNswHb8UAusJM/3PpqTWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719443275; c=relaxed/simple;
	bh=lw04AiwoAVB+nrYxtxcgBRrpGjVyQzkfU8ElmoxdRxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+fjiyA01xlpAorinxTNtQ74bcows7tQ6rW1suFA7crgigwRPyUmXv4sQ6CRlkSyPWYQB30ha62owmhJsp9U4gv58ciGfrjWXdA2LiqeU6JDETJNagS2T9WjMOCwBbvr2N5Z0FOt31PoQioVTVpTsuxWvYAMuQ6POn1ENPK6wGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg9JGeMl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg9JGeMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719443273; x=1750979273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lw04AiwoAVB+nrYxtxcgBRrpGjVyQzkfU8ElmoxdRxc=;
  b=Dg9JGeMlixg3NNdZESjLZz5trFoBe94DbqwSEHlQZc7F4WWDfidwnvze
   zOs0bj/Isi2yr1gT4UGggONOkW+VlWE2p6DGU/OGmW+Q2YmNEDWmBNvvJ
   iB/Lv5/r+sNIVJPUlBWbZD3HjE34a27VRnw+dBxSDoUuIYCnneiFItAYW
   VYDPH5ALtgnPq9nKB7qx0TRGFJ5kpabdyvIKg2snGXENL2CnYnEkMb7yY
   mV02GFdkNM5nca4BhcdO+Nmr8ibzad5hkLzffxd8AkhOHaVc1UpXZnKhP
   nX2EXAov64vHMbKcXceyfFkgQlzioueU7B1t1uDKr+6q1cYg5Ge+W4zfQ
   A==;
X-CSE-ConnectionGUID: wBXQR1wZQ3uINMwTZXhPtw==
X-CSE-MsgGUID: hSv7bQrqR/Oqnjf2JqUjmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34078210"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="34078210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 16:07:51 -0700
X-CSE-ConnectionGUID: VoC7/zVnQJaCChWqtLz+CA==
X-CSE-MsgGUID: bprYNXWPS4CI3GZhho0oqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="67390782"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2024 16:07:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMbjv-000Fe8-1O;
	Wed, 26 Jun 2024 23:07:47 +0000
Date: Thu, 27 Jun 2024 07:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kagan <rkagan@amazon.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] mm/secretmem: implement mm-local kernel
 allocations
Message-ID: <202406270602.w9EB733b-lkp@intel.com>
References: <20240621201501.1059948-3-rkagan@amazon.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621201501.1059948-3-rkagan@amazon.de>

Hi Roman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus shuah-kselftest/next shuah-kselftest/fixes linus/master v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kagan/mseal-expose-interface-to-seal-unseal-user-memory-ranges/20240625-174709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240621201501.1059948-3-rkagan%40amazon.de
patch subject: [PATCH RFC 2/3] mm/secretmem: implement mm-local kernel allocations
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240627/202406270602.w9EB733b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270602.w9EB733b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270602.w9EB733b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
>> mm/gup.c:1175:7: error: call to undeclared function 'can_access_secretmem_vma'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1175 |         if (!can_access_secretmem_vma(vma))
         |              ^
   mm/gup.c:1380:7: error: call to undeclared function 'can_access_secretmem_vma'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1380 |         if (!can_access_secretmem_vma(vma))
         |              ^
   12 warnings and 2 errors generated.


vim +/can_access_secretmem_vma +1175 mm/gup.c

  1168	
  1169	struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
  1170				 unsigned int foll_flags)
  1171	{
  1172		struct follow_page_context ctx = { NULL };
  1173		struct page *page;
  1174	
> 1175		if (!can_access_secretmem_vma(vma))
  1176			return NULL;
  1177	
  1178		if (WARN_ON_ONCE(foll_flags & FOLL_PIN))
  1179			return NULL;
  1180	
  1181		/*
  1182		 * We never set FOLL_HONOR_NUMA_FAULT because callers don't expect
  1183		 * to fail on PROT_NONE-mapped pages.
  1184		 */
  1185		page = follow_page_mask(vma, address, foll_flags, &ctx);
  1186		if (ctx.pgmap)
  1187			put_dev_pagemap(ctx.pgmap);
  1188		return page;
  1189	}
  1190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
