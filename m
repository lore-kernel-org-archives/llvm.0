Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5E1872
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663672177; x=1695208177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nqeGfwzE3RvraBj8s5VXbFNjcB2Hwa1a72V7QrPqjnw=;
  b=IJDqd7h7SVCtDuXPIZm7op0jzuuGsEix/D+Jy1hf9gs3XZ+ZQeAIBLZ0
   CvKz3OA5te1xQzUDV+FlUEXidh1lddYW7s6PSYFKO9ZJGac8p4SYlwArq
   sraR/QVrM87B2qjH20OWqtCf5jVy4qu5KB4hrxHdYyjGRoCpiIaJ2j242
   5wahlYEfG7FqjxW8etprp6HUXXZXnLH6vQXer4Nn3wurtuMM5/Tz6AJkk
   bhnoAwzN5oQ3TrF1FBNK9rWaqsbWh6S6Ick39TPnGZ5RCzqWGPc/HYEVQ
   EhzOC4VYD/UBBKc1BX3vU2tmptnzFZO5kGO5TwIylNSPmUeGKnWcK4uKq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279390818"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="279390818"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 04:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="652055159"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Sep 2022 04:09:35 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oab8B-0002hz-01;
	Tue, 20 Sep 2022 11:09:35 +0000
Date: Tue, 20 Sep 2022 19:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: arch/arm/boot/compressed/atags_to_fdt.c:129:5: warning: stack frame
 size (1344) exceeds limit (1280) in 'atags_to_fdt'
Message-ID: <202209201858.YLTXHqey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: 672513bf583157cc088a32e75bd850dd9f81564c ARM: decompressor: disable stack protector
date:   10 months ago
config: arm-randconfig-r004-20220920 (https://download.01.org/0day-ci/archive/20220920/202209201858.YLTXHqey-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=672513bf583157cc088a32e75bd850dd9f81564c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 672513bf583157cc088a32e75bd850dd9f81564c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm/boot/compressed/atags_to_fdt.c:129:5: warning: no previous prototype for function 'atags_to_fdt' [-Wmissing-prototypes]
   int atags_to_fdt(void *atag_list, void *fdt, int total_space)
       ^
   arch/arm/boot/compressed/atags_to_fdt.c:129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int atags_to_fdt(void *atag_list, void *fdt, int total_space)
   ^
   static 
>> arch/arm/boot/compressed/atags_to_fdt.c:129:5: warning: stack frame size (1344) exceeds limit (1280) in 'atags_to_fdt' [-Wframe-larger-than]
   int atags_to_fdt(void *atag_list, void *fdt, int total_space)
       ^
   2 warnings generated.


vim +/atags_to_fdt +129 arch/arm/boot/compressed/atags_to_fdt.c

31d0b9f9982f8e Ben Dooks          2018-10-12  120  
b90b9a38251e9c Nicolas Pitre      2011-09-13  121  /*
b90b9a38251e9c Nicolas Pitre      2011-09-13  122   * Convert and fold provided ATAGs into the provided FDT.
b90b9a38251e9c Nicolas Pitre      2011-09-13  123   *
4716e2e34a22a8 Geert Uytterhoeven 2021-05-19  124   * Return values:
b90b9a38251e9c Nicolas Pitre      2011-09-13  125   *    = 0 -> pretend success
b90b9a38251e9c Nicolas Pitre      2011-09-13  126   *    = 1 -> bad ATAG (may retry with another possible ATAG pointer)
b90b9a38251e9c Nicolas Pitre      2011-09-13  127   *    < 0 -> error from libfdt
b90b9a38251e9c Nicolas Pitre      2011-09-13  128   */
b90b9a38251e9c Nicolas Pitre      2011-09-13 @129  int atags_to_fdt(void *atag_list, void *fdt, int total_space)

:::::: The code at line 129 was first introduced by commit
:::::: b90b9a38251e9c89c34179eccde57411ceb5f1aa ARM: zImage: allow supplementing appended DTB with traditional ATAG data

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nico@fluxnic.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
