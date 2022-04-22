Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3B290F
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650651420; x=1682187420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nnhIBaZDqfASV2RAR/AwbQzJ844LZinCwnqJ8LSfvzY=;
  b=Prk3BRXK80CSyQ0LcWHUMy2Vd6OhX0w6DWqQanHRe5Qam6ts0Q8EV79Y
   sG9CvnlT3ontpjCK5FQpri9fUYgaqS+6ulbg3+Bgtn3uyMEfmel/tiI4K
   XQRv476Ft/zwbjwq7AZVhOm63skMwwX8blUmkikjxq2keVEk5Ye33VE3j
   WVOxdjqyNyDJ65ECDdm+oKSrhikSF8b1L4AIv83dnBH2w2JWi452bZE8m
   XpsWnvZZvDRW6rWMFzRPi1Vl7oHrdXCDqiT8ue1xQjeWzEDBAHG7IMAvP
   8BGo3JzyWwov477psaw3vBPJbEmsyIQFqUA6fpl3TWyWG8WiB/LWsqj6v
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="262343154"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="262343154"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 11:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="867997432"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2022 11:16:57 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhxpx-000ARr-AL;
	Fri, 22 Apr 2022 18:16:57 +0000
Date: Sat, 23 Apr 2022 02:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 2/54] mm/kasan/shadow.c:63:7: warning: no previous
 prototype for function 'memcpy'
Message-ID: <202204230235.huNNhtoX-lkp@intel.com>
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
commit: 359a031f0505e46e0274570b6e015984f45da29b [2/54] riscv: optimized memcpy
config: riscv-randconfig-c006-20220422 (https://download.01.org/0day-ci/archive/20220423/202204230235.huNNhtoX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/359a031f0505e46e0274570b6e015984f45da29b
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 359a031f0505e46e0274570b6e015984f45da29b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
