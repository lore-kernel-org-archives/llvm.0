Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD674C88
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646775522; x=1678311522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bps0Wzx+o0VFkXOQE1cn0Ni6ez4+LJFfwJCJwrrXPso=;
  b=aloQIAp/OnurH3rSACRumstSanVsd2LrFnIgIq+wWX9gV5xEbgg60EI+
   S6P7JpF8m69eoZW5iV2hBjsKSU1V0B3ZDvKXhqZxViCcb8ze6f+Jj5bcL
   EFTb2xhIYzm6e7t4DOVkXrqhYOU3TwlErjXjIfGXriq0y0SmREYZmLKAe
   S7u5zbA5Qn+UTb3PxFOvwkHYSOf8ejmkUW2MwMquzfhfMlQRaW7vsCL0/
   eCZep9aKaRByXUNqjcjH2ViMUeskncVcDXhp97847l0jS7kkw+V1MViwT
   Cy5Gf4JUTKemdjQZdkRMU1DyfGGSuM41glc8MfyB7ZksXH9ycQSWDQatS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234774129"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="234774129"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 13:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="513274428"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Mar 2022 13:38:39 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRhXS-00020x-Sq; Tue, 08 Mar 2022 21:38:38 +0000
Date: Wed, 9 Mar 2022 05:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 123/11353] ld.lld: error: undefined symbol:
 generic_handle_arch_irq
Message-ID: <202203090525.Ks4Y4c8K-lkp@intel.com>
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
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: 54f481a2308efab49d2b14c3f8263b34fdb1c65e [123/11353] ARM: remove old-style irq entry
config: arm-buildonly-randconfig-r006-20220308 (https://download.01.org/0day-ci/archive/20220309/202203090525.Ks4Y4c8K-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0f90bc55ed536e1488648255278ce9029cfa59)
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
