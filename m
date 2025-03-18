Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF41211488;
	Tue, 18 Mar 2025 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742318257; cv=none; b=LRccefNRBZpYgde1VMKoilbcFYWA6Jp8VfCylSLucPXuzn7kVcLD+/tkYJthcuK0zBLboRD44P+8EW6vrjc0yV+nmw7sI+h57GdLhNInXVkcz4mZF3MUwlbHiq8xj6Scos+YKPH2S7MW02nP00H6Hw8G9UPX8+OIMi7EUKfVKBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742318257; c=relaxed/simple;
	bh=rHnnE761F2f1g4EYoB4jBlo9CD7/MZHjP4zP87Tqho0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lE0p6GwebRbp5qRD23IwSpKr+goPduhw9DJ3SdFtHKXR0cP8qTt9s+kbnLm2nSKDikBpplfilIGWQj3BsWC1Q705C/DDn7WGnTwhxhnOMi6v+5R1dRzVwOBkpMFi1bI93PgD7TMxCs2wLOXYp66+t5Iqzy00e0N+X5szFXi55k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUtS2I0x; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUtS2I0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742318255; x=1773854255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rHnnE761F2f1g4EYoB4jBlo9CD7/MZHjP4zP87Tqho0=;
  b=LUtS2I0xlG3sDeLmZ1ciY8d+9T75Xbd7aCNBWv2X4DvXoDJANQDBNoIT
   CbyO9K/IPhWOA9hlZ5PXo5kiEZcQu/a+xRErFkIKSxbZR2iWrp1q1d9kW
   UyEudzsAlVRb3lqjJGeVhZf1JtflbK5+bEsWthwGc2NAI1ZL7G1QjOJcI
   DWeucPI4u3Q9f5YIxxCh4/DJsGJfCwlHy6giuCTR9VM68LPmNp0v3CQkp
   ccjATlDoXjR8F+dGpfIhwyhxLPktNXS0X9ArB4eQ7xInYpuTHrtRQ446a
   y6MTTnURPjOzY+akYfCBW1dM/dGd3owKQOnhweYmN+rb0ckRx1EXssKob
   A==;
X-CSE-ConnectionGUID: JcQzlX2SSXONcsx3MJPsIQ==
X-CSE-MsgGUID: 6MBPo05uQLCwRpkJx0Edlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="65938081"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="65938081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 10:17:23 -0700
X-CSE-ConnectionGUID: 36yUujLkR/2ZA+yz+Qs02A==
X-CSE-MsgGUID: iBsluppATz+pYY8Jm7jkkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="123265982"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2025 10:17:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuaZ5-000E0s-1J;
	Tue, 18 Mar 2025 17:17:19 +0000
Date: Wed, 19 Mar 2025 01:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10570/12094]
 include/asm-generic/pci_iomap.h:56:20: error: static declaration of
 'pci_iounmap' follows non-static declaration
Message-ID: <202503190113.lhxhbSzS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c4d4884b67802c41fd67399747165d65c770621a
commit: 976bf3aec388331454362b60cd1b5605f99bfe38 [10570/12094] mips: drop GENERIC_IOMAP wrapper
config: mips-rt305x_defconfig (https://download.01.org/0day-ci/archive/20250319/202503190113.lhxhbSzS-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190113.lhxhbSzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190113.lhxhbSzS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/mips/include/asm/page.h:181:
   In file included from arch/mips/include/asm/io.h:553:
   In file included from include/asm-generic/io.h:21:
>> include/asm-generic/pci_iomap.h:56:20: error: static declaration of 'pci_iounmap' follows non-static declaration
   static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
                      ^
   arch/mips/include/asm/io.h:550:21: note: expanded from macro 'pci_iounmap'
   #define pci_iounmap pci_iounmap
                       ^
   arch/mips/include/asm/io.h:549:6: note: previous declaration is here
   void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
        ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/mips/include/asm/page.h:181:
   In file included from arch/mips/include/asm/io.h:553:
>> include/asm-generic/io.h:1175:35: warning: pointer/integer type mismatch in conditional expression ('void *' and 'unsigned long') [-Wconditional-type-mismatch]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                            ^ ~~~~   ~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pci_iounmap +56 include/asm-generic/pci_iomap.h

eb29d8d2aad706 Michael S. Tsirkin 2013-05-29  39  
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  40  static inline void __iomem *pci_iomap_wc(struct pci_dev *dev, int bar, unsigned long max)
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  41  {
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  42  	return NULL;
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  43  }
eb29d8d2aad706 Michael S. Tsirkin 2013-05-29  44  static inline void __iomem *pci_iomap_range(struct pci_dev *dev, int bar,
eb29d8d2aad706 Michael S. Tsirkin 2013-05-29  45  					    unsigned long offset,
eb29d8d2aad706 Michael S. Tsirkin 2013-05-29  46  					    unsigned long maxlen)
eb29d8d2aad706 Michael S. Tsirkin 2013-05-29  47  {
eb29d8d2aad706 Michael S. Tsirkin 2013-05-29  48  	return NULL;
eb29d8d2aad706 Michael S. Tsirkin 2013-05-29  49  }
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  50  static inline void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  51  					       unsigned long offset,
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  52  					       unsigned long maxlen)
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  53  {
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  54  	return NULL;
1b3d4200c1e00a Luis R. Rodriguez  2015-08-24  55  }
9caea0007601d3 Helge Deller       2021-09-19 @56  static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
9caea0007601d3 Helge Deller       2021-09-19  57  { }
66eab4df288aae Michael S. Tsirkin 2011-11-24  58  #endif
66eab4df288aae Michael S. Tsirkin 2011-11-24  59  

:::::: The code at line 56 was first introduced by commit
:::::: 9caea0007601d3bc6debec04f8b4cd6f4c2394be parisc: Declare pci_iounmap() parisc version only when CONFIG_PCI enabled

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
