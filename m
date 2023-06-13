Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9456A621;
	Tue, 13 Jun 2023 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686616107; x=1718152107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h0drnt+Qe2LQaE7JXBhsRldyg8G3NPMtNryy9MtRQc4=;
  b=kbW+b2YCGpscIfZgNDJrsvnYNuaLwH5kQrSXAhRAc8dVb4JMS3Jk6Fhs
   QmLgwWJXNTLrqb6ZAfB3Qm3nxXRY6IHiA2pbpvUCoZMwbsO51IuvL7JW7
   B9PBbabzhyWYCfXO9sa1yWxOhVq8LxtMZ2lsayTIlOXZGZZnFJX9YLmLc
   rko72d2EUGY9D5n3ht0ABu0hn3r/n7qpTrQkNWEmx4xuwAJwe/7JlEbyZ
   KKsEix7PlxlS2yTdkHvNy+fH6fbyqereE9ppSvLMxXzp47K+rdId5W0s+
   blu2vQEFv3uqY8Uy8hylze+gz5nqlH+biOzT77T6QIPyF9Zt7PK4QdHYf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361559915"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="361559915"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 17:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835673924"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="835673924"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2023 17:28:24 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8rtX-0000rs-1h;
	Tue, 13 Jun 2023 00:28:23 +0000
Date: Tue, 13 Jun 2023 08:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Sagi Grimberg <sagi@grimberg.me>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-6.5 26/26] drivers/nvme/host/core.c:2999:41: error:
 incompatible integer to pointer conversion passing 'unsigned long' to
 parameter of type 'const volatile unsigned long *'; take the address with &
Message-ID: <202306130840.ggtPDMHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.5
head:   9aa77a0506d6990714c9fbb1c03596cd8e1094c7
commit: 9aa77a0506d6990714c9fbb1c03596cd8e1094c7 [26/26] nvme: skip optional id ctrl csi if it failed
config: hexagon-randconfig-r015-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130840.ggtPDMHF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme nvme-6.5
        git checkout 9aa77a0506d6990714c9fbb1c03596cd8e1094c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130840.ggtPDMHF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/nvme/host/core.c:2999:41: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const volatile unsigned long *'; take the address with & [-Wint-conversion]
    2999 |             test_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags))
         |                                                ^~~~~~~~~~~
         |                                                &
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:53:17: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/asm-generic/bitops/generic-non-atomic.h:166:64: note: passing argument to parameter 'addr' here
     166 | const_test_bit(unsigned long nr, const volatile unsigned long *addr)
         |                                                                ^
>> drivers/nvme/host/core.c:2999:41: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const volatile unsigned long *'; take the address with & [-Wint-conversion]
    2999 |             test_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags))
         |                                                ^~~~~~~~~~~
         |                                                &
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   arch/hexagon/include/asm/bitops.h:168:63: note: passing argument to parameter 'addr' here
     168 | arch_test_bit(unsigned long nr, const volatile unsigned long *addr)
         |                                                               ^
>> drivers/nvme/host/core.c:3022:37: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'volatile void *' [-Wint-conversion]
    3022 |                 set_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags);
         |                                                   ^~~~~~~~~~~
   arch/hexagon/include/asm/bitops.h:111:51: note: passing argument to parameter 'addr' here
     111 | static inline void set_bit(int nr, volatile void *addr)
         |                                                   ^
   6 warnings and 3 errors generated.


vim +2999 drivers/nvme/host/core.c

  2970	
  2971	static int nvme_init_non_mdts_limits(struct nvme_ctrl *ctrl)
  2972	{
  2973		struct nvme_command c = { };
  2974		struct nvme_id_ctrl_nvm *id;
  2975		int ret;
  2976	
  2977		if (ctrl->oncs & NVME_CTRL_ONCS_DSM) {
  2978			ctrl->max_discard_sectors = UINT_MAX;
  2979			ctrl->max_discard_segments = NVME_DSM_MAX_RANGES;
  2980		} else {
  2981			ctrl->max_discard_sectors = 0;
  2982			ctrl->max_discard_segments = 0;
  2983		}
  2984	
  2985		/*
  2986		 * Even though NVMe spec explicitly states that MDTS is not applicable
  2987		 * to the write-zeroes, we are cautious and limit the size to the
  2988		 * controllers max_hw_sectors value, which is based on the MDTS field
  2989		 * and possibly other limiting factors.
  2990		 */
  2991		if ((ctrl->oncs & NVME_CTRL_ONCS_WRITE_ZEROES) &&
  2992		    !(ctrl->quirks & NVME_QUIRK_DISABLE_WRITE_ZEROES))
  2993			ctrl->max_zeroes_sectors = ctrl->max_hw_sectors;
  2994		else
  2995			ctrl->max_zeroes_sectors = 0;
  2996	
  2997		if (ctrl->subsys->subtype != NVME_NQN_NVME ||
  2998		    nvme_ctrl_limited_cns(ctrl) ||
> 2999		    test_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags))
  3000			return 0;
  3001	
  3002		id = kzalloc(sizeof(*id), GFP_KERNEL);
  3003		if (!id)
  3004			return -ENOMEM;
  3005	
  3006		c.identify.opcode = nvme_admin_identify;
  3007		c.identify.cns = NVME_ID_CNS_CS_CTRL;
  3008		c.identify.csi = NVME_CSI_NVM;
  3009	
  3010		ret = nvme_submit_sync_cmd(ctrl->admin_q, &c, id, sizeof(*id));
  3011		if (ret)
  3012			goto free_data;
  3013	
  3014		if (id->dmrl)
  3015			ctrl->max_discard_segments = id->dmrl;
  3016		ctrl->dmrsl = le32_to_cpu(id->dmrsl);
  3017		if (id->wzsl)
  3018			ctrl->max_zeroes_sectors = nvme_mps_to_sectors(ctrl, id->wzsl);
  3019	
  3020	free_data:
  3021		if (ret > 0)
> 3022			set_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags);
  3023		kfree(id);
  3024		return ret;
  3025	}
  3026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
