Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840472F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 00:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644280145; x=1675816145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QVlSAaM+YaJeuGLE+eEJBhKvQ0xzFtjkU+/0+2kWHo=;
  b=ehvznERVZhqP+eUgzw+qFZxkW7kFTtZI5zXDCMCaURDF4h4M6tXfahF3
   /8ZP54PvI6oOVDJWbnljxsDYsJw3hCLNV2c9jshhJe6cXjdu35NUGB0bU
   ztOaxkD7kcKXspaxp0tJnCih1dZ04dpIIhLMQ7u6snznXLs15bk11uOid
   m6MNMILvD5WvE5HcOGBq4QSOZhfoA38XQv0E8tBh/F85N84jN34NyAmsB
   u4SZlFV3XvCTuuTTFJ6zSjJ5DRddSbJug12JTvRrVWjEVagfGasakd6kA
   DRZgGiFEpeFabSx7RIXmbH1+0MOju4Uh/9jZr10r7guZzPfj5x/j3HI/n
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249047888"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="249047888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 16:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="700656764"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Feb 2022 16:29:03 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHENS-00018g-JE; Tue, 08 Feb 2022 00:29:02 +0000
Date: Tue, 8 Feb 2022 08:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 122/4212]
 arch/arm/boot/compressed/atags_to_fdt.c:129:5: warning: stack frame size
 (1344) exceeds limit (1280) in 'atags_to_fdt'
Message-ID: <202202080808.lrsdrLFj-lkp@intel.com>
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
head:   b3c0a155ef77550d48f6eb7c6fdd6075764a5622
commit: 672513bf583157cc088a32e75bd850dd9f81564c [122/4212] ARM: decompressor: disable stack protector
config: arm-buildonly-randconfig-r004-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080808.lrsdrLFj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=672513bf583157cc088a32e75bd850dd9f81564c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 672513bf583157cc088a32e75bd850dd9f81564c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
