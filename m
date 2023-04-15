Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D405D7E6;
	Sat, 15 Apr 2023 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681526888; x=1713062888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sM7vnxGO0JlIrDHTr4WGoz7ijUGd6xwPhvYPaZ+lue8=;
  b=ZQMWpiFGfihilhXrpmWcB1sfJmSjiczXTEaqbBe8fgblDVVf01R6YUG5
   qVTwZ1Ohnx5i21hVHqKGceF9CjpFSlBFgTUhGx4k5Dl6TgQ/4+z9IcKrF
   BwMwt3tehQVGlRVO0JTTni/xjSSByQ7jiNicT2ZaOo0IOdAnPF1pfKiBs
   ULEx6yMeKlZbzw8VWKYvVhTsUUqr6U5WcHs6mto2jXNcIlTO/+9AZX8m8
   zumN3ZIHJ937mp+gb6b+1hyhp3ddKVRK8b/g76cRKYlqgjBMrjrprgws4
   iolpuL2PMcWDeBnuB0qqhCaFoJCb1kvX4gs4zwcPiRnrLxouU/kytGsTB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343364796"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="343364796"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 19:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722661550"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="722661550"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 19:48:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnVxN-000aKd-1v;
	Sat, 15 Apr 2023 02:48:05 +0000
Date: Sat, 15 Apr 2023 10:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-debug 7/7] check.c:195:9: error: 'NORETURN' macro
 redefined
Message-ID: <202304151033.a3vocLqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-debug
head:   76a9aa0c13243fc9452dc79184f457791c872a8c
commit: 76a9aa0c13243fc9452dc79184f457791c872a8c [7/7] objtool: Move list of noreturn functions to separate file
config: x86_64-randconfig-r033-20230410 (https://download.01.org/0day-ci/archive/20230415/202304151033.a3vocLqU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=76a9aa0c13243fc9452dc79184f457791c872a8c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-debug
        git checkout 76a9aa0c13243fc9452dc79184f457791c872a8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151033.a3vocLqU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:195:9: error: 'NORETURN' macro redefined [-Werror,-Wmacro-redefined]
   #define NORETURN(func) "\"" __stringify(func) "\"",
           ^
   tools/objtool/libsubcmd/include/subcmd/parse-options.h:10:9: note: previous definition is here
   #define NORETURN __attribute__((__noreturn__))
           ^
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/check.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile:66: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1440: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
