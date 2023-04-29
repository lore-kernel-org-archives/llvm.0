Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138592FAF;
	Sat, 29 Apr 2023 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682771045; x=1714307045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3MfKTCojcLEzoPNREK91BM7jsR8JkZgRAL6iIZSivks=;
  b=WI20tgb6PoPL4EE67e3ktnr8k2B6Kpv9XVwXfkRunRhNIradA/ZgtNBy
   kL+svvBOiYO71w2q7EGRhV2/deHYyplfBT4IJp4bYUcQRF4b0ExgBtgIP
   Ezn+iqQFOQzCM2k871WEaCCFNCMXKM26Lb7FjebBwtyDEslBTCvWpLcq5
   GL4el5iZBYQDzku/Zw1VZ8f5UTOHfts8BxrdLvg5rYUI9Z9Zd1sjVTx+u
   ZnbatR8U4wfjruRIVDPFMWUseM/VYl12X7MwBDu85DRWBwvTU1YxVnOF4
   DHU/677mZ1lLqLxrs6TWxpARlwkGFWt72pr7s6HpJ/8MmGbxrL0gIeZ2h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="411049196"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="411049196"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="764677327"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="764677327"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2023 05:24:02 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjcQ-00018N-0Q;
	Sat, 29 Apr 2023 12:24:02 +0000
Date: Sat, 29 Apr 2023 20:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 06/12] pci: implement register/unregister
 functionality
Message-ID: <202304292047.JoicCc5d-lkp@intel.com>
References: <20230429093925.133327-7-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-7-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20230428]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-7-joshi.k%40samsung.com
patch subject: [RFC PATCH 06/12] pci: implement register/unregister functionality
config: riscv-randconfig-r034-20230428 (https://download.01.org/0day-ci/archive/20230429/202304292047.JoicCc5d-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6b117fabad0d77551dee34c2b3335dde220e057a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout 6b117fabad0d77551dee34c2b3335dde220e057a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292047.JoicCc5d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:1832:3: error: field designator 'register_queue' does not refer to any field in type 'const struct blk_mq_ops'
           .register_queue = nvme_pci_register_queue,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:1833:3: error: field designator 'unregister_queue' does not refer to any field in type 'const struct blk_mq_ops'
           .unregister_queue =  nvme_pci_unregister_queue,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:3125:41: warning: shift count >= width of type [-Wshift-count-overflow]
                   dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.


vim +1832 drivers/nvme/host/pci.c

  1821	
  1822	static const struct blk_mq_ops nvme_mq_ops = {
  1823		.queue_rq	= nvme_queue_rq,
  1824		.queue_rqs	= nvme_queue_rqs,
  1825		.complete	= nvme_pci_complete_rq,
  1826		.commit_rqs	= nvme_commit_rqs,
  1827		.init_hctx	= nvme_init_hctx,
  1828		.init_request	= nvme_pci_init_request,
  1829		.map_queues	= nvme_pci_map_queues,
  1830		.timeout	= nvme_timeout,
  1831		.poll		= nvme_poll,
> 1832		.register_queue	= nvme_pci_register_queue,
> 1833		.unregister_queue =  nvme_pci_unregister_queue,
  1834	};
  1835	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
