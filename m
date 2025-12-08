Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938FD224D6;
	Mon,  8 Dec 2025 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765195690; cv=none; b=JwQ5YVedQuP3LROPX3fP/Q0eqGf6cNQpqTvagJES5OBZFlXmYi252rBhQadnIyK0ZNrV8sVc5X0Z9zbkmlmN7DxeIrVtEk7YIpaK6YwmgcSH9xCq6zzKUBvnN1i8XKBzmp/vl7zcEfA+9lAHfBkktEFrm9bQcbLDBrWgktfgmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765195690; c=relaxed/simple;
	bh=6lLM4kv6uoEq2E1MNZZZuauSNtK3L1hPhYSD+obOpSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYCRl1gh72u7i9qcF0uQBbqnt/Dh1WQyRljCRo1Cw0h/qVWCRmSFPuy6HtrEIrgYF2rdgz4AvQ9vE2gJlcYM7oKcAH0fOIhgAc490KBgSFcRdv7gaX8SqDe6i07T1ofyfE/hHO9aPEYBtHVERlBavRuNGxEwP3z9p67pdl1bxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JP6y753Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JP6y753Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765195688; x=1796731688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lLM4kv6uoEq2E1MNZZZuauSNtK3L1hPhYSD+obOpSk=;
  b=JP6y753QQqWBdVPaInrIXnLh4qnMi2WXSyqqSK2ptq18VDcNQIuw7Ir4
   AY018XfeWG8vI1j90W9T6lZ/B68DYFkNVlqGMRBr9mnPPAaROTDQOWcAj
   3kIwlr/oIPHay6+kl01pjUYf/quk9XiVXbcyT8YJU6H7/nPkI8aBmHt3u
   fUBE2nff6+71E5O+7ZOzWxceZHvTjA568AW3lkTCrZR+EC75BdKMAYmYl
   8Xtzxp85P67hNy5GdS2mtQJZOtuxKmJoT3YsTCv7/FJGFhCF+HrWSLk2k
   fNesHvifI0HnerZ0v2g1sxBx2hpSbmwSKXaiNrICWHfKO766YbCHAIoeD
   A==;
X-CSE-ConnectionGUID: cs5yrSlkRjKOaTTs7AAnDQ==
X-CSE-MsgGUID: C7Rl/GacSOmIx9/3H3v1Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66318095"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66318095"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 04:08:08 -0800
X-CSE-ConnectionGUID: s/eJmeAcRZ62oUDptcorDw==
X-CSE-MsgGUID: LVAA6ifFT6+az/Jjt8E2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="194976726"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2025 04:08:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSa27-000000000G9-2VC2;
	Mon, 08 Dec 2025 12:08:03 +0000
Date: Mon, 8 Dec 2025 20:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13538/13721] mm/kasan/common.c:601:14: error: use
 of undeclared identifier 'KASAN_VMALLOC_KEEP_TAG'
Message-ID: <202512081926.ICUawXRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
commit: 6b83afdcfa935db4f836906ca7f0fcafdca8d229 [13538/13721] kasan: unpoison vms[area] addresses with a common tag
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251208/202512081926.ICUawXRm-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081926.ICUawXRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081926.ICUawXRm-lkp@intel.com/

Note: the linux-next/master HEAD 82bcd04d124a4d84580ea4a8ba6b120db5f512e7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from mm/kasan/common.c:17:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> mm/kasan/common.c:601:14: error: use of undeclared identifier 'KASAN_VMALLOC_KEEP_TAG'
     601 |         if (flags & KASAN_VMALLOC_KEEP_TAG) {
         |                     ^
   mm/kasan/common.c:615:49: error: use of undeclared identifier 'KASAN_VMALLOC_KEEP_TAG'
     615 |                         __kasan_unpoison_vmalloc(addr, size, flags | KASAN_VMALLOC_KEEP_TAG);
         |                                                                      ^
   1 warning and 2 errors generated.


vim +/KASAN_VMALLOC_KEEP_TAG +601 mm/kasan/common.c

   586	
   587	#ifdef CONFIG_KASAN_VMALLOC
   588	void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms,
   589					 kasan_vmalloc_flags_t flags)
   590	{
   591		unsigned long size;
   592		void *addr;
   593		int area;
   594		u8 tag;
   595	
   596		/*
   597		 * If KASAN_VMALLOC_KEEP_TAG was set at this point, all vms[] pointers
   598		 * would be unpoisoned with the KASAN_TAG_KERNEL which would disable
   599		 * KASAN checks down the line.
   600		 */
 > 601		if (flags & KASAN_VMALLOC_KEEP_TAG) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
