Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE729CA
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 03:39:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="235352013"
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="235352013"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 19:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="609823913"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Dec 2021 19:39:01 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mscw1-000FmU-7y; Thu, 02 Dec 2021 03:39:01 +0000
Date: Thu, 2 Dec 2021 11:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arnd-playground:randconfig-5.16-min 83/191]
 drivers/gpu/drm/i915/i915_pci.c:35:22: error: expected parameter declarator
Message-ID: <202112021105.QvF3rmir-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-5.16-min
head:   7a16665b8fd19f170c0c15f1432c90e4750183f2
commit: 0f359885da8dfb90049605154752c25fe29c3631 [83/191] global: -Woverride-init warnings
config: x86_64-randconfig-a002-20211128 (https://download.01.org/0day-ci/archive/20211202/202112021105.QvF3rmir-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=0f359885da8dfb90049605154752c25fe29c3631
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-5.16-min
        git checkout 0f359885da8dfb90049605154752c25fe29c3631
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the arnd-playground/randconfig-5.16-min HEAD 7a16665b8fd19f170c0c15f1432c90e4750183f2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_pci.c:35:22: error: expected parameter declarator
   __diag_ignore(CLANG, 9, "-Winitializer-overrides", "features all override one another")
                        ^
>> drivers/gpu/drm/i915/i915_pci.c:35:22: error: expected ')'
   drivers/gpu/drm/i915/i915_pci.c:35:1: note: to match this '('
   __diag_ignore(CLANG, 9, "-Winitializer-overrides", "features all override one another")
   ^
   include/linux/compiler_types.h:361:21: note: expanded from macro '__diag_ignore'
           __diag_ ## compiler(version, ignore, option)
                              ^
   drivers/gpu/drm/i915/i915_pci.c:35:1: warning: declaration specifier missing, defaulting to 'int'
   __diag_ignore(CLANG, 9, "-Winitializer-overrides", "features all override one another")
   ^
   int
   include/linux/compiler_types.h:361:2: note: expanded from macro '__diag_ignore'
           __diag_ ## compiler(version, ignore, option)
           ^
   <scratch space>:118:1: note: expanded from here
   __diag_CLANG
   ^
>> drivers/gpu/drm/i915/i915_pci.c:35:1: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
   include/linux/compiler_types.h:361:21: note: expanded from macro '__diag_ignore'
           __diag_ ## compiler(version, ignore, option)
                              ^
>> drivers/gpu/drm/i915/i915_pci.c:35:88: error: expected ';' after top level declarator
   __diag_ignore(CLANG, 9, "-Winitializer-overrides", "features all override one another")
                                                                                          ^
                                                                                          ;
   1 warning and 4 errors generated.


vim +35 drivers/gpu/drm/i915/i915_pci.c

    32	
    33	
    34	__diag_ignore(GCC, 8, "-Woverride-init", "features all override one another")
  > 35	__diag_ignore(CLANG, 9, "-Winitializer-overrides", "features all override one another")
    36	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
