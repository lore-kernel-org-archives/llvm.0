Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D008D197;
	Sat, 28 Jan 2023 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674901888; x=1706437888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNf9+k9hyV+V/vSmI7FcWBXcL8oeVW+CR7Z/0naDkxQ=;
  b=idagt/74BtUuzwfple+2mBdIgSc8eQMQZQSYBgvusmruNatDhC5XX/JT
   XoH4yJKGew1ipuzWy7eqC+aE7B3C9c5QYwlW5lHf2ytDQFpaTke2g06TM
   ShI2wYpBV4oAhKBcIfeVcFumC0AgMJV+zK4DsvbksQ3TYPFhTeXyC8TSX
   rtbG9Toy7mbpFf+Rz/8gyDXOlPIDz16uTKycmRlPlLZgotGTJFkeEko6K
   S0q+ZxeNp9dmx+twqpdu8FCTmS0XmxMU7in0PfXjZ10O5ZWP69KjsIkOe
   Lo76kbZXEB9p+LDf/C6BtIU8/hI5gntOGgGG9EW7IuhBaSFiRom07rs1+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="310902686"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="310902686"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 02:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="837442522"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="837442522"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2023 02:31:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLiUX-0000aC-25;
	Sat, 28 Jan 2023 10:31:25 +0000
Date: Sat, 28 Jan 2023 18:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	0day robot <lkp@intel.com>
Subject: init/main.c:108:10: fatal error: 'asm/setup.h' file not found
Message-ID: <202301281849.TD6gcH6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
head:   06897a0964c21c88d28d72b2d7959fc8651a6d21
commit: 3e261a30a338475c3efe666377daa612924b1129 asm-generic: Remove COMMAND_LINE_SIZE from uapi
date:   3 days ago
config: riscv-randconfig-r014-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281849.TD6gcH6I-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3e261a30a338475c3efe666377daa612924b1129
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
        git checkout 3e261a30a338475c3efe666377daa612924b1129
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/ drivers/ata/ drivers/firmware/efi/libstub/ drivers/mmc/host/ drivers/of/ init/ lib/kunit/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> init/main.c:108:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>
            ^~~~~~~~~~~~~
   1 error generated.
--
>> arch/riscv/kernel/setup.c:29:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>
            ^~~~~~~~~~~~~
   1 error generated.
--
>> arch/riscv/kernel/elf_kexec.c:22:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>
            ^~~~~~~~~~~~~
   1 error generated.
--
>> drivers/ata/libata-core.c:59:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>
            ^~~~~~~~~~~~~
   1 error generated.
--
>> drivers/of/fdt.c:31:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
            ^~~~~~~~~~~~~
   1 error generated.
--
>> drivers/firmware/efi/libstub/efi-stub-helper.c:15:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>
            ^~~~~~~~~~~~~
   1 error generated.
--
>> drivers/firmware/efi/libstub/gop.c:14:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>
            ^~~~~~~~~~~~~
   1 error generated.
--
>> drivers/firmware/efi/libstub/printk.c:10:10: fatal error: 'asm/setup.h' file not found
   #include <asm/setup.h>
            ^~~~~~~~~~~~~
   1 error generated.


vim +108 init/main.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  105  
^1da177e4c3f41 Linus Torvalds   2005-04-16  106  #include <asm/io.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  107  #include <asm/bugs.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16 @108  #include <asm/setup.h>
a940199f206dcf Andi Kleen       2005-07-28  109  #include <asm/sections.h>
37b73c82818573 Arjan van de Ven 2006-01-06  110  #include <asm/cacheflush.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
