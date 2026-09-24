Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A13BCD2B;
	Thu, 24 Sep 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267418; cv=none; b=QSUNXCI059MYst1fDtuRApCztirXXVNfnjjBXL0MobEfw7bh7UsxXThSIXplWIq3yMzX7VMizMbfnTS1tOQsUhTENJynnrU6nOID+KzJCAXsY2czat8FpHJDnmLVsmyWfPhruteewonRMuJ0xERPyRsBA3xiRkSnm3Xj6b3u5dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267418; c=relaxed/simple;
	bh=ChSKxKuMRhuRcdm9DL5Ni+z0ydPSTd/FYWe/Lxf7/ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VoShWH03ZfjSNmckcJgpug0QMPycXr1PccJMY7BIfqyRRzP4gQfKD9w22Cc91EqOaZEl7KzWdohzZt2QIdJ+At/X6KoWaaRnlptQe0QCdzVW1uHEUrRyOLV7bghORvZQZLwS9i8MkIjJ4v4x1Es0bEpEOBcZG+GlznvFNy0eRHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVRzYcQt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVRzYcQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790267417; x=1821803417;
  h=date:from:to:cc:subject:message-id;
  bh=ChSKxKuMRhuRcdm9DL5Ni+z0ydPSTd/FYWe/Lxf7/ik=;
  b=QVRzYcQtssAvEDjFO+KS1bq1O/UaCcsGGKG3hayiamIfM5R+xzSWyWAz
   ra4M43v6Og3Udx+sN/lYkmay/xfT6UEtMnKG2ckQrdzzFqYrjjPt982nW
   LvT0H/3+MwjQh9DoOSl5SkeNbPYHOLUGOxN9v8rtDpCkUUOWE5CVLiLfi
   ZxqCfxWFhifhv9cF9y1HYH+r/DnGJ2pJf/u/rhnNy+MVLkl11o0PPX7Rj
   1e0AWBUIprHMUs1zOIqxk4qM2B+skbFN+YiF7uBIrzjPetbttVJXM43Fx
   e6S1mrPbZ1wOyjiZL/kx2Ls2PlR38kZarvwVOZlLiXNJcFKVDFyxQWi9q
   w==;
X-CSE-ConnectionGUID: ZzIIP1TtQ52SkWwPskOV7g==
X-CSE-MsgGUID: Xg0ICtZxQMO2wyuPhtBEsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101221711"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="101221711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 09:30:07 -0700
X-CSE-ConnectionGUID: KHEu3w5dRHW336B+lLzJaQ==
X-CSE-MsgGUID: 8fmhS75IRdORFtoQzypW3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="282164748"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2026 09:30:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9mKg-00000000JA2-3G1L;
	Thu, 24 Sep 2026 16:30:02 +0000
Date: Fri, 25 Sep 2026 00:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-panic 11/11]
 drivers/firmware/efi/libstub/efi-stub-helper.c:841:3: error: use of
 undeclared identifier 'messsage'; did you mean 'message'?
Message-ID: <202609250012.uKa5O0Sw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-panic
head:   26122a1889cbac101c0fabcddf161a87db4ba38c
commit: 26122a1889cbac101c0fabcddf161a87db4ba38c [11/11] efi/libstub: Implement efi_panic()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260925/202609250012.uKa5O0Sw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250012.uKa5O0Sw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250012.uKa5O0Sw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/efi-stub-helper.c:826:54: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     826 |                 efi_warn("Found panic report from previous boot (%lu bytes)\n");
         |                                                                  ~~^
   drivers/firmware/efi/libstub/efistub.h:77:38: note: expanded from macro 'efi_warn'
      77 |         efi_printk(KERN_WARNING "WARNING: " fmt, ##__VA_ARGS__)
         |                                             ^~~
   drivers/firmware/efi/libstub/efi-stub-helper.c:838:49: warning: format specifies type 'double' but the argument has type 'const char *' [-Wformat]
     838 |                         efi_err("%a(): Failed to allocate memory\n", __func__);
         |                                  ~~                                  ^~~~~~~~
         |                                  %s
   drivers/firmware/efi/libstub/efistub.h:79:39: note: expanded from macro 'efi_err'
      79 |         efi_printk(KERN_ERR "ERROR: " fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
>> drivers/firmware/efi/libstub/efi-stub-helper.c:841:3: error: use of undeclared identifier 'messsage'; did you mean 'message'?
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


vim +841 drivers/firmware/efi/libstub/efi-stub-helper.c

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
   826			efi_warn("Found panic report from previous boot (%lu bytes)\n");
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
   838				efi_err("%a(): Failed to allocate memory\n", __func__);
   839				return;
   840			}
 > 841			messsage = p;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
