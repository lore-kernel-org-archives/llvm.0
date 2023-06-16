Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E088627;
	Fri, 16 Jun 2023 01:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686878765; x=1718414765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cjlcGYZ8Xdgh5i43lgiUoq0m7XD27amjOqI8fH+x5j8=;
  b=hjM4rg+v7fWex215K/atX4g/3hJGRW6Ilc2qx6ahXFHGmP64U/CQFulR
   aJ2s+e4W09V0z8I/H0T8YkdvibRL/y62CfQ1wcNYUvSNofTAiNfqm+0R8
   jRvf0/xruw3E+6FPDK5UB0n5bWNtefgz5RW9wbSuvYiuj0eKoCTWVP0C9
   qgn04Yt/HceloBbi9uKgTg5BGhOnHgXL4LK6eFf3VnMXW4h99KYFlitHE
   rXmGmtmuBgxyKOP4N7j6CGqomCiD3V26wgFu3DBWngzEpyZVxTGOQqQIW
   5L5gB9TvKW7EVjINnZxzE4YjESRoVcM9ID0xFdu5GvqhK/ZlQhA1t+jWV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348794276"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="348794276"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 18:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715823734"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="715823734"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2023 18:26:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9yDv-0000cf-38;
	Fri, 16 Jun 2023 01:25:59 +0000
Date: Fri, 16 Jun 2023 09:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Arjun Roy <arjunroy.kdev@gmail.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	arjunroy@google.com, edumazet@google.com, soheil@google.com
Subject: Re: [net-next] tcp: Use per-vma locking for receive zerocopy
Message-ID: <202306160941.CgtiNISL-lkp@intel.com>
References: <20230615185516.3738855-2-arjunroy.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615185516.3738855-2-arjunroy.kdev@gmail.com>

Hi Arjun,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Arjun-Roy/tcp-Use-per-vma-locking-for-receive-zerocopy/20230616-025823
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230615185516.3738855-2-arjunroy.kdev%40gmail.com
patch subject: [net-next] tcp: Use per-vma locking for receive zerocopy
config: s390-randconfig-r026-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160941.CgtiNISL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/20230615185516.3738855-2-arjunroy.kdev@gmail.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160941.CgtiNISL-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: mm/memory.o: in function `lock_vma_under_rcu':
>> memory.c:(.text+0x9784): undefined reference to `tcp_vm_ops'
   s390x-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x3e): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: hidma.c:(.text+0x96): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: drivers/net/ethernet/altera/altera_tse_main.o: in function `altera_tse_probe':
   altera_tse_main.c:(.text+0x12c): undefined reference to `devm_ioremap'
   s390x-linux-ld: altera_tse_main.c:(.text+0x28a): undefined reference to `devm_ioremap'
   s390x-linux-ld: altera_tse_main.c:(.text+0x316): undefined reference to `devm_ioremap'
   s390x-linux-ld: drivers/net/ethernet/altera/altera_tse_main.o: in function `request_and_map':
   altera_tse_main.c:(.text+0x688): undefined reference to `devm_ioremap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
