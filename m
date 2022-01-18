Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2482C82
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642535588; x=1674071588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmkhJ3hfdkqX9gTyRZeGjmj/hhGAD7otGNfXIM5kISo=;
  b=kPl11OUc5nwCxwN5N10vHhrTOhd4b9PfIFm7JTadP2697xU0lKt7xvAi
   VOnznOCUNmhoV85JpUeCdF1YdApX/05TdE15AtoDIeFzaS6ZXWCYCruzo
   HdPAbhAL/bVSK3GfRx1nwLqII4mDo4lQSAm3Sot3cqa9WDN9oF3UwyC6X
   xZ7p+2NkruZypbfSmkPZv5nf4yPjgzMxx0l114b50glWRRT4EqFWMmFRo
   moRUwRkGkTEjQpw0a+KBWZKSIA3sMdAdjD2ZGm7NM/yQs5LBtZTa086QS
   tCe46F5FnE5vE2Stya6HunsAQJnHpO67jtgnVdKXJCGWBTaqhjsRLJDKZ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="224879864"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="224879864"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 11:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="477105195"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2022 11:53:06 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9uXS-000CuB-0D; Tue, 18 Jan 2022 19:53:06 +0000
Date: Wed, 19 Jan 2022 03:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive-5.16.y 20/80] mm/kasan/shadow.c:63:7: warning: no
 previous prototype for function 'memcpy'
Message-ID: <202201190301.Vaw8aZi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/esmil/linux visionfive-5.16.y
head:   eeeb46a916e77aecbe1699537a5592746f3130f6
commit: e23a963f827f203e0ce13cc69ac7ac8562c90585 [20/80] riscv: optimized memcpy
config: riscv-randconfig-c006-20220118 (https://download.01.org/0day-ci/archive/20220119/202201190301.Vaw8aZi3-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/e23a963f827f203e0ce13cc69ac7ac8562c90585
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive-5.16.y
        git checkout e23a963f827f203e0ce13cc69ac7ac8562c90585
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

bb359dbcb70085 Andrey Konovalov 2020-12-22  61  
bb359dbcb70085 Andrey Konovalov 2020-12-22  62  #undef memcpy
bb359dbcb70085 Andrey Konovalov 2020-12-22 @63  void *memcpy(void *dest, const void *src, size_t len)
bb359dbcb70085 Andrey Konovalov 2020-12-22  64  {
f00748bfa0246c Andrey Konovalov 2021-02-24  65  	if (!kasan_check_range((unsigned long)src, len, false, _RET_IP_) ||
f00748bfa0246c Andrey Konovalov 2021-02-24  66  	    !kasan_check_range((unsigned long)dest, len, true, _RET_IP_))
bb359dbcb70085 Andrey Konovalov 2020-12-22  67  		return NULL;
bb359dbcb70085 Andrey Konovalov 2020-12-22  68  
bb359dbcb70085 Andrey Konovalov 2020-12-22  69  	return __memcpy(dest, src, len);
bb359dbcb70085 Andrey Konovalov 2020-12-22  70  }
bb359dbcb70085 Andrey Konovalov 2020-12-22  71  

:::::: The code at line 63 was first introduced by commit
:::::: bb359dbcb70085a63e8bdbf14837a900750f0cf7 kasan: split out shadow.c from common.c

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
