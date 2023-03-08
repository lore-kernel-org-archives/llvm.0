Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5227C;
	Wed,  8 Mar 2023 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678264842; x=1709800842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gB7WDPIHJt5t/8v281bB3fITw5uht69zDV1c3D9xXos=;
  b=YVh3BgEjyXPk2D7BM/zyWCash+0vSKMyAyJcytD3cCMGePu1Mr0Hpxa1
   A5WchOL+4v/vk2mNTqL48K6bn7Q/Gyfu3xqSUbbPuh96t/3Ou3FCmx9dd
   dgGn3uSLOWeFt39kjDGj4OgFqiTN9BC1j/DxTd2aghfoVMrkD+lE+RUMG
   h+gT8wAAwpQ+DoXhXT7+kF+o7NG5/DLQ6eoRCcJEdnEhzUvsLvte/40Gk
   GFfzsM789gAp78p6MFdwXqoEEuPSPhvgeJAdTQlb704tV4/us1er+SvO4
   mQHtD7TImA/oTjLSVnG2dpSyNJCnDfIFenrooREMKWx6ll7fkgA5jB7KU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422369799"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="422369799"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 00:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006249531"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="1006249531"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 00:40:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZpLj-0001zP-28;
	Wed, 08 Mar 2023 08:40:39 +0000
Date: Wed, 8 Mar 2023 16:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: [jpoimboe:objtool/core 10/24] arch/mips/include/asm/smp.h:44:29:
 error: use of undeclared identifier 'CONFIG_MIPS_NR_CPU_NR_MAP'
Message-ID: <202303081612.leLRNMzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   ed8d2d280a75ca9deb6d307e116acff4b8ef0782
commit: 09b0d89f25b23d7ed2df68a6bf2fa1ec484a15c6 [10/24] mips/cpu: Expose play_dead()'s prototype definition
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20230308/202303081612.leLRNMzo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=09b0d89f25b23d7ed2df68a6bf2fa1ec484a15c6
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool/core
        git checkout 09b0d89f25b23d7ed2df68a6bf2fa1ec484a15c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081612.leLRNMzo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:44:29: error: use of undeclared identifier 'CONFIG_MIPS_NR_CPU_NR_MAP'
   extern int __cpu_number_map[CONFIG_MIPS_NR_CPU_NR_MAP];
                               ^
   arch/mips/include/asm/smp.h:71:20: error: redefinition of 'smp_send_reschedule'
   static inline void smp_send_reschedule(int cpu)
                      ^
   include/linux/smp.h:198:20: note: previous definition is here
   static inline void smp_send_reschedule(int cpu) { }
                      ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
   arch/mips/include/asm/smp.h:75:8: error: incomplete definition of type 'struct plat_smp_ops'
           mp_ops->send_ipi_single(cpu, SMP_RESCHEDULE_YOURSELF);
           ~~~~~~^
   arch/mips/include/asm/smp-ops.h:57:8: note: forward declaration of 'struct plat_smp_ops'
   struct plat_smp_ops;
          ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
   arch/mips/include/asm/smp.h:130:8: error: incomplete definition of type 'struct plat_smp_ops'
           mp_ops->send_ipi_single(cpu, SMP_CALL_FUNCTION);
           ~~~~~~^
   arch/mips/include/asm/smp-ops.h:57:8: note: forward declaration of 'struct plat_smp_ops'
   struct plat_smp_ops;
          ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
   arch/mips/include/asm/smp.h:137:8: error: incomplete definition of type 'struct plat_smp_ops'
           mp_ops->send_ipi_mask(mask, SMP_CALL_FUNCTION);
           ~~~~~~^
   arch/mips/include/asm/smp-ops.h:57:8: note: forward declaration of 'struct plat_smp_ops'
   struct plat_smp_ops;
          ^
   5 errors generated.


vim +/CONFIG_MIPS_NR_CPU_NR_MAP +44 arch/mips/include/asm/smp.h

^1da177e4c3f41 include/asm-mips/smp.h      Linus Torvalds 2005-04-16  41  
^1da177e4c3f41 include/asm-mips/smp.h      Linus Torvalds 2005-04-16  42  /* Map from cpu id to sequential logical cpu number.  This will only
^1da177e4c3f41 include/asm-mips/smp.h      Linus Torvalds 2005-04-16  43     not be idempotent when cpus failed to come on-line.	*/
7820b84be844d8 arch/mips/include/asm/smp.h David Daney    2017-09-28 @44  extern int __cpu_number_map[CONFIG_MIPS_NR_CPU_NR_MAP];
^1da177e4c3f41 include/asm-mips/smp.h      Linus Torvalds 2005-04-16  45  #define cpu_number_map(cpu)  __cpu_number_map[cpu]
^1da177e4c3f41 include/asm-mips/smp.h      Linus Torvalds 2005-04-16  46  

:::::: The code at line 44 was first introduced by commit
:::::: 7820b84be844d8d863122b1323f2a4bc2441b783 MIPS: Allow __cpu_number_map to be larger than NR_CPUS

:::::: TO: David Daney <david.daney@cavium.com>
:::::: CC: James Hogan <jhogan@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
