Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA3526D4CD;
	Fri,  6 Feb 2026 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770415193; cv=none; b=iabbeq5cgJTSkLhYdM6X7ZpXucB7ArLKK9dGar3iD7DwF8Bkhy5HSo+jKA6Tg0Eh02/ge3nwBk3PrOFqB0Crc8DTT/3yoyEHvWDVW16JBRjjo4zAv9W1bR7pxTmiX7Coa/Ht8cePGGXvrtjfte/siUFzR5zYlJJo5oUWFYePlAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770415193; c=relaxed/simple;
	bh=sleuaW01datBaXXLTZlMw3otWkXaeKc1JkRthU3GmxM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iOJ27TLgTQs40nnDTEgIm3DJaHsQrRgQoVs+cS1f7JM1OoUY9sO2cXj0FHEilCdwnJC4wIJfqT8mqXDUFIfaixIi9coukqICrFx81nSb6EdlX9UzVNePhQLJKi51D12/uSPxme3T3NEpJrHsLmpA6g0W6dN0KoF3Sxh5xJnKb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVOPxw3l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVOPxw3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770415193; x=1801951193;
  h=date:from:to:cc:subject:message-id;
  bh=sleuaW01datBaXXLTZlMw3otWkXaeKc1JkRthU3GmxM=;
  b=kVOPxw3ljawt9Z5bFpdIcgTri3QU1dU1CFnOZWsjLBswpC+AF2jxCjKl
   Pvozl5+XQlVP5K9yLMYyr/IAbc5Q/5koyoQqPEXAoFMeuKcUwzHoD/epf
   S/b0CrhZhoboSqIO+eHtHU7UqpnoFl/P9wNmh+1aFs4PHf32RvO1z/RgM
   Tzeawq1rhX0rJOPd8lQyvpASYUsvabW6CRn9fIR5EzHf+Df9HJsI76GWL
   DLIDbADX64V2YTEqlRv4A3vekm91BNCHuVZ6xE2cY3pbleDECvWqIXOEl
   SXuLbHDvIHBKIeSLmk3DqbZN52RzVbnX80rjgi8BlI+mJoDM1FlGIg2Sb
   w==;
X-CSE-ConnectionGUID: YjSBWXu1QXeDhrwf1R7VmA==
X-CSE-MsgGUID: doHZ6jHyTkG8EGaSmBOC2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83072162"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="83072162"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:59:53 -0800
X-CSE-ConnectionGUID: VVDEFyf3R5OS98ZDiPuLJg==
X-CSE-MsgGUID: aCLvlBEPTSmRJpumPuZ+5g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 06 Feb 2026 13:59:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTrh-000000004iv-0b0w;
	Fri, 06 Feb 2026 21:59:49 +0000
Date: Fri, 06 Feb 2026 22:59:37 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 56/56]
 arch/x86/kvm/mmu/mmu.c:609:57: error: too few arguments to function call,
 expected 3, have 2
Message-ID: <202602062208.3HnNhbka-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   c86be62d601ede14cbad1d0fb5af9b67d4172342
commit: c86be62d601ede14cbad1d0fb5af9b67d4172342 [56/56] FIXUPS
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260206/202602062208.3HnNhbka-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602062208.3HnNhbka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602062208.3HnNhbka-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:609:57: error: too few arguments to function call, expected 3, have 2
     609 |                 r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
   1 error generated.
--
>> arch/x86/kvm/mmu/tdp_mmu.c:1468:69: error: too few arguments to function call, expected 3, have 2
    1468 |                 if (kvm_x86_call(topup_external_cache)(kvm, kvm_get_running_vcpu()))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                            ^
   1 error generated.


vim +609 arch/x86/kvm/mmu/mmu.c

   593	
   594	static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
   595	{
   596		int r;
   597	
   598		/* 1 rmap, 1 parent PTE per level, and the prefetched rmaps. */
   599		r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache,
   600					       1 + PT64_ROOT_MAX_LEVEL + PTE_PREFETCH_NUM);
   601		if (r)
   602			return r;
   603		if (kvm_has_mirrored_tdp(vcpu->kvm)) {
   604			r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_external_spt_cache,
   605						       PT64_ROOT_MAX_LEVEL);
   606			if (r)
   607				return r;
   608	
 > 609			r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu);
   610			if (r)
   611				return r;
   612		}
   613		r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_shadow_page_cache,
   614					       PT64_ROOT_MAX_LEVEL);
   615		if (r)
   616			return r;
   617		if (maybe_indirect) {
   618			r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_shadowed_info_cache,
   619						       PT64_ROOT_MAX_LEVEL);
   620			if (r)
   621				return r;
   622		}
   623		return kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_header_cache,
   624						  PT64_ROOT_MAX_LEVEL);
   625	}
   626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
