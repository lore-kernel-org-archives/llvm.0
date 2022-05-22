Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138F2103
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653208039; x=1684744039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LteJ72TWNsYKXEonDajzghmVGbT4VlhAsqMZEfLzdiQ=;
  b=KhYlxaOksiJ3YLpQwAjXsnTFEP2aRKO06agLix0LEzVZ0e3X3pto5PwG
   ygzxzjMS9jEz9E1I51J9pmX1yknB9X1vDZIMZ6Y9kNRU1jwJSsK5ivl/M
   0kEYgPTHJfjXTgFGCNCOGTquIw52WKnXmoZupuaCXPkJK/NksZDKYG8xC
   LUyz0IMlhK507rO1OCLoOLwd57AVU33Zlkfu/AB5vil2Kq02xPOc09drR
   YpTqiRYUb3Ou7MufkB0Z9+lmWUkHR3lcMdbf8txsphUKBd3bLhkTE8oPA
   GuKzSB9P+4xcYzWjLVDcKz2wFWGELocZ7NuBzWQVv3y2zp2udeE/BxSJp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="255019946"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="255019946"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 01:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="819283116"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 May 2022 01:27:16 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsgvj-0000DH-Ff;
	Sun, 22 May 2022 08:27:15 +0000
Date: Sun, 22 May 2022 16:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ebiggers:crypto-pending 8/9]
 arch/arm64/crypto/polyval-ce-glue.c:187:1: error: redefinition of
 '__inittest'
Message-ID: <202205221607.4vYxE0vQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crypto-pending
head:   22ca50a7cbeef1cde1ea3d99686ad3575bd7d4ed
commit: bfa275a9bb4e16067b9056e8019bd478da798bc9 [8/9] crypto: arm64/polyval: Add PMULL accelerated implementation of POLYVAL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220522/202205221607.4vYxE0vQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b369762beb70dfef22c7e793aed79b94d7dc0757)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/commit/?id=bfa275a9bb4e16067b9056e8019bd478da798bc9
        git remote add ebiggers https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
        git fetch --no-tags ebiggers crypto-pending
        git checkout bfa275a9bb4e16067b9056e8019bd478da798bc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/crypto/polyval-ce-glue.c:187:1: error: redefinition of '__inittest'
   module_init(polyval_ce_mod_init);
   ^
   include/linux/module.h:131:42: note: expanded from macro 'module_init'
           static inline initcall_t __maybe_unused __inittest(void)                \
                                                   ^
   arch/arm64/crypto/polyval-ce-glue.c:185:1: note: previous definition is here
   module_cpu_feature_match(PMULL, polyval_ce_mod_init)
   ^
   include/linux/cpufeature.h:54:10: note: expanded from macro 'module_cpu_feature_match'
   }                                                               \
                                                                   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
           static inline initcall_t __maybe_unused __inittest(void)                \
                                                   ^
>> arch/arm64/crypto/polyval-ce-glue.c:187:1: error: redefinition of 'init_module'
   module_init(polyval_ce_mod_init);
   ^
   include/linux/module.h:133:6: note: expanded from macro 'module_init'
           int init_module(void) __copy(initfn)                    \
               ^
   arch/arm64/crypto/polyval-ce-glue.c:185:1: note: previous definition is here
   module_cpu_feature_match(PMULL, polyval_ce_mod_init)
   ^
   include/linux/cpufeature.h:54:10: note: expanded from macro 'module_cpu_feature_match'
   }                                                               \
                                                                   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
           int init_module(void) __copy(initfn)                    \
               ^
   2 errors generated.


vim +/__inittest +187 arch/arm64/crypto/polyval-ce-glue.c

   186	
 > 187	module_init(polyval_ce_mod_init);
   188	module_exit(polyval_ce_mod_exit);
   189	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
