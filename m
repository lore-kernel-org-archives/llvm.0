Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4B38387;
	Tue, 27 Feb 2024 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709005662; cv=none; b=PSesJzA48EQMsW6RJhNXW0grJAVdVH0WoSrFODwWQmti9iEuQIi1UQvBtVmF3HS/frujIH5IRKkyJuvwR1/DyBPxIlYtbX6E5rZ6RCTCcxvBrZ1elO5PXkcqlYKc7XQ2dvnCQGZum6IqCkqQboDngusVit/p1oG7kUuDMSXaRsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709005662; c=relaxed/simple;
	bh=pT+UKzUXyPK8bYyCVlk6ap4TJyueRMHggMvNBpPQRRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jqgk+Z5SLe88Ub720emCccHbYBY2KKyHEcJypT6/4tIiTE107i9tRKxPZoHUA+H4IrPiXGior4bSRBWtvP4nQ+4cd7oTeF5ROfJBYR5eVX9sJGi9JeNPxt6hItlrV5rRku8St/fGP9BqFHz7eKu/zC1KmLWk2NtqqZp/5vjUQqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmAU4pdZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmAU4pdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709005661; x=1740541661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pT+UKzUXyPK8bYyCVlk6ap4TJyueRMHggMvNBpPQRRE=;
  b=YmAU4pdZEiTpULev8c1hzk75M+QA54cyoKtdL/8UF+kt5KlAWPJrZ0jY
   dYTgJO4v6ZG6w3RbNFkOKmp4Q6Demo5Cax23CuPa/6En24IE1fRKa3gH4
   pq2c0cWsEpga7ZPUAsB1N3jrYiZ9CylDjixiyD6fbLj0UPQcmGyQLPIO6
   3wsWGRjzt3zlHHfO5xLL6iBp4gvXM1+DoN9NEirTDGZ4ETNaYtNIou2EK
   ABum6ghiR19wIfpa2UDBJujBKjBVepGRRHJEYE/FbgVp4qz28B1fpvw3g
   Yjb4PQYBQGgFx1LtOXLTvUQ0kedech5SGnwFCSdpsJ7SHeIxJCOZVCJ4T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="28770602"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="28770602"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 19:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11564121"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Feb 2024 19:47:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reoRM-000Aun-1i;
	Tue, 27 Feb 2024 03:47:36 +0000
Date: Tue, 27 Feb 2024 11:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:iowait 1/1] arch/s390/appldata/appldata_base.c:426:19:
 error: use of undeclared identifier 'nr_iowait'
Message-ID: <202402271127.N9omtGPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git iowait
head:   ee21aa8146a213a08ad3c054721c4976d6c5dfad
commit: ee21aa8146a213a08ad3c054721c4976d6c5dfad [1/1] sched/core: split iowait state into two states
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240227/202402271127.N9omtGPJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271127.N9omtGPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271127.N9omtGPJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/appldata/appldata_base.c:30:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/appldata/appldata_base.c:30:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/appldata/appldata_base.c:30:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> arch/s390/appldata/appldata_base.c:426:19: error: use of undeclared identifier 'nr_iowait'
     426 | EXPORT_SYMBOL_GPL(nr_iowait);
         |                   ^
   12 warnings and 1 error generated.


vim +/nr_iowait +426 arch/s390/appldata/appldata_base.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  420  
0c3252d58c54c8 Gerald Schaefer 2008-07-14  421  #ifdef CONFIG_SWAP
^1da177e4c3f41 Linus Torvalds  2005-04-16  422  EXPORT_SYMBOL_GPL(si_swapinfo);
0c3252d58c54c8 Gerald Schaefer 2008-07-14  423  #endif
^1da177e4c3f41 Linus Torvalds  2005-04-16  424  EXPORT_SYMBOL_GPL(nr_threads);
^1da177e4c3f41 Linus Torvalds  2005-04-16  425  EXPORT_SYMBOL_GPL(nr_running);
^1da177e4c3f41 Linus Torvalds  2005-04-16 @426  EXPORT_SYMBOL_GPL(nr_iowait);

:::::: The code at line 426 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
