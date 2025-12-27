Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA724E4B4;
	Sat, 27 Dec 2025 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766822896; cv=none; b=DOrp3N6wXHMa5NRcEviqPgnf4Vu55dy5JuwgqmtZPyWS+5GICOrFjpZX5MGigJ3mP/oR+18eHrJuwd5dExOJ2TQC5u3CAdT5sboWt0hsUTYpsgEXu4SBMsLCigUgG5rv7TErhAmCK5XLxevF0C75MqKBCHzwII+w9+6mI6IAuik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766822896; c=relaxed/simple;
	bh=/LxIaaGeYSu7JlEIRekD0KDQbPH0v4eGSnyiQGJhArM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fVxLRMOtLog78yjhmZD5uIJSAH3KHkMDUCK7iDAsy93RF8zgQXlmSq1rqa7R1Llb0GGaEGs0xjoDw9Lo3DKI3VXFUHVdwWiOzrZf5D3vMJYSW06Teuw0W4TstjrXKx8WNCrY0c3XmhtYYnJoL6msdp9hsj/MECPnJOC0bwG0GBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DH2cVJlx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DH2cVJlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766822895; x=1798358895;
  h=date:from:to:cc:subject:message-id;
  bh=/LxIaaGeYSu7JlEIRekD0KDQbPH0v4eGSnyiQGJhArM=;
  b=DH2cVJlxTgd/OjkLPcNxDQ10anCj3Q04zckMvnLnRVLycLUo55kegIiV
   v1hmx2BVa1glQ9AACn+xVw34yHp5LatRQtpn7VXM3AVkDMi46MylLqJnW
   tokH1tyt4a8DMmu5+KtJ3Dwwb2aMetp8g63qyQjuL+dXoJ+ChAsJRaNMx
   JtOU/xqJUi68DrwMA6+RLdEyTg+aOq2gdWV5cOtwTNaK+CbboXuHfh1Q6
   w48Srj9FSYx/XDGcwyswwhygzjD+qiEU3BBqIuStPCxOgJwtvnbucUF1H
   Sqxc5HyNaDywRDOsvfUHAgb3a7j9ftM4L0KlgqYWnV00psV54W8ea6McL
   A==;
X-CSE-ConnectionGUID: pVrvsC2uQs2LWaRbwqHNVA==
X-CSE-MsgGUID: Zrfo1ysdRVK9ys2wSCguVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68611757"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68611757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 00:08:12 -0800
X-CSE-ConnectionGUID: qaltlLUkRhWHa3zz5iQwRA==
X-CSE-MsgGUID: /GFmTSPuQk2VpdR1ymaZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200535296"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2025 00:08:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZPLM-000000005eZ-27JY;
	Sat, 27 Dec 2025 08:08:08 +0000
Date: Sat, 27 Dec 2025 16:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 20/29]
 drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype
 for function 'entry_offset'
Message-ID: <202512271629.w5LMMofL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: 48d32d494f9f9a7f30d08647fd94bf20c50705e9 [20/29] efi/zboot: Add support for ELF payloads
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251227/202512271629.w5LMMofL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271629.w5LMMofL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271629.w5LMMofL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype for function 'entry_offset' [-Wmissing-prototypes]
      36 | unsigned long entry_offset(void)
         |               ^
   drivers/firmware/efi/libstub/zboot.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | unsigned long entry_offset(void)
         | ^
         | static 
   drivers/firmware/efi/libstub/zboot.c:102:62: error: too few arguments to function call, expected 3, have 2
     102 |         status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
         |                  ~~~~~~~~~~~~~~~~~~~~                               ^
   drivers/firmware/efi/libstub/efistub.h:1268:14: note: 'efi_zboot_decompress' declared here
    1268 | efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen,
         |              ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1269 |                                   unsigned long va_shift);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/entry_offset +36 drivers/firmware/efi/libstub/zboot.c

    35	
  > 36	unsigned long entry_offset(void)
    37	{
    38		return entrypoint;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
