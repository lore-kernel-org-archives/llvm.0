Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75633AD5A;
	Fri,  3 Feb 2023 19:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675452451; x=1706988451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TlnwnUNnPDkhRxsRxl/uwnOTxMCzf9zIUPAEbKkZG4k=;
  b=UxB5VeSMckKPq0H1QuM0q+K0nFyq+QuT3cHBaAoUThEheXOG3WtfCXQS
   aFQ9c7h1aTFcpzEs2xQEtQhmx3RIvxXMoraw8Tvmf7eE9rokgnzGmaWi2
   OEBj/t+Ybdxlk+SHebX1xaqBXDDNCLfDOv6+JTySsRmkOs/HONUri8BIH
   I+UmETGGobXxyzpO2cY163s5kgZs7PgmcjnHAsQFyaH6y+AZZGsLoJDd2
   4/bGoUR+3xUROlKA+7fQPjzcQQUdEbRY4Fi3RYPH/R67/ojmqIalvLNbW
   FmIBQHuozd9fVYcrMfORHlHRif1Ei/h/3zx4GKlBrc5STTmR7D9fftAPb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328849854"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="328849854"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 11:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911256533"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="911256533"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2023 11:27:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO1iK-0000ij-2d;
	Fri, 03 Feb 2023 19:27:12 +0000
Date: Sat, 4 Feb 2023 03:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-raid@vger.kernel.org
Subject: [song-md:new_module_alloc_build_test 1/1]
 arch/arm64/kernel/module-plts.c:70:28: error: incompatible pointer to
 integer conversion passing 'void *' to parameter of type 'unsigned long'
Message-ID: <202302040305.Oqcm80Vb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git new_module_alloc_build_test
head:   6231a21c672da8ce79a614c9a286285844e41ef3
commit: 6231a21c672da8ce79a614c9a286285844e41ef3 [1/1] module: replace module_layout with module_memory
config: arm64-buildonly-randconfig-r005-20230204 (https://download.01.org/0day-ci/archive/20230204/202302040305.Oqcm80Vb-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/commit/?id=6231a21c672da8ce79a614c9a286285844e41ef3
        git remote add song-md git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git
        git fetch --no-tags song-md new_module_alloc_build_test
        git checkout 6231a21c672da8ce79a614c9a286285844e41ef3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/module-plts.c:70:28: error: incompatible pointer to integer conversion passing 'void *' to parameter of type 'unsigned long' [-Wint-conversion]
           return within_module_init(loc, mod);
                                     ^~~
   include/linux/module.h:622:53: note: passing argument to parameter 'addr' here
   static inline bool within_module_init(unsigned long addr,
                                                       ^
   arch/arm64/kernel/module-plts.c:291:5: warning: no previous prototype for function 'module_frob_arch_sections' [-Wmissing-prototypes]
   int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
       ^
   arch/arm64/kernel/module-plts.c:291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
   ^
   static 
   1 warning and 1 error generated.


vim +70 arch/arm64/kernel/module-plts.c

    67	
    68	static bool in_init(const struct module *mod, void *loc)
    69	{
  > 70		return within_module_init(loc, mod);
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
