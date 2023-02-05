Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EA2579;
	Sun,  5 Feb 2023 11:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675595305; x=1707131305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QseAgTNEL854KgQuKX6jiBT3qBIPUL6u0QFjJqeTmvA=;
  b=l9X9rjBA2bE0k5vruV2ttwlfbbH6jWFYqcbC9Qae5RIit9GLdp5IpBLT
   FPB4GGqaZAw7lxBb3VZWjHa9wd1Xv+XgLhtNF5pTaagfuZio/Smpe2Vk5
   vqS49EEqu6qyKkT6/LFMr2qulEREieErZm9LRsggoT5Px2kB/V+Zk+9YF
   KDRFPqjdrX6HDur0zG6GdGyqYNHRrJzPz4Ffbaxv4f3KqY1YF7b1YbY7I
   fwg28EPZEm+Wcuqx3o5nmdocO2N/rxDhD4ci0YcIVG8ETnSaivekxiWXV
   pqZFPZf3Fzcn4VtUu4dx0WiGR9+mUtFg3ZmMrJzupX/j1Z1wMLq+mIDjL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308677141"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="308677141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 03:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="911654683"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="911654683"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Feb 2023 03:08:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOcsb-0001xK-0J;
	Sun, 05 Feb 2023 11:08:17 +0000
Date: Sun, 5 Feb 2023 19:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 8959/10357] ld.lld: error: no machine record
 defined
Message-ID: <202302051805.Ki6cIpbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fafd96910add124586b549ad005dcd179de8a18
commit: 5eb6e280432ddc9b755193552f3a070da8d7455c [8959/10357] ARM: 9289/1: Allow pre-ARMv5 builds with ld.lld 16.0.0 and newer
config: arm-shannon_defconfig (https://download.01.org/0day-ci/archive/20230205/202302051805.Ki6cIpbV-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5eb6e280432ddc9b755193552f3a070da8d7455c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5eb6e280432ddc9b755193552f3a070da8d7455c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: no machine record defined
>> ld.lld: error: no machine record defined
>> ld.lld: error: no machine record defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
