Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332D2C9C
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643900300; x=1675436300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImiMr2RYxdnptVxqA2RLMhnyt9qe0IIe1pIH1aXifqQ=;
  b=UxesYxzFtSRycWP37ji6ziPcZCYPZCVBmI2ijfheDCdQ0bsqmiP6kSd/
   6O4aOleEOch2bMKmc0/6o3xkVsVANbUSG3WTweBql6vqze+/9m9uF/zkj
   NjTvyvO8HuZv7z/GmSfwAdONAuHYLej3griRecbMxv+FEUI9TZrCuOXEm
   eyYrvQOc0cLKGxumNjgKRSKwSroBAYP8Hp+y5TSoUg1/5Adb+f+8cJ9Fj
   ZVukmM5XSIArzGXcb+TjDudfeRLfiEAmyWwE61WQvHOuXTp9pifarCJiX
   5PgbT7zFw8Z69pESVR4QSAVhgvRDOm6XKsrSnT4dXdUCQMv/r6torvDBp
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="228808900"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="228808900"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 06:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="631363443"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Feb 2022 06:58:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFdYu-000WGU-PZ; Thu, 03 Feb 2022 14:58:16 +0000
Date: Thu, 3 Feb 2022 22:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 147/3941] ld.lld: error: undefined symbol:
 generic_handle_arch_irq
Message-ID: <202202032250.kbvVm5aQ-lkp@intel.com>
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
head:   2d3d8c7643a56bfe2e808f97d5a4360d49f3b45b
commit: 54f481a2308efab49d2b14c3f8263b34fdb1c65e [147/3941] ARM: remove old-style irq entry
config: arm-randconfig-r021-20220201 (https://download.01.org/0day-ci/archive/20220203/202202032250.kbvVm5aQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
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

>> ld.lld: error: undefined symbol: generic_handle_arch_irq
   >>> referenced by kernel/entry-armv.o:(__irq_svc) in archive arch/arm/built-in.a
   >>> referenced by kernel/entry-armv.o:(__irq_usr) in archive arch/arm/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
