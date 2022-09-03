Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA67E
	for <llvm@lists.linux.dev>; Sat,  3 Sep 2022 15:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662218632; x=1693754632;
  h=date:from:cc:subject:message-id:mime-version;
  bh=I1mg+0YPu0JQihhCcG4lTvOWGZQ2NM7d8NQKtWmEzhs=;
  b=E9YXZp+P/+CJfQ76J3T6077iseqfdSIbx/RjLZYwbZl/muJUrUsrmN0i
   AAzeAT7YxCaPAy8mR7YUu+jrOlamAdyA7bTUsxIrMW+h2fmeAmthFLKGI
   4oUJnqa816CGupHvBvDw14Dee4EeL8sUTQZbgJJrbS4KGnu1p/thio7lG
   qCAux5YGbHHe2EZsU0th7mdc3DVqiHOyfMzSnR0IqhSRYDbCcuk9UPiqc
   X06WqcOoh7341OYU+FHr1xApfRKSIgkvm0+sV0SX+A6cNQ9fuhWts1Lwc
   UGhkWduF4KRcDbxmPqk1FkCSEpHoNJsUGtBhuNA+SKtCPwIq1UuXNRShh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="382466208"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="382466208"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 08:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="702440854"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Sep 2022 08:23:43 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUUzn-0001p1-0V;
	Sat, 03 Sep 2022 15:23:43 +0000
Date: Sat, 3 Sep 2022 23:23:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.0-rc1 21/24] ld.lld: error:
 arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
Message-ID: <202209032354.b0SHaeQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.0-rc1
head:   fd7709c9f1119794e96665ae423d79d93bfe43fc
commit: c815de3dd0f6ccea52b05efa8e1be1043255006a [21/24] powerpc: Make virt_to_pfn() a static inline
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20220903/202209032354.b0SHaeQe-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=c815de3dd0f6ccea52b05efa8e1be1043255006a
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.0-rc1
        git checkout c815de3dd0f6ccea52b05efa8e1be1043255006a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> ld.lld: error: arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
   >>> static inline unsigned long virt_to_pfn(const volatile void *kaddr)
   >>> ^
>> clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [arch/powerpc/kernel/vdso/Makefile:66: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:392: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
