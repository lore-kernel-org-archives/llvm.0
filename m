Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F94381AE3;
	Thu, 24 Sep 2026 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258514; cv=none; b=ZE2L/QbCp65EMsSr8FUSNFHaS6qcN781cZLQvJc62buBoHFwdmxYPUafYbFkgUMFZsd8c48jMtJZdcZ7or69yVO+j8C0g3TpCLAXiwNYpkEVYbycAvGteSg+BAcP5Ra5tmjm3bCRxcW7/4LRp7mSdcXBceWmh9ozA7ZdoGSRyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258514; c=relaxed/simple;
	bh=+OVQB3N3eBFeNejVCQVBdT6Jz82bf0N3P8Wu8VdNODw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sD2t5JlPJ1mdSmCDkgKlKnWC1FaFXZDCw3bCmyox3mgnAS0ETqFGq/5ahhGn03iIxFQpseQT6h7IPdXHLn9rquO8vVW3I+/OMsC1mkhmD6L0xbHmdY0gMXhAjQ11Juzwj2zsnW4j2b+zLG6XXJWqtPsP5Ew5onx+epgBkXwmATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIXwkd0j; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIXwkd0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790258512; x=1821794512;
  h=date:from:to:cc:subject:message-id;
  bh=+OVQB3N3eBFeNejVCQVBdT6Jz82bf0N3P8Wu8VdNODw=;
  b=JIXwkd0jcTCORrnNdOjLb8CobzdAcLz1+mbLlNhcK1hVAWvHUtFryovU
   J3tM45mtiZAc6mlVVYK4mban38hrLyzBFzR9PsLnqNv719xIzXBOQRCEj
   YxwS8kwJ0bep8MW6yYPCDEM3qlykJ+ePidGnj4MS3QpHu/Qs98ZT/DFqP
   zLA5qNm595mUe1IVCmNViND4frflPiZaRJh5Jxyw3oZcepgd0wbPOp/Ww
   xMyUUuvCwnWtO+BGLMRglMB4cvA+tPlzKLI2c6HkVEt0cWdIyyn5lMbpR
   Jjjg3WbejaywddDMoi/GQENLvSF4RFtpv34u01fuyoC3Qi6DOMy/cRzdP
   Q==;
X-CSE-ConnectionGUID: SJ/cWHY5QlWUXOmlsVPpPw==
X-CSE-MsgGUID: 0D9kCYkRQ5SXIO46j8kktQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90151579"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90151579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:01:49 -0700
X-CSE-ConnectionGUID: 5u7W/17PS6255tg84HDNDw==
X-CSE-MsgGUID: W7rz2cOSSOi3xq+bgOVSug==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2026 07:01:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9k1B-00000000IuQ-1Woe;
	Thu, 24 Sep 2026 14:01:45 +0000
Date: Thu, 24 Sep 2026 22:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-panic 11/11]
 drivers/firmware/efi/libstub/efi-stub-helper.c:826:54: warning: more '%'
 conversions than data arguments
Message-ID: <202609242143.wxkynTQV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-panic
head:   26122a1889cbac101c0fabcddf161a87db4ba38c
commit: 26122a1889cbac101c0fabcddf161a87db4ba38c [11/11] efi/libstub: Implement efi_panic()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260924/202609242143.wxkynTQV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242143.wxkynTQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609242143.wxkynTQV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/efi-stub-helper.c:826:54: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     826 |                 efi_warn("Found panic report from previous boot (%lu bytes)\n");
         |                                                                  ~~^
   drivers/firmware/efi/libstub/efistub.h:77:38: note: expanded from macro 'efi_warn'
      77 |         efi_printk(KERN_WARNING "WARNING: " fmt, ##__VA_ARGS__)
         |                                             ^~~
>> drivers/firmware/efi/libstub/efi-stub-helper.c:838:49: warning: format specifies type 'double' but the argument has type 'const char *' [-Wformat]
     838 |                         efi_err("%a(): Failed to allocate memory\n", __func__);
         |                                  ~~                                  ^~~~~~~~
         |                                  %s
   drivers/firmware/efi/libstub/efistub.h:79:39: note: expanded from macro 'efi_err'
      79 |         efi_printk(KERN_ERR "ERROR: " fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   drivers/firmware/efi/libstub/efi-stub-helper.c:841:3: error: use of undeclared identifier 'messsage'; did you mean 'message'?
     841 |                 messsage = p;
         |                 ^~~~~~~~
         |                 message
   drivers/firmware/efi/libstub/efi-stub-helper.c:811:22: note: 'message' declared here
     811 |         const efi_char16_t *message;
         |                             ^
   drivers/firmware/efi/libstub/efi-stub-helper.c:809:6: warning: no previous prototype for function 'efi_check_panic' [-Wmissing-prototypes]
     809 | void efi_check_panic(void)
         |      ^
   drivers/firmware/efi/libstub/efi-stub-helper.c:809:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     809 | void efi_check_panic(void)
         | ^
         | static 
   3 warnings and 1 error generated.


vim +826 drivers/firmware/efi/libstub/efi-stub-helper.c

   808	
   809	void efi_check_panic(void)
   810	{
   811		const efi_char16_t *message;
   812		void *p;
   813	
   814		p = get_efi_config_table(capsule_header.guid);
   815	
   816		if (p) {
   817			message = p + sizeof(efi_capsule_header_t);
   818		} else {
   819			unsigned long size = 0;
   820			efi_status_t status;
   821	
   822			get_efi_var(panic_reason, &capsule_header.guid, NULL, &size, NULL);
   823			if (!size)
   824				return;
   825	
 > 826			efi_warn("Found panic report from previous boot (%lu bytes)\n");
   827	
   828			status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, size, &p);
   829			if (status == EFI_SUCCESS)
   830				get_efi_var(panic_reason, &capsule_header.guid, NULL, &size, p);
   831	
   832			/* clear the reason even on allocation failure */
   833			set_efi_var(panic_reason, &capsule_header.guid,
   834				    EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_NON_VOLATILE,
   835				    0, NULL);
   836	
   837			if (status != EFI_SUCCESS) {
 > 838				efi_err("%a(): Failed to allocate memory\n", __func__);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
