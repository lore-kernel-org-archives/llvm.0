Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055010F9;
	Wed, 10 Apr 2024 02:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712714959; cv=none; b=SmxlcJMq9yPlCFCQQQcJCA+QBsgafn+zbixhkXwBKqIOTd2TSCZIDGz1VxUAxY1EY0HuuNy/Mw63VzBMsDyJXHIwHmlsXMdATmTYx9GOVqTllzRGVzx2RwxMUOsA+IO74sNX7lG663lgwaCwb3BEpt+Ix5a5Spom5X2FBYliMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712714959; c=relaxed/simple;
	bh=1SQVaqYyMbKjIv3+zsKOuAN4nZYFqAwyXVE2WtOCfZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJXnHRt9eDXtU5tYkmD9FtalRPcZNRoYJ0uXhFL9ruRB846q7rgTndt3kjBnaG9DynIQ7gvYkG5X+YCLrA8xRWtClnkRShuLuKXw7ZTmWpr4jonEgyhnIyBR8rAbz7onenaD0NVe4MqfKMMl4DjIWByM1Uykv37bAlhCZWlgcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtISxAEZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtISxAEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712714957; x=1744250957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1SQVaqYyMbKjIv3+zsKOuAN4nZYFqAwyXVE2WtOCfZg=;
  b=DtISxAEZbsK4Tz+8x6BwE+6c2bqVwSZ+qaVUUUZosgfsTi/0OMEtGLbJ
   luq84qCxBDaTY3Xy+bpULX48yj5OrgTnWGH5ZMQgMQCnRd5/KLPVP/i28
   gso2f+1uOASIWMyisbel/M/bT7X2LxQqZf/kdSjB3Ga/KK83nQWmv4BDX
   1A5JuBtMm4eaxFuJjZxLRQvIZ40jnsf8nv7vytq0Sp5jCMGekNkdIiupF
   Ag06C+eL8UD1dBXJ0iqE8dQViag/vYhW6UoWezO+CjlLwlAt8JFBdnT//
   P9D61AK9vL7PSbJMtE+qr3XqVVyNiGtYCN4lQS8X5CPk99lDfCeaozh3F
   w==;
X-CSE-ConnectionGUID: AWLwZ23eSgm7aIPwTVdfEw==
X-CSE-MsgGUID: 2HVQshLMTJuBsIJBRYTiSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19486063"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19486063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 19:09:16 -0700
X-CSE-ConnectionGUID: x+Ge8GOhRWmV1wXEvL3QjQ==
X-CSE-MsgGUID: Tm1SvbTnReS5hwjlNqEm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25016664"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2024 19:09:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruNOi-0006hm-1h;
	Wed, 10 Apr 2024 02:09:12 +0000
Date: Wed, 10 Apr 2024 10:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 74/317] drivers/s390/block/dasd.c:904:19:
 error: use of undeclared identifier 'user_len'
Message-ID: <202404101056.0wVAjwbo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ce74875ea91d3421b08ce15d34f1eccd90cebb2b
commit: af31a7fb0db7b37d06e7725c1dc096c57ac1e226 [74/317] s390/dasd: convert to read/write iterators
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101056.0wVAjwbo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101056.0wVAjwbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101056.0wVAjwbo-lkp@intel.com/

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
>> drivers/s390/block/dasd.c:904:19: error: use of undeclared identifier 'user_len'
     904 |         buffer = vmalloc(user_len + 1);
         |                          ^
   drivers/s390/block/dasd.c:907:35: error: use of undeclared identifier 'user_len'
     907 |         if (!copy_from_iter_full(buffer, user_len), from) {
         |                                          ^
   drivers/s390/block/dasd.c:912:13: error: use of undeclared identifier 'user_len'
     912 |         if (buffer[user_len - 1] == '\n')
         |                    ^
   drivers/s390/block/dasd.c:913:10: error: use of undeclared identifier 'user_len'
     913 |                 buffer[user_len - 1] = 0;
         |                        ^
   drivers/s390/block/dasd.c:915:10: error: use of undeclared identifier 'user_len'
     915 |                 buffer[user_len] = 0;
         |                        ^
   17 warnings and 5 errors generated.
--
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
   In file included from drivers/s390/block/dasd_proc.c:24:
   In file included from drivers/s390/block/dasd_int.h:53:
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
   In file included from drivers/s390/block/dasd_proc.c:24:
   In file included from drivers/s390/block/dasd_int.h:53:
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
   In file included from drivers/s390/block/dasd_proc.c:24:
   In file included from drivers/s390/block/dasd_int.h:53:
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
>> drivers/s390/block/dasd_proc.c:323:3: error: field designator 'proc_write_iter' does not refer to any field in type 'const struct proc_ops'; did you mean 'proc_read_iter'?
     323 |         .proc_write_iter = dasd_stats_proc_write,
         |          ^~~~~~~~~~~~~~~
         |          proc_read_iter
   include/linux/proc_fs.h:33:12: note: 'proc_read_iter' declared here
      33 |         ssize_t (*proc_read_iter)(struct kiocb *, struct iov_iter *);
         |                   ^
   drivers/s390/block/dasd_proc.c:323:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     323 |         .proc_write_iter = dasd_stats_proc_write,
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd_proc.c:320:20: note: previous initialization is here
     320 |         .proc_read_iter = seq_read_iter,
         |                           ^~~~~~~~~~~~~
   18 warnings and 1 error generated.


vim +/user_len +904 drivers/s390/block/dasd.c

4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  899  
af31a7fb0db7b3 Jens Axboe       2024-04-09  900  char *dasd_get_user_string(struct iov_iter *from)
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  901  {
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  902  	char *buffer;
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  903  
e4258d55bff067 Stefan Weinhuber 2011-08-03 @904  	buffer = vmalloc(user_len + 1);
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  905  	if (buffer == NULL)
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  906  		return ERR_PTR(-ENOMEM);
af31a7fb0db7b3 Jens Axboe       2024-04-09  907  	if (!copy_from_iter_full(buffer, user_len), from) {
e4258d55bff067 Stefan Weinhuber 2011-08-03  908  		vfree(buffer);
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  909  		return ERR_PTR(-EFAULT);
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  910  	}
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  911  	/* got the string, now strip linefeed. */
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  912  	if (buffer[user_len - 1] == '\n')
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  913  		buffer[user_len - 1] = 0;
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  914  	else
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  915  		buffer[user_len] = 0;
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  916  	return buffer;
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  917  }
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  918  

:::::: The code at line 904 was first introduced by commit
:::::: e4258d55bff06780cd424c671b576a90acc1592f [S390] dasd: use vmalloc for statistics input buffer

:::::: TO: Stefan Weinhuber <wein@de.ibm.com>
:::::: CC: Heiko Carstens <heiko.carstens@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
