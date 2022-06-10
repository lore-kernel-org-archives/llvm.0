Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075E87C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654902321; x=1686438321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6G7K9PLHT3WpnM85njUgGyQ7zZIAHOlnaQHj0mDwvx0=;
  b=Q4JTBGJdD1m1UMB6Bq/Fg/sCO6rzABKZuTB3kF8Wz4Ql6yLE9Akc9GYI
   hfe9pNpMrGsdkwQKzBGr4s9FOcQPuPjegdVUWD+SSk93NRyBdWTJeBXuz
   qHi3o0FOPb8HFTQoqrzLVSHX1yJFkqt9dMbY05iWuo6VfXZb0NTaMH+0a
   VvZELVK+WtE3UxPDypnax4Fnh0Jr+XmZGcXB2+rRnbu6QpfaikzmqQKG+
   QGNKAU9eIK86+uN5w0YrJBwBrJRJceqRWjh4TbuwKeM1Ri4ijSot/+FbF
   j+4vFDHyVBKkDhdT2AlzhMKYZQ4N/QgAAyqIXU7i696l/8lgp3manuQjC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="278572723"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="278572723"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="586437690"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2022 16:04:55 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzngU-000ILh-S4;
	Fri, 10 Jun 2022 23:04:54 +0000
Date: Sat, 11 Jun 2022 07:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@profian.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jarkko-tpmdd:kprobes 3/3] arch/arm/kernel/module_alloc.c:24:7:
 warning: no previous prototype for function 'module_alloc'
Message-ID: <202206110716.TCuKUFdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git kprobes
head:   8a45ec8f64f51131c2e98dcb9ee56edf0ca0a0b3
commit: 8a45ec8f64f51131c2e98dcb9ee56edf0ca0a0b3 [3/3] kprobes: Enable tracing for mololithic kernel images
config: arm-mxs_defconfig (https://download.01.org/0day-ci/archive/20220611/202206110716.TCuKUFdZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 70d35fe1257e429266b83025997b400e9f79110e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=8a45ec8f64f51131c2e98dcb9ee56edf0ca0a0b3
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd kprobes
        git checkout 8a45ec8f64f51131c2e98dcb9ee56edf0ca0a0b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/kernel/module_alloc.c:24:7: warning: no previous prototype for function 'module_alloc' [-Wmissing-prototypes]
   void *module_alloc(unsigned long size)
         ^
   arch/arm/kernel/module_alloc.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *module_alloc(unsigned long size)
   ^
   static 
   1 warning generated.


vim +/module_alloc +24 arch/arm/kernel/module_alloc.c

    22	
    23	#ifdef CONFIG_MMU
  > 24	void *module_alloc(unsigned long size)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
