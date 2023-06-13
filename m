Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7D319E;
	Tue, 13 Jun 2023 00:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686615446; x=1718151446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftzyfGd7hEwXFU0TSLWK7eslrvKB6pKAoI9jV9Jv8F8=;
  b=CY7i+NTuAiH+HC1Oxr4DCnai9hEdC9qhERx/vf1wpSG0G16RytmdTQzc
   +lR0NKLmHteWNm6y0/NzYTpKL2Dvgku9f2F5QXQBbeSFjBwYUxBffzXgT
   S6klsVBcc3GV22L4OgVFf2HM7QiQW0Jr5dXHpyJP/k6ExC1t3M1GjBUzM
   8w79U4lpd5xb3pBPHlkaMw+HtbVz9L8lJ2Unx8wcXksKkWWhyeYn8EIo8
   Vr41Gl4qVKXe+05pTdsSwse4WdW3NsNQtimMOr17jEgIEKUZFdeux8Crg
   o9/ltcUoZlVQulPOUgzN5RPm7kvkC+oZWB1c/AP2XauFJn/zuEOZgVQby
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355690208"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="355690208"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 17:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688823020"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="688823020"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jun 2023 17:17:23 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8ris-0000rU-1d;
	Tue, 13 Jun 2023 00:17:22 +0000
Date: Tue, 13 Jun 2023 08:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Sagi Grimberg <sagi@grimberg.me>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-6.5 26/26] drivers/nvme/host/core.c:2999:41: error:
 incompatible integer to pointer conversion passing 'unsigned long' to
 parameter of type 'const volatile unsigned long *'; take the address with &
Message-ID: <202306130839.SgF584xI-lkp@intel.com>
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
config: i386-randconfig-i002-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130839.SgF584xI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme nvme-6.5
        git checkout 9aa77a0506d6990714c9fbb1c03596cd8e1094c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130839.SgF584xI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/core.c:2999:41: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const volatile unsigned long *'; take the address with & [-Wint-conversion]
               test_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags))
                                                  ^~~~~~~~~~~
                                                  &
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                                ^~~~
   include/linux/bitops.h:53:17: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                          ^~~~
   include/asm-generic/bitops/generic-non-atomic.h:166:64: note: passing argument to parameter 'addr' here
   const_test_bit(unsigned long nr, const volatile unsigned long *addr)
                                                                  ^
>> drivers/nvme/host/core.c:2999:41: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const volatile unsigned long *'; take the address with & [-Wint-conversion]
               test_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags))
                                                  ^~~~~~~~~~~
                                                  &
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                                ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   include/asm-generic/bitops/instrumented-non-atomic.h:139:59: note: passing argument to parameter 'addr' here
   _test_bit(unsigned long nr, const volatile unsigned long *addr)
                                                             ^
>> drivers/nvme/host/core.c:3022:37: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'volatile unsigned long *'; take the address with & [-Wint-conversion]
                   set_bit(NVME_CTRL_SKIP_ID_CNS_CS, ctrl->flags);
                                                     ^~~~~~~~~~~
                                                     &
   include/asm-generic/bitops/instrumented-atomic.h:26:70: note: passing argument to parameter 'addr' here
   static __always_inline void set_bit(long nr, volatile unsigned long *addr)
                                                                        ^
   3 errors generated.


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
