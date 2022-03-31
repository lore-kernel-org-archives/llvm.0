Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2A7B
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648715029; x=1680251029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftF6awFwKVzY4WYzM6LsHPF8KxWYcWnWJu1WHI3Nf7E=;
  b=RLfSajBjMyJZJWkUHF73AaXAzOeiCZBUt3ocfnk/wtZZARmYhvF8jvw8
   bmnPE9bpGPr7XCbyDIEAOjdN6F6L3KDbu1F6WaqhAm9RCgiCvsT5rb3+L
   HZqTwI91l1bkxpMnpvniIdq54jEo3oJR9/SNS2UBfimvU+DftRJPguu89
   lYRMqtvsM69hHzMC1Zs+DBiKwwNcBgRvEvJLCqNSNbx5ciEKFg9Z3d5u3
   1qntYaWm25CVpyxMSBhq7p2x7FBKZ8RepmiE/3zFBZaV7EZ/vmjuzOgQH
   ek6E2rn8hOfoK16td8jXTWFVqX1WBotiGx4IBCMsartXC+0JEwbF7a5kz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259466216"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; 
   d="scan'208";a="259466216"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 01:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; 
   d="scan'208";a="654537022"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2022 01:23:47 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZq5q-00005I-AJ;
	Thu, 31 Mar 2022 08:23:46 +0000
Date: Thu, 31 Mar 2022 16:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 2/62] mm/kasan/shadow.c:63:7: warning: no previous
 prototype for function 'memcpy'
Message-ID: <202203311615.JMeQnjS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/esmil/linux visionfive
head:   6c7cd35771680c033c40b4af48cbe7e3093eab3d
commit: 773046cb2a6e3e2339353f64646d0625484c87e1 [2/62] riscv: optimized memcpy
config: riscv-randconfig-r042-20220331 (https://download.01.org/0day-ci/archive/20220331/202203311615.JMeQnjS4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 22a95dd3e6c911c2854dd75f42ba32d34840a61a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/773046cb2a6e3e2339353f64646d0625484c87e1
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 773046cb2a6e3e2339353f64646d0625484c87e1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/kasan/shadow.c:63:7: warning: no previous prototype for function 'memcpy' [-Wmissing-prototypes]
   void *memcpy(void *dest, const void *src, size_t len)
         ^
   mm/kasan/shadow.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *memcpy(void *dest, const void *src, size_t len)
   ^
   static 
   1 warning generated.


vim +/memcpy +63 mm/kasan/shadow.c

bb359dbcb70085a Andrey Konovalov 2020-12-22  61  
bb359dbcb70085a Andrey Konovalov 2020-12-22  62  #undef memcpy
bb359dbcb70085a Andrey Konovalov 2020-12-22 @63  void *memcpy(void *dest, const void *src, size_t len)
bb359dbcb70085a Andrey Konovalov 2020-12-22  64  {
f00748bfa0246c4 Andrey Konovalov 2021-02-24  65  	if (!kasan_check_range((unsigned long)src, len, false, _RET_IP_) ||
f00748bfa0246c4 Andrey Konovalov 2021-02-24  66  	    !kasan_check_range((unsigned long)dest, len, true, _RET_IP_))
bb359dbcb70085a Andrey Konovalov 2020-12-22  67  		return NULL;
bb359dbcb70085a Andrey Konovalov 2020-12-22  68  
bb359dbcb70085a Andrey Konovalov 2020-12-22  69  	return __memcpy(dest, src, len);
bb359dbcb70085a Andrey Konovalov 2020-12-22  70  }
bb359dbcb70085a Andrey Konovalov 2020-12-22  71  

:::::: The code at line 63 was first introduced by commit
:::::: bb359dbcb70085a63e8bdbf14837a900750f0cf7 kasan: split out shadow.c from common.c

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
