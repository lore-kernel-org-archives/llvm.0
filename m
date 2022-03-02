Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB97A
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646237055; x=1677773055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=26NxKWXwuqD597/8BtfYtSDKtIxWP5CHP1tVb2le7Nk=;
  b=GuNp22/EeKcTZXnMv3MTltXLa9TCz60QpGLxuG+hH4U6qMNro/vj7oqS
   2iYF+wdVI2vsk2huPOIbJMq34So8+y//4sgqu6BuHL0jKp2IrV1cNd6bl
   ngDeHQJsR9OXepKY8w40wvGlr3TXlFutfYBIkwuoCbPg8GL9TwrjyzV7E
   tL4cv8R5j6Gm8DgjbOZJVW+boGcy1sxleIuQOwGOYd5VzIZV5/MVd51cK
   ydFLbgjXfSFtOpD/9PqcOHBEHJ/cWEhfCxNjeEnAShN8BFhi6PtPlIiza
   A2RULKFMr1KFn/CBYLTlNWWAWTp4MHS07ajClkHFqp7R05vQXSnuZ0p/k
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="234052581"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="234052581"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 08:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="508246111"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Mar 2022 08:04:13 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPRSW-0001ZU-EB; Wed, 02 Mar 2022 16:04:12 +0000
Date: Thu, 3 Mar 2022 00:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jirislaby:devel 1/26] drivers/tty/serial/sunplus-uart.c:526:7:
 error: incompatible function pointer types passing 'void (struct uart_port
 *, int)' to parameter of type 'void (*)(struct uart_port *, unsigned char)'
Message-ID: <202203022325.0pJF6ttl-lkp@intel.com>
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
head:   7191d41e22ce0a4e950f14966bad50b609e1bae5
commit: 5382fe2c6cd08c05c0def9d3bf422a2a454a5ff9 [1/26] serial: make uart_console_write->putchar()'s character an unsigned char
config: hexagon-randconfig-r001-20220302 (https://download.01.org/0day-ci/archive/20220302/202203022325.0pJF6ttl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=5382fe2c6cd08c05c0def9d3bf422a2a454a5ff9
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout 5382fe2c6cd08c05c0def9d3bf422a2a454a5ff9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/tty/serial/sunplus-uart.c:526:7: error: incompatible function pointer types passing 'void (struct uart_port *, int)' to parameter of type 'void (*)(struct uart_port *, unsigned char)' [-Werror,-Wincompatible-function-pointer-types]
                              sunplus_uart_console_putchar);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:402:11: note: passing argument to parameter 'putchar' here
                           void (*putchar)(struct uart_port *, unsigned char));
                                  ^
   drivers/tty/serial/sunplus-uart.c:752:39: error: incompatible function pointer types passing 'void (struct uart_port *, int)' to parameter of type 'void (*)(struct uart_port *, unsigned char)' [-Werror,-Wincompatible-function-pointer-types]
           uart_console_write(&dev->port, s, n, sunplus_uart_putc);
                                                ^~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:402:11: note: passing argument to parameter 'putchar' here
                           void (*putchar)(struct uart_port *, unsigned char));
                                  ^
   2 errors generated.


vim +526 drivers/tty/serial/sunplus-uart.c

9e8d5470325f25 Hammer Hsieh 2022-02-22  508  
9e8d5470325f25 Hammer Hsieh 2022-02-22  509  static void sunplus_console_write(struct console *co,
9e8d5470325f25 Hammer Hsieh 2022-02-22  510  				  const char *s,
9e8d5470325f25 Hammer Hsieh 2022-02-22  511  				  unsigned int count)
9e8d5470325f25 Hammer Hsieh 2022-02-22  512  {
9e8d5470325f25 Hammer Hsieh 2022-02-22  513  	unsigned long flags;
9e8d5470325f25 Hammer Hsieh 2022-02-22  514  	int locked = 1;
9e8d5470325f25 Hammer Hsieh 2022-02-22  515  
9e8d5470325f25 Hammer Hsieh 2022-02-22  516  	local_irq_save(flags);
9e8d5470325f25 Hammer Hsieh 2022-02-22  517  
9e8d5470325f25 Hammer Hsieh 2022-02-22  518  	if (sunplus_console_ports[co->index]->port.sysrq)
9e8d5470325f25 Hammer Hsieh 2022-02-22  519  		locked = 0;
9e8d5470325f25 Hammer Hsieh 2022-02-22  520  	else if (oops_in_progress)
9e8d5470325f25 Hammer Hsieh 2022-02-22  521  		locked = spin_trylock(&sunplus_console_ports[co->index]->port.lock);
9e8d5470325f25 Hammer Hsieh 2022-02-22  522  	else
9e8d5470325f25 Hammer Hsieh 2022-02-22  523  		spin_lock(&sunplus_console_ports[co->index]->port.lock);
9e8d5470325f25 Hammer Hsieh 2022-02-22  524  
9e8d5470325f25 Hammer Hsieh 2022-02-22  525  	uart_console_write(&sunplus_console_ports[co->index]->port, s, count,
9e8d5470325f25 Hammer Hsieh 2022-02-22 @526  			   sunplus_uart_console_putchar);
9e8d5470325f25 Hammer Hsieh 2022-02-22  527  
9e8d5470325f25 Hammer Hsieh 2022-02-22  528  	if (locked)
9e8d5470325f25 Hammer Hsieh 2022-02-22  529  		spin_unlock(&sunplus_console_ports[co->index]->port.lock);
9e8d5470325f25 Hammer Hsieh 2022-02-22  530  
9e8d5470325f25 Hammer Hsieh 2022-02-22  531  	local_irq_restore(flags);
9e8d5470325f25 Hammer Hsieh 2022-02-22  532  }
9e8d5470325f25 Hammer Hsieh 2022-02-22  533  

:::::: The code at line 526 was first introduced by commit
:::::: 9e8d5470325f25bed7d33f9faaae6d5e4f313650 serial: sunplus-uart: Add Sunplus SoC UART Driver

:::::: TO: Hammer Hsieh <hammerh0314@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
