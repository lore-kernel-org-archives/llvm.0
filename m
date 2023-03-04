Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7329215B1;
	Sat,  4 Mar 2023 03:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677899854; x=1709435854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oatAEQ7vl8BoKmV6kkc6s2zJXLgO695Y2syAKAjumrU=;
  b=k+8vYmq9DRmI6dTvlQwXZQMyfvWzY9TxcbYv89RQKDXgsXusmydK2Kvf
   WmFGJfhMRjr3WIRkDQPNzyDEd20HIyc5xDc0NnM6D8swkD9vtNhI7TLRq
   KwBJ2mYAMuIpm3BxIaUoBmSJVcfapVKwH4mnco3NdWK6UA8LbytGDovK5
   ba458aQ+pf2LSsQkYcj/Ccct2tlSX/nrnVZ+B7AuNRkImCtBS06+Agk+B
   rSXK4+NzLGMcIy7nqGRUp0lZmGecj5tXpMqNEiiYdCg45+s4HcuZr6wQY
   zE2vSBAfMdbQwESeIeS5eQbRImq+rqrHerr8Mv14Eg4kiMR83on9a4ReO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="421487336"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="421487336"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 19:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="744452762"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="744452762"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2023 19:17:32 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYIOp-0001oo-33;
	Sat, 04 Mar 2023 03:17:31 +0000
Date: Sat, 4 Mar 2023 11:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:net-queue 14/71] drivers/net/phy/sfp.c:2656:44: error: too
 many arguments to function call, expected 2, have 3
Message-ID: <202303041125.wYVktEZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm net-queue
head:   e61867cdc3bb4a8980784f3cafaa6c877ab6af0d
commit: 9e4f66979a9751beb8ac23f928fe25a7a4617573 [14/71] net: sfp: add support for rate selection
config: hexagon-randconfig-r033-20230302 (https://download.01.org/0day-ci/archive/20230304/202303041125.wYVktEZl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm net-queue
        git checkout 9e4f66979a9751beb8ac23f928fe25a7a4617573
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041125.wYVktEZl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/phy/sfp.c:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/net/phy/sfp.c:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/phy/sfp.c:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
>> drivers/net/phy/sfp.c:2656:44: error: too many arguments to function call, expected 2, have 3
           sfp_set_state(sfp, SFP_F_RS0 | SFP_F_RS1, set);
           ~~~~~~~~~~~~~                             ^~~
   drivers/net/phy/sfp.c:762:13: note: 'sfp_set_state' declared here
   static void sfp_set_state(struct sfp *sfp, unsigned int state)
               ^
   6 warnings and 1 error generated.


vim +2656 drivers/net/phy/sfp.c

  2644	
  2645	static void sfp_set_signal_rate(struct sfp *sfp, unsigned int rate_kbd)
  2646	{
  2647		unsigned int set;
  2648	
  2649		sfp->rate_kbd = rate_kbd;
  2650	
  2651		if (rate_kbd > sfp->rs_threshold_kbd)
  2652			set = sfp->rs_state_mask;
  2653		else
  2654			set = 0;
  2655	
> 2656		sfp_set_state(sfp, SFP_F_RS0 | SFP_F_RS1, set);
  2657	}
  2658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
