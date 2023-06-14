Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A6363;
	Wed, 14 Jun 2023 00:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686702275; x=1718238275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+z9GBLi1BnVcEXppPKhFwPlvZeKrj9V+HDJt8oeyVsU=;
  b=UHLb7l3dhCJDt5aYkLd4fUgERGFTCM1YoqguFeq9PaVVpfW30ZLNcefh
   W0tdXjz+C6GvFCDgrIFgkavsWSOOxshmdM1KQLDRUv9KzGPnsXmwESKZN
   Jz7HTG9kjhz7uHwVY0l01vc1Lu/ddOB0jgWgjLXzOeSUgovo88xy5r7Aa
   78EAWfAffbK16/+L1bddHdByvA0zw/eFDZQWf0ziSK5yuacD0VOITk9kA
   1XY7KYTFwwJFNQXxpmI2weHHDaSGMKZF1cUlyXljA2nGew0n00M00a19M
   IQmGfncaeqNSJEwTrA6Z/ZPksY3GHkHP9YrJCpRBOhLgnNVjOp4OQmtDP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="348139669"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="348139669"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 17:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958603361"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="958603361"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2023 17:24:32 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9EJM-0001yq-2m;
	Wed, 14 Jun 2023 00:24:32 +0000
Date: Wed, 14 Jun 2023 08:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [jirislaby:devel 35/55] drivers/tty/serial/serial_port.c:23:3:
 error: call to undeclared function 'uart_circ_chars_pending'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202306140845.IOXyGfiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f8c938871c78b165f3123967084c0f7b4f64a439
commit: f1d3b372ea89b57cd1be6cab2b25a72a8cfabef4 [35/55] tty: serial, use kfifo
config: i386-randconfig-r035-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140845.IOXyGfiW-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=f1d3b372ea89b57cd1be6cab2b25a72a8cfabef4
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout f1d3b372ea89b57cd1be6cab2b25a72a8cfabef4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140845.IOXyGfiW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/serial_port.c:23:3: error: call to undeclared function 'uart_circ_chars_pending'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   uart_circ_chars_pending(&port->state->xmit);
                   ^
>> drivers/tty/serial/serial_port.c:23:41: error: no member named 'xmit' in 'struct uart_state'
                   uart_circ_chars_pending(&port->state->xmit);
                                            ~~~~~~~~~~~  ^
   2 errors generated.


vim +/uart_circ_chars_pending +23 drivers/tty/serial/serial_port.c

84a9582fd20306 Tony Lindgren 2023-05-25  18  
84a9582fd20306 Tony Lindgren 2023-05-25  19  /* Only considers pending TX for now. Caller must take care of locking */
84a9582fd20306 Tony Lindgren 2023-05-25  20  static int __serial_port_busy(struct uart_port *port)
84a9582fd20306 Tony Lindgren 2023-05-25  21  {
84a9582fd20306 Tony Lindgren 2023-05-25  22  	return !uart_tx_stopped(port) &&
84a9582fd20306 Tony Lindgren 2023-05-25 @23  		uart_circ_chars_pending(&port->state->xmit);
84a9582fd20306 Tony Lindgren 2023-05-25  24  }
84a9582fd20306 Tony Lindgren 2023-05-25  25  

:::::: The code at line 23 was first introduced by commit
:::::: 84a9582fd203063cd4d301204971ff2cd8327f1a serial: core: Start managing serial controllers to enable runtime PM

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
