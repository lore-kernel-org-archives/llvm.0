Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7512172
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 04:40:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="298608230"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="298608230"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 20:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="457322900"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Nov 2021 20:40:30 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mpk57-0004JW-LA; Wed, 24 Nov 2021 04:40:29 +0000
Date: Wed, 24 Nov 2021 12:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mcgrof-next:20211123-sysctl-cleanups 20/41]
 include/linux/sysctl.h:230:13: error: expected ';' after return statement
Message-ID: <202111241209.uMwnv9ST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20211123-sysctl-cleanups
head:   c18add41d859b4feec081eab6cfd624a5642973d
commit: 06d33569add5d71725a727d8da80ce480b06fdec [20/41] sysctl: add helper to register a sysctl mount point
config: hexagon-randconfig-r045-20211123 (https://download.01.org/0day-ci/archive/20211124/202111241209.uMwnv9ST-lkp@intel.com/config.gz)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e3838145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=06d33569add5d71725a727d8da80ce480b06fdec
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20211123-sysctl-cleanups
        git checkout 06d33569add5d71725a727d8da80ce480b06fdec
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /c/kernel-tests/lib/kbuild.sh: line 3321: ulimit: max locked memory: cannot modify limit: Operation not permitted
   error: no override and no default toolchain set
   init/Kconfig:70:warning: 'RUSTC_VERSION': number is invalid
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/cred.h:13:
   In file included from include/linux/key.h:17:
>> include/linux/sysctl.h:230:13: error: expected ';' after return statement
           return NULL
                      ^
                      ;
   1 error generated.
   make[2]: *** [scripts/Makefile.build:122: arch/hexagon/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1284: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +230 include/linux/sysctl.h

   227	
   228	static struct sysctl_header *register_sysctl_mount_point(const char *path)
   229	{
 > 230		return NULL
   231	}
   232	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
