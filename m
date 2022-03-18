Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CF48B7
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647602969; x=1679138969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l1GuPZNsutuzZp94mQlMThNJ0vvVjvY7hDbdSgk3DOc=;
  b=iUONe0UhnekBYSmKmgqywDe+TQBFIGSlNg5E6BHlL+uAYdMI75TaTE/+
   4L1MY28MMcarLBep0RRvttWabrK979QQycTxTm6q2GaLhtyl0vvdHPufM
   WHwYW2fdtc+62V+fB+mSUprvTgniSDlma45L3pTmCk446joAARgclKpHa
   NBmV1zHf7MD7GPScyXpuW+TbNSgbUtfPKHSQJz4EedEbUmOX1hUwscYnL
   3j21scJpgRO0rFn9wlF4MteUoaMDiR2Dj9KZgaDm5l602GROBz6h5XK2a
   Qlur6k3DP2FPptb4KCVdmc6KFp8z9ImQ9aiPCX07ota0W4LZdSNO3sGvt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237729932"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="237729932"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 04:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="541801519"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2022 04:29:26 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVAnO-000EiC-8c; Fri, 18 Mar 2022 11:29:26 +0000
Date: Fri, 18 Mar 2022 19:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 1808/2335]
 arch/x86/entry/vdso/vdso32-setup.c:55:12: warning: no previous prototype for
 function 'sysenter_setup'
Message-ID: <202203181924.OJ9XUwqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: 9b4a1c67afe98651319ebba46faa74c696c9c79b [1808/2335] headers/deps: x86/cpu, arm64/cpu: Split out <asm/processor_api.h> from <asm/processor.h>
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220318/202203181924.OJ9XUwqG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=9b4a1c67afe98651319ebba46faa74c696c9c79b
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 9b4a1c67afe98651319ebba46faa74c696c9c79b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/entry/vdso/ arch/x86/entry/vsyscall/ arch/x86/kernel/cpu/mtrr/ arch/x86/pci/ kernel/trace/ net/ipv6/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/entry/vdso/vdso32-setup.c:55:12: warning: no previous prototype for function 'sysenter_setup' [-Wmissing-prototypes]
   int __init sysenter_setup(void)
              ^
   arch/x86/entry/vdso/vdso32-setup.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init sysenter_setup(void)
   ^
   static 
   1 warning generated.


vim +/sysenter_setup +55 arch/x86/entry/vdso/vdso32-setup.c

^1da177e4c3f41 arch/i386/kernel/sysenter.c        Linus Torvalds      2005-04-16  54  
a6c4e076ee4c1e arch/i386/kernel/sysenter.c        Jeremy Fitzhardinge 2007-05-02 @55  int __init sysenter_setup(void)
^1da177e4c3f41 arch/i386/kernel/sysenter.c        Linus Torvalds      2005-04-16  56  {
0a6d1fa0d2b48f arch/x86/entry/vdso/vdso32-setup.c Andy Lutomirski     2015-10-05  57  	init_vdso_image(&vdso_image_32);
^1da177e4c3f41 arch/i386/kernel/sysenter.c        Linus Torvalds      2005-04-16  58  
^1da177e4c3f41 arch/i386/kernel/sysenter.c        Linus Torvalds      2005-04-16  59  	return 0;
^1da177e4c3f41 arch/i386/kernel/sysenter.c        Linus Torvalds      2005-04-16  60  }
e6e5494cb23d19 arch/i386/kernel/sysenter.c        Ingo Molnar         2006-06-27  61  

:::::: The code at line 55 was first introduced by commit
:::::: a6c4e076ee4c1ea670e4faa55814e63dd08e3f29 [PATCH] i386: clean up identify_cpu

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
