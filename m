Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71341CAB3;
	Wed, 14 May 2025 05:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747201491; cv=none; b=uCytVTJE8EunntE1HceJG7TYAzqIsOUcdO1w/qRsA03tgUxXM/IF8oCsLXKns8JTvJ3BBoE7e+ZSqz10bV6QSkhbyqnNClwh93tRKQsLCvlC1FmHYVI9t0MsYbUzGiVYwf02K6fS+6l1LtScT357B2wd+WbKhqpi1LZLy3Zl5MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747201491; c=relaxed/simple;
	bh=Z1e2VhSwNzQWFJPu/+sXtRnWaj+d4+AnBc6QVyUbypw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q57OME0QXCzSwYdUNKa8SaNAGtciX8Q8PglOrd+SrgDZVMKfzqZsNe+S2FgeYmrinGF2e0/z5Z4sbcYFCm1w47Q7viygPUYMJLkXOVXAvB+haC6X8hToHlkO3toft9zams+FL0jwJthLD00An/sveEP7CzxfESD0QWz/B3grKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nG4N2NeQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nG4N2NeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747201490; x=1778737490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z1e2VhSwNzQWFJPu/+sXtRnWaj+d4+AnBc6QVyUbypw=;
  b=nG4N2NeQtXYge67Thj+EMcwOC2LZsQrhW6Xfjp5NuI9ziIQ9l0iSK5hU
   zjXIgoU7ry62mzFeDRSFs/+9Ud0S8O030ygXbazwG0+y2rWKXzcHY+ZZC
   +oNJ7RENR1wotFsCiLGw9UnwK8XggbXa8+Z1rgt5K+oezvgUoNVpRMros
   oOEFNjK+Hi1V40u95mpUkBCUw5Md5OHii24xapVyE0Xjc10K7OvGQC3nR
   pVKhe10ZGC75Qs9i3wB+S5K6UOgsFtv4OPcW3vs+L/fLD8dXZ/ujgyVb+
   86YaRxWUVSEk+5JkZixTMyi3uC/oWJRplFoI58CfgrZnN5nw9VMPG4I5Q
   Q==;
X-CSE-ConnectionGUID: s5sfH/RnSe66zeC7VVmbZw==
X-CSE-MsgGUID: G+iPvAuORuKaOXO5GxgHYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60416778"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="60416778"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 22:44:49 -0700
X-CSE-ConnectionGUID: Nk2K2tf8RtOpSNHaMNIspw==
X-CSE-MsgGUID: x58zZm1xSpe2ZXXBSGW9Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="175052862"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2025 22:44:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF4v7-000GiV-11;
	Wed, 14 May 2025 05:44:45 +0000
Date: Wed, 14 May 2025 13:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 14/17] KVM: arm64: Enable mapping guest_memfd in arm64
Message-ID: <202505141338.1SqLzH12-lkp@intel.com>
References: <20250513163438.3942405-15-tabba@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513163438.3942405-15-tabba@google.com>

Hi Fuad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/KVM-Rename-CONFIG_KVM_PRIVATE_MEM-to-CONFIG_KVM_GMEM/20250514-003900
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20250513163438.3942405-15-tabba%40google.com
patch subject: [PATCH v9 14/17] KVM: arm64: Enable mapping guest_memfd in arm64
config: arm64-randconfig-004-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141338.1SqLzH12-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141338.1SqLzH12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141338.1SqLzH12-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:15:
>> include/linux/kvm_host.h:726:20: error: redefinition of 'kvm_arch_supports_gmem'
     726 | static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
         |                    ^
   arch/arm64/include/asm/kvm_host.h:1596:20: note: previous definition is here
    1596 | static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
         |                    ^
   In file included from arch/arm64/kernel/asm-offsets.c:15:
>> include/linux/kvm_host.h:739:20: error: redefinition of 'kvm_arch_vm_supports_gmem_shared_mem'
     739 | static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
         |                    ^
   arch/arm64/include/asm/kvm_host.h:1601:20: note: previous definition is here
    1601 | static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
         |                    ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:98: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=2236105568
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2236105568
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2236105568
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2236105568
   make: Target 'prepare' not remade because of errors.


vim +/kvm_arch_supports_gmem +726 include/linux/kvm_host.h

f481b069e67437 Paolo Bonzini       2015-05-17  720  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  721  /*
fc8463899419fd Fuad Tabba          2025-05-13  722   * Arch code must define kvm_arch_supports_gmem if support for guest_memfd
a7800aa80ea4d5 Sean Christopherson 2023-11-13  723   * is enabled.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  724   */
fc8463899419fd Fuad Tabba          2025-05-13  725  #if !defined(kvm_arch_supports_gmem) && !IS_ENABLED(CONFIG_KVM_GMEM)
fc8463899419fd Fuad Tabba          2025-05-13 @726  static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  727  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  728  	return false;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  729  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  730  #endif
a7800aa80ea4d5 Sean Christopherson 2023-11-13  731  
33a8543055465e Fuad Tabba          2025-05-13  732  /*
33a8543055465e Fuad Tabba          2025-05-13  733   * Returns true if this VM supports shared mem in guest_memfd.
33a8543055465e Fuad Tabba          2025-05-13  734   *
33a8543055465e Fuad Tabba          2025-05-13  735   * Arch code must define kvm_arch_vm_supports_gmem_shared_mem if support for
33a8543055465e Fuad Tabba          2025-05-13  736   * guest_memfd is enabled.
33a8543055465e Fuad Tabba          2025-05-13  737   */
33a8543055465e Fuad Tabba          2025-05-13  738  #if !defined(kvm_arch_vm_supports_gmem_shared_mem) && !IS_ENABLED(CONFIG_KVM_GMEM)
33a8543055465e Fuad Tabba          2025-05-13 @739  static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
33a8543055465e Fuad Tabba          2025-05-13  740  {
33a8543055465e Fuad Tabba          2025-05-13  741  	return false;
33a8543055465e Fuad Tabba          2025-05-13  742  }
33a8543055465e Fuad Tabba          2025-05-13  743  #endif
33a8543055465e Fuad Tabba          2025-05-13  744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
