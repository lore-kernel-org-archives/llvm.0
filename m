Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF67E
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648146447; x=1679682447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufK9tZGDIrBNM7JdjRcaZZQj8aetI36gS2Cck1HaZ0U=;
  b=kSOq4tnR7F0fFPKVuDfJO7IzuaGFFwS1jNpdxSwRN9PMhbC1mCqfOf4X
   E+q//VRUCbZAsnKSaDlkeLzUI0KzWLHbbjrrrIlrdMq1ImpWxEulTAurH
   akxVsZd2qWbYZWv8iq1u8zgWLTgdx61k3DBA3HsVcJNxqKBA89gLRPS0S
   ZqOJWoI2J9BQcKcuA6t+myCUg3pX3gXKXdcvJKLYc0pin8KllCNsHYCEU
   OSDK33fg+QjFUnB+mjS/eqko07df3+a5oOj9q4f98Pcop2soeLBKGpfOW
   NCk5mp+/80Xrd1xnsN/rxfQ2m0DOztocvxQpxhTXcMB+CVo3odF9MdvVU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="239059413"
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="239059413"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 11:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="501504436"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Mar 2022 11:27:23 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXSB8-000LJI-NN; Thu, 24 Mar 2022 18:27:22 +0000
Date: Fri, 25 Mar 2022 02:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: YunQiang Su <yunqiang.su@cipunited.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/uart-16550.c:44:6: warning: no previous
 prototype for function 'putc'
Message-ID: <202203250200.mXHo7XPx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ed4643521e6af8ab8ed1e467630a85884d2696cf
commit: 31b2f3dc851c65fee288612432c4fc956f1a264e MIPS: enable both vmlinux.gz.itb and vmlinuz for generic
date:   3 months ago
config: mips-buildonly-randconfig-r006-20220324 (https://download.01.org/0day-ci/archive/20220325/202203250200.mXHo7XPx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=31b2f3dc851c65fee288612432c4fc956f1a264e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 31b2f3dc851c65fee288612432c4fc956f1a264e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/mips/boot/compressed/uart-16550.c:44:6: warning: no previous prototype for function 'putc' [-Wmissing-prototypes]
   void putc(char c)
        ^
   arch/mips/boot/compressed/uart-16550.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void putc(char c)
   ^
   static 
   1 warning generated.


vim +/putc +44 arch/mips/boot/compressed/uart-16550.c

1b93b3c3e94be26 Wu Zhangjin 2009-10-14  43  
1b93b3c3e94be26 Wu Zhangjin 2009-10-14 @44  void putc(char c)

:::::: The code at line 44 was first introduced by commit
:::::: 1b93b3c3e94be2605759735a89fc935ba5f58dcf MIPS: Add support for GZIP / BZIP2 / LZMA compressed kernel images

:::::: TO: Wu Zhangjin <wuzhangjin@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
