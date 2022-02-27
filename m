Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372B87C
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 06:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645942706; x=1677478706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4sfhET7rmDSA35k4xkqA8n8vQEkpuhLa1sO9aJfY0L4=;
  b=KiY2DEs7nGYb5EqhrWUEb5IvHEV4kv4PV9YQ/xXOcTi9cdD30c3BDw42
   ncqaDyUWloYzQmpyKf6D4F/cgG/vFCU2xTrEcVXIV2CTHmAwsA9aLtIEc
   JVIT6EjGjGWja5m+LPnTOwbupvqWvprcE8QA55Kd1sJdkctvz+LFw80hH
   M34qhtouKwezxTOmELpMgMJnHXcNRCtk8BzztvekojT5+f65/ghfdgvnY
   KN3j0MpAoEJArU3v3adl0o6syDcWjzo8dwbBJNJOGaVDWk3gZPuK9iQdk
   Sm3jbgIa1Uty3ybkm2Xb5cYW+AgkyEcuUa31GhGKHbxhAN4T2XSpKHSvS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="252901722"
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; 
   d="scan'208";a="252901722"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2022 22:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; 
   d="scan'208";a="640549305"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Feb 2022 22:18:23 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOCsx-0006Hp-1b; Sun, 27 Feb 2022 06:18:23 +0000
Date: Sun, 27 Feb 2022 14:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hammer Hsieh <hammerh0314@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [tty:tty-testing 36/42] drivers/tty/serial/sunplus-uart.c:574:12:
 error: use of undeclared identifier 'sunplus_uart_console'; did you mean
 'sunplus_uart_ops'?
Message-ID: <202202271439.QCMkeVQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   71404f653cf7858fdbb81dd5419a8a4ac4ffa20c
commit: 9e8d5470325f25bed7d33f9faaae6d5e4f313650 [36/42] serial: sunplus-uart: Add Sunplus SoC UART Driver
config: riscv-randconfig-r025-20220227 (https://download.01.org/0day-ci/archive/20220227/202202271439.QCMkeVQs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?id=9e8d5470325f25bed7d33f9faaae6d5e4f313650
        git remote add tty https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
        git fetch --no-tags tty tty-testing
        git checkout 9e8d5470325f25bed7d33f9faaae6d5e4f313650
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/tty/serial/sunplus-uart.c:574:12: error: use of undeclared identifier 'sunplus_uart_console'; did you mean 'sunplus_uart_ops'?
           .cons           = &sunplus_uart_console,
                              ^~~~~~~~~~~~~~~~~~~~
                              sunplus_uart_ops
   drivers/tty/serial/sunplus-uart.c:479:30: note: 'sunplus_uart_ops' declared here
   static const struct uart_ops sunplus_uart_ops = {
                                ^
>> drivers/tty/serial/sunplus-uart.c:574:11: error: incompatible pointer types initializing 'struct console *' with an expression of type 'const struct uart_ops *' [-Werror,-Wincompatible-pointer-types]
           .cons           = &sunplus_uart_console,
                             ^~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +574 drivers/tty/serial/sunplus-uart.c

   566	
   567	static struct uart_driver sunplus_uart_driver = {
   568		.owner		= THIS_MODULE,
   569		.driver_name	= "sunplus_uart",
   570		.dev_name	= "ttySUP",
   571		.major		= TTY_MAJOR,
   572		.minor		= 64,
   573		.nr		= SUP_UART_NR,
 > 574		.cons		= &sunplus_uart_console,
   575	};
   576	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
