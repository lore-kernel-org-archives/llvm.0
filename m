Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE517E
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654007838; x=1685543838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3T67bfAQbnZiZb2PCR9IrVytbv/b6C8m2GiQK7Xh+s=;
  b=jtXqSc1waADALrpNzmQMYAj7MUB+WM0EzfwDRSA8ZXCZ4ZEmXk6cgGTX
   oTk/aV/GUqWq+x7aTG1hhAMHzCBZdW+YxM6QLlzkJacogh0uQcYt7y+Jv
   g1ynXqMfAw7Y7XuOK6ul3L0b7M8bCTSJgdoMBQxwW3xC7CTn7cOHY+IeR
   zDFYBYh3SrZ/6FMzV8Jql3Dr/91GITtz2aKSyoWm00cqqJv3j9GDgGx0J
   O4RlCuqjdH1h1cR/lxC/BiIOQBKg/UU+ydUrjRU1MFnTYZGrrLwv3VBnh
   3L7RfYSb1eaoTxoth37UdIWFQRTOyqIpVV3y4UnmrpAxmhlPO91K1hmcC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="361645572"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; 
   d="scan'208";a="361645572"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 07:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; 
   d="scan'208";a="529604918"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2022 07:37:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nw2zi-0002mo-7f;
	Tue, 31 May 2022 14:37:14 +0000
Date: Tue, 31 May 2022 22:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Bill Wendling <morbo@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: ld.lld: error: undefined symbol: .early_setup
Message-ID: <202205312222.XiSqyPc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab2afa23bd197df47819a87f0265c0ac95c5b6a
commit: 0355785313e2191be4e1108cdbda94ddb0238c48 powerpc: Add "-z notext" flag to disable diagnostic
date:   10 months ago
config: powerpc64-randconfig-r023-20220530 (https://download.01.org/0day-ci/archive/20220531/202205312222.XiSqyPc4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0355785313e2191be4e1108cdbda94ddb0238c48
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0355785313e2191be4e1108cdbda94ddb0238c48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: .early_setup
   >>> referenced by arch/powerpc/kernel/head_64.o:(.ref.text+0xAE)
   >>> did you mean: early_setup
   >>> defined in: arch/powerpc/built-in.a(kernel/setup_64.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
