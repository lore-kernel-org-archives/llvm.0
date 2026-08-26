Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE9F327C09;
	Wed, 26 Aug 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738431; cv=none; b=UoUGBIx2OYxuhw1oIFGIWw8XKGhKPNt9Ot8Kn089wHpQRlnNysnLgmyBlNKUFMn/DDuApjcwzCq9/+w+yQ7Ld6Kyx/TLEFCE7C0fDTDF1h9BMdn/YXTUelaJn5Cp+Ft1Bi+bFso+IuJkbf7o+9OrFxJNbg+KHECjbNjor0nsS/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738431; c=relaxed/simple;
	bh=OMhxZRY17IDZoBqfn6H8x/JyETLPC/eGD9l3CRl584I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ij5aG5Ij4ed2cqeR9u0NX2mdcpcbNkCq8eM2xIEFNDxYJrQF0vNf1dJM2Uu3pealX0mkaIGPEe+xnQJat8icCsHB7clkmMgKIPn04gIRQjX0jrKwiv4sR7NvRCuFZcJb6mXVEqKmJeiVkJ+2DGbtWBujw7ltxKGcV1NmaZUnKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpdCC75x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpdCC75x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787738431; x=1819274431;
  h=date:from:to:cc:subject:message-id;
  bh=OMhxZRY17IDZoBqfn6H8x/JyETLPC/eGD9l3CRl584I=;
  b=gpdCC75x81aBAewGlOjOgPhCqIy+bI/qYDT960UlFK6IyvPd2hP4fdPC
   ZkJOvaxCIWI265AlwoRreebacA06BmeHzbYcbMSG2J8ZYDmb8MnMGhun1
   sCpNgfQgcDUHsjlVZvO/y2RSE1hK2ZDfK2m76LeCbxIwtQTyejFztvUzH
   1v3bbcNxDD7U5iCx6t2RZPYEaADRsXhWRLRQXLiwMmqaeW7NMcMuWg9OA
   3Ocqhe131C8Q6cUoZmo4NucKxwfKYD9FFqohuWyzZMvb1AhZcf+8CcKPJ
   pSh0zz7FKwY5vlS0yluOGCShUftmfFYVuRVGBfr1AL3nBztyOSBOZdlAl
   A==;
X-CSE-ConnectionGUID: 1psAAiu2TpmvzjD54OpPgg==
X-CSE-MsgGUID: Vt1xA/cZTEe7ODCa1dqYBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92078331"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="92078331"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 03:00:30 -0700
X-CSE-ConnectionGUID: 7ogqAHYgQYmeROJspUKjWg==
X-CSE-MsgGUID: it31LNnbSLSBFEGw0Pb75A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="291061019"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2026 03:00:28 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzAQj-000000007GE-3Tn8;
	Wed, 26 Aug 2026 10:00:25 +0000
Date: Wed, 26 Aug 2026 17:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: ld.lld: error: undefined symbol: __aeabi_uidivmod
Message-ID: <202608261730.Z3vfMtxw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66498c75b4f8017f62d720d9b59675bdf3abce91
commit: 25900bd99d4d10faa939a79e2fdc49c3373b51e7 ARM: limit OABI support to StrongARM CPUs
date:   8 weeks ago
config: arm-assabet_defconfig (https://download.01.org/0day-ci/archive/20260826/202608261730.Z3vfMtxw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608261730.Z3vfMtxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25900bd99d4d ("ARM: limit OABI support to StrongARM CPUs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261730.Z3vfMtxw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uidivmod
   >>> referenced by ptrace.c
   >>>               kernel/ptrace.o:(ptrace_regset) in archive vmlinux.a
   >>> referenced by irqdomain.c
   >>>               kernel/irq/irqdomain.o:(irq_create_mapping_affinity_locked) in archive vmlinux.a
   >>> referenced by irqdomain.c
   >>>               kernel/irq/irqdomain.o:(irq_domain_alloc_descs) in archive vmlinux.a
   >>> referenced 122 more times
--
>> ld.lld: error: undefined symbol: __aeabi_idivmod
   >>> referenced by bitmap.c
   >>>               lib/bitmap.o:(bitmap_bitremap) in archive vmlinux.a
   >>> referenced by blk-map.c
   >>>               block/blk-map.o:(blk_rq_map_user_iov) in archive vmlinux.a
   >>> referenced by ialloc.c
   >>>               fs/ext2/ialloc.o:(ext2_new_inode) in archive vmlinux.a
   >>> referenced 21 more times

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
