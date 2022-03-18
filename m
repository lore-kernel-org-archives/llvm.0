Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92545115
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647629869; x=1679165869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmb8Mp9/Yjbqt6c60djUi87xjUJe4H7B4BMQF9kFBuE=;
  b=NLkqFfgTQZ3BwQUUssOfPzfYEzGVODx+LM7G/zH56ZFDKJt4i6jmBaSA
   QOW9IZc4kyEKZtMCawZZKLFIkPbawJqQHdNbSEmJ166vpUzgFlW47NHjm
   bLtB3liUmUv5XnUuSpwsvMleJUvMe9evE/mq/n7UJBm68bRrAO7e6999G
   iO1FWr1fLD1a3g+XThTYqFxozqrSM8zdzTOn6G1I1qiGtZF6ZP+uyeWOY
   2pYRDpYUIumU/qDPyMFFPFZ0ix/x8AWrjEJEQhilBRJDxLtbLxyQ+bc86
   dFKHV6St/h1CfFoTOu/JaDNeoYRQjoo7DKapIHD/8mnUB2dQRJroUbauA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="282015214"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="282015214"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 11:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="499353008"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2022 11:57:46 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVHnG-000F4F-6v; Fri, 18 Mar 2022 18:57:46 +0000
Date: Sat, 19 Mar 2022 02:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: Shravya Kumbham <shravya.kumbham@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Swati Agarwal <swati.agarwal@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 270/1007]
 include/linux/fortify-string.h:187:4: error: call to __read_overflow2
 declared with 'error' attribute: detected read beyond size of object passed
 as 2nd parameter
Message-ID: <202203190216.ZojcN5CR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   452ffbe114c20f1d744fda914d163c0a21b78d1a
commit: 5e2af855147c7a9c5c9288a6888e298435a1c2c3 [270/1007] net: xilinx: Ethtool statistics support
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220319/202203190216.ZojcN5CR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/5e2af855147c7a9c5c9288a6888e298435a1c2c3
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 5e2af855147c7a9c5c9288a6888e298435a1c2c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the xilinx-xlnx/xlnx_rebase_v5.15_LTS HEAD 452ffbe114c20f1d744fda914d163c0a21b78d1a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2660:5: warning: no previous prototype for function 'axienet_ethtools_sset_count' [-Wmissing-prototypes]
   int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2660:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
   ^
   static 
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2683:6: warning: no previous prototype for function 'axienet_ethtools_get_stats' [-Wmissing-prototypes]
   void axienet_ethtools_get_stats(struct net_device *ndev,
        ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2683:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void axienet_ethtools_get_stats(struct net_device *ndev,
   ^
   static 
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2710:6: warning: no previous prototype for function 'axienet_ethtools_strings' [-Wmissing-prototypes]
   void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
        ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2710:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
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

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
