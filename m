Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE9A8632B;
	Tue, 10 Feb 2026 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770736427; cv=none; b=cyanxuc/+IkGrYwXesfjsydDn05KZTjR4nQwEmLBNDKuL62dJbgR3+klWWBoYpFx0If4YdmALHPGJ9zOU4jGD/qr2N6giPB90/S+Tdk6ZQR/KmWe7lMpKk/x2GoPT1Mw3ZLEtqjT4lFdBMEz1NYQjl+nFvaWZZpaFVbpPVQCj1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770736427; c=relaxed/simple;
	bh=A1VP8GdVrodlGLPvZG1q7SrpN0GjmJM04K5T83dw5QQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QsuSP4GSabB1X7/FO1Nl925FTbLQKPrv8ikyyusApxMd03A8uCGOauut5aMK6J5gGyNQV9lA/olGnsaAlqPHJtt6nP5dUHhCBWkIkDMSWX8qw1nAZfzv2vxiM9mebQUwdr7uBNdzhza4HPxbigjMuui3U3Z1TCX7QWoA62OIk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czpTJ38h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czpTJ38h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770736426; x=1802272426;
  h=date:from:to:cc:subject:message-id;
  bh=A1VP8GdVrodlGLPvZG1q7SrpN0GjmJM04K5T83dw5QQ=;
  b=czpTJ38h93X9JyIg19ZJuJOxS2jhkGnuRJNHBO+oJVteLiCK2oFWZKXH
   U5AUFoCn7PAMN6jl1zzrNVh7oHhlGFMgAfLGya9WK07GHRF/za+aiNz6s
   LOACRibN8YIAihSmkEfvm4Hm8/FUgAPTjJB++wH0smzeSKkyhXOlQEQBX
   b3y/eCuXtfrPNELlJybQOXuq33+JhAaRDTipXEAAUzktKP84J+zXEw4VC
   oLTBwhjFbQdzweCTd/Hd7NSNJPQ4yv8ydDgJt04CAJkbWUeZQPRsS2Zn9
   jxeBA9PoII9X2q3sqLeWSd1j4q6lPmSdvhqcEBPlg1K+hgOzUPqhkdbzs
   w==;
X-CSE-ConnectionGUID: 5zhPDtWtR2SVzqhJv/0jGg==
X-CSE-MsgGUID: 27BR67mcRXG2MA6KNPzFkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75490926"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75490926"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:13:45 -0800
X-CSE-ConnectionGUID: 4OYDOwMdST+R8OLyZbgVvg==
X-CSE-MsgGUID: onFo1JzXSEKEqCyPSpRBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211432625"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 07:13:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vppQr-00000000p6e-1c9k;
	Tue, 10 Feb 2026 15:13:41 +0000
Date: Tue, 10 Feb 2026 23:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-slaunch 38/41]
 drivers/firmware/efi/libstub/x86-stub.c:832:34: error: too many arguments to
 function call, expected 0, have 1
Message-ID: <202602102308.djyeMqpP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: a64c42672d622dc2867904b9857ef64a890610bd [38/41] x86/efistub: EFI stub DRTM launch support for Secure Launch
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260210/202602102308.djyeMqpP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102308.djyeMqpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102308.djyeMqpP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/x86-stub.c:832:34: error: too many arguments to function call, expected 0, have 1
     832 |         status = efi_secure_launch_init(handle);
         |                  ~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~
   drivers/firmware/efi/libstub/efistub.h:1258:14: note: 'efi_secure_launch_init' declared here
    1258 | efi_status_t efi_secure_launch_init(void)
         |              ^
   1 error generated.


vim +832 drivers/firmware/efi/libstub/x86-stub.c

   810	
   811	/*
   812	 * On success, this routine will jump to the relocated image directly and never
   813	 * return.  On failure, it will exit to the firmware via efi_exit() instead of
   814	 * returning.
   815	 */
   816	void __noreturn efi_stub_entry(efi_handle_t handle,
   817				       efi_system_table_t *sys_table_arg,
   818				       struct boot_params *boot_params)
   819	
   820	{
   821		efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
   822		const struct linux_efi_initrd *initrd = NULL;
   823		unsigned long kernel_entry;
   824		struct setup_header *hdr;
   825		efi_status_t status;
   826	
   827		efi_system_table = sys_table_arg;
   828		/* Check if we were booted by the EFI firmware */
   829		if (efi_system_table->hdr.signature != EFI_SYSTEM_TABLE_SIGNATURE)
   830			efi_exit(handle, EFI_INVALID_PARAMETER);
   831	
 > 832		status = efi_secure_launch_init(handle);
   833		switch (status) {
   834			case EFI_SUCCESS:
   835			case EFI_UNSUPPORTED:
   836				break;
   837			default:
   838				efi_exit(handle, status);
   839		}
   840	
   841		if (!IS_ENABLED(CONFIG_EFI_HANDOVER_PROTOCOL) || !boot_params) {
   842			status = efi_allocate_bootparams(handle, &boot_params);
   843			if (status != EFI_SUCCESS)
   844				efi_exit(handle, status);
   845		}
   846	
   847		hdr = &boot_params->hdr;
   848	
   849		if (have_unsupported_snp_features())
   850			efi_exit(handle, EFI_UNSUPPORTED);
   851	
   852		if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
   853			efi_dxe_table = get_efi_config_table(EFI_DXE_SERVICES_TABLE_GUID);
   854			if (efi_dxe_table &&
   855			    efi_dxe_table->hdr.signature != EFI_DXE_SERVICES_TABLE_SIGNATURE) {
   856				efi_warn("Ignoring DXE services table: invalid signature\n");
   857				efi_dxe_table = NULL;
   858			}
   859		}
   860	
   861		/* grab the memory attributes protocol if it exists */
   862		efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
   863	
   864		status = efi_setup_5level_paging();
   865		if (status != EFI_SUCCESS) {
   866			efi_err("efi_setup_5level_paging() failed!\n");
   867			goto fail;
   868		}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
