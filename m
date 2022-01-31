Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E42CA1
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 18:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643654024; x=1675190024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuTp7nzlEgMrvqDW2kgs1bZPa/4q12z915xx9yu/Cko=;
  b=PrrVrHfZD2jtK5LKSaAsQ+O7D6C6lW25swRkCoUmHem3+4BIJYVSaEiV
   AWQChdSLSpNsjXRNSG2Ae1r5W2R299QaAWkJbulP5uy+lJc6sthZmo8G9
   hhHMzXpbVvINRKS3GV2v+5dvAtzYnEUjw13vEwr+nQsYX4nwfHKpIJS0Q
   Ux4se52Ssvem/abIRG2z5NsOkxSZ5iDtUe3mFXMrDxUK7E738szXbVdZm
   IgXBE824tn2NlSfGpxHNmNvFdD9KgVu7mdlZi2Wa+wdIsFYq4dGYl6okm
   roPxJhtv5cZJLxpzIQYSAiqrD1/hQiDpjepA5uzb/GUEh8aSM/70rCXC1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="231095205"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="231095205"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 10:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="565252201"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2022 10:33:43 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEbUk-000SEq-B2; Mon, 31 Jan 2022 18:33:42 +0000
Date: Tue, 1 Feb 2022 02:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 10/20]
 drivers/gpio/gpio-mt7621.c:198:22: warning: format specifies type 'char *'
 but the argument has type 'int'
Message-ID: <202202010228.xL1vl2JR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/irq_chip_ro
head:   3feae85f6c2365d60a02d167b72a3e7410f82160
commit: a2c5a576e1b1c539e3676c024c67a3c2acfe8852 [10/20] gpio: mt7621: Switch to dynamic chip name output
config: hexagon-randconfig-r041-20220130 (https://download.01.org/0day-ci/archive/20220201/202202010228.xL1vl2JR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=a2c5a576e1b1c539e3676c024c67a3c2acfe8852
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout a2c5a576e1b1c539e3676c024c67a3c2acfe8852
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-mt7621.c:194:52: error: passing 'struct irq_data' to parameter of incompatible type 'struct irq_data *'; take the address with &
           struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
                                                             ^
                                                             &
   include/linux/irq.h:834:65: note: passing argument to parameter 'd' here
   static inline void *irq_data_get_irq_chip_data(struct irq_data *d)
                                                                   ^
   drivers/gpio/gpio-mt7621.c:198:22: error: implicit declaration of function 'devname' [-Werror,-Wimplicit-function-declaration]
           seq_printf(p, "%s", devname(mtk->dev));
                               ^
   drivers/gpio/gpio-mt7621.c:198:22: note: did you mean 'dev_name'?
   include/linux/device.h:633:27: note: 'dev_name' declared here
   static inline const char *dev_name(const struct device *dev)
                             ^
>> drivers/gpio/gpio-mt7621.c:198:22: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
           seq_printf(p, "%s", devname(mtk->dev));
                          ~~   ^~~~~~~~~~~~~~~~~
                          %d
   drivers/gpio/gpio-mt7621.c:256:32: error: use of undeclared identifier 'mediatek_gpio_irq_print_chip'; did you mean 'mediatek_irq_print_chip'?
           rg->irq_chip.irq_print_chip = mediatek_gpio_irq_print_chip;
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                         mediatek_irq_print_chip
   drivers/gpio/gpio-mt7621.c:192:13: note: 'mediatek_irq_print_chip' declared here
   static void mediatek_irq_print_chip(struct irq_data d, struct seq_file *p)
               ^
   1 warning and 3 errors generated.


vim +198 drivers/gpio/gpio-mt7621.c

   191	
   192	static void mediatek_irq_print_chip(struct irq_data d, struct seq_file *p)
   193	{
   194		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
   195		struct mtk_gc *rg = to_mediatek_gpio(gc);
   196		struct mtk *mtk = container_of(rg - rg->bank, struct mtk, gc_map[0]);
   197	
 > 198		seq_printf(p, "%s", devname(mtk->dev));
   199	}
   200	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
