Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8E4A02
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662731910; x=1694267910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9InOYRd6GJtuGHZOn1qLjjMn+Kg/wzBmgX6NBiyeEuw=;
  b=EKKa7+K6JpDenHNbEYTuTmVs9WRkoO2UOFeqJbP/Eg/fpXhl855hX/xT
   CpUFn6LG/fEkfc59iMFvIWGfqNeMs2d1Geqaij8T7lp0UopwzJBDUKxVm
   mrNbQQUFomIE/MbzVju8vuanLYM1rpecyTGv7vyFULfogMmwB4icXuNEt
   Kisqh/eTKrQP/jSDV4Dh9wlBEyOhP/XZz19UDW4Hx5t1taZpzvXjw71RG
   vS3DzqZmM/XV7zw3eigsCMfYjjtswsidLuym4ED5iVxfR6qr0br00x6Ct
   kzIm/7ghVY0tECKfXM9HuykYVYkScoa8TTKNEK2eI2sQNaT1Nt7AfWVC3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359200132"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="359200132"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 06:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="566373940"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Sep 2022 06:58:28 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWeWZ-0001Gh-29;
	Fri, 09 Sep 2022 13:58:27 +0000
Date: Fri, 9 Sep 2022 21:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [ammarfaizi2-block:tglx/devel/depthtracking 58/59]
 kernel/trace/trace_selftest.c:790:6: error: expected string literal in 'asm'
Message-ID: <202209092112.6jfANnOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/depthtracking
head:   b7a028328b2f2fa64df9f0d1540f50f1d747a7c7
commit: c134aff63058e4f96b9582b517d14e63d1197a4e [58/59] x86/ftrace: Make it call depth tracking aware
config: s390-randconfig-r044-20220909 (https://download.01.org/0day-ci/archive/20220909/202209092112.6jfANnOZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/c134aff63058e4f96b9582b517d14e63d1197a4e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tglx/devel/depthtracking
        git checkout c134aff63058e4f96b9582b517d14e63d1197a4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace.c:53:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/trace/trace.c:53:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/trace/trace.c:53:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from kernel/trace/trace.c:8672:
>> kernel/trace/trace_selftest.c:790:6: error: expected string literal in 'asm'
           asm(CALL_DEPTH_ACCOUNT);
               ^
   12 warnings and 1 error generated.


vim +/asm +790 kernel/trace/trace_selftest.c

   786	
   787	#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
   788	noinline __noclone static void trace_direct_tramp(void)
   789	{
 > 790		asm(CALL_DEPTH_ACCOUNT);
   791	}
   792	#endif
   793	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
