Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A801AC8BE;
	Fri, 16 Aug 2024 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830371; cv=none; b=Qu2DzvWNkPnlPk9biTVszmZBZq2u/zH9kTo23vTpmJGDIFH4dHJpMVhFHHuV9I1AlC+ukmgA23tZlIKWGKloOaGuBv3GhdhLPwPBPL42CO2gtE5y1EA0OmJCzNNq1aVkNXM3bQgBXtL+ho7iXGDzw/4OenehZmZCOd8wbjbmdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830371; c=relaxed/simple;
	bh=Ws6sscHJPDSexL5TG6KOn3jp12wP7URAIqlE+vveEtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnYuCVCq6+G5V7dCA6UEMXYrIz7xZgAnGe7BgS7lvnGEF5lsUkZUvChv+lvZISmFRWEGkflRdUwv347pgeLBiZKPqDzTuc803+mNMRGqU8Uhauiy3Y+uFAYkhAgEONFNnnC8xRBxPGywquGQCwE+WGa0/JCxVWwHagp3f4Jwra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5cXBc2R; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5cXBc2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723830370; x=1755366370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ws6sscHJPDSexL5TG6KOn3jp12wP7URAIqlE+vveEtc=;
  b=I5cXBc2RlOMBhX7g4gR269ndy4LcNCvXgNrL+0JOtpWjlzunJ0F+2h/m
   CtWJ9Aaf0xKvpkH3dGs57Np1ihDBuqIPaHqLesLnvGo0vhRAdNjWimSbX
   KfzlVa5wqSd6daQo23BuU2oBLXmQ4oOfH7JogM3fODb/Yf/LOPgwPAD9q
   BfC9sd7Oz3N02ZBUlhPsXIeeyy23EVSEXLBe0zv/tHWXgvi4qFE7PUdxV
   DZq6Qbk9DWGCARUykD2LebMdTnxzQCPOhGZGrGs8Cq0eS3FsyKK84iTWr
   IPtvVteZVGEzxTy10del8UfipDIDK//l2705578euJpV0h3N94ejTrzAB
   g==;
X-CSE-ConnectionGUID: k6COtOU4SFuTZI8rSYEqTg==
X-CSE-MsgGUID: IujjX6euRW6wZUAF0i3J1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21991872"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="21991872"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:46:09 -0700
X-CSE-ConnectionGUID: C2WVt4UeT0iQeyx+7ZvuxA==
X-CSE-MsgGUID: aMky/gGFSMqpSTapHezJrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="64693626"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2024 10:46:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf11Y-0006gy-1o;
	Fri, 16 Aug 2024 17:46:04 +0000
Date: Sat, 17 Aug 2024 01:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.dio 36/36] fs/inode.c:2468:6: warning: no previous
 prototype for function 'inode_dio_finished'
Message-ID: <202408170155.rdZNmFZm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.dio
head:   547ff50a106c7fda7594b19819588fbf9356e85c
commit: 547ff50a106c7fda7594b19819588fbf9356e85c [36/36] inode: remove __I_DIO_WAKEUP
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240817/202408170155.rdZNmFZm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170155.rdZNmFZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170155.rdZNmFZm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/inode.c:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/inode.c:15:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/inode.c:15:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/inode.c:15:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/inode.c:2468:6: warning: no previous prototype for function 'inode_dio_finished' [-Wmissing-prototypes]
    2468 | bool inode_dio_finished(const struct inode *inode)
         |      ^
   fs/inode.c:2468:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2468 | bool inode_dio_finished(const struct inode *inode)
         | ^
         | static 
   14 warnings generated.


vim +/inode_dio_finished +2468 fs/inode.c

  2464	
  2465	/*
  2466	 * Direct i/o helper functions
  2467	 */
> 2468	bool inode_dio_finished(const struct inode *inode)
  2469	{
  2470		smp_mb__before_atomic();
  2471		return atomic_read(&inode->i_dio_count) == 0;
  2472	}
  2473	EXPORT_SYMBOL(inode_dio_finished);
  2474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
