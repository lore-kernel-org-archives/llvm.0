Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E8947F;
	Sat, 13 May 2023 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684016959; x=1715552959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55WnoW770A7AW46VBywjG+22e4tx++ou05eIzPjyJg8=;
  b=V5g57m3u2b0teiIrdY8ZBPRD/nP3MBrShIamqu9mneblYnfCRjVZlW04
   cNE+f/xarCX6CUlysi1mmnEZ9W9rmlGYskdJkVDYGy+6hCSvxV5rLHNvB
   2/rawrpVaRAAi03x67drU9+RolZs9RnPaxxjTNxXKSomBbowv21nbR4Pv
   xfWH9eZRXdUw22V8dlKzi1ZXIHk6tzc61xMkTXhIMFfR3UxXwFNTK6ppT
   pvIN90lz3dKorSLkbcobdOQqEidf0fpxP1+t+VE+IM8+gAMlNtI3rChI1
   B3BBfRP0qHDYzEzwDYKaF5GMbAr3yFNfYwI57Z5v2LK9muPBH7Kf/Pj1n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="416633315"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="416633315"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 15:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="703530274"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="703530274"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 15:29:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxxjo-0005hk-2t;
	Sat, 13 May 2023 22:29:16 +0000
Date: Sun, 14 May 2023 06:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 189/453] drivers/pci/endpoint/functions/pci-epf-mhi.c:185:5: warning: no
 previous prototype for function 'pci_epf_mhi_iatu_read'
Message-ID: <202305140657.EjS0EOnP-lkp@intel.com>
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
commit: 7935e8cdfe2198432a4b403ecf9a766d82a6a070 [189/453] PCI: endpoint: epf-mhi: Add eDMA support
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230514/202305140657.EjS0EOnP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/krzk/linux/commit/7935e8cdfe2198432a4b403ecf9a766d82a6a070
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 7935e8cdfe2198432a4b403ecf9a766d82a6a070
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140657.EjS0EOnP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-mhi.c:124:24: error: field has incomplete type 'enum pci_notify_event'
           enum pci_notify_event event;
                                 ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:124:7: note: forward declaration of 'enum pci_notify_event'
           enum pci_notify_event event;
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:172:6: warning: no previous prototype for function 'pci_epf_mhi_raise_irq' [-Wmissing-prototypes]
   void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
        ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:185:5: warning: no previous prototype for function 'pci_epf_mhi_iatu_read' [-Wmissing-prototypes]
   int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:222:5: warning: no previous prototype for function 'pci_epf_mhi_iatu_write' [-Wmissing-prototypes]
   int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:222:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
   ^
   static 
   drivers/pci/endpoint/functions/pci-epf-mhi.c:450:57: error: no member named 'nb' in 'struct pci_epf'
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
   drivers/pci/endpoint/functions/pci-epf-mhi.c:450:24: error: no member named 'nb' in 'pci_epf'
           struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
                                 ^                                ~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
           ((type *)(__mptr - offsetof(type, member))); })
                              ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:450:18: error: initializing 'struct pci_epf *' with an expression of incompatible type 'void'
           struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:460:7: error: use of undeclared identifier 'CORE_INIT'
           case CORE_INIT:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:485:7: error: use of undeclared identifier 'LINK_UP'
           case LINK_UP:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:525:7: error: use of undeclared identifier 'LINK_DOWN'
           case LINK_DOWN:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:535:7: error: use of undeclared identifier 'BME'
           case BME:
                ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:588:7: error: no member named 'nb' in 'struct pci_epf'
           epf->nb.notifier_call = pci_epf_mhi_notifier;
           ~~~  ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:589:2: error: call to undeclared function 'pci_epc_register_notifier'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_epc_register_notifier(epc, &epf->nb);
           ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:589:39: error: no member named 'nb' in 'struct pci_epf'
           pci_epc_register_notifier(epc, &epf->nb);
                                           ~~~  ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:602:2: error: call to undeclared function 'pci_epc_unregister_notifier'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_epc_unregister_notifier(epc, &epf->nb);
           ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:602:2: note: did you mean 'pci_epf_unregister_driver'?
   include/linux/pci-epf.h:216:6: note: 'pci_epf_unregister_driver' declared here
   void pci_epf_unregister_driver(struct pci_epf_driver *driver);
        ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:602:41: error: no member named 'nb' in 'struct pci_epf'
           pci_epc_unregister_notifier(epc, &epf->nb);
                                             ~~~  ^
   3 warnings and 13 errors generated.


vim +/pci_epf_mhi_iatu_read +185 drivers/pci/endpoint/functions/pci-epf-mhi.c

   184	
 > 185	int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
   186				  size_t size)
   187	{
   188		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   189		struct pci_epf *epf = epf_mhi->epf;
   190		struct pci_epc *epc = epf_mhi->epf->epc;
   191		void __iomem *tre_buf;
   192		phys_addr_t tre_phys;
   193		size_t offset = from % 0x1000;
   194		int ret;
   195	
   196		mutex_lock(&epf_mhi->lock);
   197	
   198		tre_buf = pci_epc_mem_alloc_addr(epc, &tre_phys, size + offset);
   199		if (!tre_buf) {
   200			mutex_unlock(&epf_mhi->lock);
   201			return -ENOMEM;
   202		}
   203	
   204		ret = pci_epc_map_addr(epc, epf->func_no, epf->vfunc_no, tre_phys, from - offset,
   205				       size + offset);
   206		if (ret) {
   207			pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   208			mutex_unlock(&epf_mhi->lock);
   209			return ret;
   210		}
   211	
   212		memcpy_fromio(to, tre_buf + offset, size);
   213	
   214		pci_epc_unmap_addr(epc, epf->func_no, epf->vfunc_no, tre_phys);
   215		pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   216	
   217		mutex_unlock(&epf_mhi->lock);
   218	
   219		return 0;
   220	}
   221	
 > 222	int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
   223				   size_t size)
   224	{
   225		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   226		struct pci_epf *epf = epf_mhi->epf;
   227		struct pci_epc *epc = epf_mhi->epf->epc;
   228		void __iomem *tre_buf;
   229		phys_addr_t tre_phys;
   230		size_t offset = to % 0x1000;
   231		int ret;
   232	
   233		mutex_lock(&epf_mhi->lock);
   234	
   235		tre_buf = pci_epc_mem_alloc_addr(epc, &tre_phys, size + offset);
   236		if (!tre_buf) {
   237			mutex_unlock(&epf_mhi->lock);
   238			return -ENOMEM;
   239		}
   240	
   241		ret = pci_epc_map_addr(epc, epf->func_no, epf->vfunc_no, tre_phys, to - offset,
   242				       size + offset);
   243		if (ret) {
   244			pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   245			mutex_unlock(&epf_mhi->lock);
   246			return ret;
   247		}
   248	
   249		memcpy_toio(tre_buf + offset, from, size);
   250	
   251		pci_epc_unmap_addr(epc, epf->func_no, epf->vfunc_no, tre_phys);
   252		pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   253	
   254		mutex_unlock(&epf_mhi->lock);
   255	
   256		return 0;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
