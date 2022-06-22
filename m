Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3010F1
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 04:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655870433; x=1687406433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6h8WulSh+ENgoPqn3e+4bZfRdJ5VakAV3CDijVfD/g=;
  b=cUV17a/TeNbVH/58AtO7vcJxkCw/vtOh410jw7X0yjEh1IqOxxWvV9xY
   MUpb62bWgN0roo2i7058HUweAWeFrvReV55+21lURkjpAEZ8+Dg9yeD4i
   xbfLvr+Xl2rV2yIdx3i65kVtTDeeBpGCfECnyvqD60zgAKoRWJNnJmZM+
   V0QWde9wsAs3CEJ+4sjEe36QkAXTsUevPh49eNaOm8QIRxgcvCtu2771m
   U8jlH8siNsHF5Ir4zMVZ8IH1sviLJad62EHxULDCxzaFtQHGoqgW4/dpq
   10mzlsEIqb6Fsu05BYdpNCFqB3o3htiZQ1BsXv8f2ZxR05Zd6UH5I283w
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="344297078"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="344297078"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 21:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="833892571"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2022 21:00:30 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3rXZ-0000oH-SQ;
	Wed, 22 Jun 2022 04:00:29 +0000
Date: Wed, 22 Jun 2022 12:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@profian.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jarkko-tpmdd:kprobes 3/3] arch/powerpc/kernel/module_alloc.c:31:39:
 error: use of undeclared identifier '_etext'
Message-ID: <202206221119.cyyF058c-lkp@intel.com>
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
config: powerpc-mpc8313_rdb_defconfig (https://download.01.org/0day-ci/archive/20220622/202206221119.cyyF058c-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=8a45ec8f64f51131c2e98dcb9ee56edf0ca0a0b3
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd kprobes
        git checkout 8a45ec8f64f51131c2e98dcb9ee56edf0ca0a0b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/module_alloc.c:31:39: error: use of undeclared identifier '_etext'
           unsigned long limit = (unsigned long)_etext - SZ_32M;
                                                ^
   1 error generated.


vim +/_etext +31 arch/powerpc/kernel/module_alloc.c

    27	
    28	void *module_alloc(unsigned long size)
    29	{
    30	#ifdef MODULES_VADDR
  > 31		unsigned long limit = (unsigned long)_etext - SZ_32M;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
