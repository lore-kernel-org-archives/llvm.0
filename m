Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8A07A
	for <llvm@lists.linux.dev>; Sun, 26 Jun 2022 01:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656206083; x=1687742083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9YUx/ia4ZXoU1I26EZo2cnKfqnlMluvbKpEQBK01d8M=;
  b=eNEg7LXfdozyvU60hGyI3Ys2I1aRvUDm8vRDU1JFeIaZ9l8oHabU/PmH
   kXcrhsfQDFU2Ssm/MbRNw9CKqXPtCBw9WdN7vsxp0Mb7PdGnwIqKKPU6O
   869KXN8JHkkcUHtZFnPj62fTtiK5C0TrUf9Sj3pOthfg/BzYpYdC1jGWl
   0V5xTwUpdulTu1QdEI6LPl174vCGJLo39kHE/gCtFGTdczuI931oxG5JX
   AS7P2GeMCK0/VluGtX397N5tU2DcrTTPGk7+Tc3ucyZqI2xUVy1BAbKX/
   SX0//xh1sVLGIpzlYHCcdDsotGiC6/b4ptUw7LQdRfjj96nqUfnEWU/H5
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="281969536"
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; 
   d="scan'208";a="281969536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2022 18:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; 
   d="scan'208";a="539687955"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jun 2022 18:14:41 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5GrJ-0006Wv-5k;
	Sun, 26 Jun 2022 01:14:41 +0000
Date: Sun, 26 Jun 2022 09:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:510:5:
 warning: no previous prototype for function
 'LZ4_decompress_safe_forceExtDict'
Message-ID: <202206260948.akgsho1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiezhu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0840a7914caa14315a3191178a9f72c742477860
commit: 7e4fd16b38923028b01d3dbadf4ca973d885c53e MIPS: RALINK: Define pci_remap_iospace under CONFIG_PCI_DRIVERS_GENERIC
date:   4 weeks ago
config: mips-randconfig-r035-20220626
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 42a7ddb428c999229491b0effbb1a4059149fba8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7e4fd16b38923028b01d3dbadf4ca973d885c53e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7e4fd16b38923028b01d3dbadf4ca973d885c53e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/mips/boot/compressed/decompress.c:42:6: warning: no previous prototype for function 'error' [-Wmissing-prototypes]
   void error(char *x)
        ^
   arch/mips/boot/compressed/decompress.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void error(char *x)
   ^
   static 
   In file included from arch/mips/boot/compressed/decompress.c:64:
   In file included from arch/mips/boot/compressed/../../../../lib/decompress_unlz4.c:10:
>> arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:510:5: warning: no previous prototype for function 'LZ4_decompress_safe_forceExtDict' [-Wmissing-prototypes]
   int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
       ^
   arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:510:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
   ^
   static 
   arch/mips/boot/compressed/decompress.c:85:6: warning: no previous prototype for function '__stack_chk_fail' [-Wmissing-prototypes]
   void __stack_chk_fail(void)
        ^
   arch/mips/boot/compressed/decompress.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __stack_chk_fail(void)
   ^
   static 
   arch/mips/boot/compressed/decompress.c:90:6: warning: no previous prototype for function 'decompress_kernel' [-Wmissing-prototypes]
   void decompress_kernel(unsigned long boot_heap_start)
        ^
   arch/mips/boot/compressed/decompress.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void decompress_kernel(unsigned long boot_heap_start)
   ^
   static 
   4 warnings generated.
--
>> arch/mips/boot/compressed/dbg.c:12:13: warning: no previous prototype for function 'putc' [-Wmissing-prototypes]
   void __weak putc(char c)
               ^
   arch/mips/boot/compressed/dbg.c:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak putc(char c)
   ^
   static 
>> arch/mips/boot/compressed/dbg.c:16:6: warning: no previous prototype for function 'puts' [-Wmissing-prototypes]
   void puts(const char *s)
        ^
   arch/mips/boot/compressed/dbg.c:16:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void puts(const char *s)
   ^
   static 
>> arch/mips/boot/compressed/dbg.c:26:6: warning: no previous prototype for function 'puthex' [-Wmissing-prototypes]
   void puthex(unsigned long long val)
        ^
   arch/mips/boot/compressed/dbg.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void puthex(unsigned long long val)
   ^
   static 
   3 warnings generated.


vim +/LZ4_decompress_safe_forceExtDict +510 arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c

cffb78b0e0b3a3 Kyungsik Lee 2013-07-08  509  
2209fda323e2fd Gao Xiang    2018-10-30 @510  int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  511  				     int compressedSize, int maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  512  				     const void *dictStart, size_t dictSize)
2209fda323e2fd Gao Xiang    2018-10-30  513  {
2209fda323e2fd Gao Xiang    2018-10-30  514  	return LZ4_decompress_generic(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  515  				      compressedSize, maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  516  				      endOnInputSize, decode_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  517  				      usingExtDict, (BYTE *)dest,
2209fda323e2fd Gao Xiang    2018-10-30  518  				      (const BYTE *)dictStart, dictSize);
2209fda323e2fd Gao Xiang    2018-10-30  519  }
2209fda323e2fd Gao Xiang    2018-10-30  520  

:::::: The code at line 510 was first introduced by commit
:::::: 2209fda323e2fd2a2d0885595fd5097717f8d2aa lib/lz4: update LZ4 decompressor module

:::::: TO: Gao Xiang <gaoxiang25@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
