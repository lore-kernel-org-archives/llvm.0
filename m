Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714B12837B;
	Wed, 10 Apr 2024 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748667; cv=none; b=a5OMwsVJ5doabo0vF7U+zSfCG6jh/ClEODbQCF4lYn4Ku8AdbWo8UvpTB6exAqeat4nxMpxnhdrN/Dz1/KFm0XFHSqkTYdDNr6qSIqBhIR/V7g2p3YLzuZAricOAmz0/jJr41reHh6m2jtT8M7ZEZArf56RYAlB1OsoQQOknHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748667; c=relaxed/simple;
	bh=axtzChUqvlY9sNZDWVdvrN9IAA0vlVq1Z3UEJyEq/l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hw+ijMoPrO8AB2KPKv4D/u0BseBVUAyLsKPOdzZ6/NGpSXOahY2GONOpuPRcElPkmdixoSF+K81Co7656mf0XDDcGK/ZPdF7Z57Y+75Y1a5gZFJxSsiRB/BgHuVtqefSy/T/HQrQ8HgQYjG957cW+EpZ+PpDf5CrjaMvz92hzrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bztUZImB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bztUZImB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712748664; x=1744284664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axtzChUqvlY9sNZDWVdvrN9IAA0vlVq1Z3UEJyEq/l4=;
  b=bztUZImBErZTbzeNfk2ngC4m6w+tR8440HuFmlHh9hAR0GJQWvJB8XER
   opIQva422I3kt5PnCNNmq7OgE4H5JaQDp2/ypJAYVgSaXrFfsgJuXTPmS
   Ogf1FU5WEnPireWPmBqTLypn1OV93VSrvBmyeUkjG6NWsqbQMZw+n+pQL
   uw/AfJCaYnkCS64ewbSe033wWnqb6Wh/a3PpoYLj5z8sX4yUH1hw0MTjp
   mKzE6Y9ektMduNaxDqHT0kZWoYgkL+adHCRxg+JY8on11AwBB4KL1m9oI
   QxGZtNu5F2Ra3ozJ35+U1j97dTHeIXX2w1piWfulYh2ZXy5E6BNNfLycQ
   w==;
X-CSE-ConnectionGUID: YV8Mdi7VS1OCMYeR6Ao77Q==
X-CSE-MsgGUID: 6Q/rq/RDQECQOr7SufHS8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11942594"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11942594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:31:03 -0700
X-CSE-ConnectionGUID: X4/o7noIQvW9GO/7qkPQKA==
X-CSE-MsgGUID: Sh4+pF6pSv652mUK3Jng3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43767327"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2024 04:31:01 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruWAN-0007LA-0t;
	Wed, 10 Apr 2024 11:30:59 +0000
Date: Wed, 10 Apr 2024 19:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 74/367] drivers/s390/block/dasd.c:908:43:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <202404101907.cFk0K74r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ad69a5a8c930e58537ce092334af08caaa412900
commit: f344daebdf504e18dcdc1661cbff885c48b304be [74/367] s390/dasd: convert to read/write iterators
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101907.cFk0K74r-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101907.cFk0K74r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101907.cFk0K74r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/s390/block/dasd.c:24:
   In file included from arch/s390/include/asm/ccwdev.h:14:
   In file included from arch/s390/include/asm/chsc.h:12:
   In file included from arch/s390/include/uapi/asm/chsc.h:14:
   In file included from arch/s390/include/asm/chpid.h:10:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
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
   In file included from drivers/s390/block/dasd.c:24:
   In file included from arch/s390/include/asm/ccwdev.h:14:
   In file included from arch/s390/include/asm/chsc.h:12:
   In file included from arch/s390/include/uapi/asm/chsc.h:14:
   In file included from arch/s390/include/asm/chpid.h:10:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
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
   In file included from drivers/s390/block/dasd.c:24:
   In file included from arch/s390/include/asm/ccwdev.h:14:
   In file included from arch/s390/include/asm/chsc.h:12:
   In file included from arch/s390/include/uapi/asm/chsc.h:14:
   In file included from arch/s390/include/asm/chpid.h:10:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
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
>> drivers/s390/block/dasd.c:908:43: error: too few arguments to function call, expected 3, have 2
     908 |         if (!copy_from_iter_full(buffer, user_len), from) {
         |              ~~~~~~~~~~~~~~~~~~~                 ^
   include/linux/uio.h:222:6: note: 'copy_from_iter_full' declared here
     222 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |      ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   17 warnings and 1 error generated.


vim +908 drivers/s390/block/dasd.c

   899	
   900	char *dasd_get_user_string(struct iov_iter *from)
   901	{
   902		size_t user_len = iov_iter_count(from);
   903		char *buffer;
   904	
   905		buffer = vmalloc(user_len + 1);
   906		if (buffer == NULL)
   907			return ERR_PTR(-ENOMEM);
 > 908		if (!copy_from_iter_full(buffer, user_len), from) {
   909			vfree(buffer);
   910			return ERR_PTR(-EFAULT);
   911		}
   912		/* got the string, now strip linefeed. */
   913		if (buffer[user_len - 1] == '\n')
   914			buffer[user_len - 1] = 0;
   915		else
   916			buffer[user_len] = 0;
   917		return buffer;
   918	}
   919	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
