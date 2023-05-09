Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80221990C;
	Tue,  9 May 2023 22:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683671875; x=1715207875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5n6VV0nH8Sd1Fww0nDPfaJiqSwFe3rj7RhAINpuiC0Q=;
  b=J9GynS3Ra6CjNkjM+vQeH/I3cJTZAvtbSlLxIGXo7qQ59KbyMHcSPRq0
   Z9iKBoOvxvyqSD0WS4ZfBwrWmmnN5JJ+Lkk/RWsARqmomGz1LgKaq345f
   HfVtBEoepZUsDxj9OOXzDvCbqmIpejmx+UVqq4KJYzt7asXdsuPWnlZ/y
   /wLKxjtpNz+Lu0M0b4Bz5W4cfj9Ig+28zR96aOLm6ywm36UYIqTZqIrtb
   S1c8gYdWiAXa0th/VMwxHuJz34F79TWvSbgkGv/CqPky2r2M2F4Qd2Ls3
   bKGPqw5ChOj5HZHuJGekKSSnCsD7tQ0LL0BuvqG1xBSb/hubuJYmQFRGb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350100986"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="350100986"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 15:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="676621533"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="676621533"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 May 2023 15:35:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwVw1-0002aW-2P;
	Tue, 09 May 2023 22:35:53 +0000
Date: Wed, 10 May 2023 06:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_perf_snapshot_rfc 5/7]
 drivers/perf/riscv_pmu_sbi.c:500:42: warning: format specifies type 'int'
 but the argument has type 'long'
Message-ID: <202305100606.77rwZJhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_snapshot_rfc
head:   5ae7188de04f861c3f4026005a0ace2cf2575bde
commit: 51adde1839f15db1a4074f7b36eb2dccad7fa534 [5/7] perf: RISC-V: Implement SBI PMU snapshot function
config: riscv-randconfig-r042-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100606.77rwZJhG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/atishp04/linux/commit/51adde1839f15db1a4074f7b36eb2dccad7fa534
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_snapshot_rfc
        git checkout 51adde1839f15db1a4074f7b36eb2dccad7fa534
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/perf/ drivers/usb/dwc3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100606.77rwZJhG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:500:42: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
                   pr_err("%s: ret.error %d\n", __func__, ret.error);
                                         ~~               ^~~~~~~~~
                                         %ld
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +500 drivers/perf/riscv_pmu_sbi.c

   472	
   473	static int pmu_sbi_snapshot_init(struct riscv_pmu *pmu, int cpu)
   474	{
   475		struct page *snapshot_page;
   476		struct cpu_hw_events *cpu_hw_evt;
   477		phys_addr_t snapshot_addr_phys;
   478		struct sbiret ret = {0};
   479	
   480		cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
   481		if (cpu_hw_evt->snapshot_addr)
   482			return 0;
   483	
   484		snapshot_page = alloc_page(GFP_ATOMIC | __GFP_ZERO);
   485		if (!snapshot_page) {
   486			pmu_sbi_snapshot_deinit(pmu);
   487			return -ENOMEM;
   488		}
   489		cpu_hw_evt->snapshot_addr = page_to_virt(snapshot_page);
   490		snapshot_addr_phys = page_to_phys(snapshot_page);
   491	#if defined(CONFIG_32BIT)
   492		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_ENABLE_SNAPSHOT, (unsigned long)snapshot_addr_phys,
   493				 (u64)(snapshot_addr_phys) >> 32, 0, 0, 0, 0);
   494	#else
   495		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_ENABLE_SNAPSHOT, (unsigned long)snapshot_addr_phys,
   496				0, 0, 0, 0, 0);
   497	#endif
   498		/* Free up the snapshot area memory and fall back to default SBI */
   499		if (ret.error) {
 > 500			pr_err("%s: ret.error %d\n", __func__, ret.error);
   501			pmu_sbi_snapshot_deinit(pmu);
   502		}
   503	
   504		return 0;
   505	}
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
