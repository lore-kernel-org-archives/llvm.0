Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75942C80
	for <llvm@lists.linux.dev>; Sat,  1 Jan 2022 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641077887; x=1672613887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jgQubOI3SKNzWA7k79bmOtULyLmwm1J31xvIebg1f0Y=;
  b=GaCLFqCLtvTG7oj2gyRjXGrA1qSj6evkAfBggqzT6q1HlFIx/Cy6m9en
   Xj0Chw3ysAhsAIi70GwyZ7JCBjg+nsfdmFPussvRhHHuovVnQYE37Cn2o
   yn892jnL+55fXno8rDTTto8Vy3XxbyyaMDWFrtTyykON7R5JLeE0m6cNR
   nUoQZHpkKPhSdfb/rYfR7xIAjpstYqK8e8Mk4DE74uP988HJaL+d5xKnu
   BCXj7f3ih29Qo4YT17FmlT8chNwFIPWygSr0TVii9L3oNKC6b+xBm4iVy
   is2/20j2eG7QfJXLhvF0eeCDa2Cf5SY53hDBbuAlb8gsaZEMAbMTqmb5g
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10214"; a="242134446"
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; 
   d="scan'208";a="242134446"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2022 14:58:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; 
   d="scan'208";a="762142342"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jan 2022 14:58:05 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n3nK9-000CrR-Be; Sat, 01 Jan 2022 22:58:05 +0000
Date: Sun, 2 Jan 2022 06:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [linux-next:master 4461/9897] arch/arm/mach-iop32x/irq.c:62:6:
 warning: no previous prototype for function 'iop_handle_irq'
Message-ID: <202201020627.cJMyevvZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: 6f5d248d05db9c4991366154f1a657a630faa583 [4461/9897] ARM: iop32x: use GENERIC_IRQ_MULTI_HANDLER
config: arm-randconfig-r031-20220101 (https://download.01.org/0day-ci/archive/20220102/202201020627.cJMyevvZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c054402170cd8466683a20385befc0523aba3359)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6f5d248d05db9c4991366154f1a657a630faa583
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6f5d248d05db9c4991366154f1a657a630faa583
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-iop32x/irq.c:62:6: warning: no previous prototype for function 'iop_handle_irq' [-Wmissing-prototypes]
   void iop_handle_irq(struct pt_regs *regs)
        ^
   arch/arm/mach-iop32x/irq.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iop_handle_irq(struct pt_regs *regs)
   ^
   static 
   1 warning generated.
--
>> arch/arm/mach-iop32x/cp6.c:10:6: warning: no previous prototype for function 'iop_enable_cp6' [-Wmissing-prototypes]
   void iop_enable_cp6(void)
        ^
   arch/arm/mach-iop32x/cp6.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iop_enable_cp6(void)
   ^
   static 
   arch/arm/mach-iop32x/cp6.c:43:13: warning: no previous prototype for function 'iop_init_cp6_handler' [-Wmissing-prototypes]
   void __init iop_init_cp6_handler(void)
               ^
   arch/arm/mach-iop32x/cp6.c:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init iop_init_cp6_handler(void)
   ^
   static 
   2 warnings generated.


vim +/iop_handle_irq +62 arch/arm/mach-iop32x/irq.c

    61	
  > 62	void iop_handle_irq(struct pt_regs *regs)
    63	{
    64		u32 mask;
    65	
    66		iop_enable_cp6();
    67	
    68		do {
    69			mask = iintsrc_read();
    70			if (mask)
    71				generic_handle_irq(fls(mask));
    72		} while (mask);
    73	}
    74	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
