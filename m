Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA220E0
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 02:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650074925; x=1681610925;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+SozWAuTRn8n3WTieTjLdS8h9WtL6mOTm5voWPcp+Zk=;
  b=cCg7hXS50S+jbEsJ6ZwN69mmVUTNEmsfKsH7Gh7pNlr9AmJPIhAn9yML
   9Ys7AwjVqehmf9xb9Y/YUS7Z75NyTK3N51b2U+ZJAat4kDsWdM6vY0CdU
   HASzmbXuTkQT4+ISZ9GtyVdXqcdkZ/vl1jjdAR5FTRkMjQNldGxMWvZeo
   4+z/qIL64t3etdjxFpaD135Hy2QXS6kt9sTNckOTBOxqZxxEnhYSQay5D
   EEWj1B3Zl7+wiu1eXS7Djqqp177CG3iP7Eg/hDVBVvrA+3f+Bm0Y5B9Wm
   AAkNXzAJ/GRre2s1cA+yQ1KKsWu1/umTQncwGai91oltyqKA+oWFG9z5a
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="323702073"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="323702073"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 19:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="509140142"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Apr 2022 19:08:43 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfXrf-0002f3-3k;
	Sat, 16 Apr 2022 02:08:43 +0000
Date: Sat, 16 Apr 2022 10:07:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 248/711] include/linux/fortify-string.h:187:4:
 error: call to __read_overflow2 declared with 'error' attribute: detected
 read beyond size of object passed as 2nd parameter
Message-ID: <202204160956.OFscVu9U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx master
head:   0b70857ca66da7d471f5c17d1af67a2af273a960
commit: 9b62852ec04b7d48971ce8016b13c27403929908 [248/711] Merge tag 'v5.15' into master
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220416/202204160956.OFscVu9U-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8e43cbab33765c476337571e5ed11b005199dd0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9b62852ec04b7d48971ce8016b13c27403929908
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 9b62852ec04b7d48971ce8016b13c27403929908
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2652:5: warning: no previous prototype for function 'axienet_ethtools_sset_count' [-Wmissing-prototypes]
   int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
   ^
   static 
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2675:6: warning: no previous prototype for function 'axienet_ethtools_get_stats' [-Wmissing-prototypes]
   void axienet_ethtools_get_stats(struct net_device *ndev,
        ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2675:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void axienet_ethtools_get_stats(struct net_device *ndev,
   ^
   static 
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2702:6: warning: no previous prototype for function 'axienet_ethtools_strings' [-Wmissing-prototypes]
   void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
        ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2702:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
   ^
   static 
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:25:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:14:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:10:
   In file included from include/linux/string.h:262:
>> include/linux/fortify-string.h:187:4: error: call to __read_overflow2 declared with 'error' attribute: detected read beyond size of object passed as 2nd parameter
                           __read_overflow2();
                           ^
   3 warnings and 1 error generated.


vim +/error +187 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  177  
a28a6e860c6cf2 Francis Laniel 2021-02-25  178  __FORTIFY_INLINE void *memcpy(void *p, const void *q, __kernel_size_t size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  179  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  180  	size_t p_size = __builtin_object_size(p, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  181  	size_t q_size = __builtin_object_size(q, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  182  
a28a6e860c6cf2 Francis Laniel 2021-02-25  183  	if (__builtin_constant_p(size)) {
a28a6e860c6cf2 Francis Laniel 2021-02-25  184  		if (p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  185  			__write_overflow();
a28a6e860c6cf2 Francis Laniel 2021-02-25  186  		if (q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25 @187  			__read_overflow2();
a28a6e860c6cf2 Francis Laniel 2021-02-25  188  	}
a28a6e860c6cf2 Francis Laniel 2021-02-25  189  	if (p_size < size || q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  190  		fortify_panic(__func__);
a28a6e860c6cf2 Francis Laniel 2021-02-25  191  	return __underlying_memcpy(p, q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  192  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  193  

:::::: The code at line 187 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
