Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74217723;
	Tue,  6 Jun 2023 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686057521; x=1717593521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mfBO4jRjSNsclCXSQCisJlia8X+rZbigXs3REq9DmC8=;
  b=i+Q/qnLQzPIscOBoGhTGKqg3EIaULCCk2fb8c+tLdVzr/tJ9YNw+7ZIy
   QK8w9itQAhzMKt/psCgUOVx8w7jJ65jtDp7iC2g6IGqwGZ2E62zLSo2FB
   IVtypc48PfohJFw3eJ4tiZRs98AxZ0TgeuDkpl/zh0v9mDiKqpSsewSu1
   s+Sd4ELb4p948uzMsvImdxFHiTR9nAkHcmAy97hKdWRI88w5TsnDc+Fy8
   QmC+onmhsUNp8y8MyvYC+8/pKk3RO0J8oKtXmmArIPMXvVGh8zKJkZaRO
   Mxlp9fCGPwk1Szw2l6C74Q50TUn9aHUgA6ayki/Ue4KyC1OJZUGhUHhVs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341310893"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="341310893"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 06:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659525173"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="659525173"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 06:08:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6WQC-0005Gl-3C;
	Tue, 06 Jun 2023 13:08:24 +0000
Date: Tue, 6 Jun 2023 21:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9767/9999]
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33: warning: unused variable
 'rtl819xp_ops'
Message-ID: <202306062022.VI9ZL87S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d7af3e5ba454d007b4939f858739cf1cecdeab46
commit: a97e60bd28965014ae4195de1e1573a1fc7bcb02 [9767/9999] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
config: powerpc-randconfig-r021-20230606 (https://download.01.org/0day-ci/archive/20230606/202306062022.VI9ZL87S-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a97e60bd28965014ae4195de1e1573a1fc7bcb02
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout a97e60bd28965014ae4195de1e1573a1fc7bcb02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/staging/rtl8192e/rtl8192e/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306062022.VI9ZL87S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33: warning: unused variable 'rtl819xp_ops' [-Wunused-const-variable]
      29 | static const struct rtl819x_ops rtl819xp_ops = {
         |                                 ^
   1 warning generated.


vim +/rtl819xp_ops +29 drivers/staging/rtl8192e/rtl8192e/rtl_core.c

94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  27  
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  28  
1c099ed63f8363 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Julia Lawall       2016-09-11 @29  static const struct rtl819x_ops rtl819xp_ops = {
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  30  	.nic_type			= NIC_8192E,
b095be37004f91 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  31  	.get_eeprom_size		= rtl92e_get_eeprom_size,
df85a1313fee7d drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  32  	.init_adapter_variable		= rtl92e_init_variables,
460266292de1c3 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  33  	.initialize_adapter		= rtl92e_start_adapter,
b974b289c4cb8a drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  34  	.link_change			= rtl92e_link_change,
072b3948d473f8 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  35  	.tx_fill_descriptor		= rtl92e_fill_tx_desc,
63b544a17c63c0 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  36  	.tx_fill_cmd_descriptor		= rtl92e_fill_tx_cmd_desc,
7897285ceb2864 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  37  	.rx_query_status_descriptor	= rtl92e_get_rx_stats,
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  38  	.rx_command_packet_handler = NULL,
fe99c77b44e41c drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  39  	.stop_adapter			= rtl92e_stop_adapter,
575d48c5753246 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  40  	.update_ratr_table		= rtl92e_update_ratr_table,
6d99c68e6f5024 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  41  	.irq_enable			= rtl92e_enable_irq,
baadea565daae4 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  42  	.irq_disable			= rtl92e_disable_irq,
dc578b417facae drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  43  	.irq_clear			= rtl92e_clear_irq,
78c352b2b22348 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  44  	.rx_enable			= rtl92e_enable_rx,
6af7a8b662f6bb drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  45  	.tx_enable			= rtl92e_enable_tx,
a57165d15dae6f drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  46  	.interrupt_recognized		= rtl92e_ack_irq,
c9cf5e78f3b28e drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  47  	.TxCheckStuckHandler		= rtl92e_is_tx_stuck,
4d73bd2636f51a drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  48  	.RxCheckStuckHandler		= rtl92e_is_rx_stuck,
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  49  };
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  50  

:::::: The code at line 29 was first introduced by commit
:::::: 1c099ed63f8363228a0b075a25511c9feb90e03f staging: rtl8192e: constify local structures

:::::: TO: Julia Lawall <Julia.Lawall@lip6.fr>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
