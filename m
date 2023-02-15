Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB697C;
	Wed, 15 Feb 2023 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676433453; x=1707969453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLhs6o2fCFxp26+sHW7UMl7L2vaPn8fl/naPN67gxnU=;
  b=RNa/kiTOnj0YDolYSNU7ndrYRjfNGsJQfl74FKUEUl9Aim996UF1FUCf
   QFVpGmoQrJFI0hzOIHC+VWLRQikgR+rF38pc4qoKcGFZP60hSW1WHT+EM
   Q584aIdxhK12pP/31+BTPfqe0g7gWtxRHgSDRMRdzJ7iPEmTtUbQR7tFK
   CxAnlVfCqQKZOodqVxW/hSn8LiSD7EK21goivIfNeNc+VR8FqVmLYvvc0
   02OAN6EtxINTn4n3Qmfl+nK/7VugTpYHRQu/B/H5aNljtNxdsTe84fDqx
   OWBJ7YcM67b5uRvY5+1nNTQQaXrmi1W2ymlpyWNioZkQp5aIkH74qU32m
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393740588"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="393740588"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 19:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812281074"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="812281074"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2023 19:57:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS8vC-00090Y-2K;
	Wed, 15 Feb 2023 03:57:30 +0000
Date: Wed, 15 Feb 2023 11:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stable:linux-4.19.y 2425/5220] ld.lld: error:
 drivers/nvme/host/pci.o: contains a compressed section, but zlib is not
 available
Message-ID: <202302151140.0kk4LFIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   53b696f0584acce2e90db69272a2a11aab138370
commit: 455431805699e91c2fd66b7fe43db27643d9b3fd [2425/5220] lightnvm: disable the subsystem
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230215/202302151140.0kk4LFIP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=455431805699e91c2fd66b7fe43db27643d9b3fd
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 455431805699e91c2fd66b7fe43db27643d9b3fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151140.0kk4LFIP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/nvme/host/pci.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/pci.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/pci.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/pci.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/pci.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/pci.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/pci.o: contains a compressed section, but zlib is not available
--
   ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
