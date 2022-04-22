Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129A7A
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650659956; x=1682195956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvEmm3q5zs9POqKdsIu+eEbpwdiEBwUZG5UoQU3is80=;
  b=ZpqieZnPaunMLJhSJ4XF5ELYRsTFAPYufVxBmew80DZ8HgUOqIZ1EZFO
   SAo2Rbn7yL23z/ecWJmxtlqClSs2gLyhf6wk+rmEzJFB7kbBmWRSCv8wj
   jVK0czQEdoL8SuMDywIpAOouakFlr93DBiC+sqsPZMbUlrehIc4TEsY5x
   P6YFm6fCzQ1NlwfbIZwOajMnihmYmES2eoUSEZERs2ODSn1Y47o/sSgk+
   VOjln4L8D3oo7VuywLPpnlrlSpi/ZlyW0H5VXa42nK7vgnzft5VHLXADf
   9uvYrqBhX5wtBTIAWLdb1xYgB98+9AFciLa0m1IwY1+SOy9ZDm3emWJCo
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246685904"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="246685904"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 13:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="511729153"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Apr 2022 13:39:12 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ni03c-000AZO-08;
	Fri, 22 Apr 2022 20:39:12 +0000
Date: Sat, 23 Apr 2022 04:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 4/54] mm/kasan/shadow.c:42:7: warning: no previous
 prototype for function 'memset'
Message-ID: <202204230424.eOU8iNAQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   68fe13e37af4c8331cdd40841353c9725cb65925
commit: 20157c7f08403f9a7cbaef427717ce571387416c [4/54] riscv: optimized memset
config: riscv-randconfig-c006-20220422 (https://download.01.org/0day-ci/archive/20220423/202204230424.eOU8iNAQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/20157c7f08403f9a7cbaef427717ce571387416c
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 20157c7f08403f9a7cbaef427717ce571387416c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/kasan/shadow.c:42:7: warning: no previous prototype for function 'memset' [-Wmissing-prototypes]
   void *memset(void *addr, int c, size_t len)
         ^
   mm/kasan/shadow.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *memset(void *addr, int c, size_t len)
   ^
   static 
   mm/kasan/shadow.c:63:7: warning: no previous prototype for function 'memcpy' [-Wmissing-prototypes]
   void *memcpy(void *dest, const void *src, size_t len)
         ^
   mm/kasan/shadow.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *memcpy(void *dest, const void *src, size_t len)
   ^
   static 
   2 warnings generated.


vim +/memset +42 mm/kasan/shadow.c

bb359dbcb70085 Andrey Konovalov 2020-12-22  40  
bb359dbcb70085 Andrey Konovalov 2020-12-22  41  #undef memset
bb359dbcb70085 Andrey Konovalov 2020-12-22 @42  void *memset(void *addr, int c, size_t len)
bb359dbcb70085 Andrey Konovalov 2020-12-22  43  {
f00748bfa0246c Andrey Konovalov 2021-02-24  44  	if (!kasan_check_range((unsigned long)addr, len, true, _RET_IP_))
bb359dbcb70085 Andrey Konovalov 2020-12-22  45  		return NULL;
bb359dbcb70085 Andrey Konovalov 2020-12-22  46  
bb359dbcb70085 Andrey Konovalov 2020-12-22  47  	return __memset(addr, c, len);
bb359dbcb70085 Andrey Konovalov 2020-12-22  48  }
bb359dbcb70085 Andrey Konovalov 2020-12-22  49  

:::::: The code at line 42 was first introduced by commit
:::::: bb359dbcb70085a63e8bdbf14837a900750f0cf7 kasan: split out shadow.c from common.c

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
