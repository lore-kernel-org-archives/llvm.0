Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401AF2F25;
	Wed, 15 Mar 2023 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678872522; x=1710408522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJrx4psR0rNvMy2ve6/ah38feNBcncCPSlCtYc3BCFY=;
  b=aj5ycPsKQgBKrxyFWwJllQAOkLDNl0j8epx46JjeP+aNlPAZEtnZKTcC
   CWlJrT2EJeQcKtKGkrOSGHA3U66CnTv4WpXpd8p2MJnFCXH4ckaLYMGHk
   wk1k+3Ay+53Pp1knxOAJneSKTlD2I8CUhn9L1it8twOEkKW7qo7oWIeID
   vrsm4WCq82SoNtJjyyQMW8Uk7/j693xgXWCZq1c/L68t5wDHvwqpiNguJ
   Y5UVZ2N/tO4OR0oHGt7ACydmFTbXo0jzhA+pg8JRbKFdUpGUI4PJ/EWjH
   D24DTjM79U7YyGqmixRWs3aDxSNnz5udFstTr5hZ3K+mvo453RYOh1irz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335141056"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335141056"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 02:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="1008769110"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="1008769110"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 02:28:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcNR2-0007a7-0h;
	Wed, 15 Mar 2023 09:28:40 +0000
Date: Wed, 15 Mar 2023 17:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/uaccess/fixes 1/4] lib/usercopy_kunit.c:144:6: warning:
 no previous prototype for function 'usercopy_test_exit'
Message-ID: <202303151748.uK7wcgS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/uaccess/fixes
head:   bcab174e50dd95f92848c50fdfec65390e201a4b
commit: ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6 [1/4] lib: test copy_{to,from}_user()
config: hexagon-randconfig-r005-20230313 (https://download.01.org/0day-ci/archive/20230315/202303151748.uK7wcgS9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/uaccess/fixes
        git checkout ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151748.uK7wcgS9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/usercopy_kunit.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from lib/usercopy_kunit.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from lib/usercopy_kunit.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> lib/usercopy_kunit.c:144:6: warning: no previous prototype for function 'usercopy_test_exit' [-Wmissing-prototypes]
   void usercopy_test_exit(struct kunit *test)
        ^
   lib/usercopy_kunit.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void usercopy_test_exit(struct kunit *test)
   ^
   static 
   7 warnings generated.


vim +/usercopy_test_exit +144 lib/usercopy_kunit.c

   143	
 > 144	void usercopy_test_exit(struct kunit *test)
   145	{
   146		struct usercopy_env *env = test->priv;
   147	
   148		kunmap(env->ubuf);
   149	
   150		usercopy_ubuf_unpin(env);
   151		usercopy_mm_free(env->mm);
   152		usercopy_env_free(env);
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
