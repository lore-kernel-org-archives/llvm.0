Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150DE7A
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 00:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657239197; x=1688775197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kHhNQQ1pcG1319c7Uxr7FzaMzLB0M5407ND+aU7n/Ps=;
  b=XboNjmbSuVDZaGaPnILj2JAATgTZfnHS3iCzsBh0O7DFaDecZZYOdmsG
   58bLn2RD1kHgvwqSRWkJn/x8aAFM+kfDgPaR/u/pv2JrlzYgH59/JaBQ8
   6qkxl13M/UTcgevyPteeBZKdrr+jc401vHkEFrMC4KSYp9N7nULasXwei
   wrjeUcR3I3fBC1s59KuGftqpSD+cyNdSOJUQA4fJ68QW+pQscFdTLlEOq
   CHD5uFM9QuJXiB+4c7kUt+3wOdt3MoZra4+1QT+sqCbumJRcMWZQz6SHu
   GCd31Kt3i66uEVdYl2DiORqbIny3M5Fc4LPwqFPjOHw/XPWlSD3EH4Op3
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="281698772"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="281698772"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 17:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="920794538"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jul 2022 17:13:13 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9bcO-000Mec-St;
	Fri, 08 Jul 2022 00:13:12 +0000
Date: Fri, 8 Jul 2022 08:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [arnd-asm-generic:asm-generic-fixes 1/1] kernel/resource.c:1124:6:
 error: call to undeclared function 'devmem_is_allowed'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202207080855.lobMzAgr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git asm-generic-fixes
head:   cdfde8f61a004fa5797d40581077603c142adca1
commit: cdfde8f61a004fa5797d40581077603c142adca1 [1/1] asm-generic: correct reference to GENERIC_LIB_DEVMEM_IS_ALLOWED
config: arm-buildonly-randconfig-r003-20220707 (https://download.01.org/0day-ci/archive/20220708/202207080855.lobMzAgr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=cdfde8f61a004fa5797d40581077603c142adca1
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic asm-generic-fixes
        git checkout cdfde8f61a004fa5797d40581077603c142adca1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/resource.c:1124:6: error: call to undeclared function 'devmem_is_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (devmem_is_allowed(PHYS_PFN(res->start)) &&
               ^
   1 error generated.


vim +/devmem_is_allowed +1124 kernel/resource.c

71a1d8ed900f8c Daniel Vetter 2020-11-27  1102  
71a1d8ed900f8c Daniel Vetter 2020-11-27  1103  #ifdef CONFIG_IO_STRICT_DEVMEM
71a1d8ed900f8c Daniel Vetter 2020-11-27  1104  static void revoke_iomem(struct resource *res)
71a1d8ed900f8c Daniel Vetter 2020-11-27  1105  {
71a1d8ed900f8c Daniel Vetter 2020-11-27  1106  	/* pairs with smp_store_release() in iomem_init_inode() */
71a1d8ed900f8c Daniel Vetter 2020-11-27  1107  	struct inode *inode = smp_load_acquire(&iomem_inode);
71a1d8ed900f8c Daniel Vetter 2020-11-27  1108  
71a1d8ed900f8c Daniel Vetter 2020-11-27  1109  	/*
71a1d8ed900f8c Daniel Vetter 2020-11-27  1110  	 * Check that the initialization has completed. Losing the race
71a1d8ed900f8c Daniel Vetter 2020-11-27  1111  	 * is ok because it means drivers are claiming resources before
71a1d8ed900f8c Daniel Vetter 2020-11-27  1112  	 * the fs_initcall level of init and prevent iomem_get_mapping users
71a1d8ed900f8c Daniel Vetter 2020-11-27  1113  	 * from establishing mappings.
71a1d8ed900f8c Daniel Vetter 2020-11-27  1114  	 */
71a1d8ed900f8c Daniel Vetter 2020-11-27  1115  	if (!inode)
71a1d8ed900f8c Daniel Vetter 2020-11-27  1116  		return;
71a1d8ed900f8c Daniel Vetter 2020-11-27  1117  
71a1d8ed900f8c Daniel Vetter 2020-11-27  1118  	/*
71a1d8ed900f8c Daniel Vetter 2020-11-27  1119  	 * The expectation is that the driver has successfully marked
71a1d8ed900f8c Daniel Vetter 2020-11-27  1120  	 * the resource busy by this point, so devmem_is_allowed()
71a1d8ed900f8c Daniel Vetter 2020-11-27  1121  	 * should start returning false, however for performance this
71a1d8ed900f8c Daniel Vetter 2020-11-27  1122  	 * does not iterate the entire resource range.
71a1d8ed900f8c Daniel Vetter 2020-11-27  1123  	 */
71a1d8ed900f8c Daniel Vetter 2020-11-27 @1124  	if (devmem_is_allowed(PHYS_PFN(res->start)) &&
71a1d8ed900f8c Daniel Vetter 2020-11-27  1125  	    devmem_is_allowed(PHYS_PFN(res->end))) {
71a1d8ed900f8c Daniel Vetter 2020-11-27  1126  		/*
71a1d8ed900f8c Daniel Vetter 2020-11-27  1127  		 * *cringe* iomem=relaxed says "go ahead, what's the
71a1d8ed900f8c Daniel Vetter 2020-11-27  1128  		 * worst that can happen?"
71a1d8ed900f8c Daniel Vetter 2020-11-27  1129  		 */
71a1d8ed900f8c Daniel Vetter 2020-11-27  1130  		return;
71a1d8ed900f8c Daniel Vetter 2020-11-27  1131  	}
71a1d8ed900f8c Daniel Vetter 2020-11-27  1132  
71a1d8ed900f8c Daniel Vetter 2020-11-27  1133  	unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
71a1d8ed900f8c Daniel Vetter 2020-11-27  1134  }
71a1d8ed900f8c Daniel Vetter 2020-11-27  1135  #else
71a1d8ed900f8c Daniel Vetter 2020-11-27  1136  static void revoke_iomem(struct resource *res) {}
71a1d8ed900f8c Daniel Vetter 2020-11-27  1137  #endif
71a1d8ed900f8c Daniel Vetter 2020-11-27  1138  

:::::: The code at line 1124 was first introduced by commit
:::::: 71a1d8ed900f8cf53151beff17e3e2ff8e9283a1 resource: Move devmem revoke code to resource framework

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
