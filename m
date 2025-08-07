Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F732221286;
	Thu,  7 Aug 2025 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564677; cv=none; b=MNibCeqHCEqlQ3a5NndmsVNcA6DFTakBdmj+6Y4UY98iXX9R2zufdUBrR3ZhuYAjopTvsf0m2xgSt9oiK1pgY+wSZ/n4ocr2ATwn/rZyzadC62UZl7gdumFLj3vvuHCMRmrCGUONXw7kaMHRQ4QlvkAnvBt/gE/jczRc4SUxsyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564677; c=relaxed/simple;
	bh=lvBs7EtjnTfJXnmuGBl3EkbudQHRF1hsHedrUBkSZeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDzaKYTTm1A0WDfoBpX2hL5XdCPMFmQg50uP1hWDbXyaXXYtG56LibLOjOkUkBRPUIbdeJ/V/pqM6rSrIFGbeX24qUeY0QAVjLrOCemneOtSNKKUTXn3kg6+Gk4grhC0SkYV1FDJzVC4dYzuW/000Lav6MixF/OqvlRtcvABK5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfG/WZMX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfG/WZMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754564676; x=1786100676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lvBs7EtjnTfJXnmuGBl3EkbudQHRF1hsHedrUBkSZeM=;
  b=JfG/WZMXcLEQWSxOfOqB1DZqjIq48XeNCGHUZHyOkJEhsYZ48xWy5+x3
   OJNclCA1KV12Na2bfKc0lISxKGvKkH9CfuLVYSouUKCN9JMPI7TTi8DtO
   t/cQWbcK8F43SV9ftHaiYM+2TvyjTvI6gua+HGNcA+1IZ3+o0hzE7/rLw
   ayG6vhDA/j4ua5KjEntXKcQuXz+oRvstst6l5qX9QIa06NVtQ+zocDBGM
   DGrXUHJAucsZwoB6fcWnXLEWnwfLn8+lN/g65B4Q0I2SAsyW1mLaojYEs
   ySqkDkbCGxowh818i/joJyia+TxTzDvy9ZauTZCwkCuUgp9hsSOq/vEth
   A==;
X-CSE-ConnectionGUID: JNzukz7iSC6ub1O71hYvSw==
X-CSE-MsgGUID: pr3BtdBdQHuJVvnEW114eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60527748"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60527748"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 04:04:19 -0700
X-CSE-ConnectionGUID: zD8tOfWBRWuEhcLAzuRCEQ==
X-CSE-MsgGUID: vPkLdZmBSxum8hmvVpJ+Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195873243"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 04:04:17 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujyPv-0002R1-0I;
	Thu, 07 Aug 2025 11:04:15 +0000
Date: Thu, 7 Aug 2025 13:03:45 +0200
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yan Zhao <yan.y.zhao@intel.com>
Subject: [intel-tdx:huge_page_v2 47/204] include/linux/kvm_host.h:727:20:
 error: redefinition of 'kvm_arch_supports_gmem'
Message-ID: <202508071321.wduQJLKM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git huge_page_v2
head:   0744d0b90629d528fa94ff73dce7ceeaaed1560c
commit: 9747a2b15704a4f83d4c950118794f8b94058421 [47/204] KVM: arm64: Enable mapping guest_memfd in arm64
config: arm64-randconfig-2002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071321.wduQJLKM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071321.wduQJLKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071321.wduQJLKM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:15:
>> include/linux/kvm_host.h:727:20: error: redefinition of 'kvm_arch_supports_gmem'
     727 | static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
         |                    ^
   arch/arm64/include/asm/kvm_host.h:1677:20: note: previous definition is here
    1677 | static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
         |                    ^
   In file included from arch/arm64/kernel/asm-offsets.c:15:
   include/linux/kvm_host.h:740:20: error: redefinition of 'kvm_arch_vm_supports_gmem_shared_mem'
     740 | static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
         |                    ^
   arch/arm64/include/asm/kvm_host.h:1682:20: note: previous definition is here
    1682 | static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
         |                    ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=1276423085
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=1276423085
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1276423085
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1276423085
   make: Target 'prepare' not remade because of errors.


vim +/kvm_arch_supports_gmem +727 include/linux/kvm_host.h

f481b069e67437 Paolo Bonzini       2015-05-17  721  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  722  /*
0bd74ee4e718b0 Fuad Tabba          2025-05-13  723   * Arch code must define kvm_arch_supports_gmem if support for guest_memfd
a7800aa80ea4d5 Sean Christopherson 2023-11-13  724   * is enabled.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  725   */
0bd74ee4e718b0 Fuad Tabba          2025-05-13  726  #if !defined(kvm_arch_supports_gmem) && !IS_ENABLED(CONFIG_KVM_GMEM)
0bd74ee4e718b0 Fuad Tabba          2025-05-13 @727  static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  728  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  729  	return false;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  730  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  731  #endif
a7800aa80ea4d5 Sean Christopherson 2023-11-13  732  

:::::: The code at line 727 was first introduced by commit
:::::: 0bd74ee4e718b0d652602d430cf2e06b82750455 KVM: Rename kvm_arch_has_private_mem() to kvm_arch_supports_gmem()

:::::: TO: Fuad Tabba <tabba@google.com>
:::::: CC: Yan Zhao <yan.y.zhao@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
