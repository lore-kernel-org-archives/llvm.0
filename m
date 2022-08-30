Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015257C
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661856317; x=1693392317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKlFORyxnWPVtksZ250hmueT/fkq9pSrvO9JbImEhww=;
  b=J+XT8+wRVHRoXzk5ZUck12J9k33ALe0k1kacu5xoKzZ7YLk+v1/A39Qo
   ZVoaPv/SkRUdkufJLSZdpGlBsEEjssA4iT1PgoL2bVhtXujPEOQlbWuaX
   XFyGsWM3tq6RAaLKEDXR4lKbtWE3MVq5U7RCKPVpmAApvl5J10Jjfg5eJ
   QO8juJknCB/WsbI/Bqxf7MRTv2Iqje3LkJQ+lelKmsG+2xB5Qprk876R6
   JQjdnWoHLlasqFabI7N432CMptDwfgaR2AV4+O83JnyuBwygJEb2m0B/1
   P5Ab79Xgh+BmYgiZ0mRp4rYkbRUYD0cikIPQjbUMB/qeQ/1Pq4BHlzaHI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381439096"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="381439096"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 03:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="614568569"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2022 03:45:15 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSyk6-0000CQ-1g;
	Tue, 30 Aug 2022 10:45:14 +0000
Date: Tue, 30 Aug 2022 18:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [avpatel:riscv_sbi_dbcn_v1 9/42] arch/riscv/mm/cacheflush.c:123:6:
 warning: variable 'cbom_hartid' is uninitialized when used here
Message-ID: <202208301804.6NyqVVPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbcn_v1
head:   74814d446b33fc095867181d8953a92ede0b042c
commit: 9a1ab381c3ec9717a3b694fc72fed88b4dde6b91 [9/42] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
config: riscv-randconfig-r042-20220830 (https://download.01.org/0day-ci/archive/20220830/202208301804.6NyqVVPU-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/9a1ab381c3ec9717a3b694fc72fed88b4dde6b91
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_dbcn_v1
        git checkout 9a1ab381c3ec9717a3b694fc72fed88b4dde6b91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/mm/cacheflush.c:123:6: warning: variable 'cbom_hartid' is uninitialized when used here [-Wuninitialized]
                                           cbom_hartid, hartid);
                                           ^~~~~~~~~~~
   include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                              ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/riscv/mm/cacheflush.c:103:18: note: initialize the variable 'cbom_hartid' to silence this warning
                   int cbom_hartid;
                                  ^
                                   = 0
   1 warning generated.


vim +/cbom_hartid +123 arch/riscv/mm/cacheflush.c

    93	
    94	#ifdef CONFIG_RISCV_ISA_ZICBOM
    95	void riscv_init_cbom_blocksize(void)
    96	{
    97		struct device_node *node;
    98		int ret;
    99		u32 val;
   100	
   101		for_each_of_cpu_node(node) {
   102			unsigned long hartid;
   103			int cbom_hartid;
   104	
   105			ret = riscv_of_processor_hartid(node, &hartid);
   106			if (ret)
   107				continue;
   108	
   109			if (hartid < 0)
   110				continue;
   111	
   112			/* set block-size for cbom extension if available */
   113			ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
   114			if (ret)
   115				continue;
   116	
   117			if (!riscv_cbom_block_size) {
   118				riscv_cbom_block_size = val;
   119				cbom_hartid = hartid;
   120			} else {
   121				if (riscv_cbom_block_size != val)
   122					pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
 > 123						cbom_hartid, hartid);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
