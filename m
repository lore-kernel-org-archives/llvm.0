Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB41876
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650531153; x=1682067153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3EC3KlKKZO/UYyJjPtajH9hjh9GX6FEadOKY32nXFaI=;
  b=D48LfwKTg2ZBteUrP21LUpDXYizRS/xRDB2nOQ0uiFX1QokPgNW4QkqD
   LquDxR1NEnA5YPFE0cojkfOGcTU5L6ZJYY3+ByXWwLJogmV34h29GMZUQ
   n/nEjPjJUYH48OgmpXjOl1NM4x7bCXkJva4PirFHkq/hgtHpmrmgDuAZz
   LjyC1uL1amOaRYbFw0gfVsvfeLoMjJtsPh9UCikpGS+pyAEc2Zatdrpgh
   CMSJs3vlhgDCD1dedPAiXGD+LSu9JB+temY/i1uBjylUwwlwGH7n+jg7J
   WzVsDcg8b/mSdc//Die/kFNEcGqD6fPgXmc6xTkWkyMsUlRU3B45VN21e
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="264050015"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="264050015"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 01:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="703002903"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2022 01:52:16 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhSXv-000893-S5;
	Thu, 21 Apr 2022 08:52:15 +0000
Date: Thu, 21 Apr 2022 16:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1987/2579]
 arch/x86/entry/vdso/vdso32-setup.c:55:12: warning: no previous prototype for
 function 'sysenter_setup'
Message-ID: <202204211627.pSYrSUgt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: 3edbef1e72915c9356080e1e09b29bd64b1673ae [1987/2579] headers/deps: x86/elf: Optimize <asm/elf.h> dependencies, split out <asm/elf_api.h>
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220421/202204211627.pSYrSUgt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=3edbef1e72915c9356080e1e09b29bd64b1673ae
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 3edbef1e72915c9356080e1e09b29bd64b1673ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/ arch/x86/entry/ arch/x86/kernel/cpu/ arch/x86/pci/ kernel/bpf/ kernel/trace/ net/ipv6/

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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
