Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E247E2FE04F;
	Tue,  9 Sep 2025 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442926; cv=none; b=DkVvh06IUvbsi6uufrwV3QSVi+3MbpwZwRwqvBvVXyR/N/JwR3s5bwvA4MAsxfF4QNU1BRG9EUIGs//6shtSgZagaOoM+NoHrOnAzv10gnMvisRNaLcaDiiaey+47eCXhHvKVHtAQESI5ZzDG1Ir7a0bB7ptZo8twly/GsuhjyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442926; c=relaxed/simple;
	bh=tXXXv37QsFj6TdTOYpG+J6ybReCSYsms9o1+k6onCkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7HqNauM1rfaQ+Z4tfyH2LgNc1VF8a+pC1sheUYenapTihxgMPhLuD+HX11ukiR94Soxtjv7zXGPe3aNxrBv8vQNNXK8twwhTY76VnTiKzDGDz9kI2hUvjcLqpRM+MOdFJmwAuFrUBsrMwp0hrF/9PhsvIPhnxXj2r4ZCLNmyQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnrV+KY3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnrV+KY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757442925; x=1788978925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tXXXv37QsFj6TdTOYpG+J6ybReCSYsms9o1+k6onCkc=;
  b=FnrV+KY3dlu3CJNHq4ziOt8Uj46L3Kr+v7rML+F7WZPTssCSLx4IfD1w
   /U8Yco4QAxXc9Aq6UVsPoYbt9naUJVFu8WaHX7lf2AR7253PuFFSyJgL9
   RZcwDuTqBA98EBp4fEFf63VYiqSWMdxs0oQBvtQtWljpub0w/qRn+Kcr9
   kw7Tpr6+5EXnkOLfQ7q8kLXO/Kv4RLtZ3N5F2zkroufNSDi0nOkwJxVQR
   hOQUW+wD1p+rVp6WCoPa/selg0m4r04RBATzhZ2/kFTqW9tc8oIC7SYw6
   U0k8hXfUg5Z9bajLXmzyWB/3Fn6X+VGk+g1kMboZ2cV8HXCzQKbnp95Mz
   A==;
X-CSE-ConnectionGUID: ZcvBefrFT3+DKfc0UV1e9g==
X-CSE-MsgGUID: 7fXVBEfVQU6ZF8N0kZ1j9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="69992911"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="69992911"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 11:35:24 -0700
X-CSE-ConnectionGUID: n70I+XUrQYOv4l3zWCXYHg==
X-CSE-MsgGUID: mmcyAU3iQ9aWAjycj3Xjkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="177218583"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Sep 2025 11:35:23 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw3BY-0005B1-15;
	Tue, 09 Sep 2025 18:35:20 +0000
Date: Wed, 10 Sep 2025 02:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [leon-rdma:dmabuf-vfio 9/28] mm/kmsan/hooks.c:346:6: error: call to
 undeclared function 'PhysHighMem'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202509100215.IP4yqu2S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   cb053472a535636cc9e48a971df9b9ee5a4af2d5
commit: 183ae5b67dcfc06cffdba72e9eef1e9985858ff2 [9/28] kmsan: convert kmsan_handle_dma to use physical addresses
config: s390-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20250910/202509100215.IP4yqu2S-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100215.IP4yqu2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100215.IP4yqu2S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kmsan/hooks.c:346:6: error: call to undeclared function 'PhysHighMem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     346 |         if (PhysHighMem(phys))
         |             ^
   mm/kmsan/hooks.c:346:6: note: did you mean 'PageHighMem'?
   include/linux/page-flags.h:620:1: note: 'PageHighMem' declared here
     620 | PAGEFLAG_FALSE(HighMem, highmem)
         | ^
   include/linux/page-flags.h:545:38: note: expanded from macro 'PAGEFLAG_FALSE'
     545 | #define PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lname)   \
         |                                      ^
   include/linux/page-flags.h:523:19: note: expanded from macro 'TESTPAGEFLAG_FALSE'
     523 | static inline int Page##uname(const struct page *page) { return 0; }
         |                   ^
   <scratch space>:21:1: note: expanded from here
      21 | PageHighMem
         | ^
   mm/kmsan/hooks.c:372:6: error: too many arguments to function call, expected 3, have 4
     371 |                 kmsan_handle_dma(sg_page(item), item->offset, item->length,
         |                 ~~~~~~~~~~~~~~~~
     372 |                                  dir);
         |                                  ^~~
   mm/kmsan/hooks.c:362:19: note: 'kmsan_handle_dma' declared here
     362 | EXPORT_SYMBOL_GPL(kmsan_handle_dma);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^~~
   include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^~~
   include/linux/export.h:76:21: note: expanded from macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   2 errors generated.


vim +/PhysHighMem +346 mm/kmsan/hooks.c

   337	
   338	/* Helper function to handle DMA data transfers. */
   339	void kmsan_handle_dma(phys_addr_t phys, size_t size,
   340			      enum dma_data_direction dir)
   341	{
   342		struct page *page = phys_to_page(phys);
   343		u64 page_offset, to_go;
   344		void *addr;
   345	
 > 346		if (PhysHighMem(phys))
   347			return;
   348		addr = page_to_virt(page);
   349		/*
   350		 * The kernel may occasionally give us adjacent DMA pages not belonging
   351		 * to the same allocation. Process them separately to avoid triggering
   352		 * internal KMSAN checks.
   353		 */
   354		while (size > 0) {
   355			page_offset = offset_in_page(addr);
   356			to_go = min(PAGE_SIZE - page_offset, (u64)size);
   357			kmsan_handle_dma_page((void *)addr, to_go, dir);
   358			addr += to_go;
   359			size -= to_go;
   360		}
   361	}
   362	EXPORT_SYMBOL_GPL(kmsan_handle_dma);
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
