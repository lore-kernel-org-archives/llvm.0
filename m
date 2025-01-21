Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63446155398;
	Tue, 21 Jan 2025 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737438728; cv=none; b=YSgrdZ49udKG884wVMdIB1sbwYviZCgAWW6Ou7tgZoLEWvJgVX/znYSikSLqhM3sb1G2kugl0K+LY5yS0vsxlwDOFoM/l1wEo+0KEbkZNCDCdyVLQrhD0xAU6YOEkDvRwxymF+Kdow6GgakNBRKVJdFlJf7DAjZxo++W1uQ/Tq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737438728; c=relaxed/simple;
	bh=pfK26veDPULH6U4AZ8mSmH0SBRWWxfUNGvz10zE8uj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvIFQQi3JoYG65YkmuwGWbrQDQc74/zJQPmfxfHkDnuyzoicLZBFOU0ms/3n/mM5TBnHZsFOImgAvWmFd23NY/yl1PH9N7BfsbTSKTw0XP26nKoBehCCJTuHAg93z8ozOoklwBau62XnAUGvQvXaDIbg731mnGHFkfYnceyBU6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHWI2Rso; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHWI2Rso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737438726; x=1768974726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfK26veDPULH6U4AZ8mSmH0SBRWWxfUNGvz10zE8uj8=;
  b=XHWI2Rso/j8PIaSSN0ahgg/SHHtNa094Q+odgAQEKwN9No5Cdb4xOcwv
   QPhPGZYif5km60yh+djFu+BU5jG1+ybo+SLZjCUgYi5UsQdprDfh6HoLd
   SAcGnOlyODL7SM8Z41QtwquSKeNhaMrdgcqdxw0PNf+XqT+bQBP8ayF6H
   V+bMw56R5gY7Kv5awc0dzGa2oY442aA//YFwikb+QeAYHQbOMwcCDs2Pv
   D+pd0rQHh9Vwa2+GsvtMthLHA0CHmi67jjnQJJAX4s3ik1WCQG8Sp/7vL
   cd+p0TFNMp+oBkKAgbi1+JSmHvIooEZPbj4UPTEC9aQU7s+dB5/9QkAH4
   w==;
X-CSE-ConnectionGUID: qGguYJ8sRhmPv+cT6iUJoQ==
X-CSE-MsgGUID: HpCR6rvDRWeGvmNaoTMVQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="63204516"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="63204516"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 21:52:02 -0800
X-CSE-ConnectionGUID: 25U3JpIBTvivjSUbfdVm7A==
X-CSE-MsgGUID: BAvpbMYbTjGXwPoLQ0ex9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="111694700"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 21:52:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta7B8-000Xgl-2v;
	Tue, 21 Jan 2025 05:51:58 +0000
Date: Tue, 21 Jan 2025 13:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 29/30]
 drivers/firmware/efi/libstub/x86-stub.c:457:2: error: call to undeclared
 function 'efi_stub_entry'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202501211302.wfLY0NuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   d9643e73517e2ecc1c3dac9a4724ddfb866620c3
commit: 8785c948523908af9cab93e4f845bdf476c653dc [29/30] efistub/x86: Refactor decompression flow to prepare for zboot support
config: x86_64-buildonly-randconfig-005-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211302.wfLY0NuE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211302.wfLY0NuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211302.wfLY0NuE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/x86-stub.c:457:2: error: call to undeclared function 'efi_stub_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     457 |         efi_stub_entry(handle, sys_table_arg, boot_params);
         |         ^
   drivers/firmware/efi/libstub/x86-stub.c:457:2: note: did you mean 'efi_pe_entry'?
   drivers/firmware/efi/libstub/efistub.h:48:23: note: 'efi_pe_entry' declared here
      48 | efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
         |                       ^
   1 error generated.


vim +/efi_stub_entry +457 drivers/firmware/efi/libstub/x86-stub.c

c3710de5065d63 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2019-12-24  405  
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  406  /*
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  407   * Because the x86 boot code expects to be passed a boot_params we
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  408   * need to create one ourselves (usually the bootloader would create
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  409   * one for us).
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  410   */
8785c948523908 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-12-17  411  efi_status_t __efiapi efi_pe_common_entry(efi_handle_t handle,
c3710de5065d63 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2019-12-24  412  					  efi_system_table_t *sys_table_arg)
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  413  {
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  414  	efi_guid_t proto = LOADED_IMAGE_PROTOCOL_GUID;
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  415  	struct boot_params *boot_params;
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  416  	struct setup_header *hdr;
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  417  	efi_status_t status;
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  418  	unsigned long alloc;
5fef3870c572a3 arch/x86/boot/compressed/eboot.c        Roy Franz      2013-09-22  419  	char *cmdline_ptr;
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  420  
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2020-04-16  421  	efi_system_table = sys_table_arg;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  422  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  423  	/* Check if we were booted by the EFI firmware */
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2020-04-16  424  	if (efi_system_table->hdr.signature != EFI_SYSTEM_TABLE_SIGNATURE)
3b8f44fc0810d5 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2020-02-16  425  		efi_exit(handle, EFI_INVALID_PARAMETER);
54b52d87268034 arch/x86/boot/compressed/eboot.c        Matt Fleming   2014-01-10  426  
0347d8c28cbbfd drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  427  	status = efi_bs_call(handle_protocol, handle, &proto, (void **)&image);
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  428  	if (status != EFI_SUCCESS) {
36bdd0a78d5683 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-30  429  		efi_err("Failed to get handle for LOADED_IMAGE_PROTOCOL\n");
3b8f44fc0810d5 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2020-02-16  430  		efi_exit(handle, status);
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  431  	}
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  432  
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  433  	status = efi_allocate_pages(PARAM_SIZE, &alloc, ULONG_MAX);
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  434  	if (status != EFI_SUCCESS)
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  435  		efi_exit(handle, status);
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  436  
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  437  	boot_params = memset((void *)alloc, 0x0, PARAM_SIZE);
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  438  	hdr	    = &boot_params->hdr;
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  439  
7e50262229faad drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2023-09-12  440  	/* Assign the setup_header fields that the kernel actually cares about */
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  441  	hdr->root_flags	= 1;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  442  	hdr->vid_mode	= 0xffff;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  443  
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  444  	hdr->type_of_loader = 0x21;
decd347c2a75d3 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-28  445  	hdr->initrd_addr_max = INT_MAX;
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  446  
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  447  	/* Convert unicode cmdline to ascii */
ade7ccba2d647f drivers/firmware/efi/libstub/x86-stub.c Jonathan Marek 2024-10-13  448  	cmdline_ptr = efi_convert_cmdline(image);
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  449  	if (!cmdline_ptr) {
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  450  		efi_free(PARAM_SIZE, alloc);
fb318ca0a52229 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-07-04  451  		efi_exit(handle, EFI_OUT_OF_RESOURCES);
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  452  	}
90a2186b7df183 arch/x86/boot/compressed/eboot.c        Ingo Molnar    2018-07-11  453  
7e50262229faad drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2023-09-12  454  	efi_set_u64_split((unsigned long)cmdline_ptr, &hdr->cmd_line_ptr,
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22  455  			  &boot_params->ext_cmd_line_ptr);
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  456  
ae835a96d72cd0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2024-03-22 @457  	efi_stub_entry(handle, sys_table_arg, boot_params);
c3710de5065d63 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2019-12-24  458  	/* not reached */
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  459  }
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  460  

:::::: The code at line 457 was first introduced by commit
:::::: ae835a96d72cd025421910edb0e8faf706998727 x86/efistub: Revert to heap allocated boot_params for PE entrypoint

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
