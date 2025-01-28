Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A7199FA2;
	Tue, 28 Jan 2025 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064255; cv=none; b=NxD3Y1NRYkjRr+ZvFeuzQUlA/U7EQmctB9e28JoDfFrS5/QeZaWyh8GF6XVighUWa8qK9nYtYfZ19ph6fNPG5CGrb219ElVmoJZ8HXuV9QNW7suBcHxzA7EWk0d9O76QwEINKNuARV+N2ZNApfLYiOmOt1jvfHpBvyYxJdQS7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064255; c=relaxed/simple;
	bh=nk9k8G4JgEDl72Ama/eB4GcNqtRWxWghx2VOE32XuMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JB1n3L8nUwe3D7tfrS+2MUWzouKUKeBdBRxKixWjO7DHfzsEwWJvKz/La/obu8qMW3g+fqiIC8+giBmO/SsLVAhlwIZLwILg8sgB8FKxlx7JzHWpH/YqdCP7Zugj5ZHe3J7f1PZF9f7bT0DPXnRTkAUbV2V/KrkydbRqMBtH9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOyZtqH/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOyZtqH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738064253; x=1769600253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nk9k8G4JgEDl72Ama/eB4GcNqtRWxWghx2VOE32XuMM=;
  b=SOyZtqH/KXCT3qXZjlr/tMUq/YWSD3USp4Y1FaXboeSji0NJyGbVWdIm
   JbdBLvLzNq8O1nUeGdda6/KpPz4uI34XUTt2obR10O+C+vhnJqAwr1IZw
   Crgm/FXgutdHm2Q6CYXdDqYAyThN9M8RXZ/CXdaRTkF1WjmsHrHN5802o
   W41GXX1ftJghwtXSv2Z8zUDS/ZpsDkP5uFNdcg9WTpnZPgJEYJxZxXhja
   cBraS1Ksq97PCnm4O4ubRjclnvXXFHxEGHWj/FDmylH1PxVUpv6Jrj+qo
   NnwaexNpLynFCGDzH4tqKIm/uO5+O/ZHsxcP9okDyCutS3ffhxDQOJPjn
   w==;
X-CSE-ConnectionGUID: 7kB66LMcS1ufRATJ2q93qQ==
X-CSE-MsgGUID: uruIHoqaSjeL++lL73SCJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="61013614"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="61013614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 03:37:33 -0800
X-CSE-ConnectionGUID: VLB0d+9uSluH7iFJXJpTUQ==
X-CSE-MsgGUID: /8DOiY/fSjmYAg/6NKfdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139576689"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2025 03:37:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcjuL-000hjD-2q;
	Tue, 28 Jan 2025 11:37:29 +0000
Date: Tue, 28 Jan 2025 19:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 16/16]
 drivers/firmware/efi/libstub/zboot-x86.c:26:14: error: conflicting types for
 'efi_decompress_kernel'
Message-ID: <202501281944.OIGe40x9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   9d45748a5e00217becbc742d98c413913ad8344a
commit: 9d45748a5e00217becbc742d98c413913ad8344a [16/16] efi zboot for x86
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250128/202501281944.OIGe40x9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281944.OIGe40x9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281944.OIGe40x9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/zboot-x86.c:26:14: error: conflicting types for 'efi_decompress_kernel'
      26 | efi_status_t efi_decompress_kernel(unsigned long *kernel_entry)
         |              ^
   drivers/firmware/efi/libstub/x86-stub.h:15:14: note: previous declaration is here
      15 | efi_status_t efi_decompress_kernel(unsigned long *kernel_entry,
         |              ^
>> drivers/firmware/efi/libstub/zboot-x86.c:32:53: error: too few arguments to function call, expected 4, have 3
      32 |                  efi_allocate_kernel(alloc_size, &virt_addr, &addr) ?:
         |                  ~~~~~~~~~~~~~~~~~~~                              ^
   drivers/firmware/efi/libstub/x86-stub.h:17:14: note: 'efi_allocate_kernel' declared here
      17 | efi_status_t efi_allocate_kernel(unsigned long alloc_size,
         |              ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                                  unsigned long *virt_addr,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                                  unsigned long *alloc,
         |                                  ~~~~~~~~~~~~~~~~~~~~~
      20 |                                  struct boot_params *boot_params);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/efi_decompress_kernel +26 drivers/firmware/efi/libstub/zboot-x86.c

    25	
  > 26	efi_status_t efi_decompress_kernel(unsigned long *kernel_entry)
    27	{
    28		unsigned long virt_addr, addr, alloc_size, entry;
    29		efi_status_t status;
    30	
    31		status = efi_zboot_decompress_init(&alloc_size, &entry) ?:
  > 32			 efi_allocate_kernel(alloc_size, &virt_addr, &addr) ?:
    33			 efi_zboot_decompress((void *)addr, alloc_size);
    34		if (status != EFI_SUCCESS)
    35			return status;
    36	
    37	
    38		// TODO apply relocations
    39		efi_warn("TODO relocate to 0x%lx\n", virt_addr);
    40	
    41		*kernel_entry = addr + entry;
    42		return EFI_SUCCESS;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
