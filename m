Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771C7E
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646320678; x=1677856678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=siK6OzUYk0P0LR9ZIqrqzGygUf4emkuyJ9piDWJjlE8=;
  b=nAVUG0DElNAgbyQKUHVWnj39BGFN8sfbBSf7DcmJj0Ivkd3svfPjwv3K
   u+FTjET5KAPfvKtvN2dumigL+Opg5U1Db2r8KRl6nMPLH6MtmZ/oYX77H
   1Y3EqNL3raoAV1ZWX9KdI8KXdhbXuPFk1xxdrjZB7E7DQnu5uvxpgQbub
   yWfBiz5XGfdoOaQDt7V+nehE3UCwXe95QwuDiOl5gfjDYhfMXlra/i33I
   zx635Q3piplUCWjjoqtexGOPW9h1X4UQ6eem3QEwJLHdD50GgFXtMOsmr
   C88568nZFZp9Quj0xMFon2PoofVHuzrXwcL5+TucKirzEh/7hA4GLlKZn
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="316919683"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="316919683"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 07:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535867276"
Received: from lkp-server01.sh.intel.com (HELO ccb16ba0ecc3) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 07:17:56 -0800
Received: from kbuild by ccb16ba0ecc3 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPnDI-0000ej-87; Thu, 03 Mar 2022 15:17:56 +0000
Date: Thu, 3 Mar 2022 23:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9446/10468] arch/s390/lib/test_unwind.c:172:21:
 warning: variable 'fops' set but not used
Message-ID: <202203032324.ysoZaPqS-lkp@intel.com>
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
head:   91265a6da44d13296bdb5b3fbafa19d06be462f2
commit: 829ec7491c401e4a3068955a438578d2c2ae8acc [9446/10468] s390/test_unwind: add ftrace test
config: s390-randconfig-r015-20220303 (https://download.01.org/0day-ci/archive/20220303/202203032324.ysoZaPqS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=829ec7491c401e4a3068955a438578d2c2ae8acc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 829ec7491c401e4a3068955a438578d2c2ae8acc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/s390/lib/test_unwind.c:172:21: warning: variable 'fops' set but not used [-Wunused-but-set-variable]
           struct ftrace_ops *fops;
                              ^
   1 warning generated.


vim +/fops +172 arch/s390/lib/test_unwind.c

   169	
   170	static int test_unwind_ftrace(struct unwindme *u)
   171	{
 > 172		struct ftrace_ops *fops;
   173		int ret;
   174	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
