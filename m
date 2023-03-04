Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91D184F;
	Sat,  4 Mar 2023 12:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677933716; x=1709469716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOl3cbpUD1Dx9q9FQBpQIuhy8+PV/IYspNeaKDalGv0=;
  b=oGOHBlUvFMa1dyi/lSpkS2LNh7fkSdhyNcA+a42Dlk6+1+wQts3az09j
   0X9tLIY2EShWnjKXplU0tV8gXONIl5sImZ0q79mW9MhWuzuleUYin/IWK
   xx2Olr9cQwe8keu7YxeePaMf5y8GjBCopaHWqzKESsu4UzAw5Je1DwgCs
   XBNE+s53y+NHCljdn67d0q4Ly2hOYnEhPGKHvf9AlNdY2+WS3NmcfbuMq
   cF0tH5FzoVlj0kDg9Rm7bkBp14eaii1ROzeo9rAY1JczjLET5CdK1iJE4
   lRT6yX1jLDmSqygC0DHVUrsLmvFTw5hJlpIZdST7V8RBFCSYHMczgGbcj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="314912255"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="314912255"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 04:41:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799510458"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="799510458"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2023 04:41:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYRCz-0002AE-0H;
	Sat, 04 Mar 2023 12:41:53 +0000
Date: Sat, 4 Mar 2023 20:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: ye xingchen <ye.xingchen@zte.com.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 3/16] Inconsistent kallsyms data
Message-ID: <202303042034.Cjc7JTd0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   8e66dbeb1a7d8e0dc9d392a5f29c2570ee9379a2
commit: 21baac5614dc603df6cd2783a7427a0ce7689632 [3/16] Kconfig.debug: fix SCHED_DEBUG dependency
config: arm-randconfig-r003-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042034.Cjc7JTd0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=21baac5614dc603df6cd2783a7427a0ce7689632
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-nonmm-unstable
        git checkout 21baac5614dc603df6cd2783a7427a0ce7689632
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042034.Cjc7JTd0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Inconsistent kallsyms data
   Try make KALLSYMS_EXTRA_PASS=1 as a workaround

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
