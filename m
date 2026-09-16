Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441347FB10;
	Wed, 16 Sep 2026 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548749; cv=none; b=EH2NxORBVRGF/0qQ4wcL5r2OddPTB3Zlqed5RB92J7qcdFFlwZv1yqpfPwjYulhH7fp2lt0BYZC/Y7GAUefo5yfkcPdPMqZpJ3ZW/sx8xHFAlLG61FAHN7Pio3ffyQ0X5BD3/e8omjEkA1NpMVpXMKUde5chZYCDWvfgDwTN8iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548749; c=relaxed/simple;
	bh=nsPNj4WQO3JA0WIXZz0KAPjO4FrFqP1qMMd/DUaEmMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lz7lzNyJsHHyjuzDN1i6oKIY7x3pz9TsSJtAIIhhXsb26zG18lUTuNvtBU9fK84Dlf5t9Icr1JDhq+MBTLo8OsXZOnvapLwrSv/ypllEfXtTAcu9lgPq7IjwvMqHQTgu+fhO9Fhysa+ERBQBs6Za39vxqBO1GrwKU6fNeC3xd20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMQRSgnw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMQRSgnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789548741; x=1821084741;
  h=date:from:to:cc:subject:message-id;
  bh=nsPNj4WQO3JA0WIXZz0KAPjO4FrFqP1qMMd/DUaEmMk=;
  b=gMQRSgnwwHnxRY39+fL4iFX2xy1FNZJDJM/3EahssdoRhQtgMNg41yYv
   d2SaZ2RcbtqAxS6fSQDDGJkznLMtzugF/UR6n+8yNhEt906LOvNqWeXzg
   NRPpxCKEit8kOczoZbh7srG8H63JfC2t47ZV6CFNdghAI9+J7hIsU85hN
   IOcAe5LWUbEGCcFV9vP3FlEEag8rg0R/sjc46nU+r0+0pxKAI+fr6X/8b
   AxMxEB3giMk5ORRslEmuOQS8sOKcf6OpKX6a0frnC/kw0zUseMn0n4ffR
   ARswb6iFek4m3kkMG4ui/lATA1A1UCIDQugfxuFhjTziG6/rHDppbz4XM
   A==;
X-CSE-ConnectionGUID: hl1GB/CLQY6uikHyNzfd6g==
X-CSE-MsgGUID: tFIMsU3cScKBqdIKiP71oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92427784"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92427784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:52:13 -0700
X-CSE-ConnectionGUID: g2TU/v/UQZah+DUsbMAfFA==
X-CSE-MsgGUID: LdL1UjpuQ8WjlMXU8xf3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273818637"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2026 01:52:11 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6lNA-000000005kf-3Usl;
	Wed, 16 Sep 2026 08:52:08 +0000
Date: Wed, 16 Sep 2026 16:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-tdx-efistub 2/3]
 drivers/firmware/efi/libstub/x86-stub.c:1106:13: error: call to undeclared
 function 'early_is_sevsnp_guest'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609161626.12YwpSKN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-tdx-efistub
head:   dbd995955d7cd3afb151e05449c3571295cdef92
commit: f9d03e512d573e1b021b2b8c38d2490b87eaf9e1 [2/3] x86/boot: Move unaccepted memory handling out of the decompressor
config: x86_64-randconfig-071-20260916 (https://download.01.org/0day-ci/archive/20260916/202609161626.12YwpSKN-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161626.12YwpSKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161626.12YwpSKN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/x86-stub.c:1106:13: error: call to undeclared function 'early_is_sevsnp_guest'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1106 |         } else if (early_is_sevsnp_guest()) {
         |                    ^
   drivers/firmware/efi/libstub/x86-stub.c:1106:13: note: did you mean 'early_is_tdx_guest'?
   drivers/firmware/efi/libstub/x86-stub.c:1081:13: note: 'early_is_tdx_guest' declared here
    1081 | static bool early_is_tdx_guest(void)
         |             ^
   1 error generated.


vim +/early_is_sevsnp_guest +1106 drivers/firmware/efi/libstub/x86-stub.c

  1100	
  1101	void arch_accept_memory(phys_addr_t start, phys_addr_t end)
  1102	{
  1103		if (early_is_tdx_guest()) {
  1104			if (!tdx_accept_memory(start, end))
  1105				tdx_panic("Failed to accept memory");
> 1106		} else if (early_is_sevsnp_guest()) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
