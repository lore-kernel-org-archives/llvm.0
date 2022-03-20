Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B73FE6
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647795812; x=1679331812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4KLxCogkaJgL1I4Qp9As2MeVvJ0l1Sntjslo9WZHLMA=;
  b=WBlHF88RwBg87Mqb7n9J5gyZARSTRgVPUj/+1JR02XKQAYh1Nnl7kZco
   5BXoEVF5bM3ywl2HA2EdoXVMQcW0BAhp1UkCCA8ZxUsJpDIUn4q3z4fZj
   ZaD0Y0FkOzVtc65u+77n5FchjbuGjTgTsxjcDAMuLpg7UZOvTc8RO7F1n
   LMFZmwUgCDe7c5OrNOGumDQieT912GmDbeFycCqGoN1+QC1mGHkrsMxe0
   jQ6IN89C21Thd5m9qWt9abj3h70ZjNurcCHSmLLznMLZZm7WC9gxKbws/
   SG38+6TGGp5pZ2ZS41oomkoNWxXkdiQ4hWXterF8bb0a7n3dWoQL8KihZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="238017911"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="238017911"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 10:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="823848173"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2022 10:03:31 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVyxm-000H6P-FY; Sun, 20 Mar 2022 17:03:30 +0000
Date: Mon, 21 Mar 2022 01:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ardb:efi-psci 2/2] drivers/firmware/psci/psci.c:152:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202203210042.UJZ5llHd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-psci
head:   4b8d4b95fbd43459a4b0ae3f9020a912f7621884
commit: 4b8d4b95fbd43459a4b0ae3f9020a912f7621884 [2/2] efi: arm: implement PSCI method backed by EFI runtime code
config: arm64-randconfig-r022-20220320 (https://download.01.org/0day-ci/archive/20220321/202203210042.UJZ5llHd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=4b8d4b95fbd43459a4b0ae3f9020a912f7621884
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-psci
        git checkout 4b8d4b95fbd43459a4b0ae3f9020a912f7621884
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/firmware/psci/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/firmware/psci/psci.c:152:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/firmware/psci/psci.c:152:2: note: insert '__attribute__((fallthrough));' to silence this warning
           default:
           ^
           __attribute__((fallthrough)); 
   drivers/firmware/psci/psci.c:152:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   drivers/firmware/psci/psci.c:94:20: warning: unused function 'psci_power_state_loses_context' [-Wunused-function]
   static inline bool psci_power_state_loses_context(u32 state)
                      ^
   2 warnings generated.


vim +152 drivers/firmware/psci/psci.c

   131	
   132	static unsigned long __invoke_psci_fn_efi(unsigned long function_id,
   133				unsigned long arg0, unsigned long arg1,
   134				unsigned long arg2)
   135	{
   136		unsigned long flags, ret;
   137	
   138		switch (function_id) {
   139		case PSCI_0_2_FN_PSCI_VERSION:
   140			return PSCI_VERSION(0, 2);
   141		case PSCI_0_2_FN_MIGRATE_INFO_TYPE:
   142			return PSCI_0_2_TOS_MP;
   143		case PSCI_0_2_FN_CPU_SUSPEND:
   144		case PSCI_0_2_FN_CPU_OFF:
   145		case PSCI_0_2_FN_CPU_ON:
   146		case PSCI_0_2_FN_AFFINITY_INFO:
   147		case PSCI_0_2_FN64_CPU_SUSPEND:
   148		case PSCI_0_2_FN64_CPU_ON:
   149		case PSCI_0_2_FN64_AFFINITY_INFO:
   150			if (WARN_ON_ONCE(!efi_psci.psci_handler ||
   151					 !efi_enabled(EFI_RUNTIME_SERVICES)))
 > 152		default:
   153				return PSCI_RET_NOT_SUPPORTED;
   154			break;
   155		}
   156	
   157		raw_local_irq_save(flags);
   158		efi_set_pgd(&efi_mm);
   159	
   160		ret = efi_psci.psci_handler(function_id, arg0, arg1, arg2);
   161	
   162		efi_set_pgd(current->active_mm);
   163		raw_local_irq_restore(flags);
   164	
   165		return ret;
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
