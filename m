Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A76612E;
	Mon,  3 Apr 2023 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680531676; x=1712067676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSZZY4s/HxNN3z2RGTWKu6jFoqAp/p6Cwq9YHG0bmng=;
  b=L1o4ri3FVgfr3rsJEzoZkHUQ52Cc0VUrcuTspInXy20xlcC+ZxjTFwXy
   3iIOgG2zI+/b5l/+K7hre7ucMhUnrfhxRb4OurxpQsYq+/KxSwDUnL2LP
   8nhhUFkxG2m7UIvTaKD7hVmiIwYVPQm/ymomSUTASXCuMnpPobn0LtByt
   mM32Z0G66iX8OSechUt1E9AiTS770delVf/fgF8ekyLhekCAuTEoG166a
   ZSbrVel2FEFN7rokqKUhab4N2pD4Vq0xyWXo28rWlnPUq+SBky+K2qAvl
   4vjEjLY1Uc7XqLRQLQUpIxb9nTr9o+PZTt738halLz/W2fr3d8R1+gBOu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="344461728"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="344461728"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 07:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="718559467"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="718559467"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Apr 2023 07:21:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjL3Y-000OOD-0R;
	Mon, 03 Apr 2023 14:21:12 +0000
Date: Mon, 3 Apr 2023 22:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	Christoph Hellwig <hch@lst.de>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 5319/9999] ld.lld: error:
 drivers/nvme/host/core.o: contains a compressed section, but zlib is not
 available
Message-ID: <202304032219.jG1sChqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sagi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   09b1a76e7879184fb35d71a221cae9451b895fff
commit: 3e9aa125f69c0006d10f101898932acedc942b59 [5319/9999] nvme-tcp: remove incorrect Kconfig dep in BLK_DEV_NVME
config: x86_64-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230403/202304032219.jG1sChqf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3e9aa125f69c0006d10f101898932acedc942b59
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 3e9aa125f69c0006d10f101898932acedc942b59
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304032219.jG1sChqf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
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
