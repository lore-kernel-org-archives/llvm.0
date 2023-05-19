Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3247472;
	Fri, 19 May 2023 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684492931; x=1716028931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwrw2O0CqzHPAgpSKiKFwvRjhkbA86gWP8t7USzkjto=;
  b=RvN9grou+GS4HJLJZMtyKS7d4r6V3Zy2xqrcdXwllaZ4Qyg05qUu8Jdh
   aigduTcdbyf2w2TFzpFZdbv5ml2BZm6VRKRjOXT7tAQO/S26syO1gbFPa
   WDDHMYyDwijyy0pnww9TH4Y5S86RtQSeds4HjcsYO2FoJaixSZyBQdWHK
   M83X3ttmidloynI18w7WkcAFdrJfSEfgUlGpukKZSnTDafIWWP/M3K1rH
   oollBVG4Z90RQG0gjxxZf5nlQ/OQPj+WfsV2CFaZPUmfEsQvSKxW+BwMN
   Vq/h4/TXSQnWQB6kIxIs8WRMu5Bje+SZzGjj8lEUspY7NEtsXlnhHXuJD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="332704855"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="332704855"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 03:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="680011208"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="680011208"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 May 2023 03:42:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzxYk-000AmW-2C;
	Fri, 19 May 2023 10:42:06 +0000
Date: Fri, 19 May 2023 18:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-raid@vger.kernel.org
Subject: [song-md:module_alloc_test 5/6] arch/powerpc/kernel/module.c:108:8:
 error: unused variable 'ptr'
Message-ID: <202305191808.4xsaLKSZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Song,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git module_alloc_test
head:   7b05e9e4784401342805814b52f3dab621fdb1d1
commit: d4dbd22faf1717ce798327b60fc98cd5b7628ec8 [5/6] powerpc/module: use module_alloc_type
config: powerpc-mpc836x_rdk_defconfig (https://download.01.org/0day-ci/archive/20230519/202305191808.4xsaLKSZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/commit/?id=d4dbd22faf1717ce798327b60fc98cd5b7628ec8
        git remote add song-md git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git
        git fetch --no-tags song-md module_alloc_test
        git checkout d4dbd22faf1717ce798327b60fc98cd5b7628ec8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191808.4xsaLKSZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/module.c:108:8: error: unused variable 'ptr' [-Werror,-Wunused-variable]
           void *ptr = NULL;
                 ^
   1 error generated.


vim +/ptr +108 arch/powerpc/kernel/module.c

d4dbd22faf1717 Song Liu         2023-05-17   98  
d4dbd22faf1717 Song Liu         2023-05-17   99  void __init module_alloc_type_init(struct mod_allocators *allocators)
2ec13df167040c Christophe Leroy 2021-04-01  100  {
4fcc636615b1a3 Jordan Niethe    2021-06-09  101  	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
d4dbd22faf1717 Song Liu         2023-05-17  102  	struct mod_alloc_params *params = &powerpc_mod_type_allocator.params;
d4dbd22faf1717 Song Liu         2023-05-17  103  	struct vmalloc_params *vmp = &params->vmp[0];
d4dbd22faf1717 Song Liu         2023-05-17  104  	int i;
4fcc636615b1a3 Jordan Niethe    2021-06-09  105  
8abddd968a303d Nicholas Piggin  2021-05-03  106  #ifdef MODULES_VADDR
2ec13df167040c Christophe Leroy 2021-04-01  107  	unsigned long limit = (unsigned long)_etext - SZ_32M;
2ec13df167040c Christophe Leroy 2021-04-01 @108  	void *ptr = NULL;

:::::: The code at line 108 was first introduced by commit
:::::: 2ec13df167040cd153c25c4d96d0ffc573ac4c40 powerpc/modules: Load modules closer to kernel text

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
