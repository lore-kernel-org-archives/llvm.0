Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D51168
	for <llvm@lists.linux.dev>; Sun, 23 Jan 2022 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642936975; x=1674472975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=So3UoZ2Zr5F1X5/R3sOMbQvlJJoyJHcL9ULCs0OBhZo=;
  b=KwooupzBMJTizqc7xr8HNr+SpUuxBi7ZFI/hMW/WDcjVzib163My7AfR
   RxMRMK/Hh8TIAmjhkiJphmbwl/9qwE+e1tpqeSQmoYbDxieZNjLflYP1e
   z+FlL/5/hUG6PJItmAGODcXZrzquNW6xQuIrS1638axakOEZ5Ej4Fo9Gh
   jHYfZFQ2LrxhfE1q9O3ruxVPOQeOdBosIpcrTOOq88aNmkxDy43J3awPA
   3pofbYtT30Nc9z4v1kVxA+VkMApBDGgCBSY4ulqNt3iQInNmkS6e7/Aj2
   lHFuoFc5mGa4pJeOtRBstDe02y1cknp/RlqxmJVS4Un2NfXo8m7CdGM7R
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10235"; a="306604587"
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; 
   d="scan'208";a="306604587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2022 03:22:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; 
   d="scan'208";a="616955888"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2022 03:22:52 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBaxP-000HD9-Rf; Sun, 23 Jan 2022 11:22:51 +0000
Date: Sun, 23 Jan 2022 19:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Kees Cook <keescook@chromium.org>
Subject: ERROR: modpost: "bcsr_mod" [drivers/pcmcia/db1xxx_ss.ko] undefined!
Message-ID: <202201231941.OMnmf2JQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
commit: 606b102876e3741851dfb09d53f3ee57f650a52c drm: fb_helper: fix CONFIG_FB dependency
date:   4 months ago
config: mips-randconfig-r002-20220120 (https://download.01.org/0day-ci/archive/20220123/202201231941.OMnmf2JQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=606b102876e3741851dfb09d53f3ee57f650a52c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 606b102876e3741851dfb09d53f3ee57f650a52c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bcsr_mod" [drivers/pcmcia/db1xxx_ss.ko] undefined!
>> ERROR: modpost: "bcsr_read" [drivers/pcmcia/db1xxx_ss.ko] undefined!
--
arch/mips/boot/compressed/decompress.c:42:6: warning: no previous prototype for function 'error' [-Wmissing-prototypes]
void error(char *x)
^
arch/mips/boot/compressed/decompress.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
void error(char *x)
^
static
In file included from arch/mips/boot/compressed/decompress.c:64:
In file included from arch/mips/boot/compressed/../../../../lib/decompress_unlz4.c:10:
>> arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:506:5: warning: no previous prototype for function 'LZ4_decompress_safe_forceExtDict' [-Wmissing-prototypes]
int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
^
arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:506:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
