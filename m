Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A51DA58;
	Mon, 19 Aug 2024 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724077010; cv=none; b=qI/w5zLEoNBQSkQ2XsZSUsTxR7Pn1+jDbfagQiqpGlAv6B2TplLWa24iAdH0KQLlJ/0puNksSsMWjY2O5UgkpTqhE6uHohZ2S0AOiJo/iSd/pHkZ+wA8QowSyhTHOxiS4jCTQ8HZIlXrzEekwvDnCcsXsIJ66l/ZXclAkrbx8sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724077010; c=relaxed/simple;
	bh=mnwLF0TnfXq7cg3jN8iAwtQabXlrEGSW/K+U3HM0F9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEpc0K3kbDOZOQNFstY4RIZYWyHC/XVFZzyBn7HSJzrikp4ty6EIoO63FmPDP6CVUMGo+Ykkmwz+8CkfVlQZzm2iRtG8hvGq6gXjrJGhg8zA2FN2OK0T8L8DtHe/iepVHFa014dF4VhrK7Wta8Jrvptyk/QTM1QyEa5zIb7Wfcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFT6+UJZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFT6+UJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724077008; x=1755613008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnwLF0TnfXq7cg3jN8iAwtQabXlrEGSW/K+U3HM0F9k=;
  b=CFT6+UJZaWVpmoA4vxm2ODit03opIvbtGSXV1YiXweQB4IWGsCFjZ1c7
   C1j9cPif5C7Q3R6LpjVtQNQyc8hRT6pcNj8kzXy4v7agkVBqbQPKdABZl
   tgwRzK9tHr2MHsRD20AA12MNEQP6Uf+Jiss7sHsGQJSB3zyKzSQECOSsD
   cFlZou1GqgtgQykH/sT56XvfcFYa3ji3y0H+2c7NRXrDtgNnGTGK/cW0o
   044Axc5OxdzpRcxOEpwCpTLv7OUARk0DNP9BZ9czZEKMDV5R2OiwRfw3j
   GDJ6tNIckaWW1c5q7yI7C6C4Gd6/IDSuQcdtHRNpqQxfvwmyLKX6VWlCX
   A==;
X-CSE-ConnectionGUID: N6NxcTd5QEOSkDGCtQpyEg==
X-CSE-MsgGUID: uwICby9DSeShoeyhJr2ung==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22501757"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22501757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 07:16:46 -0700
X-CSE-ConnectionGUID: 7gSz4SjKTgedV7xcjeEQqg==
X-CSE-MsgGUID: +sDyYt4vSX+a5ea0pr+0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60365345"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2024 07:16:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg3Ba-000936-36;
	Mon, 19 Aug 2024 14:16:42 +0000
Date: Mon, 19 Aug 2024 22:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 'tlb_flush_all_threshold'; recompile with -fPIC
Message-ID: <202408192214.Wywi5bOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   47ac09b91befbb6a235ab620c32af719f8208399
commit: f0c83a23fcbb424fdff5b38fbcdda3c04003a210 Bluetooth: btmtk: Fix btmtk.c undefined reference build error
date:   3 weeks ago
config: riscv-randconfig-001-20240819 (https://download.01.org/0day-ci/archive/20240819/202408192214.Wywi5bOd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408192214.Wywi5bOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408192214.Wywi5bOd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'tlb_flush_all_threshold'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/mm/tlbflush.o)
   >>> referenced by errata.c:70 (arch/riscv/errata/sifive/errata.c:70)
   >>>               arch/riscv/errata/sifive/errata.o:(errata_cip_1200_check_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_S cannot be used against symbol 'tlb_flush_all_threshold'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/mm/tlbflush.o)
   >>> referenced by errata.c:70 (arch/riscv/errata/sifive/errata.c:70)
   >>>               arch/riscv/errata/sifive/errata.o:(errata_cip_1200_check_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'riscv_cbom_block_size'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
   >>> referenced by errata.c:113 (arch/riscv/errata/thead/errata.c:113)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_S cannot be used against symbol 'riscv_cbom_block_size'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
   >>> referenced by errata.c:120 (arch/riscv/errata/thead/errata.c:120)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
