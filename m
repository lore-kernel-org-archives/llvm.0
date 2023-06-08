Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E17F628;
	Thu,  8 Jun 2023 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686209807; x=1717745807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZQxyZtJGRmqMnWPgP9gu3e0p0yuXbFa0L7+iW8ujBY=;
  b=AgUCdiWSBUqHQ7b7ePsT4ALgf77ok7AvB0UXJ2hc0c10aPtwE/mpZ3Vs
   dIYwWbGFLTx5JTZzZGoBECbOhGpVxGOweVna8QG8dft87fYPCmHkU6/Er
   tt3yljGmccAQ1hpaJs12WHJKjvdx9CL9YFgow8o6Vuc/ns1307CZETcAR
   bvXrVC7yHEOzVB9KhXBw6V6lbdqwyvDFNaivzMtlstVv6UiJ2JuQZ2+AQ
   q7HRs+6MBBSp4eUh6mX/ofqPB6Q9ZGAWHh7DpiH0boPvAA8xKO1xia5+H
   8gdxQmNF4Bq3HEkvaGrt5+HUP2EOlcKOFZjVxT4VLiM/KsJupdP+HUHjp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360572268"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="360572268"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 00:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="779781251"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="779781251"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2023 00:36:45 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ACK-0007X2-1V;
	Thu, 08 Jun 2023 07:36:44 +0000
Date: Thu, 8 Jun 2023 15:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 3/5] ld.lld: error: undefined symbol: cpu_scale
Message-ID: <202306081516.3994M3qz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   9386dea7e9d6e37c2c08b088f3195770ae2f3feb
commit: 435daa42656081a9a751c5140a78cb775c0c9e7a [3/5] bpf: Add cpufreq helpers
config: arm-randconfig-r036-20230608 (https://download.01.org/0day-ci/archive/20230608/202306081516.3994M3qz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=435daa42656081a9a751c5140a78cb775c0c9e7a
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout 435daa42656081a9a751c5140a78cb775c0c9e7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081516.3994M3qz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cpu_scale
   >>> referenced by helpers.c
   >>>               kernel/bpf/helpers.o:(bpf_get_cpu_scale) in archive vmlinux.a
   >>> referenced by helpers.c
   >>>               kernel/bpf/helpers.o:(bpf_get_cpu_scale) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
