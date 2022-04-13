Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9379A290C
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649864752; x=1681400752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3zbd6vsN/xYMo+xEA/uqxZ1y5kmTnkt79dlYfFG6zA=;
  b=cOd/ib2woiP0luvQIScPNOXATf2G59Fz2yZ8uc5gZd6wPe+Il4fJvWHA
   oPDfbFuN6qBUyvEQgACCzk66FXRPGqa7G1/vfbz0N1/a0SrMIvlkgNSba
   loptQmn1vbKTiOyveS7AuKIWW2F6XhuCDoWZa31MVg4+L+XOGEGLHDeRx
   c5/zYWVnVtgQ/3hqr7UNdOX1liXcCuurEyHoe9Tmk5xdNkENlEs38OFoD
   GLoE3C0Ylyds819khlIg67bJ9k7PfDVU86IKklgfg3tW0Tq1YG3DfvN6z
   ODRQZ8XVpDxC+s7nonqUcR2P/zriPt8aQFQ0YufWQn/tymn6GPkyVY0mm
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="261548367"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="261548367"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 08:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="724948525"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Apr 2022 08:45:24 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nefBM-0000Py-6d;
	Wed, 13 Apr 2022 15:45:24 +0000
Date: Wed, 13 Apr 2022 23:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jirislaby:devel 49/49] drivers/tty/serial/men_z135_uart.c:346:6:
 warning: variable '__tmp' is uninitialized when used within its own
 initialization
Message-ID: <202204132329.LphHCVTD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   af0ac0f5161e051a3e4a2a669e377bdc2439920e
commit: af0ac0f5161e051a3e4a2a669e377bdc2439920e [49/49] tty: serial, use kfifo
config: arm64-buildonly-randconfig-r003-20220413 (https://download.01.org/0day-ci/archive/20220413/202204132329.LphHCVTD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=af0ac0f5161e051a3e4a2a669e377bdc2439920e
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout af0ac0f5161e051a3e4a2a669e377bdc2439920e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/men_z135_uart.c:346:6: warning: variable '__tmp' is uninitialized when used within its own initialization [-Wuninitialized]
           n = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:850:42: note: expanded from macro 'kfifo_out_linear_ptr'
           unsigned int __count = kfifo_out_linear(__tmp, &___tail, (n)); \
                                  ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:834:30: note: expanded from macro 'kfifo_out_linear'
           typeof((fifo) + 1) __tmp = (fifo); \
                              ~~~~~    ^~~~
   1 warning generated.


vim +/__tmp +346 drivers/tty/serial/men_z135_uart.c

   287	
   288	/**
   289	 * men_z135_handle_tx() - TX tasklet routine
   290	 * @uart: Pointer to struct men_z135_port
   291	 *
   292	 */
   293	static void men_z135_handle_tx(struct men_z135_port *uart)
   294	{
   295		struct uart_port *port = &uart->port;
   296		struct tty_port *tport = &port->state->port;
   297		unsigned char *tail;
   298		unsigned int n, txfree;
   299		u32 txc;
   300		u32 wptr;
   301		int qlen;
   302	
   303		if (kfifo_is_empty(&tport->xmit_fifo))
   304			goto out;
   305	
   306		if (uart_tx_stopped(port))
   307			goto out;
   308	
   309		if (port->x_char)
   310			goto out;
   311	
   312		/* calculate bytes to copy */
   313		qlen = kfifo_len(&tport->xmit_fifo);
   314		if (qlen <= 0)
   315			goto out;
   316	
   317		wptr = ioread32(port->membase + MEN_Z135_TX_CTRL);
   318		txc = (wptr >> 16) & 0x3ff;
   319		wptr &= 0x3ff;
   320	
   321		if (txc > MEN_Z135_FIFO_WATERMARK)
   322			txc = MEN_Z135_FIFO_WATERMARK;
   323	
   324		txfree = MEN_Z135_FIFO_WATERMARK - txc;
   325		if (txfree <= 0) {
   326			dev_err(&uart->mdev->dev,
   327				"Not enough room in TX FIFO have %d, need %d\n",
   328				txfree, qlen);
   329			goto irq_en;
   330		}
   331	
   332		/* if we're not aligned, it's better to copy only 1 or 2 bytes and
   333		 * then the rest.
   334		 */
   335		if (align && qlen >= 3 && BYTES_TO_ALIGN(wptr))
   336			n = 4 - BYTES_TO_ALIGN(wptr);
   337		else if (qlen > txfree)
   338			n = txfree;
   339		else
   340			n = qlen;
   341	
   342		if (n <= 0)
   343			goto irq_en;
   344	
   345	
 > 346		n = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
   347				min_t(unsigned int, UART_XMIT_SIZE, n));
   348		memcpy_toio(port->membase + MEN_Z135_TX_RAM, tail, n);
   349		kfifo_dma_out_finish(&tport->xmit_fifo, n);
   350	
   351		iowrite32(n & 0x3ff, port->membase + MEN_Z135_TX_CTRL);
   352	
   353		port->icount.tx += n;
   354	
   355		if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
   356			uart_write_wakeup(port);
   357	
   358	irq_en:
   359		if (!kfifo_is_empty(&tport->xmit_fifo))
   360			men_z135_reg_set(uart, MEN_Z135_CONF_REG, MEN_Z135_IER_TXCIEN);
   361		else
   362			men_z135_reg_clr(uart, MEN_Z135_CONF_REG, MEN_Z135_IER_TXCIEN);
   363	
   364	out:
   365		return;
   366	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
