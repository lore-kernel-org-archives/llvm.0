Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054316DEBE;
	Wed, 10 Apr 2024 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712765724; cv=none; b=QSNU6PRubwDIk+OTZZEuWJPiLB1wvpOwYZD5e9hSEExjlwYZKHYv/ZoJAUivJTunYgjtXVBaW03r8W94n7aHCav4Y630CDQY4OP91IEn2OhjC8OxQOZSQzE4G14zMAy2j6GLOU1zJgRTOnjkYlXQU6sanrE2Upf4fC+BkPa7jss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712765724; c=relaxed/simple;
	bh=JCP/MnQMargwz5fA/08+wb3ER69C0Pygm0hPngQLPcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWSdSlJE3YIOGZ/4T7h4xSQ3o08w+nP3Ia2iEVmlmryp2cjEpp3WNiRVp1UqFE5CQV7j9C+Ipkqla8YSEYzMMaFqstFH7semR8B+Xku3Z/kfNkRjyalFNT8X8CnnLK78c2xhAUR5pjThMdnASeVT6yIfAJ8DuoSbQU9DEP2rsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpxwRCvC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpxwRCvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712765721; x=1744301721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCP/MnQMargwz5fA/08+wb3ER69C0Pygm0hPngQLPcU=;
  b=FpxwRCvCBAOR6Cg+aOIrGZFzvR2vZTz81nMW26EJt3v3UcRHMBa1QOg9
   tvpdj/zSTxp2mrFl9Fx0CiztfPBz1yoli0VBBL0easTn3rnc8R2GOwnmj
   IooQWSme0jg8wMFGSB3YsAbWncDhEZ4h9FbSVzRsmkfzX9zxptQ774T0S
   1zXsb3GxTp+TOPIhR0lYWz0zNnJpHiNjSQE8WPp8axVkRrW6cB0kARBQF
   lanw0lsLrSwsQ4nmcKrhHHbIkqaTENoat7HOlnx8w45EEiIN+KSPsQdV3
   3m8aTfHFkrTiwMsb6Im3wjWQPymWaord50afLGXGPVXq5P5G8HAomNAMo
   g==;
X-CSE-ConnectionGUID: 015AWPmISYGN/9onhfq8rw==
X-CSE-MsgGUID: C0N8HZh+Ts29Z2FJQO/Muw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19290429"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19290429"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 09:15:21 -0700
X-CSE-ConnectionGUID: WY3XSLP5QiKdGzTBnkvzMQ==
X-CSE-MsgGUID: yZLYUQilTC64+/AHvxPR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51576324"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2024 09:15:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruabQ-0007YQ-2x;
	Wed, 10 Apr 2024 16:15:12 +0000
Date: Thu, 11 Apr 2024 00:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 293/367] drivers/s390/char/monreader.c:363:32:
 error: use of undeclared identifier 'filp'
Message-ID: <202404110053.w59UcHrM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   311f35559fcfb4b9679bb71901606d666cba0b4b
commit: 8d580724cfba67d95a7ee10456f5eac0dd382439 [293/367] s390: monreader: convert to read/write iterators
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240411/202404110053.w59UcHrM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110053.w59UcHrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110053.w59UcHrM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/s390/char/monreader.c:13:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
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
   In file included from drivers/s390/char/monreader.c:25:
   In file included from include/net/iucv/iucv.h:33:
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
   In file included from drivers/s390/char/monreader.c:25:
   In file included from include/net/iucv/iucv.h:33:
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
   In file included from drivers/s390/char/monreader.c:25:
   In file included from include/net/iucv/iucv.h:33:
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
>> drivers/s390/char/monreader.c:363:32: error: use of undeclared identifier 'filp'
     363 |         struct mon_private *monpriv = filp->private_data;
         |                                       ^
   17 warnings and 1 error generated.


vim +/filp +363 drivers/s390/char/monreader.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  360  
8d580724cfba67 Jens Axboe      2024-04-09  361  static ssize_t mon_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 Linus Torvalds  2005-04-16  362  {
^1da177e4c3f41 Linus Torvalds  2005-04-16 @363  	struct mon_private *monpriv = filp->private_data;
8d580724cfba67 Jens Axboe      2024-04-09  364  	size_t count = iov_iter_count(to);
^1da177e4c3f41 Linus Torvalds  2005-04-16  365  	struct mon_msg *monmsg;
^1da177e4c3f41 Linus Torvalds  2005-04-16  366  	int ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  367  	u32 mce_start;
^1da177e4c3f41 Linus Torvalds  2005-04-16  368  
^1da177e4c3f41 Linus Torvalds  2005-04-16  369  	monmsg = mon_next_message(monpriv);
^1da177e4c3f41 Linus Torvalds  2005-04-16  370  	if (IS_ERR(monmsg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  371  		return PTR_ERR(monmsg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  372  
^1da177e4c3f41 Linus Torvalds  2005-04-16  373  	if (!monmsg) {
8d580724cfba67 Jens Axboe      2024-04-09  374  		if (iocb->ki_filp->f_flags & O_NONBLOCK)
^1da177e4c3f41 Linus Torvalds  2005-04-16  375  			return -EAGAIN;
^1da177e4c3f41 Linus Torvalds  2005-04-16  376  		ret = wait_event_interruptible(mon_read_wait_queue,
^1da177e4c3f41 Linus Torvalds  2005-04-16  377  					atomic_read(&monpriv->read_ready) ||
^1da177e4c3f41 Linus Torvalds  2005-04-16  378  					atomic_read(&monpriv->iucv_severed));
^1da177e4c3f41 Linus Torvalds  2005-04-16  379  		if (ret)
^1da177e4c3f41 Linus Torvalds  2005-04-16  380  			return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  381  		if (unlikely(atomic_read(&monpriv->iucv_severed)))
^1da177e4c3f41 Linus Torvalds  2005-04-16  382  			return -EIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  383  		monmsg = monpriv->msg_array[monpriv->read_index];
^1da177e4c3f41 Linus Torvalds  2005-04-16  384  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  385  
2ca5b6e288d025 Gerald Schaefer 2008-07-14  386  	if (!monmsg->pos)
^1da177e4c3f41 Linus Torvalds  2005-04-16  387  		monmsg->pos = mon_mca_start(monmsg) + monmsg->mca_offset;
^1da177e4c3f41 Linus Torvalds  2005-04-16  388  	if (mon_check_mca(monmsg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  389  		goto reply;
^1da177e4c3f41 Linus Torvalds  2005-04-16  390  
^1da177e4c3f41 Linus Torvalds  2005-04-16  391  	/* read monitor control element (12 bytes) first */
^1da177e4c3f41 Linus Torvalds  2005-04-16  392  	mce_start = mon_mca_start(monmsg) + monmsg->mca_offset;
^1da177e4c3f41 Linus Torvalds  2005-04-16  393  	if ((monmsg->pos >= mce_start) && (monmsg->pos < mce_start + 12)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  394  		count = min(count, (size_t) mce_start + 12 - monmsg->pos);
8d580724cfba67 Jens Axboe      2024-04-09  395  		ret = copy_to_iter_full(__va(monmsg->pos), count, to);
^1da177e4c3f41 Linus Torvalds  2005-04-16  396  		if (ret)
^1da177e4c3f41 Linus Torvalds  2005-04-16  397  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  398  		monmsg->pos += count;
^1da177e4c3f41 Linus Torvalds  2005-04-16  399  		if (monmsg->pos == mce_start + 12)
^1da177e4c3f41 Linus Torvalds  2005-04-16  400  			monmsg->pos = mon_rec_start(monmsg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  401  		goto out_copy;
^1da177e4c3f41 Linus Torvalds  2005-04-16  402  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  403  
^1da177e4c3f41 Linus Torvalds  2005-04-16  404  	/* read records */
^1da177e4c3f41 Linus Torvalds  2005-04-16  405  	if (monmsg->pos <= mon_rec_end(monmsg)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  406  		count = min(count, (size_t) mon_rec_end(monmsg) - monmsg->pos
^1da177e4c3f41 Linus Torvalds  2005-04-16  407  					    + 1);
8d580724cfba67 Jens Axboe      2024-04-09  408  		ret = copy_to_iter_full(__va(monmsg->pos), count, to);
^1da177e4c3f41 Linus Torvalds  2005-04-16  409  		if (ret)
^1da177e4c3f41 Linus Torvalds  2005-04-16  410  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  411  		monmsg->pos += count;
^1da177e4c3f41 Linus Torvalds  2005-04-16  412  		if (monmsg->pos > mon_rec_end(monmsg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  413  			mon_next_mca(monmsg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  414  		goto out_copy;
^1da177e4c3f41 Linus Torvalds  2005-04-16  415  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  416  reply:
^1da177e4c3f41 Linus Torvalds  2005-04-16  417  	ret = mon_send_reply(monmsg, monpriv);
^1da177e4c3f41 Linus Torvalds  2005-04-16  418  	return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  419  
^1da177e4c3f41 Linus Torvalds  2005-04-16  420  out_copy:
8d580724cfba67 Jens Axboe      2024-04-09  421  	iocb->ki_pos += count;
^1da177e4c3f41 Linus Torvalds  2005-04-16  422  	return count;
^1da177e4c3f41 Linus Torvalds  2005-04-16  423  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  424  

:::::: The code at line 363 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
