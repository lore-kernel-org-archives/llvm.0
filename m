Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060B1E7C23;
	Sun, 19 Oct 2025 07:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760858188; cv=none; b=l96CUZF5eao+Ayr6W5HtwsCEo3oPy66rMMsbQq1PVuqNDUIUaufQY+z6B4AWfm060McwLsKno3OUACy2cfxqfhqaeHBEtIbcXFiscEFnuhicrT1GloDnVNCCZtjknow6zaaDXB4xLjIn2O7CieUIlm2D0BTyRXJqczFnF8VSHRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760858188; c=relaxed/simple;
	bh=TVvFUjSA5hqiGNb3ne9oYhH0nFbawCF66fCxSIyAt9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXRSIy2HiYXj/rGJXkMyMZ61otc5Y85gIMDyJO4RbRk5MKm62+rogMmqnzvrxgfEfhD0rR6SApOvicOUq7b7jt+uGfXTxTTFkR/gn86cMkE4QlANYxyV/ZQ9ESC2nfW/fZ3D6B1FQy7gnA8jvUrsCHq4bR2iSiuNVbfAm48Bmsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOhZJUbi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOhZJUbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760858186; x=1792394186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVvFUjSA5hqiGNb3ne9oYhH0nFbawCF66fCxSIyAt9w=;
  b=WOhZJUbit6dNWktaNiN1uBgBDECIWI2KTC1jOiRmdsgk9NH+79quq5qW
   xJjp3GgQ1UH3eh3LU6LweeYZMg8NxNwq/eZSJQF6I82aRJp3T4WwXVuRw
   xuw7na1ebJzVFHK2oFJI+iyynu7ghxDckd+qN0uoLtD4w6V3fqlpeEy0r
   hWuhz3BeqqfALbCjd5AcTwYQbL7bgrOuzti/y7Vs2gG29I25rqBDlEj0y
   sqcovG/hGKFiSEZMzuRdmIhUnDl1V0ZoIy4d6DCXZULgrwc5MFjpXYjhw
   +BwzEKwFgH+toGUpjJDpICasd9UWnBbt4obz7dbPIMDgNBChXYIR7fpP5
   g==;
X-CSE-ConnectionGUID: 195uB7z6RKq20oDJ/FUvHg==
X-CSE-MsgGUID: ccPdzClDSmOaG6MHi35xKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62224639"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="62224639"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 00:16:23 -0700
X-CSE-ConnectionGUID: +KAnABAKQlmB7kdYQQstjA==
X-CSE-MsgGUID: C7tpVnN3SDCF0/UexvYpHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="182783110"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2025 00:16:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vANeO-0008un-1e;
	Sun, 19 Oct 2025 07:16:20 +0000
Date: Sun, 19 Oct 2025 15:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 14/28]
 drivers/vfio/pci/vfio_pci_core.c:2593:5: error: expected identifier or '('
Message-ID: <202510191531.msEdR0Ri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   fa05815572860da32b9145bb5e396a511cc081a9
commit: 7323ffb6a7a00fcc9c21bcb5ded7119da356110c [14/28] Make  vfio_pci_core_get_dmabuf_phys()
config: loongarch-randconfig-001-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191531.msEdR0Ri-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191531.msEdR0Ri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191531.msEdR0Ri-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_core.c:2593:5: error: expected identifier or '('
    2593 | int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
         |     ^
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                ^
>> drivers/vfio/pci/vfio_pci_core.c:2593:5: error: expected ')'
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                ^
   drivers/vfio/pci/vfio_pci_core.c:2593:5: note: to match this '('
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:15: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |               ^
>> drivers/vfio/pci/vfio_pci_core.c:2593:5: error: expected ')'
    2593 | int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
         |     ^
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                       ^
   drivers/vfio/pci/vfio_pci_core.c:2593:5: note: to match this '('
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   drivers/vfio/pci/vfio_pci_core.c:2602:19: error: expected identifier or '('
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         |                   ^
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                ^
   drivers/vfio/pci/vfio_pci_core.c:2602:19: error: expected ')'
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                ^
   drivers/vfio/pci/vfio_pci_core.c:2602:19: note: to match this '('
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:15: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |               ^
   drivers/vfio/pci/vfio_pci_core.c:2602:19: error: expected ')'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         |                   ^
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                       ^
   drivers/vfio/pci/vfio_pci_core.c:2602:19: note: to match this '('
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
>> drivers/vfio/pci/vfio_pci_core.c:2602:1: error: pasting formed '__addressable_(', an invalid preprocessing token
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^
   include/linux/export.h:90:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^
   include/linux/export.h:86:38: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^
   include/linux/export.h:77:2: note: expanded from macro '__EXPORT_SYMBOL'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:286:14: note: expanded from macro '___ADDRESSABLE'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                     ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:24: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                        ^
>> drivers/vfio/pci/vfio_pci_core.c:2602:19: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         |                   ^
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                ^
   drivers/vfio/pci/vfio_pci_core.c:2602:19: error: expected ')'
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                       ^
   drivers/vfio/pci/vfio_pci_core.c:2602:19: note: to match this '('
   include/linux/vfio_pci_core.h:75:39: note: expanded from macro 'vfio_pci_core_get_dmabuf_phys'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
>> drivers/vfio/pci/vfio_pci_core.c:2602:1: error: pasting formed ')569', an invalid preprocessing token
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^
   include/linux/export.h:90:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^
   include/linux/export.h:86:38: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^
   include/linux/export.h:77:2: note: expanded from macro '__EXPORT_SYMBOL'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:24: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                        ^
>> drivers/vfio/pci/vfio_pci_core.c:2602:1: error: expected function body after function declarator
   include/linux/export.h:90:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^
   include/linux/export.h:86:38: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^
   include/linux/export.h:77:2: note: expanded from macro '__EXPORT_SYMBOL'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:286:2: note: expanded from macro '___ADDRESSABLE'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^
   include/linux/compiler.h:166:68: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                                                    ^
   <scratch space>:6:1: note: expanded from here
       6 | 569
         | ^
>> drivers/vfio/pci/vfio_pci_core.c:2602:1: error: pasting formed '__export_symbol_(', an invalid preprocessing token
   include/linux/export.h:90:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^
   include/linux/export.h:86:38: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^
   include/linux/export.h:79:18: note: expanded from macro '__EXPORT_SYMBOL'
      79 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |                         ^
   include/linux/export.h:35:18: note: expanded from macro '___EXPORT_SYMBOL'
      35 |         __export_symbol_##sym:                  ASM_NL  \
         |                         ^
   12 errors generated.


vim +2593 drivers/vfio/pci/vfio_pci_core.c

c61302aa48f7c4 Yishai Hadas    2021-08-26  2591  
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2592  #if !IS_ENABLED(CONFIG_VFIO_PCI_DMABUF)
8c6218f59ae87a Jason Gunthorpe 2025-10-18 @2593  int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2594  				  struct p2pdma_provider **provider,
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2595  				  unsigned int region_index,
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2596  				  struct phys_vec *phys_vec,
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2597  				  struct vfio_region_dma_range *dma_ranges,
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2598  				  size_t nr_ranges)
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2599  {
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2600  	return -EOPNOTSUPP;
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2601  }
8c6218f59ae87a Jason Gunthorpe 2025-10-18 @2602  EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2603  #endif
8c6218f59ae87a Jason Gunthorpe 2025-10-18  2604  

:::::: The code at line 2593 was first introduced by commit
:::::: 8c6218f59ae87a79a7ed6c38409afc86d29adcfd Make vfio dmabuf use an ops for getting the phys ranges

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
