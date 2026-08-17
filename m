Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B032EEE73;
	Mon, 17 Aug 2026 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980510; cv=none; b=Dv97Mg9EYO28TLBJXvhavaIzQsqi1z42uYhXbBM5OIz6sBsujwSyxdPEdNQiI8z5efpFsNtNwI4UNeteUWz3hGJZEYzQtWc5f3N5AVayrHWJH7oEAFtxd+TCi6s18XMM1MLydlPxUMKGSmKVmXk085G/KWayk+Fbu/RhZTZPagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980510; c=relaxed/simple;
	bh=jzOH9XhHbTON03DtevCw+iYmjxG0j2LjTarGKKKIkk4=;
	h=Date:From:Cc:Subject:Message-ID; b=gLVl1+KjCMXeEBWfwZWr+9HyO22fwER1E0lqhEr3LcCSQS7wVwzTQYk/LrEu6SNGx0l8jurA3bf+L/YdsHnMUxN1WBg88uFPc6DXek2SZvRn2l3ZYXcK2tVag8Bgsw7yNriOaSkN3FYDkmYg95dDcgf4t9D0Jt7/8aCz5v92GUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beRWWAnr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beRWWAnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786980508; x=1818516508;
  h=date:from:cc:subject:message-id;
  bh=jzOH9XhHbTON03DtevCw+iYmjxG0j2LjTarGKKKIkk4=;
  b=beRWWAnr8Qr21Ul3bOcpJfxvQmVvqpEUNYvxMyLEpqFgorKDDtURVmJR
   yKihQW2ZqYrtvcLGM/ki5e8vxdzgOghKJ9bZguCXflzidqPncLSrsUenH
   ENHEYcjHrcljFlmLIZvHihrANCID4IWybyQmBNgAkSsyizIsOK6kSziy8
   eei5og4OUk7c0EsySDOWyxP1oc2CczIwZ9Kv3MhlOvLO+iFQdbOrVXHGk
   H3068mv2vSDlUb+7DiJT0Ix6GgYOGsDG7xziPjA537YGj4zN5cDoOyoK3
   GiGwGN/ICt8jGSSJBSxN6FqBuRriHJDKANQYxgYrlRzdPtDHe9UfsU5NG
   w==;
X-CSE-ConnectionGUID: PbyCHNEqSNWPzmeFEJ0mfA==
X-CSE-MsgGUID: LJ4uuXIZTA+MEvS+itdAng==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98046167"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="98046167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:28:28 -0700
X-CSE-ConnectionGUID: 1X0pq5DLRFKJJBohkCvw9A==
X-CSE-MsgGUID: Vx5PSLBJTxy2IXWgjAT0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="270145225"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2026 08:28:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvzG7-00000000dYU-1oa9;
	Mon, 17 Aug 2026 15:28:19 +0000
Date: Mon, 17 Aug 2026 23:27:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [dakr:nova/irq 17/33] rust/helpers/pci.c:37:9: error: call
 to undeclared function 'pci_irq_type'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202608172313.aWAREqgm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git nova/irq
head:   63c0231684920d3d7e0141796b199ba5de8f2ecc
commit: b511b9e0001c87ee7f7e478b1e7064a6b08536bc [17/33] rust: pci: expose the allocated interrupt type
config: um-randconfig-001-20260817 (https://download.01.org/0day-ci/archive/20260817/202608172313.aWAREqgm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172313.aWAREqgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172313.aWAREqgm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:77:
>> rust/helpers/pci.c:37:9: error: call to undeclared function 'pci_irq_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   37 |         return pci_irq_type(pdev);
   |                ^
   rust/helpers/pci.c:37:9: note: did you mean 'pci_pcie_type'?
   include/linux/pci.h:2703:19: note: 'pci_pcie_type' declared here
   2703 | static inline int pci_pcie_type(const struct pci_dev *dev)
   |                   ^
   1 error generated.
   make[3]: *** [rust/Makefile:701: rust/helpers/helpers.o] Error 1 shuffle=2223888588
>> rust/helpers/pci.c:37:9: error: call to undeclared function 'pci_irq_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> Unable to generate bindings: clang diagnosed error: rust/helpers/pci.c:37:9: error: call to undeclared function 'pci_irq_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


vim +/pci_irq_type +37 rust/helpers/pci.c

    34	
    35	__rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev)
    36	{
  > 37		return pci_irq_type(pdev);
    38	}
    39	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
