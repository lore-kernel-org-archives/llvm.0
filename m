Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535F322B;
	Mon, 10 Apr 2023 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681133550; x=1712669550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIRseaj/w0jaxvqdyvGek6VFQtiE+TvyPFYOyjpDXUM=;
  b=UV0BHI7YkzZdi6aOrz2TTYlk+zKdhovs7n5ts7/tXV/j61aJQDFKNfvd
   3YLcPbdBvbpTEza1w6DK2kyNe3Xa7qZrt3racG4PyrK5QF5HxFLalEUB0
   eXDq7ZsnAYHl5QG161xLO9Q+29LjQ+KjuovtlwHrDp/GW9lIM9g72+y5D
   d3XV2qb5Y0Dz2bNVrnXMiJf58DZUFwMmV0pfY9DYU+JUmeymzQeMImy14
   /ZgAEYtcfCIRdCo5IAUdyWLazVl3GIcfEjWnD6iBJXnjB2Z1fLKa+U1Xp
   cEakKQvHpywMfkQZc53/a+fqIAOt0a50dKX9LdKscbZsdwlUhD6I5KF+4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371191748"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="371191748"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 06:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862500058"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="862500058"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Apr 2023 06:32:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plrdB-000VOr-0h;
	Mon, 10 Apr 2023 13:32:25 +0000
Date: Mon, 10 Apr 2023 21:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm-efi-zboot 13/13]
 drivers/firmware/efi/libstub/arm32.c:59:44: error: invalid instruction, any
 one of the following would fix this:
Message-ID: <202304102140.VXdME0D3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-efi-zboot
head:   90c71e0a776484a81fdfadacf0e84c6bec598afb
commit: 90c71e0a776484a81fdfadacf0e84c6bec598afb [13/13] efi/zboot: Enable for 32-bit ARM
config: arm-randconfig-r046-20230409 (https://download.01.org/0day-ci/archive/20230410/202304102140.VXdME0D3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=90c71e0a776484a81fdfadacf0e84c6bec598afb
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb arm-efi-zboot
        git checkout 90c71e0a776484a81fdfadacf0e84c6bec598afb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304102140.VXdME0D3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/arm32.c:14:17: warning: no previous prototype for function '__div0' [-Wmissing-prototypes]
   asmlinkage void __div0(void)
                   ^
   drivers/firmware/efi/libstub/arm32.c:14:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void __div0(void)
              ^
              static 
>> drivers/firmware/efi/libstub/arm32.c:59:44: error: invalid instruction, any one of the following would fix this:
               "   mcr     p15, 0, ip, c7, c5, 4   @ ISB                   \n\t"
                                                                             ^
   <inline asm>:20:3: note: instantiated into assembly here
                   bx      r3                                              
                   ^
   drivers/firmware/efi/libstub/arm32.c:59:44: note: instruction requires: thumb
               "   mcr     p15, 0, ip, c7, c5, 4   @ ISB                   \n\t"
                                                                             ^
   <inline asm>:20:3: note: instantiated into assembly here
                   bx      r3                                              
                   ^
   drivers/firmware/efi/libstub/arm32.c:59:44: note: instruction requires: armv4t
               "   mcr     p15, 0, ip, c7, c5, 4   @ ISB                   \n\t"
                                                                             ^
   <inline asm>:20:3: note: instantiated into assembly here
                   bx      r3                                              
                   ^
   1 warning and 1 error generated.


vim +59 drivers/firmware/efi/libstub/arm32.c

    37	
    38	static void __naked __noreturn jump_to_kernel(u32 arg0, u32 arg1, u32 arg2,
    39						      u32 entrypoint)
    40	{
    41		asm("	adr	ip, 1f						\n\t"
    42		    "	mcr	p15, 0, ip, c7, c10, 1	@ DC clean by VA	\n\t"
    43		    "	mcr	p15, 0, r2, c7, c10, 1	@ clean FDT magic	\n\t"
    44		    "	mcr	p15, 0, ip, c7, c10, 4	@ DSB			\n\t"
    45		    "	mcr	p15, 0, ip, c7, c5, 4	@ ISB			\n\t"
    46		    "	mcr	p15, 0, ip, c7, c5, 0	@ invalidate I+BTB	\n\t"
    47		    "	mcr	p15, 0, ip, c7, c5, 4	@ ISB			\n\t"
    48		    "	mrs	ip, CPSR					\n\t"
    49		    "	and	ip, %[mode_mask]				\n\t"
    50		    "	cmp	ip, %[hyp_mode]					\n\t"
    51		    "	mrc	p15, 0, ip, c1, c0, 0	@ SCTLR			\n\t"
    52		    "	bne	0f						\n\t"
    53		    "	mrc	p15, 4, ip, c1, c0, 0	@ HSCTLR		\n\t"
    54		    "0:	bic	ip, ip, #1		@ clear M bit		\n\t"
    55		    "	bne	2f						\n\t"
    56		    "	.align	4						\n\t"
    57		    "1:	mcr	p15, 4, ip, c1, c0, 0	@ HSCTLR		\n\t"
    58		    "2:	mcrne 	p15, 0, ip, c1, c0, 0	@ SCTLR			\n\t"
  > 59		    "	mcr	p15, 0, ip, c7, c5, 4	@ ISB			\n\t"
    60		    "	bx	r3						\n\t"
    61		    :
    62		    :	[mode_mask]"I"(MODE_MASK), [hyp_mode]"I"(HYP_MODE)
    63		    :	"ip", "cc");
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
