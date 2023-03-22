Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E68C01;
	Wed, 22 Mar 2023 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679498626; x=1711034626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hs+jJFqcJ6oQIKDyU52p04F2VEqNuaUbOL8nGWQli9Q=;
  b=n9dsj55GeEDgMKKQQsWnMPiu+yQtoT+0qT0L8gqpexm0S/Y0lb23qNnL
   c06G15Q6JVVX7GLKYmftbVD8nw2xgfdCk9io9NfEjp0OYzbDqtaie/xjU
   SmdDYjfr2QBFNB5zoHQMSJ2QBwtHTwV+lLS8rfJz1kMciB1lUpJlMBpSu
   cd0TaGTyiDpm5Xuld7HtGrEmoFBoSqHVf1V8vsDUcd+OGwpzoVy/sCgHH
   A9IuCcdsRStuSj8Sxxs3LnFoWvixpI3t4606aMnw2Oul6sDdHm+aYXm4o
   ZGoEA/bGx/jksiWAiCiVmNxwvgxtiLV7Ig3OTfdqKW8YD2SBUu1cChek/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="318887525"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="318887525"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 08:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714438626"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="714438626"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 08:23:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf0JS-000DQy-1q;
	Wed, 22 Mar 2023 15:23:42 +0000
Date: Wed, 22 Mar 2023 23:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [jirislaby:devel 27/46] drivers/tty/serial/stm32-usart.c:686:9:
 error: call to undeclared function 'uart_circ_empty'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202303222321.2Q5vlD3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   1bf93d9ee094d8d799c333abb0e1b7aca6d4cba3
commit: 162967376aea871d0287902da6294fe5e4cdbc51 [27/46] tty: serial, use kfifo
config: hexagon-randconfig-r041-20230322 (https://download.01.org/0day-ci/archive/20230322/202303222321.2Q5vlD3k-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=162967376aea871d0287902da6294fe5e4cdbc51
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout 162967376aea871d0287902da6294fe5e4cdbc51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303222321.2Q5vlD3k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/stm32-usart.c:16:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/tty/serial/stm32-usart.c:16:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/tty/serial/stm32-usart.c:16:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/tty/serial/stm32-usart.c:686:9: error: call to undeclared function 'uart_circ_empty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                !(uart_circ_empty(xmit) || uart_tx_stopped(port)))) {
                  ^
   drivers/tty/serial/stm32-usart.c:686:9: note: did you mean 'uart_lsr_tx_empty'?
   include/linux/serial.h:26:20: note: 'uart_lsr_tx_empty' declared here
   static inline bool uart_lsr_tx_empty(u16 lsr)
                      ^
>> drivers/tty/serial/stm32-usart.c:686:25: error: use of undeclared identifier 'xmit'
                !(uart_circ_empty(xmit) || uart_tx_stopped(port)))) {
                                  ^
   6 warnings and 2 errors generated.


vim +/uart_circ_empty +686 drivers/tty/serial/stm32-usart.c

3489187204eb75 Alexandre TORGUE 2016-09-15  674  
56f9a76c27b51b Erwan Le Ray     2021-01-06  675  static void stm32_usart_transmit_chars(struct uart_port *port)
48a6092fb41fab Maxime Coquelin  2015-06-10  676  {
ada8618ff3bfe1 Alexandre TORGUE 2016-09-15  677  	struct stm32_port *stm32_port = to_stm32_port(port);
d825f0bea20f49 Stephen Boyd     2021-01-22  678  	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
162967376aea87 Jiri Slaby       2022-01-05  679  	struct tty_port *tport = &port->state->port;
d3d079bde07e1b Valentin Caron   2022-01-11  680  	u32 isr;
d3d079bde07e1b Valentin Caron   2022-01-11  681  	int ret;
48a6092fb41fab Maxime Coquelin  2015-06-10  682  
d7c76716169ddc Marek Vasut      2022-04-30  683  	if (!stm32_port->hw_flow_control &&
c47527cbcc3c50 Marek Vasut      2023-02-23  684  	    port->rs485.flags & SER_RS485_ENABLED &&
c47527cbcc3c50 Marek Vasut      2023-02-23  685  	    (port->x_char ||
c47527cbcc3c50 Marek Vasut      2023-02-23 @686  	     !(uart_circ_empty(xmit) || uart_tx_stopped(port)))) {
d7c76716169ddc Marek Vasut      2022-04-30  687  		stm32_usart_tc_interrupt_disable(port);
d7c76716169ddc Marek Vasut      2022-04-30  688  		stm32_usart_rs485_rts_enable(port);
d7c76716169ddc Marek Vasut      2022-04-30  689  	}
d7c76716169ddc Marek Vasut      2022-04-30  690  
48a6092fb41fab Maxime Coquelin  2015-06-10  691  	if (port->x_char) {
9a135f16d22885 Valentin Caron   2022-01-04  692  		if (stm32_usart_tx_dma_started(stm32_port) &&
9a135f16d22885 Valentin Caron   2022-01-04  693  		    stm32_usart_tx_dma_enabled(stm32_port))
56f9a76c27b51b Erwan Le Ray     2021-01-06  694  			stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAT);
d3d079bde07e1b Valentin Caron   2022-01-11  695  
d3d079bde07e1b Valentin Caron   2022-01-11  696  		/* Check that TDR is empty before filling FIFO */
d3d079bde07e1b Valentin Caron   2022-01-11  697  		ret =
d3d079bde07e1b Valentin Caron   2022-01-11  698  		readl_relaxed_poll_timeout_atomic(port->membase + ofs->isr,
d3d079bde07e1b Valentin Caron   2022-01-11  699  						  isr,
d3d079bde07e1b Valentin Caron   2022-01-11  700  						  (isr & USART_SR_TXE),
d3d079bde07e1b Valentin Caron   2022-01-11  701  						  10, 1000);
d3d079bde07e1b Valentin Caron   2022-01-11  702  		if (ret)
d3d079bde07e1b Valentin Caron   2022-01-11  703  			dev_warn(port->dev, "1 character may be erased\n");
d3d079bde07e1b Valentin Caron   2022-01-11  704  
ada8618ff3bfe1 Alexandre TORGUE 2016-09-15  705  		writel_relaxed(port->x_char, port->membase + ofs->tdr);
48a6092fb41fab Maxime Coquelin  2015-06-10  706  		port->x_char = 0;
48a6092fb41fab Maxime Coquelin  2015-06-10  707  		port->icount.tx++;
9a135f16d22885 Valentin Caron   2022-01-04  708  		if (stm32_usart_tx_dma_started(stm32_port))
56f9a76c27b51b Erwan Le Ray     2021-01-06  709  			stm32_usart_set_bits(port, ofs->cr3, USART_CR3_DMAT);
48a6092fb41fab Maxime Coquelin  2015-06-10  710  		return;
48a6092fb41fab Maxime Coquelin  2015-06-10  711  	}
48a6092fb41fab Maxime Coquelin  2015-06-10  712  
162967376aea87 Jiri Slaby       2022-01-05  713  	if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port)) {
56f9a76c27b51b Erwan Le Ray     2021-01-06  714  		stm32_usart_tx_interrupt_disable(port);
48a6092fb41fab Maxime Coquelin  2015-06-10  715  		return;
48a6092fb41fab Maxime Coquelin  2015-06-10  716  	}
48a6092fb41fab Maxime Coquelin  2015-06-10  717  
64c32eab660386 Erwan Le Ray     2019-05-21  718  	if (ofs->icr == UNDEF_REG)
56f9a76c27b51b Erwan Le Ray     2021-01-06  719  		stm32_usart_clr_bits(port, ofs->isr, USART_SR_TC);
64c32eab660386 Erwan Le Ray     2019-05-21  720  	else
1250ed7114a977 Fabrice Gasnier  2019-11-21  721  		writel_relaxed(USART_ICR_TCCF, port->membase + ofs->icr);
64c32eab660386 Erwan Le Ray     2019-05-21  722  
3489187204eb75 Alexandre TORGUE 2016-09-15  723  	if (stm32_port->tx_ch)
56f9a76c27b51b Erwan Le Ray     2021-01-06  724  		stm32_usart_transmit_chars_dma(port);
3489187204eb75 Alexandre TORGUE 2016-09-15  725  	else
56f9a76c27b51b Erwan Le Ray     2021-01-06  726  		stm32_usart_transmit_chars_pio(port);
48a6092fb41fab Maxime Coquelin  2015-06-10  727  
162967376aea87 Jiri Slaby       2022-01-05  728  	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
48a6092fb41fab Maxime Coquelin  2015-06-10  729  		uart_write_wakeup(port);
48a6092fb41fab Maxime Coquelin  2015-06-10  730  
162967376aea87 Jiri Slaby       2022-01-05  731  	if (kfifo_is_empty(&tport->xmit_fifo)) {
56f9a76c27b51b Erwan Le Ray     2021-01-06  732  		stm32_usart_tx_interrupt_disable(port);
d7c76716169ddc Marek Vasut      2022-04-30  733  		if (!stm32_port->hw_flow_control &&
d7c76716169ddc Marek Vasut      2022-04-30  734  		    port->rs485.flags & SER_RS485_ENABLED) {
d7c76716169ddc Marek Vasut      2022-04-30  735  			stm32_usart_tc_interrupt_enable(port);
d7c76716169ddc Marek Vasut      2022-04-30  736  		}
d7c76716169ddc Marek Vasut      2022-04-30  737  	}
48a6092fb41fab Maxime Coquelin  2015-06-10  738  }
48a6092fb41fab Maxime Coquelin  2015-06-10  739  

:::::: The code at line 686 was first introduced by commit
:::::: c47527cbcc3c50800f34b8c684f29721f75de246 serial: stm32: Re-assert RTS/DE GPIO in RS485 mode only if more data are transmitted

:::::: TO: Marek Vasut <marex@denx.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
