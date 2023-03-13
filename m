Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F41FD0;
	Mon, 13 Mar 2023 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678695784; x=1710231784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5m1mUmEHGEIlWbeClSBmqo7VD2IYy8jJmKpCUlNu74=;
  b=CJauSRDDTIAl2LUeNoM1wg4Vu7/bXEYYFXZUSu+SRdf94E5CPqu6jznc
   fetGO+A7M/S3KlamYWUAABRQcloPqFCFg9rxUWaihOlHHtw3ju4Qcqe14
   eEGBmUAqi5+cIqe/E8whtTMLN8/RmaEyR0NbrSotaxGq6BU8tBhM5MGJP
   aGR5+Q5PVPz1JoxdiE6ouJx04eRCNg1JTjAAr+dXO1Y4HrPfOTBjsGO99
   0dWgKRCKVOlRPUvWP9DzRvWYwIBcEJzq28t2JafZrpuBOesfRIIhxncl+
   +d1wl6pI0mTEEITBPtTC7gGbF1HYEd2kjYG84M8/3zWJN9XfJQRndVJ6C
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="325447112"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="325447112"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 01:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711041232"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="711041232"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Mar 2023 01:23:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbdSQ-0005Ry-15;
	Mon, 13 Mar 2023 08:23:02 +0000
Date: Mon, 13 Mar 2023 16:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.10.y 649/9999] ERROR: modpost:
 "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
Message-ID: <202303131651.H3xjZ5Lo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   e5f315b55f8e09ac17c968da42f9345f64efcdd2
commit: ba02635769f18a9231aba6e032d65f1fa6c537b4 [649/9999] init/Kconfig: make COMPILE_TEST depend on !S390
config: s390-randconfig-r022-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131651.H3xjZ5Lo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=ba02635769f18a9231aba6e032d65f1fa6c537b4
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout ba02635769f18a9231aba6e032d65f1fa6c537b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131651.H3xjZ5Lo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
>> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
