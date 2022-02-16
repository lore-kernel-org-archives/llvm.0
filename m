Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF311FBF
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 03:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644983965; x=1676519965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PgQ3c1cxHyIxyeyyslL+EK8pi1l+yRMhFM7dHBzqNsY=;
  b=aY9uZ2Iym//8m3Et6uaBnqA819diRV9IgvS3x5MisKEjinQTq2DnwCNB
   oU0WEyClqQalCAhkGw+7mkzweYD/X0TuZ4c6ZbxF1Iq2lIhxN1pepqZTY
   nAumB+w8HsQVLmmDzzqWv9XhfkAgI0iFX/js7FhZt7g7/K3T4RbcsbL/7
   i94L53Rycuya1bdxGN4PqfHf3OSUTMsEXKyD297NWQxTutCzb+RCED1gn
   XQ7b6NV6T9+1oOc74IPmP7dbQ5Qn46gmtQa6/z2sX2xewCZAvx9J74NWv
   rKF5reHKCV+a1DRxW92jCjUiEjFoe+x2Y1RRzcRbM/OQdGcUhnpM88lcy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="237922167"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="237922167"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 19:59:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="776189351"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Feb 2022 19:59:23 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKBTO-000ANj-Ob; Wed, 16 Feb 2022 03:59:22 +0000
Date: Wed, 16 Feb 2022 11:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hammer Hsieh <hammerh0314@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v8 2/2] serial:sunplus-uart:Add Sunplus SoC UART Driver
Message-ID: <202202161113.516ledjy-lkp@intel.com>
References: <1644917065-23168-3-git-send-email-hammerh0314@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644917065-23168-3-git-send-email-hammerh0314@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hammer,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[cannot apply to tty/tty-testing robh/for-next linus/master v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hammer-Hsieh/Add-UART-driver-for-Suplus-SP7021-SoC/20220215-172535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2c271fe77d52a0555161926c232cd5bc07178b39
config: arm64-buildonly-randconfig-r003-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161113.516ledjy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/acb196db041b9bf489d6378ffb63751070deea90
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hammer-Hsieh/Add-UART-driver-for-Suplus-SP7021-SoC/20220215-172535
        git checkout acb196db041b9bf489d6378ffb63751070deea90
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/sunplus-uart.c:139:3: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   ret |= TIOCM_DTR;
                   ^~~
   drivers/tty/serial/sunplus-uart.c:134:18: note: initialize the variable 'ret' to silence this warning
           unsigned int ret, mcr;
                           ^
                            = 0
>> drivers/tty/serial/sunplus-uart.c:310:2: warning: variable 'isc' is uninitialized when used here [-Wuninitialized]
           isc |= SUP_UART_ISC_RXM;
           ^~~
   drivers/tty/serial/sunplus-uart.c:301:18: note: initialize the variable 'isc' to silence this warning
           unsigned int isc;
                           ^
                            = 0
   2 warnings generated.


vim +/ret +139 drivers/tty/serial/sunplus-uart.c

   131	
   132	static unsigned int sunplus_get_mctrl(struct uart_port *port)
   133	{
   134		unsigned int ret, mcr;
   135	
   136		mcr = readl(port->membase + SUP_UART_MCR);
   137	
   138		if (mcr & UART_MCR_DTR)
 > 139			ret |= TIOCM_DTR;
   140	
   141		if (mcr & UART_MCR_RTS)
   142			ret |= TIOCM_RTS;
   143	
   144		if (mcr & SUP_UART_MCR_DCD)
   145			ret |= TIOCM_CAR;
   146	
   147		if (mcr & SUP_UART_MCR_RI)
   148			ret |= TIOCM_RI;
   149	
   150		if (mcr & UART_MCR_LOOP)
   151			ret |= TIOCM_LOOP;
   152	
   153		return ret;
   154	}
   155	
   156	static void sunplus_stop_tx(struct uart_port *port)
   157	{
   158		unsigned int isc;
   159	
   160		isc = readl(port->membase + SUP_UART_ISC);
   161		isc &= ~SUP_UART_ISC_TXM;
   162		writel(isc, port->membase + SUP_UART_ISC);
   163	}
   164	
   165	static void sunplus_start_tx(struct uart_port *port)
   166	{
   167		unsigned int isc;
   168	
   169		isc = readl(port->membase + SUP_UART_ISC);
   170		isc |= SUP_UART_ISC_TXM;
   171		writel(isc, port->membase + SUP_UART_ISC);
   172	}
   173	
   174	static void sunplus_stop_rx(struct uart_port *port)
   175	{
   176		unsigned int isc;
   177	
   178		isc = readl(port->membase + SUP_UART_ISC);
   179		isc &= ~SUP_UART_ISC_RXM;
   180		writel(isc, port->membase + SUP_UART_ISC);
   181	}
   182	
   183	static void sunplus_break_ctl(struct uart_port *port, int ctl)
   184	{
   185		unsigned long flags;
   186		unsigned int lcr;
   187	
   188		spin_lock_irqsave(&port->lock, flags);
   189	
   190		lcr = readl(port->membase + SUP_UART_LCR);
   191	
   192		if (ctl)
   193			lcr |= SUP_UART_LCR_SBC; /* start break */
   194		else
   195			lcr &= ~SUP_UART_LCR_SBC; /* stop break */
   196	
   197		writel(lcr, port->membase + SUP_UART_LCR);
   198	
   199		spin_unlock_irqrestore(&port->lock, flags);
   200	}
   201	
   202	static void transmit_chars(struct uart_port *port)
   203	{
   204		struct circ_buf *xmit = &port->state->xmit;
   205	
   206		if (port->x_char) {
   207			sp_uart_put_char(port, port->x_char);
   208			port->icount.tx++;
   209			port->x_char = 0;
   210			return;
   211		}
   212	
   213		if (uart_circ_empty(xmit) || uart_tx_stopped(port)) {
   214			sunplus_stop_tx(port);
   215			return;
   216		}
   217	
   218		do {
   219			sp_uart_put_char(port, xmit->buf[xmit->tail]);
   220			xmit->tail = (xmit->tail + 1) % UART_XMIT_SIZE;
   221			port->icount.tx++;
   222	
   223			if (uart_circ_empty(xmit))
   224				break;
   225		} while (sunplus_tx_buf_not_full(port));
   226	
   227		if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
   228			uart_write_wakeup(port);
   229	
   230		if (uart_circ_empty(xmit))
   231			sunplus_stop_tx(port);
   232	}
   233	
   234	static void receive_chars(struct uart_port *port)
   235	{
   236		unsigned int lsr = readl(port->membase + SUP_UART_LSR);
   237		unsigned int ch, flag;
   238	
   239		do {
   240			ch = readl(port->membase + SUP_UART_DATA);
   241			flag = TTY_NORMAL;
   242			port->icount.rx++;
   243	
   244			if (unlikely(lsr & SUP_UART_LSR_BRK_ERROR_BITS)) {
   245				if (lsr & SUP_UART_LSR_BC) {
   246					lsr &= ~(SUP_UART_LSR_FE | SUP_UART_LSR_PE);
   247					port->icount.brk++;
   248					flag = TTY_BREAK;
   249					if (uart_handle_break(port))
   250						goto ignore_char;
   251				} else if (lsr & SUP_UART_LSR_PE) {
   252					port->icount.parity++;
   253					flag = TTY_PARITY;
   254				} else if (lsr & SUP_UART_LSR_FE) {
   255					port->icount.frame++;
   256					flag = TTY_FRAME;
   257				}
   258	
   259				if (lsr & SUP_UART_LSR_OE)
   260					port->icount.overrun++;
   261			}
   262	
   263			if (port->ignore_status_mask & SUP_DUMMY_READ)
   264				goto ignore_char;
   265	
   266			if (uart_handle_sysrq_char(port, ch))
   267				goto ignore_char;
   268	
   269			uart_insert_char(port, lsr, SUP_UART_LSR_OE, ch, flag);
   270	
   271	ignore_char:
   272			lsr = readl(port->membase + SUP_UART_LSR);
   273		} while (lsr & SUP_UART_LSR_RX);
   274	
   275		tty_flip_buffer_push(&port->state->port);
   276	}
   277	
   278	static irqreturn_t sunplus_uart_irq(int irq, void *args)
   279	{
   280		struct uart_port *port = args;
   281		unsigned int isc;
   282	
   283		spin_lock(&port->lock);
   284	
   285		isc = readl(port->membase + SUP_UART_ISC);
   286	
   287		if (isc & SUP_UART_ISC_RX)
   288			receive_chars(port);
   289	
   290		if (isc & SUP_UART_ISC_TX)
   291			transmit_chars(port);
   292	
   293		spin_unlock(&port->lock);
   294	
   295		return IRQ_HANDLED;
   296	}
   297	
   298	static int sunplus_startup(struct uart_port *port)
   299	{
   300		unsigned long flags;
   301		unsigned int isc;
   302		int ret;
   303	
   304		ret = request_irq(port->irq, sunplus_uart_irq, 0, "sunplus_uart", port);
   305		if (ret)
   306			return ret;
   307	
   308		spin_lock_irqsave(&port->lock, flags);
   309	
 > 310		isc |= SUP_UART_ISC_RXM;
   311		writel(isc, port->membase + SUP_UART_ISC);
   312	
   313		spin_unlock_irqrestore(&port->lock, flags);
   314	
   315		return 0;
   316	}
   317	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
