Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC0D3D6E
	for <llvm@lists.linux.dev>; Sat, 27 Aug 2022 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661602257; x=1693138257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E30TlKHyMpVq2+ft4kq1Ob+zQ2NSiPpWjFxEeiQQiiI=;
  b=NEMqNv0BXakeDz0Adu9zXl7bBro99sHapJ2cM+FqRK04rMgumm9ST0gm
   4Rqf+ycKxphbJ72ibr3CgjsGMD7K3nnkdV76ZJhA2ftdMIbczBaAnhkWA
   B4+dynf0onELAVngklum2+zlu7ahaN1NpkpDD9rHXu6TMqcAtjk9q0YRN
   53lyRcp449NdkvesBuZu/r2yoQHau/uvAtvX8/UD3cFGDCE0GWN769A+U
   ikdJsl3MMOzsCNkigb50Cd0omE7GRO+9+arD7mVzuegDw+UObVLwR4UEY
   v8QprpDnFyw+RAWRlwTuszVSB7mYAQycuBu5+cIxfZg6Yp0XJKauPJcTI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="293403037"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="293403037"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2022 05:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="587617855"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2022 05:10:47 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRueE-000099-2n;
	Sat, 27 Aug 2022 12:10:46 +0000
Date: Sat, 27 Aug 2022 20:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [avpatel:riscv_pmem_v1 37/38] arch/riscv/mm/cacheflush.c:100:2:
 error: call to undeclared function 'for_each_of_cpu_node'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202208272028.IwrNZ0Ur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_pmem_v1
head:   cfb27bb3561d70cd5e00b71c5f817b7c4452ae71
commit: 2590647b8e45549f88977f6c2d87b9740e3df722 [37/38] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
config: riscv-randconfig-r042-20220825 (https://download.01.org/0day-ci/archive/20220827/202208272028.IwrNZ0Ur-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100daf12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/2590647b8e45549f88977f6c2d87b9740e3df722
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_pmem_v1
        git checkout 2590647b8e45549f88977f6c2d87b9740e3df722
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/mm/cacheflush.c:100:2: error: call to undeclared function 'for_each_of_cpu_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           for_each_of_cpu_node(node) {
           ^
>> arch/riscv/mm/cacheflush.c:100:28: error: expected ';' after expression
           for_each_of_cpu_node(node) {
                                     ^
                                     ;
>> arch/riscv/mm/cacheflush.c:106:4: error: 'continue' statement not in loop statement
                           continue;
                           ^
   arch/riscv/mm/cacheflush.c:109:4: error: 'continue' statement not in loop statement
                           continue;
                           ^
>> arch/riscv/mm/cacheflush.c:112:9: error: call to undeclared function 'of_property_read_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
                         ^
   arch/riscv/mm/cacheflush.c:114:4: error: 'continue' statement not in loop statement
                           continue;
                           ^
   6 errors generated.


vim +/for_each_of_cpu_node +100 arch/riscv/mm/cacheflush.c

    92	
    93	#ifdef CONFIG_RISCV_ISA_ZICBOM
    94	void riscv_init_cbom_blocksize(void)
    95	{
    96		struct device_node *node;
    97		int ret;
    98		u32 val;
    99	
 > 100		for_each_of_cpu_node(node) {
   101			unsigned long hartid;
   102			int cbom_hartid;
   103	
   104			ret = riscv_of_processor_hartid(node, &hartid);
   105			if (ret)
 > 106				continue;
   107	
   108			if (hartid < 0)
   109				continue;
   110	
   111			/* set block-size for cbom extension if available */
 > 112			ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
