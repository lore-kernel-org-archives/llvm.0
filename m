Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B639515CE;
	Fri, 28 Apr 2023 03:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682651417; x=1714187417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DEpXIX8sQe+FD4hYd7gCGzhMapm1L9EFRRaFS5GszPY=;
  b=eYWK5a7XZu3VAswzqK1f6TuhNp+NlBIPXDMfcChImPwJ0mjOvxiu+0tD
   ACk83s76cPqvEZ3TZgW1jtRBJnaAYbtal6xrS5flk9biQAPUaOhUyVS53
   nCFW3ZP718IDfo26RVA+R+Af/316hIcSGDWOy1nB72Ud3WwmSrZldqjLB
   w6TV3HzhB+UcK/q7GmXZwZGZE4EYQ5YQ9J7jYlUrB2LBHf171IreyCZ+9
   E8iojH2624W2pGreIdXgoKG8EdZKQlZSToZrvTuA8UVQhUmzC+9zK/CL9
   u2Y6zZCPan6lACEL/YICphNpdR/BHzXplWr/zdEJYOtn42Cs/dW3ekLlz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346391665"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="346391665"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 20:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806213461"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="806213461"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2023 20:10:15 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEUw-00003j-39;
	Fri, 28 Apr 2023 03:10:14 +0000
Date: Fri, 28 Apr 2023 11:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 7/8] netdev: expose DPLL pin handle for netdevice
Message-ID: <202304281043.3dUibSbi-lkp@intel.com>
References: <20230428002009.2948020-8-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-8-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.3]
[cannot apply to tnguy-next-queue/dev-queue linus/master next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230428002009.2948020-8-vadfed%40meta.com
patch subject: [RFC PATCH v7 7/8] netdev: expose DPLL pin handle for netdevice
config: hexagon-randconfig-r031-20230428 (https://download.01.org/0day-ci/archive/20230428/202304281043.3dUibSbi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/896bf6147acb6644a9a3cf4825510821d86ba577
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
        git checkout 896bf6147acb6644a9a3cf4825510821d86ba577
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281043.3dUibSbi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/dev.c:88:
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
   In file included from net/core/dev.c:88:
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
   In file included from net/core/dev.c:88:
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
>> net/core/dev.c:8958:7: error: no member named 'dpll_pin' in 'struct net_device'
           dev->dpll_pin = dpll_pin;
           ~~~  ^
   6 warnings and 1 error generated.
--
   In file included from net/core/rtnetlink.c:28:
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
   In file included from net/core/rtnetlink.c:28:
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
   In file included from net/core/rtnetlink.c:28:
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
>> net/core/rtnetlink.c:1056:11: error: no member named 'dpll_pin' in 'struct net_device'
           if (dev->dpll_pin)
               ~~~  ^
   net/core/rtnetlink.c:1057:41: error: no member named 'dpll_pin' in 'struct net_device'
                   size += dpll_msg_pin_handle_size(dev->dpll_pin);
                                                    ~~~  ^
   net/core/rtnetlink.c:1790:11: error: no member named 'dpll_pin' in 'struct net_device'
           if (dev->dpll_pin) {
               ~~~  ^
   net/core/rtnetlink.c:1791:43: error: no member named 'dpll_pin' in 'struct net_device'
                   ret = dpll_msg_add_pin_handle(skb, dev->dpll_pin);
                                                      ~~~  ^
   6 warnings and 4 errors generated.


vim +8958 net/core/dev.c

  8954	
  8955	static void netdev_dpll_pin_assign(struct net_device *dev, struct dpll_pin *dpll_pin)
  8956	{
  8957		rtnl_lock();
> 8958		dev->dpll_pin = dpll_pin;
  8959		rtnl_unlock();
  8960	}
  8961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
