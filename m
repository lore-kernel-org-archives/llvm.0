Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715965BCA;
	Sat, 17 Feb 2024 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708176557; cv=none; b=bsHKSenWaGj40YY34aDJ+Kc9uLj1n13COU2Vi9L/Uf2FI+8p+nE/Ja3YeBM0aIjqJeXzwsCkFHqAWlEzbJSd8BfGIiY7uJedhEl5vGpXYt+4f6qDiGpOuvMBae6YO1lhpEwV42wRVUZBuQGuotz8F3bhvFT5+xutiY3NsZSgnis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708176557; c=relaxed/simple;
	bh=UPO4XDeeLeKBKvWG5+wcq/CBzK+rogHoWPya1ehfmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=poAHkNpaFYRvO5ARcHkwPGJJsN6CDa9/pQPxb4jKjwjAt41Ur6IpOFu8ET/SAQWVIrrMlTFaJZZPlflODA46OviGhBPUvYn04Ypb2CKlbD3dZ4Xv9dw6piD/pMJrYXpSMkBnaNPzJyHH1hlob/o9sxlJ4TNoehUhhfJnz6Ds0TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACgJ1Xi5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACgJ1Xi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708176555; x=1739712555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UPO4XDeeLeKBKvWG5+wcq/CBzK+rogHoWPya1ehfmbQ=;
  b=ACgJ1Xi5QjlmJdKCfUhD7vwcBmbd/y4Q5ad5BFewrjK9m3IJl0K9GHka
   0G16mdMAxUJZS4SEgPKWp8z2HOGzcQd2+qXwqYJXCKhSEuPd/Wau5C89j
   uyVbVrFXSCLqyO2TJl9U6/jRNjBDqfos8hMrCzoH1S2YZY/wxAiUwputw
   K7kfcWhkGyYOY7l6epVoUYsmEstlQ6BrqQngKVPwyFvIUFiOw53+VwmA4
   cH5Kfh+io2B4OqcBtqiqnsDBeUn7uVHvrv+FdWSdZfmQMVVYsVXJnBXUZ
   n/4a7kggqHC/CXm3Jpr67mU7QDxN8XZcsOzkQpLda14mxmKWRp7EiMvh9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="13405658"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="13405658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 05:29:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4107570"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2024 05:29:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbKkh-00028k-19;
	Sat, 17 Feb 2024 13:29:11 +0000
Date: Sat, 17 Feb 2024 21:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 2/37]
 arch/arm/kernel/traps.c:962:6: warning: no previous prototype for function
 'arch_sync_kernel_mappings'
Message-ID: <202402172125.Hq5GC5yb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   23633d13a520a9f34caf0f1a13820660b95406b5
commit: d55de34a38a9b226f04758efc2a7949bf81e39fc [2/37] asm-generic/io.h: Kill vmalloc.h dependency
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240217/202402172125.Hq5GC5yb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402172125.Hq5GC5yb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402172125.Hq5GC5yb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/kernel/traps.c:962:6: warning: no previous prototype for function 'arch_sync_kernel_mappings' [-Wmissing-prototypes]
   void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
        ^
   arch/arm/kernel/traps.c:962:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
   ^
   static 
   1 warning generated.


vim +/arch_sync_kernel_mappings +962 arch/arm/kernel/traps.c

a1c510d0adc604 Ard Biesheuvel 2021-09-23  946  
d31e23aff011d9 Ard Biesheuvel 2022-01-10  947  #ifndef CONFIG_ARM_LPAE
a1c510d0adc604 Ard Biesheuvel 2021-09-23  948  /*
a1c510d0adc604 Ard Biesheuvel 2021-09-23  949   * Normally, we rely on the logic in do_translation_fault() to update stale PMD
a1c510d0adc604 Ard Biesheuvel 2021-09-23  950   * entries covering the vmalloc space in a task's page tables when it first
a1c510d0adc604 Ard Biesheuvel 2021-09-23  951   * accesses the region in question. Unfortunately, this is not sufficient when
a1c510d0adc604 Ard Biesheuvel 2021-09-23  952   * the task stack resides in the vmalloc region, as do_translation_fault() is a
a1c510d0adc604 Ard Biesheuvel 2021-09-23  953   * C function that needs a stack to run.
a1c510d0adc604 Ard Biesheuvel 2021-09-23  954   *
a1c510d0adc604 Ard Biesheuvel 2021-09-23  955   * So we need to ensure that these PMD entries are up to date *before* the MM
a1c510d0adc604 Ard Biesheuvel 2021-09-23  956   * switch. As we already have some logic in the MM switch path that takes care
a1c510d0adc604 Ard Biesheuvel 2021-09-23  957   * of this, let's trigger it by bumping the counter every time the core vmalloc
d31e23aff011d9 Ard Biesheuvel 2022-01-10  958   * code modifies a PMD entry in the vmalloc region. Use release semantics on
d31e23aff011d9 Ard Biesheuvel 2022-01-10  959   * the store so that other CPUs observing the counter's new value are
d31e23aff011d9 Ard Biesheuvel 2022-01-10  960   * guaranteed to see the updated page table entries as well.
a1c510d0adc604 Ard Biesheuvel 2021-09-23  961   */
a1c510d0adc604 Ard Biesheuvel 2021-09-23 @962  void arch_sync_kernel_mappings(unsigned long start, unsigned long end)

:::::: The code at line 962 was first introduced by commit
:::::: a1c510d0adc604bb143c86052bc5be48cbcfa17c ARM: implement support for vmap'ed stacks

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
