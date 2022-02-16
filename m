Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81C7C
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645008590; x=1676544590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EUKFDEji/6gwt9hwxzLLJjF4ArMNNPU0gl41KspXdJs=;
  b=PqqtbX8lwlphbn1NoAyPhDX2G8vqtpPrRgvX9rj045L5LKaK6aRKEiDx
   WbBwP7ZfgXxuOm6Anr6zHzf6iBLAcio10Y2tYtV2kSJC+VUE3UT5aI86o
   BNaLUFBZ1HNHnWNGnBnM5/55+X+pQNXxZHc5dQMBwIa1aRD5AvLc/M9tE
   IEmuT5SlwwqBaschLwAhTHgEsVkzT+nIV2l9uVrO27U86mgjKDArmNKwm
   JaUL+m+bhwkQItERBZsVdDd61X+KhPZtSNd/XRlSwD+lif+8S2cBeJGTL
   6WRSAhTcQHHNWGm4wfuWunb7OZgv2NveKhLR6OnSWjj5NQKYw0gXD+ewp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="337011937"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="337011937"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 02:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="539979933"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Feb 2022 02:49:34 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKHsL-000Aih-SQ; Wed, 16 Feb 2022 10:49:33 +0000
Date: Wed, 16 Feb 2022 18:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 127/5952] ld.lld: error: undefined symbol:
 generic_handle_arch_irq
Message-ID: <202202161817.n8HQcj2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b593b8979eac3f6255401663fa42f3473b8f6cb1
commit: 54f481a2308efab49d2b14c3f8263b34fdb1c65e [127/5952] ARM: remove old-style irq entry
config: arm-buildonly-randconfig-r004-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161817.n8HQcj2s-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=54f481a2308efab49d2b14c3f8263b34fdb1c65e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 54f481a2308efab49d2b14c3f8263b34fdb1c65e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
>> ld.lld: error: undefined symbol: generic_handle_arch_irq
   >>> referenced by kernel/entry-armv.o:(__irq_svc) in archive arch/arm/built-in.a
   >>> referenced by kernel/entry-armv.o:(__irq_usr) in archive arch/arm/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
