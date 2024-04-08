Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00FD7F47F;
	Mon,  8 Apr 2024 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712584691; cv=none; b=oyVCGXG9mgXWdwYSnUV4Y9RQMjHF2k97NsUW0HbOYYoHHz8jeFVNaECqqiX4zbUDa4Hi/4aDZ8hdL7Qyb+yEaTYmEf2T/ki57dnUmsqfoezGI4tOa0+A4rdcRyZXfz79+xM77Rixoh3XAtArHwszUAERxDM6YtjIIZ1+/beQXqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712584691; c=relaxed/simple;
	bh=tNc3S5QCSXGryWE+u5vkFBeB9n4QgVmZ1MBXBAv/V98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amiMABW+jKUVCESuNAey9aCU1ANRkkzOk7f65B1juD+mVdqsEEYRsrRfOhBHElzoNACcML0/0pavUPX/rmGGYUj6kRnjePuAvybir+tL3Sm3nrl+oWptneuTT0T6KLKFB5VV2CRyWocI2GHgYSwWKZ+VMBzM2max4/Lnaw7HMKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJz21AFS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJz21AFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712584689; x=1744120689;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tNc3S5QCSXGryWE+u5vkFBeB9n4QgVmZ1MBXBAv/V98=;
  b=EJz21AFSwu1jKEADPbYeGeRQBRcrpw2KcvsnybT828LULDq7GiezHusM
   JjjZoVqnK+lgFJJbfwEjLc4aI4U0VB30pLv94vxbi/OPosmF04PWgZOSt
   1vLeYxoroqv6R9mMdGKM9Wu8hW7qr0Oh8N4mRcoJYH4PAvvWO8oqgKV2D
   WVAMOrcVgMKBpouRG4b9NLEFj5h+Mde3lwf2oA4+Tx15aXK6Kq2YRfLYI
   Ed/lBawUl9ONEpLhp6PuNRJs/PMgKu+r7N8jxx8J22uq5UkVanxBu4oNP
   GnLjhfOiV11qJJcIbJXwiBQ0Yra0O5XlBgZYP0bS0bc9Du96HidO9ROJ0
   Q==;
X-CSE-ConnectionGUID: lFj+mEeeRPywoszLWInyNA==
X-CSE-MsgGUID: MqxUjfMvRuC2IAKLTfpN8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19006488"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19006488"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 06:58:06 -0700
X-CSE-ConnectionGUID: j3duHUbPSDevHARJ4QDh1w==
X-CSE-MsgGUID: 08013dMLS7Kvcgc9vqCUlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24523418"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2024 06:58:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtpVa-0005FK-2L;
	Mon, 08 Apr 2024 13:58:02 +0000
Date: Mon, 8 Apr 2024 21:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 33/40] drivers/tty/mxser.c:503:13: warning:
 variable 'baud' is used uninitialized whenever 'if' condition is false
Message-ID: <202404082138.87ndclpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a56ff0cb0fd0fd59f4a9a12091951ae80f866abb
commit: fb7c4d96c47896d2d8db670f34bb961a66ea869a [33/40] mxser: use timeout from uart_port
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240408/202404082138.87ndclpm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 73ddb2a7471986a7ed600dbea14efc60f0d0db47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404082138.87ndclpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404082138.87ndclpm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/mxser.c:19:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/tty/mxser.c:25:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:39:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
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
   In file included from drivers/tty/mxser.c:25:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:39:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/tty/mxser.c:25:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:39:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
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
>> drivers/tty/mxser.c:503:13: warning: variable 'baud' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     503 |         } else if (newspd) {
         |                    ^~~~~~
   drivers/tty/mxser.c:513:47: note: uninitialized use occurs here
     513 |         uart_update_timeout(uport, termios->c_cflag, baud);
         |                                                      ^~~~
   drivers/tty/mxser.c:503:9: note: remove the 'if' if its condition is always true
     503 |         } else if (newspd) {
         |                ^~~~~~~~~~~
     504 |                 quot = MXSER_BAUD_BASE / newspd;
     505 |                 if (quot == 0)
     506 |                         quot = 1;
     507 |                 baud = MXSER_BAUD_BASE / quot;
     508 |                 tty_termios_encode_baud_rate(termios, baud, baud);
     509 |         } else {
         |           ~~~~~~
     510 |                 quot = 0;
         |                 ~~~~~~~~~
     511 |         }
         |         ~
>> drivers/tty/mxser.c:500:6: warning: variable 'baud' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     500 |         if (newspd == 134) {
         |             ^~~~~~~~~~~~~
   drivers/tty/mxser.c:513:47: note: uninitialized use occurs here
     513 |         uart_update_timeout(uport, termios->c_cflag, baud);
         |                                                      ^~~~
   drivers/tty/mxser.c:500:2: note: remove the 'if' if its condition is always false
     500 |         if (newspd == 134) {
         |         ^~~~~~~~~~~~~~~~~~~~
     501 |                 quot = 2 * MXSER_BAUD_BASE / 269;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     502 |                 tty_termios_encode_baud_rate(termios, 134, 134);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         } else if (newspd) {
         |         ~~~~~~
   drivers/tty/mxser.c:493:29: note: initialize the variable 'baud' to silence this warning
     493 |         unsigned int quot = 0, baud;
         |                                    ^
         |                                     = 0
   19 warnings generated.


vim +503 drivers/tty/mxser.c

5d951fb458f847 drivers/char/mxser.c Alan Cox          2009-01-02  489  
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  490  static int mxser_set_baud(struct mxser_port *info, struct ktermios *termios)
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  491  {
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  492) 	struct uart_port *uport = &info->uport;
104583b504da8a drivers/tty/mxser.c  Jiri Slaby        2017-09-12  493  	unsigned int quot = 0, baud;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  494  	unsigned char cval;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  495  	speed_t newspd = tty_termios_baud_rate(termios);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  496  
928f946426905d drivers/tty/mxser.c  Jiri Slaby        2021-06-18  497  	if (newspd > info->board->max_baud)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  498  		return -1;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  499  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07 @500  	if (newspd == 134) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  501  		quot = 2 * MXSER_BAUD_BASE / 269;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  502  		tty_termios_encode_baud_rate(termios, 134, 134);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07 @503  	} else if (newspd) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  504  		quot = MXSER_BAUD_BASE / newspd;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  505  		if (quot == 0)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  506  			quot = 1;
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  507  		baud = MXSER_BAUD_BASE / quot;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  508  		tty_termios_encode_baud_rate(termios, baud, baud);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  509  	} else {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  510  		quot = 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  511  	}
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  512  
fb7c4d96c47896 drivers/tty/mxser.c  Jiri Slaby (SUSE  2022-11-15  513) 	uart_update_timeout(uport, termios->c_cflag, baud);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  514  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  515  	if (quot) {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  516  		info->MCR |= UART_MCR_DTR;
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  517) 		outb(info->MCR, uport->iobase + UART_MCR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  518  	} else {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  519  		info->MCR &= ~UART_MCR_DTR;
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  520) 		outb(info->MCR, uport->iobase + UART_MCR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  521  		return 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  522  	}
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  523  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  524) 	cval = inb(uport->iobase + UART_LCR);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  525  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  526) 	outb(cval | UART_LCR_DLAB, uport->iobase + UART_LCR);	/* set DLAB */
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  527  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  528) 	outb(quot & 0xff, uport->iobase + UART_DLL);	/* LS of divisor */
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  529) 	outb(quot >> 8, uport->iobase + UART_DLM);	/* MS of divisor */
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  530) 	outb(cval, uport->iobase + UART_LCR);	/* reset DLAB */
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  531  
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  532  	if ((termios->c_cflag & CBAUD) == BOTHER) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  533  		quot = MXSER_BAUD_BASE % newspd;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  534  		quot *= 8;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  535  		if (quot % newspd > newspd / 2) {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  536  			quot /= newspd;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  537  			quot++;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  538  		} else
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  539  			quot /= newspd;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  540  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  541) 		mxser_set_must_enum_value(uport->iobase, quot);
69648d7bda8636 drivers/tty/mxser.c  Ilpo Järvinen     2022-05-13  542  	} else {
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  543) 		mxser_set_must_enum_value(uport->iobase, 0);
69648d7bda8636 drivers/tty/mxser.c  Ilpo Järvinen     2022-05-13  544  	}
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  545  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  546  	return 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  547  }
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  548  

:::::: The code at line 503 was first introduced by commit
:::::: 1c45607ad3eb7397bc2433f3c36a4ed8b315889e Char: mxser, remove it

:::::: TO: Jiri Slaby <jirislaby@gmail.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
