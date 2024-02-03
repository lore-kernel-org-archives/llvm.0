Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFA3612B;
	Sat,  3 Feb 2024 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706926556; cv=none; b=nc1+wOhBaUEQ93eH786CwL3nVoG1Dy0S+mUgjkb4YK1M57+kQqBmgBgxowu4m57SxCpE9uC7KAeNOv9ANr5Ta2txtAAtGNwcMwMCsVEyqXNgmlrlOXh1WmLKz/FWKTzWHDwuvBb/E4FQhm1Q8kXskqqSr5wIzAKY4Zrsvr3FqjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706926556; c=relaxed/simple;
	bh=jUe6ut4trDSoZXCarOfPmMnUFiYo70AueWJpJriuw/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpqOSPXvvwMZmHnTcszWlBGuuU81nr9jj6Fzp5hCOr+oOEahuFSzuconiGSe8OBEV1LFkbGXHMYBo8oeK8rQHRbDR2v1vGVFMofkTUbnKZNuDEfaRtih2fKJiPeJhcqdtXBYzxFFvw5yhsn7119+h+JPMHoY6gWnich2HJXaSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GL/y6e2A; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL/y6e2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706926554; x=1738462554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jUe6ut4trDSoZXCarOfPmMnUFiYo70AueWJpJriuw/c=;
  b=GL/y6e2Ayi6D0LV3k9MB7VHQDuz+nLkjG5UppYszSkPfyag/ag4DfeCd
   hMurNNcsTTAHBbIh82TpaDH9hEz02VBRaj9LG4APXTiOwXQYhB+j3vuMV
   QilH7gybYfAMiKQvExF73n4kOUC2LYX1MI7PoOn2HuMVlgoAgfaQa5Sy9
   C6p/k+Y7boBShB8gtecpezwH2EdcepObVCR6t48NhMEH9B3zIwCHKl1fT
   F1fHGOLa5nY16SIMYOF5ped2EqvTVh3l/ne09t8bJWczGoIi/gInpV2xl
   76XQ3Uu9U/nglxAcjkwckx2nWvmS7iVc5Xrxt1CgN/m891MaNpC0jbcld
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="394707723"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="394707723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 18:15:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="37648762"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Feb 2024 18:15:52 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW5Z2-0004XG-2S;
	Sat, 03 Feb 2024 02:15:43 +0000
Date: Sat, 3 Feb 2024 10:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 53/55]
 drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: warning: declaration of
 'struct circ_buf' will not be visible outside of this function
Message-ID: <202402031058.BjICn73w-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240203/202402031058.BjICn73w-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031058.BjICn73w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031058.BjICn73w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: warning: declaration of 'struct circ_buf' will not be visible outside of this function [-Wvisibility]
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:391:11: error: incomplete definition of type 'struct circ_buf'
     391 |                 if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
         |                     ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:393:32: error: incomplete definition of type 'struct circ_buf'
     393 |                 writel(*(unsigned int *)&xmit->buf[xmit->tail],
         |                                          ~~~~^
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:393:42: error: incomplete definition of type 'struct circ_buf'
     393 |                 writel(*(unsigned int *)&xmit->buf[xmit->tail],
         |                                                    ~~~~^
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
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:13: note: forward declaration of 'struct circ_buf'
     376 |                                         struct circ_buf *xmit,
         |                                                ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:406:24: error: incomplete definition of type 'struct circ_buf'
     406 |                 writeb(xmit->buf[xmit->tail], port->membase +
         |                                  ~~~~^
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
   drivers/tty/serial/8250/8250_pci1xxxx.c:435:23: error: no member named 'xmit' in 'struct uart_state'
     435 |         xmit = &port->state->xmit;
         |                 ~~~~~~~~~~~  ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:444:34: error: call to undeclared function 'uart_circ_empty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     444 |         if ((uart_tx_stopped(port)) || (uart_circ_empty(xmit))) {
         |                                         ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:444:34: note: did you mean 'uart_lsr_tx_empty'?
   include/linux/serial.h:26:20: note: 'uart_lsr_tx_empty' declared here
      26 | static inline bool uart_lsr_tx_empty(u16 lsr)
         |                    ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:450:23: error: call to undeclared function 'uart_circ_chars_pending'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     450 |                         valid_byte_count = uart_circ_chars_pending(xmit);
         |                                            ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:452:38: error: incompatible pointer types passing 'struct circ_buf *' to parameter of type 'struct circ_buf *' [-Werror,-Wincompatible-pointer-types]
     452 |                         pci1xxxx_process_write_data(port, xmit,
         |                                                           ^~~~
   drivers/tty/serial/8250/8250_pci1xxxx.c:376:23: note: passing argument to parameter 'xmit' here
     376 |                                         struct circ_buf *xmit,
         |                                                          ^
   drivers/tty/serial/8250/8250_pci1xxxx.c:462:6: error: call to undeclared function 'uart_circ_chars_pending'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     462 |         if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
         |             ^
   1 warning and 15 errors generated.


vim +376 drivers/tty/serial/8250/8250_pci1xxxx.c

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
90d051b63519b0 Rengarajan S 2024-01-25  391  		if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
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
90d051b63519b0 Rengarajan S 2024-01-25  422  		if (valid_burst_count && (xmit->tail <
90d051b63519b0 Rengarajan S 2024-01-25  423  		   (UART_XMIT_SIZE - UART_BURST_SIZE)))
90d051b63519b0 Rengarajan S 2024-01-25  424  			break;
90d051b63519b0 Rengarajan S 2024-01-25  425  	}
90d051b63519b0 Rengarajan S 2024-01-25  426  }
90d051b63519b0 Rengarajan S 2024-01-25  427  

:::::: The code at line 376 was first introduced by commit
:::::: 90d051b63519b0e653432168ecee8a4c0abc24dd 8250: microchip: pci1xxxx: Add Burst mode transmission support in uart driver for reading from FIFO

:::::: TO: Rengarajan S <rengarajan.s@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
