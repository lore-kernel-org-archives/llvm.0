Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE46A7B
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 23:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663887827; x=1695423827;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cyy/Gh9e+eJgOv3wmhUgtQgxkoNMiwuxtcILvKWEy28=;
  b=f3EJk4G/z9e82VV1/2CbkphMkI3uba4YAv0YB17hMcWm/rqi4exqUglx
   Wyuca/titE0VjJePVeArH4SJteP6mVvIO1GxxfU3qh36mLeyyCwPV/SGH
   mSTIY5lEgGKjKqLFij4xpqJwQ7A/gWe2ZGbkxDYl7x+HlkfD8ct+FVaxf
   tBv4/4vqfua+Ro55SsYGyRij11uEHGK5UWALa0elMeGdjN4UO6nJrQzSa
   9Wft4ACuLsiZ+1K/T90p6hJwPVPsYJbwujrr83QVyBZvd86nJf++Ntxfz
   oO4UWimizrBqhIcFP9LX7v24WmlL48uxl1ytCzJr/EbwOba4r30VCjYGB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="299179275"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="299179275"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 16:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="650732529"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Sep 2022 16:03:46 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obVEP-00053o-1H;
	Thu, 22 Sep 2022 23:03:45 +0000
Date: Fri, 23 Sep 2022 07:03:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 8660/8813] ld.lld: error:
 vmlinux.a(kernel/crash_core.o):(function crash_save_vmcoreinfo_init:
 .init.text+0x67c): relocation R_RISCV_PCREL_HI20 out of range: -526499 is
 not in [-524288, 524287]; references kallsyms_names
Message-ID: <202209230603.Y1zKLGtz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Vignesh Raghavendra <vigneshr@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   483fed3b5dc8ce3644c83d24240cf5756fb0993e
commit: a7c350a0e522caa4fb89ca3f28ab18091c75c419 [8660/8813] Merge branch 'ti-next' of git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
config: riscv-buildonly-randconfig-r002-20220922 (https://download.01.org/0day-ci/archive/20220923/202209230603.Y1zKLGtz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a7c350a0e522caa4fb89ca3f28ab18091c75c419
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a7c350a0e522caa4fb89ca3f28ab18091c75c419
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/crash_core.o):(function crash_save_vmcoreinfo_init: .init.text+0x67c): relocation R_RISCV_PCREL_HI20 out of range: -526499 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by crash_core.c:260 (kernel/crash_core.c:260)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/crash_core.o):(function crash_save_vmcoreinfo_init: .init.text+0x696): relocation R_RISCV_PCREL_HI20 out of range: -526499 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by crash_core.c:267 (kernel/crash_core.c:267)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/crash_core.o):(function crash_save_vmcoreinfo_init: .init.text+0x6b0): relocation R_RISCV_PCREL_HI20 out of range: -526499 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by crash_core.c:267 (kernel/crash_core.c:267)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/crash_core.o):(function crash_save_vmcoreinfo_init: .init.text+0x6ca): relocation R_RISCV_PCREL_HI20 out of range: -526499 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by crash_core.c:267 (kernel/crash_core.c:267)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/crash_core.o):(function crash_save_vmcoreinfo_init: .init.text+0x6e4): relocation R_RISCV_PCREL_HI20 out of range: -526499 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by crash_core.c:267 (kernel/crash_core.c:267)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/crash_core.o):(function crash_save_vmcoreinfo_init: .init.text+0x6fe): relocation R_RISCV_PCREL_HI20 out of range: -526499 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by crash_core.c:267 (kernel/crash_core.c:267)
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
