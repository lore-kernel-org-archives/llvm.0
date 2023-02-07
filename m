Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD63C3B;
	Tue,  7 Feb 2023 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675796377; x=1707332377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Mp6NMgwj0IL6KwFesw0L/HixzVcJnlIbK4zO/yOc6o=;
  b=TzBFZZ0ZRZydZlTYHUFLK55PdOnL9o+adfr/ebq2ZitoVpkZ3jPdkMC3
   isZLKcvo+GUOSLUK8O2N7FdSnF4Ha0SxnhNFPbJr+Hp+jZmSXCAF1S4/R
   DgEjwOFSRqycyqfEYDEyjFPKb4OAADZBQPsp80tpSDsLsa1nemYc0wsPg
   JH36Ou6wsD6vm5WV745N2RrGUrd4rBetP+5jlUPQTubB8y5xdWfl0zghM
   TCNe/eZ/8pIYKwTOVhdveUsqxmudl5vfLxdTyCEYv73EBpg18VnRXwr2b
   /TRDaw9/30kDep/R3VMVrwLSYwCY+oWEzkxKl4kqIcVMA4UYOzRQZBE8I
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415817701"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="415817701"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 10:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="755729481"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="755729481"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2023 10:59:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPTBf-0003nI-2Y;
	Tue, 07 Feb 2023 18:59:27 +0000
Date: Wed, 8 Feb 2023 02:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Mark Zhang <markzhang@nvidia.com>
Subject: include/linux/fortify-string.h:414:4: error: call to
 '__read_overflow' declared with 'error' attribute: detected read beyond size
 of object (1st parameter)
Message-ID: <202302080231.ZqOmpanX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
commit: 925d046e7e52c71c3531199ce137e141807ef740 RDMA/core: Add a netevent notifier to cma
date:   8 months ago
config: mips-buildonly-randconfig-r006-20230207 (https://download.01.org/0day-ci/archive/20230208/202302080231.ZqOmpanX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=925d046e7e52c71c3531199ce137e141807ef740
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 925d046e7e52c71c3531199ce137e141807ef740
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/infiniband/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/core/cma.c:9:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:55:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/mips/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:15:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:253:
>> include/linux/fortify-string.h:414:4: error: call to '__read_overflow' declared with 'error' attribute: detected read beyond size of object (1st parameter)
                           __read_overflow();
                           ^
   1 error generated.


vim +414 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  405  
92df138a8d663c Kees Cook      2022-02-08  406  __FORTIFY_INLINE __diagnose_as(__builtin_memcmp, 1, 2, 3)
281d0c962752fb Kees Cook      2022-02-08  407  int memcmp(const void * const POS0 p, const void * const POS0 q, __kernel_size_t size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  408  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  409  	size_t p_size = __builtin_object_size(p, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  410  	size_t q_size = __builtin_object_size(q, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  411  
a28a6e860c6cf2 Francis Laniel 2021-02-25  412  	if (__builtin_constant_p(size)) {
a28a6e860c6cf2 Francis Laniel 2021-02-25  413  		if (p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25 @414  			__read_overflow();
a28a6e860c6cf2 Francis Laniel 2021-02-25  415  		if (q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  416  			__read_overflow2();
a28a6e860c6cf2 Francis Laniel 2021-02-25  417  	}
a28a6e860c6cf2 Francis Laniel 2021-02-25  418  	if (p_size < size || q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  419  		fortify_panic(__func__);
a28a6e860c6cf2 Francis Laniel 2021-02-25  420  	return __underlying_memcmp(p, q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  421  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  422  

:::::: The code at line 414 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
