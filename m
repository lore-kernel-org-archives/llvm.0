Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E1C173
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 00:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639094486; x=1670630486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ns55OeCdhnWy6O+UAopBMsgcN1hw7GLsLJeQrVbni1I=;
  b=BhyGjITksfv8GG3VuL6xjrgwfNP7UCAeWK5e1jjo2OSDxf+JGGs1CpMT
   sIIEjgrUbBmo6l/LezLwC2G958nh77Pz8fp6KZ/oiuOB3xRh5cJ7kASff
   NmvT8mFl3o3jukiQXH0URI+e+iq+X0pHvmsqMTGH9+1jG0T+hzqpluq03
   irSzSf/pnIQQTCIR3RIWxVGlK6Cvu41iwSPa7IJdGDOB5hEmkznVbcFkh
   gMX6J50skP9X9HIcyLCJsL87Hw52vy/zJKmpqTU+Fl2HjhF4yGxKikt0N
   Z2gp7LCGy0hI6XMpsacnrUKb4VvIXxsEW9TrwXe2gm00Im3PpB3Pr4Vej
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218255582"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="218255582"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 16:00:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="543781468"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Dec 2021 16:00:47 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvTLC-0002Wj-SE; Fri, 10 Dec 2021 00:00:46 +0000
Date: Fri, 10 Dec 2021 07:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ardb:for-kernelci 1/1] arch/arm/boot/compressed/head.S:315:3:
 error: invalid instruction, any one of the following would fix this:
Message-ID: <202112100747.znK7leLP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   3d803745c0cdcca58579eb2654530bf4be3bef72
commit: 3d803745c0cdcca58579eb2654530bf4be3bef72 [1/1] ARM: set textoffset to 4 MiB unconditionally
config: arm-randconfig-r034-20211207 (https://download.01.org/0day-ci/archive/20211210/202112100747.znK7leLP-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=3d803745c0cdcca58579eb2654530bf4be3bef72
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 3d803745c0cdcca58579eb2654530bf4be3bef72
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/boot/compressed/head.S:315:3: error: invalid instruction, any one of the following would fix this:
     add r4, r0, #0x00408000
     ^
   arch/arm/boot/compressed/head.S:315:16: note: invalid operand for instruction
     add r4, r0, #0x00408000
                  ^
   arch/arm/boot/compressed/head.S:315:16: note: operand must be a register in range [r0, r15]
     add r4, r0, #0x00408000
                  ^
   arch/arm/boot/compressed/head.S:315:3: note: instruction requires: thumb2
     add r4, r0, #0x00408000
     ^
   arch/arm/boot/compressed/head.S:413:3: error: invalid instruction, any one of the following would fix this:
     sub r0, r4, #0x00408000
     ^
   arch/arm/boot/compressed/head.S:413:16: note: invalid operand for instruction
     sub r0, r4, #0x00408000
                  ^
   arch/arm/boot/compressed/head.S:413:16: note: operand must be a register in range [r0, r15]
     sub r0, r4, #0x00408000
                  ^
   arch/arm/boot/compressed/head.S:413:3: note: instruction requires: thumb2
     sub r0, r4, #0x00408000
     ^


vim +315 arch/arm/boot/compressed/head.S

0673cb38951215 Geert Uytterhoeven 2021-01-04  300  
0673cb38951215 Geert Uytterhoeven 2021-01-04  301  		/*
0673cb38951215 Geert Uytterhoeven 2021-01-04  302  		 * Make sure we have some stack before calling C code.
0673cb38951215 Geert Uytterhoeven 2021-01-04  303  		 * No GOT fixup has occurred yet, but none of the code we're
0673cb38951215 Geert Uytterhoeven 2021-01-04  304  		 * about to call uses any global variables.
0673cb38951215 Geert Uytterhoeven 2021-01-04  305  		 */
0673cb38951215 Geert Uytterhoeven 2021-01-04  306  		ldr	sp, [r1]	@ get stack location
0673cb38951215 Geert Uytterhoeven 2021-01-04  307  		add	sp, sp, r1	@ apply relocation
0673cb38951215 Geert Uytterhoeven 2021-01-04  308  
0673cb38951215 Geert Uytterhoeven 2021-01-04  309  		/* Validate calculated start against passed DTB */
0673cb38951215 Geert Uytterhoeven 2021-01-04  310  		mov	r1, r8
0673cb38951215 Geert Uytterhoeven 2021-01-04  311  		bl	fdt_check_mem_start
0673cb38951215 Geert Uytterhoeven 2021-01-04  312  1:
0673cb38951215 Geert Uytterhoeven 2021-01-04  313  #endif /* CONFIG_USE_OF */
0a6a78b8b3c1c1 Russell King       2015-03-26  314  		/* Determine final kernel image address. */
0673cb38951215 Geert Uytterhoeven 2021-01-04 @315  		add	r4, r0, #TEXT_OFFSET
e69edc7939abda Eric Miao          2010-07-05  316  #else
9e84ed63dc71e1 Russell King       2010-09-09  317  		ldr	r4, =zreladdr
e69edc7939abda Eric Miao          2010-07-05  318  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  319  
2874865c1271cc Nicolas Pitre      2013-06-06  320  		/*
2874865c1271cc Nicolas Pitre      2013-06-06  321  		 * Set up a page table only if it won't overwrite ourself.
7d57909bf69f21 Masahiro Yamada    2015-01-20  322  		 * That means r4 < pc || r4 - 16k page directory > &_end.
2874865c1271cc Nicolas Pitre      2013-06-06  323  		 * Given that r4 > &_end is most unfrequent, we add a rough
2874865c1271cc Nicolas Pitre      2013-06-06  324  		 * additional 1MB of room for a possible appended DTB.
2874865c1271cc Nicolas Pitre      2013-06-06  325  		 */
2874865c1271cc Nicolas Pitre      2013-06-06  326  		mov	r0, pc
2874865c1271cc Nicolas Pitre      2013-06-06  327  		cmp	r0, r4
691cbe5ba5f77f Ard Biesheuvel     2020-04-13  328  		ldrcc	r0, .Lheadroom
2874865c1271cc Nicolas Pitre      2013-06-06  329  		addcc	r0, r0, pc
2874865c1271cc Nicolas Pitre      2013-06-06  330  		cmpcc	r4, r0
2874865c1271cc Nicolas Pitre      2013-06-06  331  		orrcc	r4, r4, #1		@ remember we skipped cache_on
2874865c1271cc Nicolas Pitre      2013-06-06  332  		blcs	cache_on
6d7d0ae5157494 Nicolas Pitre      2011-02-21  333  

:::::: The code at line 315 was first introduced by commit
:::::: 0673cb38951215060d7993b43ad3c45cd413c2c3 ARM: 9045/1: uncompress: Validate start of physical memory against passed DTB

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
