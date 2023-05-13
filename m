Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F62749B;
	Sat, 13 May 2023 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684013899; x=1715549899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYbXqvn0BdNTRZYpREOFoAJ0pyJYcML/tt2cAR6k2HU=;
  b=eUB0hRWxvRW/U8lAqnIF3+1ICsGta18OjdKzyqvU78hfqxbJbEuwi/0a
   rzLgJ6JSQQ96aa/z6HfK34sRqwVbKnPVWMpHC2IEqOx5P7WADWQkk6KE4
   rEOhmPIsKqCuVOoFOo6TQ2+3o1eeldw5YJ5OmB8yNROI6FJ6x+zlBgRnE
   0V3IdBfo4PE+y+BdPHIMwqY/6H3PBm6Dgy0Ny63IU9ggbwFyqBY0aiPNz
   k4EzV9FvHG2QrvfLFAxtt5TdPtd2I+IQB5OIYWYh3Um0FSemcKcF4sh1F
   36gKC8SroIUD6B7sDxgbDIg6krFR1xNJ5GpReMuyOTKLAr9I561Kj5ypt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="340323532"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="340323532"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 14:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="731189688"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="731189688"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 May 2023 14:38:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxwwS-0005gm-1V;
	Sat, 13 May 2023 21:38:16 +0000
Date: Sun, 14 May 2023 05:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 178/453] drivers/pci/endpoint/functions/pci-epf-mhi.c:146:6: warning: no
 previous prototype for function 'pci_epf_mhi_raise_irq'
Message-ID: <202305140553.mkEWd8CJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   255ec801b7a09e914735a942f27f3c74f5e8e810
commit: 2e57e366c02cd2c24bb947f2f2607857318bc1e4 [178/453] PCI: endpoint: Add PCI Endpoint function driver for MHI bus
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230514/202305140553.mkEWd8CJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/krzk/linux/commit/2e57e366c02cd2c24bb947f2f2607857318bc1e4
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 2e57e366c02cd2c24bb947f2f2607857318bc1e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140553.mkEWd8CJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-mhi.c:100:24: error: field has incomplete type 'enum pci_notify_event'
           enum pci_notify_event event;
                                 ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:100:7: note: forward declaration of 'enum pci_notify_event'
           enum pci_notify_event event;
                ^
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:146:6: warning: no previous prototype for function 'pci_epf_mhi_raise_irq' [-Wmissing-prototypes]
   void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
        ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:146:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
   ^
   static 
   drivers/pci/endpoint/functions/pci-epf-mhi.c:159:5: warning: no previous prototype for function 'pci_epf_mhi_read_from_host' [-Wmissing-prototypes]
   int pci_epf_mhi_read_from_host(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_read_from_host(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
   ^
   static 
   drivers/pci/endpoint/functions/pci-epf-mhi.c:196:5: warning: no previous prototype for function 'pci_epf_mhi_write_to_host' [-Wmissing-prototypes]
   int pci_epf_mhi_write_to_host(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_write_to_host(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
   ^
   static 
   drivers/pci/endpoint/functions/pci-epf-mhi.c:235:57: error: no member named 'nb' in 'struct pci_epf'
           struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:74: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                            ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:235:24: error: no member named 'nb' in 'pci_epf'
           struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
                                 ^                                ~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
           ((type *)(__mptr - offsetof(type, member))); })
                              ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:235:18: error: initializing 'struct pci_epf *' with an expression of incompatible type 'void'
           struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:245:7: error: use of undeclared identifier 'CORE_INIT'
           case CORE_INIT:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:270:7: error: use of undeclared identifier 'LINK_UP'
           case LINK_UP:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:292:7: error: use of undeclared identifier 'LINK_DOWN'
           case LINK_DOWN:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:300:7: error: use of undeclared identifier 'BME'
           case BME:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:351:7: error: no member named 'nb' in 'struct pci_epf'
           epf->nb.notifier_call = pci_epf_mhi_notifier;
           ~~~  ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:352:2: error: call to undeclared function 'pci_epc_register_notifier'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_epc_register_notifier(epc, &epf->nb);
           ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:352:39: error: no member named 'nb' in 'struct pci_epf'
           pci_epc_register_notifier(epc, &epf->nb);
                                           ~~~  ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:365:2: error: call to undeclared function 'pci_epc_unregister_notifier'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_epc_unregister_notifier(epc, &epf->nb);
           ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:365:2: note: did you mean 'pci_epf_unregister_driver'?
   include/linux/pci-epf.h:210:6: note: 'pci_epf_unregister_driver' declared here
   void pci_epf_unregister_driver(struct pci_epf_driver *driver);
        ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:365:41: error: no member named 'nb' in 'struct pci_epf'
           pci_epc_unregister_notifier(epc, &epf->nb);
                                             ~~~  ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:416:12: error: incompatible function pointer types initializing 'int (*)(struct pci_epf *)' with an expression of type 'int (struct pci_epf *, const struct pci_epf_device_id *)' [-Wincompatible-function-pointer-types]
           .probe          = pci_epf_mhi_probe,
                             ^~~~~~~~~~~~~~~~~
   3 warnings and 14 errors generated.


vim +/pci_epf_mhi_raise_irq +146 drivers/pci/endpoint/functions/pci-epf-mhi.c

   145	
 > 146	void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
   147	{
   148		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   149		struct pci_epf *epf = epf_mhi->epf;
   150		struct pci_epc *epc = epf->epc;
   151	
   152		/*
   153		 * Vector is incremented by 1 here as the DWC core will decrement it before
   154		 * writing to iATU.
   155		 */
   156		pci_epc_raise_irq(epc, epf->func_no, epf->vfunc_no, PCI_EPC_IRQ_MSI, vector + 1);
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
