Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617201840
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649706403; x=1681242403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qd8xB8/pQWpvGflrqWIresaz99YocN5UGfgkrUCN3eg=;
  b=Mno5uUojsxBUBDT2t80P/RXKdMVXNaPywMwuae5AK9FNCiDiaRY2OgNm
   4bWuEbhAlpQAg4Il2zK5g/FvV0xW2EntfouwzqShvehF8CAY8G6iHvtNj
   4SM9ccfX4V6wDebDHmcitgXUdpm86nJtu57cZ2nAdF3jOUM+KDUOgqNzL
   33egVrzSODQlYL7Ftz1sIWZxk7IBgcYERyoOpfTw9k92aefF3EvPS5wT3
   w+TrsoP3ZjfLKPwtdR7yw8gbUgP1+9yJh8zAaD8IpB/EH/aA6N9Zis660
   3dpNWvs92eeYyt081aDcnDcpybgQeBHr5bLxT1Lm/kE8jAX+C2P81/HVo
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249484171"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="249484171"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 12:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="660183146"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2022 12:46:41 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndzzl-00027u-2H;
	Mon, 11 Apr 2022 19:46:41 +0000
Date: Tue, 12 Apr 2022 03:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/4] mptcp: never shrink offered window
Message-ID: <202204120334.WqEBThyK-lkp@intel.com>
References: <ab1fd2897c57a50d7580950dbe6fb58006c04253.1649672265.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab1fd2897c57a50d7580950dbe6fb58006c04253.1649672265.git.pabeni@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Paolo,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mptcp/export]
[also build test ERROR on linus/master v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/mptcp-improve-mptcp-level-window-tracking/20220411-184144
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
config: arm-buildonly-randconfig-r006-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120334.WqEBThyK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/4cd25cbca4acc18a428817e9b1adc5ddd131422b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paolo-Abeni/mptcp-improve-mptcp-level-window-tracking/20220411-184144
        git checkout 4cd25cbca4acc18a428817e9b1adc5ddd131422b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   net/mptcp/options.c:554:21: warning: parameter 'remaining' set but not used [-Wunused-but-set-parameter]
                                             unsigned int remaining,
                                                          ^
   In file included from net/mptcp/options.c:9:
   In file included from include/linux/kernel.h:22:
   In file included from include/linux/bitops.h:33:
   In file included from arch/arm/include/asm/bitops.h:243:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
>> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
   "1:     ldrexd          %1, %H1, [%3]\n"
   ^
   <inline asm>:1:5: note: instantiated into assembly here
           1:      ldrexd          r8, r9, [r11]
                   ^
   In file included from net/mptcp/options.c:9:
   In file included from include/linux/kernel.h:22:
   In file included from include/linux/bitops.h:33:
   In file included from arch/arm/include/asm/bitops.h:243:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
   arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
   "       strexd          %0, %5, %H5, [%3]\n"
    ^
   <inline asm>:5:2: note: instantiated into assembly here
           strexd          r0, r4, r5, [r11]
           ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on HAS_IOMEM && DRM && MMU
   Selected by
   - DRM_SSD130X && HAS_IOMEM && DRM


vim +254 arch/arm/include/asm/cmpxchg.h

e001bbae7147b1 Russell King 2015-05-26  243  
2523c67bb6962f Will Deacon  2013-10-09  244  static inline unsigned long long __cmpxchg64(unsigned long long *ptr,
2523c67bb6962f Will Deacon  2013-10-09  245  					     unsigned long long old,
2523c67bb6962f Will Deacon  2013-10-09  246  					     unsigned long long new)
2523c67bb6962f Will Deacon  2013-10-09  247  {
2523c67bb6962f Will Deacon  2013-10-09  248  	unsigned long long oldval;
2523c67bb6962f Will Deacon  2013-10-09  249  	unsigned long res;
2523c67bb6962f Will Deacon  2013-10-09  250  
c32ffce0f66e5d Will Deacon  2014-02-21  251  	prefetchw(ptr);
c32ffce0f66e5d Will Deacon  2014-02-21  252  
2523c67bb6962f Will Deacon  2013-10-09  253  	__asm__ __volatile__(
2523c67bb6962f Will Deacon  2013-10-09 @254  "1:	ldrexd		%1, %H1, [%3]\n"
2523c67bb6962f Will Deacon  2013-10-09  255  "	teq		%1, %4\n"
2523c67bb6962f Will Deacon  2013-10-09  256  "	teqeq		%H1, %H4\n"
2523c67bb6962f Will Deacon  2013-10-09  257  "	bne		2f\n"
2523c67bb6962f Will Deacon  2013-10-09  258  "	strexd		%0, %5, %H5, [%3]\n"
2523c67bb6962f Will Deacon  2013-10-09  259  "	teq		%0, #0\n"
2523c67bb6962f Will Deacon  2013-10-09  260  "	bne		1b\n"
2523c67bb6962f Will Deacon  2013-10-09  261  "2:"
2523c67bb6962f Will Deacon  2013-10-09  262  	: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
2523c67bb6962f Will Deacon  2013-10-09  263  	: "r" (ptr), "r" (old), "r" (new)
2523c67bb6962f Will Deacon  2013-10-09  264  	: "cc");
2523c67bb6962f Will Deacon  2013-10-09  265  
2523c67bb6962f Will Deacon  2013-10-09  266  	return oldval;
2523c67bb6962f Will Deacon  2013-10-09  267  }
2523c67bb6962f Will Deacon  2013-10-09  268  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
