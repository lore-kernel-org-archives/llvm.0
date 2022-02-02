Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F2D29CA
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643786625; x=1675322625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Li9rgOuuufRV9TVG3CsHpo+mWli1OWS8PKwkQwWYsZM=;
  b=Ax7Id1xXIhEfRre7YpXANeNzO9M4b/v3gcoB0R6HmUEkiu6f8fJrSBr9
   J4TA2M3Vedd2327aLYYSN53lOYi9bnTE4vb754JwArScMC2oY8Y0O78wk
   TN9MDdB2FKnj+tQM338TRZ5Tb+zH1l9mXGRB7hagnYTJS75939Y+0q7ok
   vg4wohhILdidkcw+Eb/GfWayjy6begBRhGKWQgBM3kvVcChFX3x92EAGC
   KPaQiJgwHYGFuGnrMBUkOeuSXw2c2eO2kZlIghiteFvMCGld8LD7Hucph
   SqeHbRr0cVE0WN4c5UE24SqipT2Lh4r6LG1t+vQwngJu8bJZhaarvQ6+N
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="248083596"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="248083596"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 23:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="769196803"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2022 23:23:43 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nF9zT-000UGr-5Z; Wed, 02 Feb 2022 07:23:43 +0000
Date: Wed, 2 Feb 2022 15:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/3] nvme: add the "debug" host driver
Message-ID: <202202021549.3g79sGNE-lkp@intel.com>
References: <alpine.LRH.2.02.2202011333160.22481@file01.intranet.prod.int.rdu2.redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2202011333160.22481@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mikulas,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v5.17-rc2 next-20220202]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mikulas-Patocka/block-add-copy-offload-support/20220202-033318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220202/202202021549.3g79sGNE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b59e9d971770c50aaac1d07d6edaa10a4a47171b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mikulas-Patocka/block-add-copy-offload-support/20220202-033318
        git checkout b59e9d971770c50aaac1d07d6edaa10a4a47171b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/cec/platform/seco/ drivers/net/ethernet/cavium/thunder/ drivers/net/wireless/ath/ drivers/nvme/host/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/nvme-debug.c:148:5: warning: no previous prototype for function 'nvme_debug_reg_read64' [-Wmissing-prototypes]
   int nvme_debug_reg_read64(struct nvme_ctrl *nctrl, u32 off, u64 *val)
       ^
   drivers/nvme/host/nvme-debug.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvme_debug_reg_read64(struct nvme_ctrl *nctrl, u32 off, u64 *val)
   ^
   static 
>> drivers/nvme/host/nvme-debug.c:163:5: warning: no previous prototype for function 'nvme_debug_reg_write32' [-Wmissing-prototypes]
   int nvme_debug_reg_write32(struct nvme_ctrl *nctrl, u32 off, u32 val)
       ^
   drivers/nvme/host/nvme-debug.c:163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvme_debug_reg_write32(struct nvme_ctrl *nctrl, u32 off, u32 val)
   ^
   static 
>> drivers/nvme/host/nvme-debug.c:758:6: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!ctrl->io_wq)
               ^~~~~~~~~~~~
   drivers/nvme/host/nvme-debug.c:804:17: note: uninitialized use occurs here
           return ERR_PTR(r);
                          ^
   drivers/nvme/host/nvme-debug.c:758:2: note: remove the 'if' if its condition is always false
           if (!ctrl->io_wq)
           ^~~~~~~~~~~~~~~~~
   drivers/nvme/host/nvme-debug.c:754:6: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!ctrl->admin_wq)
               ^~~~~~~~~~~~~~~
   drivers/nvme/host/nvme-debug.c:804:17: note: uninitialized use occurs here
           return ERR_PTR(r);
                          ^
   drivers/nvme/host/nvme-debug.c:754:2: note: remove the 'if' if its condition is always false
           if (!ctrl->admin_wq)
           ^~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/nvme-debug.c:738:7: note: initialize the variable 'r' to silence this warning
           int r;
                ^
                 = 0
   4 warnings generated.


vim +/nvme_debug_reg_read64 +148 drivers/nvme/host/nvme-debug.c

   147	
 > 148	int nvme_debug_reg_read64(struct nvme_ctrl *nctrl, u32 off, u64 *val)
   149	{
   150		switch (off) {
   151			case NVME_REG_CAP: {
   152				*val = (1ULL << 0) | (1ULL << 37);
   153				break;
   154			}
   155			default: {
   156				printk("nvme_debug_reg_read64: %x\n", off);
   157				return -ENOSYS;
   158			}
   159		}
   160		return 0;
   161	}
   162	
 > 163	int nvme_debug_reg_write32(struct nvme_ctrl *nctrl, u32 off, u32 val)
   164	{
   165		struct nvme_debug_ctrl *ctrl = to_debug_ctrl(nctrl);
   166		switch (off) {
   167			case NVME_REG_CC: {
   168				ctrl->reg_cc = val;
   169				break;
   170			}
   171			default: {
   172				printk("nvme_debug_reg_write32: %x, %x\n", off, val);
   173				return -ENOSYS;
   174			}
   175		}
   176		return 0;
   177	}
   178	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
