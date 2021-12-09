Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BB29CA
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 05:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639027932; x=1670563932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smr3t5WKC03WkNX9V0Z4U1tv94uetRsSl7sjkPVXnss=;
  b=Fg7216EV0VHtDXUEQlzqcHi5aCCxLxCWT6J1jfFVO8B60AlnbP/RMn9L
   cPBMak4RJg7QoBA8FhFWdaSS5lO91PaQxZT+N/ei6H4/SQ9JD2qklLl2M
   taxclRw2z3yOMi2vm6wDPHUzTM1DOQMIGhbraoIJNWVqCxT7HII9DVpMq
   HzeVjwa8hxFvPR+QbNcoXl2tGAF7g8JidffB4mgUB/g9OVlXgjq8yUo3H
   NNvnSAETzy4abzFVc5OtvV9fdbTf42RMI0eXMMwZfPzipAlafN9GpHhfL
   7Jy/lP94QiHdwLnKBkgFjHBbrJ/9Oqcr4y3pTp7awRTYbBiYgEzBVqsIz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="237826189"
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; 
   d="scan'208";a="237826189"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 21:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; 
   d="scan'208";a="612378061"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2021 21:32:09 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvC2K-0001Wr-D6; Thu, 09 Dec 2021 05:32:08 +0000
Date: Thu, 9 Dec 2021 13:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Subject: drivers/pinctrl/bcm/pinctrl-bcm2835.c:413:14: warning: variable
 'group' is used uninitialized whenever 'for' loop exits because its
 condition is false
Message-ID: <202112091309.HCSKbMQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 4434f4c50345c84373b7117b5c827a88870f9d36 pinctrl: bcm2835: Allow building driver as a module
date:   6 weeks ago
config: mips-randconfig-r001-20211209 (https://download.01.org/0day-ci/archive/20211209/202112091309.HCSKbMQS-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4434f4c50345c84373b7117b5c827a88870f9d36
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4434f4c50345c84373b7117b5c827a88870f9d36
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/pinctrl/bcm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:413:14: warning: variable 'group' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
           for (i = 0; i < BCM2835_NUM_IRQS; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm2835.c:424:10: note: uninitialized use occurs here
           switch (group) {
                   ^~~~~
   drivers/pinctrl/bcm/pinctrl-bcm2835.c:413:14: note: remove the condition if it is always true
           for (i = 0; i < BCM2835_NUM_IRQS; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm2835.c:410:11: note: initialize the variable 'group' to silence this warning
           int group;
                    ^
                     = 0
   1 warning generated.


vim +413 drivers/pinctrl/bcm/pinctrl-bcm2835.c

00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  403  
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  404  static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  405  {
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  406  	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  407  	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  408  	struct irq_chip *host_chip = irq_desc_get_chip(desc);
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  409  	int irq = irq_desc_get_irq(desc);
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  410  	int group;
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  411  	int i;
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  412  
73345a18d464b1 drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2019-08-12 @413  	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
73345a18d464b1 drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2019-08-12  414  		if (chip->irq.parents[i] == irq) {
0d885e9da176ad drivers/pinctrl/bcm/pinctrl-bcm2835.c Thierry Reding 2017-07-20  415  			group = i;
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  416  			break;
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  417  		}
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  418  	}
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  419  	/* This should not happen, every IRQ has a bank */
29d45a642d4ea8 drivers/pinctrl/bcm/pinctrl-bcm2835.c Jason Wang     2021-06-24  420  	BUG_ON(i == BCM2835_NUM_IRQS);
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  421  
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  422  	chained_irq_enter(host_chip, desc);
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  423  
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  424  	switch (group) {
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  425  	case 0: /* IRQ0 covers GPIOs 0-27 */
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  426  		bcm2835_gpio_irq_handle_bank(pc, 0, 0x0fffffff);
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  427  		break;
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  428  	case 1: /* IRQ1 covers GPIOs 28-45 */
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  429  		bcm2835_gpio_irq_handle_bank(pc, 0, 0xf0000000);
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  430  		bcm2835_gpio_irq_handle_bank(pc, 1, 0x00003fff);
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  431  		break;
b1d84a3d0a26c5 drivers/pinctrl/bcm/pinctrl-bcm2835.c Stefan Wahren  2020-02-08  432  	case 2: /* IRQ2 covers GPIOs 46-57 */
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  433  		bcm2835_gpio_irq_handle_bank(pc, 1, 0x003fc000);
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  434  		break;
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  435  	}
00445b5d5866c7 drivers/pinctrl/bcm/pinctrl-bcm2835.c Phil Elwell    2015-02-24  436  
85ae9e512f437c drivers/pinctrl/bcm/pinctrl-bcm2835.c Linus Walleij  2016-11-14  437  	chained_irq_exit(host_chip, desc);
e1b2dc70cd5b00 drivers/pinctrl/pinctrl-bcm2835.c     Simon Arlott   2012-09-27  438  }
e1b2dc70cd5b00 drivers/pinctrl/pinctrl-bcm2835.c     Simon Arlott   2012-09-27  439  

:::::: The code at line 413 was first introduced by commit
:::::: 73345a18d464b1b945b29f54f630ace6873344e2 pinctrl: bcm2835: Pass irqchip when adding gpiochip

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
