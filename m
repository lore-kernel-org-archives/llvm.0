Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C7C636;
	Sat,  3 Feb 2024 00:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706921600; cv=none; b=VZQho4nwhWWbCNcYP3gHoqBkNaPy+QnKJ/big2dmvlPWmJKzrliYw8QIKPVq/elzS7NlSNCb9ljBklCW31R6I1sn2txAclQdxML3NRWYsA51PjKYVz2Yenp/bXC1ahrREEiBa8mDGrt3PtEz/yQmJztMP3KIOAtMvEUk/7yjfxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706921600; c=relaxed/simple;
	bh=09bpOgwoE9f7iHSws8hurffV6C+mJg2IAIt8tbGplgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nPxg54GCgV7snrFfUxlBAowHb90Ge5rWssl3enX4bIU4WYH8oFCF/98MmQhWhXJQ7ruZNkdyC4c95eDUWTsQd1Ii58T65Blrrv9Ug8ctwigGYcxP3UUWUbesm1jYJPbhnRaR55gcUutnEZkzz2oPJmHrpIsYNa9KAyAnnETnLK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmZGyTfi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmZGyTfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706921598; x=1738457598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=09bpOgwoE9f7iHSws8hurffV6C+mJg2IAIt8tbGplgY=;
  b=fmZGyTfiOcS35ZVnTR5N1kOADfFr+wH4FCIZS0+mRvBMtscgHaLS0Rrf
   /DjwFP6YcURi7IJO3mrLhUCIHV5YwASRitGUWjpfsVMLM04N95IeeCf6o
   56Esdebt+sqtWNl7WuvEgZntO1NUzQNGrctkD7o25Yemi/LMsiuaSfu4c
   ojNiCLHvTHCchbKvkZsODFRiHnZRb3vcRnETlb/k1OGn/wF+z1yjg7PTO
   OSDFO0NC8LcsU//x/Q9xlXwPpLV2r/q/P/PGxlB+NUHusNJXz89rYEdpv
   6liD4Ql5d0cjf6Fydiy8eXQX2toNJPkByJ62HCNxhiRbrN2L/Sj+SK1vA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="502399"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="502399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 16:53:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="502763"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Feb 2024 16:53:17 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW4HM-0004To-1s;
	Sat, 03 Feb 2024 00:53:13 +0000
Date: Sat, 3 Feb 2024 08:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 53/55]
 drivers/tty/serial/8250/8250_pci1xxxx.c:391:11: error: incomplete definition
 of type 'struct circ_buf'
Message-ID: <202402030818.ysi68ZEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   417694d355605a4881edb833d8212c636c6c4c8a
commit: 8de16c2e3e826f59359da550330149d938e1fb09 [53/55] tty: serial, use kfifo
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402030818.ysi68ZEw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030818.ysi68ZEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030818.ysi68ZEw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: warning: declaration of 'struct circ_buf' will not be visible outside of this function [-Wvisibility]
     376 |                                         struct circ_buf *xmit,
         |                                                ^
>> drivers/tty/serial/8250/8250_pci1xxxx.c:391:11: error: incomplete definition of type 'struct circ_buf'
     391 |                 if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
         |                     ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:393:32: error: incomplete definition of type 'struct circ_buf'
     393 |                 writel(*(unsigned int *)&xmit->buf[xmit->tail],
         |                                          ~~~~^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
     144 | #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
         |                                                   ^
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_cpu'
      93 | #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:393:42: error: incomplete definition of type 'struct circ_buf'
     393 |                 writel(*(unsigned int *)&xmit->buf[xmit->tail],
         |                                                    ~~~~^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
     144 | #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
         |                                                   ^
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_cpu'
      93 | #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:399:7: error: incomplete definition of type 'struct circ_buf'
     399 |                 xmit->tail = (xmit->tail + UART_BURST_SIZE) &
         |                 ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:399:21: error: incomplete definition of type 'struct circ_buf'
     399 |                 xmit->tail = (xmit->tail + UART_BURST_SIZE) &
         |                               ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:406:14: error: incomplete definition of type 'struct circ_buf'
     406 |                 writeb(xmit->buf[xmit->tail], port->membase +
         |                        ~~~~^
   arch/riscv/include/asm/mmio.h:142:48: note: expanded from macro 'writeb'
     142 | #define writeb(v, c)    ({ __io_bw(); writeb_cpu((v), (c)); __io_aw(); })
         |                                                   ^
   arch/riscv/include/asm/mmio.h:91:47: note: expanded from macro 'writeb_cpu'
      91 | #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
         |                                                      ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:406:24: error: incomplete definition of type 'struct circ_buf'
     406 |                 writeb(xmit->buf[xmit->tail], port->membase +
         |                                  ~~~~^
   arch/riscv/include/asm/mmio.h:142:48: note: expanded from macro 'writeb'
     142 | #define writeb(v, c)    ({ __io_bw(); writeb_cpu((v), (c)); __io_aw(); })
         |                                                   ^
   arch/riscv/include/asm/mmio.h:91:47: note: expanded from macro 'writeb_cpu'
      91 | #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
         |                                                      ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:415:7: error: incomplete definition of type 'struct circ_buf'
     415 |                 xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
         |                 ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:415:21: error: incomplete definition of type 'struct circ_buf'
     415 |                 xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
         |                               ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:422:33: error: incomplete definition of type 'struct circ_buf'
     422 |                 if (valid_burst_count && (xmit->tail <
         |                                           ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
>> drivers/tty/serial/8250/8250_pci1xxxx.c:435:23: error: no member named 'xmit' in 'struct uart_state'
     435 |         xmit = &port->state->xmit;
         |                 ~~~~~~~~~~~  ^
>> drivers/tty/serial/8250/8250_pci1xxxx.c:444:34: error: call to undeclared function 'uart_circ_empty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     444 |         if ((uart_tx_stopped(port)) || (uart_circ_empty(xmit))) {
         |                                         ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:444:34: note: did you mean 'uart_lsr_tx_empty'?
   include/linux/serial.h:26:20: note: 'uart_lsr_tx_empty' declared here
      26 | static inline bool uart_lsr_tx_empty(u16 lsr)
         |                    ^
>> drivers/tty/serial/8250/8250_pci1xxxx.c:450:23: error: call to undeclared function 'uart_circ_chars_pending'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     450 |                         valid_byte_count = uart_circ_chars_pending(xmit);
         |                                            ^
>> drivers/tty/serial/8250/8250_pci1xxxx.c:452:38: error: incompatible pointer types passing 'struct circ_buf *' to parameter of type 'struct circ_buf *' [-Werror,-Wincompatible-pointer-types]
     452 |                         pci1xxxx_process_write_data(port, xmit,
         |                                                           ^~~~
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:23: note: passing argument to parameter 'xmit' here
     376 |                                         struct circ_buf *xmit,
         |                                                          ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:462:6: error: call to undeclared function 'uart_circ_chars_pending'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     462 |         if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
         |             ^
   1 warning and 15 errors generated.


vim +391 drivers/tty/serial/8250/8250_pci1xxxx.c

aba8290f368d96 Rengarajan S 2023-12-15  374  
90d051b63519b0 Rengarajan S 2024-01-25  375  static void pci1xxxx_process_write_data(struct uart_port *port,
90d051b63519b0 Rengarajan S 2024-01-25 @376  					struct circ_buf *xmit,
90d051b63519b0 Rengarajan S 2024-01-25  377  					int *data_empty_count,
90d051b63519b0 Rengarajan S 2024-01-25  378  					u32 *valid_byte_count)
90d051b63519b0 Rengarajan S 2024-01-25  379  {
90d051b63519b0 Rengarajan S 2024-01-25  380  	u32 valid_burst_count = *valid_byte_count / UART_BURST_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  381  
90d051b63519b0 Rengarajan S 2024-01-25  382  	/*
90d051b63519b0 Rengarajan S 2024-01-25  383  	 * Each transaction transfers data in DWORDs. If there are less than
90d051b63519b0 Rengarajan S 2024-01-25  384  	 * four remaining valid_byte_count to transfer or if the circular
90d051b63519b0 Rengarajan S 2024-01-25  385  	 * buffer has insufficient space for a DWORD, the data is transferred
90d051b63519b0 Rengarajan S 2024-01-25  386  	 * one byte at a time.
90d051b63519b0 Rengarajan S 2024-01-25  387  	 */
90d051b63519b0 Rengarajan S 2024-01-25  388  	while (valid_burst_count) {
90d051b63519b0 Rengarajan S 2024-01-25  389  		if (*data_empty_count - UART_BURST_SIZE < 0)
90d051b63519b0 Rengarajan S 2024-01-25  390  			break;
90d051b63519b0 Rengarajan S 2024-01-25 @391  		if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
90d051b63519b0 Rengarajan S 2024-01-25  392  			break;
90d051b63519b0 Rengarajan S 2024-01-25  393  		writel(*(unsigned int *)&xmit->buf[xmit->tail],
90d051b63519b0 Rengarajan S 2024-01-25  394  		       port->membase + UART_TX_BURST_FIFO);
90d051b63519b0 Rengarajan S 2024-01-25  395  		*valid_byte_count -= UART_BURST_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  396  		*data_empty_count -= UART_BURST_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  397  		valid_burst_count -= UART_BYTE_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  398  
90d051b63519b0 Rengarajan S 2024-01-25  399  		xmit->tail = (xmit->tail + UART_BURST_SIZE) &
90d051b63519b0 Rengarajan S 2024-01-25  400  			     (UART_XMIT_SIZE - 1);
90d051b63519b0 Rengarajan S 2024-01-25  401  	}
90d051b63519b0 Rengarajan S 2024-01-25  402  
90d051b63519b0 Rengarajan S 2024-01-25  403  	while (*valid_byte_count) {
90d051b63519b0 Rengarajan S 2024-01-25  404  		if (*data_empty_count - UART_BYTE_SIZE < 0)
90d051b63519b0 Rengarajan S 2024-01-25  405  			break;
90d051b63519b0 Rengarajan S 2024-01-25  406  		writeb(xmit->buf[xmit->tail], port->membase +
90d051b63519b0 Rengarajan S 2024-01-25  407  		       UART_TX_BYTE_FIFO);
90d051b63519b0 Rengarajan S 2024-01-25  408  		*data_empty_count -= UART_BYTE_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  409  		*valid_byte_count -= UART_BYTE_SIZE;
90d051b63519b0 Rengarajan S 2024-01-25  410  
90d051b63519b0 Rengarajan S 2024-01-25  411  		/*
90d051b63519b0 Rengarajan S 2024-01-25  412  		 * When the tail of the circular buffer is reached, the next
90d051b63519b0 Rengarajan S 2024-01-25  413  		 * byte is transferred to the beginning of the buffer.
90d051b63519b0 Rengarajan S 2024-01-25  414  		 */
90d051b63519b0 Rengarajan S 2024-01-25  415  		xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
90d051b63519b0 Rengarajan S 2024-01-25  416  			     (UART_XMIT_SIZE - 1);
90d051b63519b0 Rengarajan S 2024-01-25  417  
90d051b63519b0 Rengarajan S 2024-01-25  418  		/*
90d051b63519b0 Rengarajan S 2024-01-25  419  		 * If there are any pending burst count, data is handled by
90d051b63519b0 Rengarajan S 2024-01-25  420  		 * transmitting DWORDs at a time.
90d051b63519b0 Rengarajan S 2024-01-25  421  		 */
90d051b63519b0 Rengarajan S 2024-01-25 @422  		if (valid_burst_count && (xmit->tail <
90d051b63519b0 Rengarajan S 2024-01-25  423  		   (UART_XMIT_SIZE - UART_BURST_SIZE)))
90d051b63519b0 Rengarajan S 2024-01-25  424  			break;
90d051b63519b0 Rengarajan S 2024-01-25  425  	}
90d051b63519b0 Rengarajan S 2024-01-25  426  }
90d051b63519b0 Rengarajan S 2024-01-25  427  
90d051b63519b0 Rengarajan S 2024-01-25  428  static void pci1xxxx_tx_burst(struct uart_port *port, u32 uart_status)
90d051b63519b0 Rengarajan S 2024-01-25  429  {
90d051b63519b0 Rengarajan S 2024-01-25  430  	struct uart_8250_port *up = up_to_u8250p(port);
90d051b63519b0 Rengarajan S 2024-01-25  431  	u32 valid_byte_count;
90d051b63519b0 Rengarajan S 2024-01-25  432  	int data_empty_count;
90d051b63519b0 Rengarajan S 2024-01-25  433  	struct circ_buf *xmit;
90d051b63519b0 Rengarajan S 2024-01-25  434  
90d051b63519b0 Rengarajan S 2024-01-25 @435  	xmit = &port->state->xmit;
90d051b63519b0 Rengarajan S 2024-01-25  436  
90d051b63519b0 Rengarajan S 2024-01-25  437  	if (port->x_char) {
90d051b63519b0 Rengarajan S 2024-01-25  438  		writeb(port->x_char, port->membase + UART_TX);
90d051b63519b0 Rengarajan S 2024-01-25  439  		port->icount.tx++;
90d051b63519b0 Rengarajan S 2024-01-25  440  		port->x_char = 0;
90d051b63519b0 Rengarajan S 2024-01-25  441  		return;
90d051b63519b0 Rengarajan S 2024-01-25  442  	}
90d051b63519b0 Rengarajan S 2024-01-25  443  
90d051b63519b0 Rengarajan S 2024-01-25 @444  	if ((uart_tx_stopped(port)) || (uart_circ_empty(xmit))) {
90d051b63519b0 Rengarajan S 2024-01-25  445  		port->ops->stop_tx(port);
90d051b63519b0 Rengarajan S 2024-01-25  446  	} else {
90d051b63519b0 Rengarajan S 2024-01-25  447  		data_empty_count = (pci1xxxx_read_burst_status(port) &
90d051b63519b0 Rengarajan S 2024-01-25  448  				    UART_BST_STAT_TX_COUNT_MASK) >> 8;
90d051b63519b0 Rengarajan S 2024-01-25  449  		do {
90d051b63519b0 Rengarajan S 2024-01-25 @450  			valid_byte_count = uart_circ_chars_pending(xmit);
90d051b63519b0 Rengarajan S 2024-01-25  451  
90d051b63519b0 Rengarajan S 2024-01-25 @452  			pci1xxxx_process_write_data(port, xmit,
90d051b63519b0 Rengarajan S 2024-01-25  453  						    &data_empty_count,
90d051b63519b0 Rengarajan S 2024-01-25  454  						    &valid_byte_count);
90d051b63519b0 Rengarajan S 2024-01-25  455  
90d051b63519b0 Rengarajan S 2024-01-25  456  			port->icount.tx++;
90d051b63519b0 Rengarajan S 2024-01-25  457  			if (uart_circ_empty(xmit))
90d051b63519b0 Rengarajan S 2024-01-25  458  				break;
90d051b63519b0 Rengarajan S 2024-01-25  459  		} while (data_empty_count && valid_byte_count);
90d051b63519b0 Rengarajan S 2024-01-25  460  	}
90d051b63519b0 Rengarajan S 2024-01-25  461  
90d051b63519b0 Rengarajan S 2024-01-25  462  	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
90d051b63519b0 Rengarajan S 2024-01-25  463  		uart_write_wakeup(port);
90d051b63519b0 Rengarajan S 2024-01-25  464  
90d051b63519b0 Rengarajan S 2024-01-25  465  	 /*
90d051b63519b0 Rengarajan S 2024-01-25  466  	  * With RPM enabled, we have to wait until the FIFO is empty before
90d051b63519b0 Rengarajan S 2024-01-25  467  	  * the HW can go idle. So we get here once again with empty FIFO and
90d051b63519b0 Rengarajan S 2024-01-25  468  	  * disable the interrupt and RPM in __stop_tx()
90d051b63519b0 Rengarajan S 2024-01-25  469  	  */
90d051b63519b0 Rengarajan S 2024-01-25  470  	if (uart_circ_empty(xmit) && !(up->capabilities & UART_CAP_RPM))
90d051b63519b0 Rengarajan S 2024-01-25  471  		port->ops->stop_tx(port);
90d051b63519b0 Rengarajan S 2024-01-25  472  }
90d051b63519b0 Rengarajan S 2024-01-25  473  

:::::: The code at line 391 was first introduced by commit
:::::: 90d051b63519b0e653432168ecee8a4c0abc24dd 8250: microchip: pci1xxxx: Add Burst mode transmission support in uart driver for reading from FIFO

:::::: TO: Rengarajan S <rengarajan.s@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
