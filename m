Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E87F6
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648721163; x=1680257163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BKmwz0x2Ie7JP3uu3Xw1GYBWKuuPY8Av3iPGXzko/gE=;
  b=RFtnHewoN2he3tRF0YPK3fITgooY7KcqUZu0UUAcNYH3WoocG+0u14Tt
   3iC2m8UuL0pEgIoLWpTOcresbdzVH7DQs5Ue8UbpbVTPwAm3gLbGCAGYi
   b3IVReLiHt57bgkBzoJSEc4H5KuucO204C2z4qw4iNO0xuNItrX5kHk1v
   dTkdl0XyQX4tEsSIXxIAexKHZzS94B3gpXhW8Bw863q6gZwEF6asp5uwJ
   6dLKDRDUKv+oUkbxGQ377odX88L9xhtNsSjaPr5xWtsFUGU0bFP5EKq04
   ZgR3TB0M1w+HmJlwaf5S7BReiOCLAMkhPUtvn7Qo3420FP56+uaHXG2oZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284702167"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="284702167"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 03:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="522278085"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Mar 2022 03:06:01 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZrgm-00009I-Gg;
	Thu, 31 Mar 2022 10:06:00 +0000
Date: Thu, 31 Mar 2022 18:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 4/62] mm/kasan/shadow.c:42:7: warning: no previous
 prototype for function 'memset'
Message-ID: <202203311721.E2WjyRUE-lkp@intel.com>
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
commit: 25b1ed58675d7210b11e3492dcd5785f983d2b4a [4/62] riscv: optimized memset
config: riscv-randconfig-r042-20220331 (https://download.01.org/0day-ci/archive/20220331/202203311721.E2WjyRUE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 22a95dd3e6c911c2854dd75f42ba32d34840a61a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/25b1ed58675d7210b11e3492dcd5785f983d2b4a
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 25b1ed58675d7210b11e3492dcd5785f983d2b4a
        # save the config file to linux build tree
        mkdir build_dir
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

bb359dbcb70085a Andrey Konovalov 2020-12-22  40  
bb359dbcb70085a Andrey Konovalov 2020-12-22  41  #undef memset
bb359dbcb70085a Andrey Konovalov 2020-12-22 @42  void *memset(void *addr, int c, size_t len)
bb359dbcb70085a Andrey Konovalov 2020-12-22  43  {
f00748bfa0246c4 Andrey Konovalov 2021-02-24  44  	if (!kasan_check_range((unsigned long)addr, len, true, _RET_IP_))
bb359dbcb70085a Andrey Konovalov 2020-12-22  45  		return NULL;
bb359dbcb70085a Andrey Konovalov 2020-12-22  46  
bb359dbcb70085a Andrey Konovalov 2020-12-22  47  	return __memset(addr, c, len);
bb359dbcb70085a Andrey Konovalov 2020-12-22  48  }
bb359dbcb70085a Andrey Konovalov 2020-12-22  49  

:::::: The code at line 42 was first introduced by commit
:::::: bb359dbcb70085a63e8bdbf14837a900750f0cf7 kasan: split out shadow.c from common.c

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
