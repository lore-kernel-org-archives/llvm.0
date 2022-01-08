Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CC2C9C
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641666847; x=1673202847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RPLlKS7QXjNchTmA1oMEU6PugeV8pY3fAoX40O/Rbw4=;
  b=RzIw1vauXmZZz+IU2pQRqh1hObqKVZQEDePSxxjdODYAWAT/Zfqey19U
   /V8gbGofZpTrnIxq0npSbkyxfROj34e0g6aeT7hY2+nmg++vqPPvD6K2j
   5FpYxnw/fG59JYZ7y4W9tzmMPQm0HR6HnXVXSs5ZNifTSNBUpO6Jvopdv
   53mPLO5fYURcUZov76ZVFbhyxadSoB4LS3TJVpFenAUgAXslsqNxZ0eU3
   g6ebhs+WzY8dq3gbcPLfeoH7laYDprDtyBR3HUVkGP3c2y641uYkJ/O8v
   sjTfZjuoeLgtBhrUvAmt6vMEPTYKCqXjzodC8BlCAVc4zovDsTFrv0EjR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10221"; a="241845944"
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="241845944"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2022 10:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="471641026"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jan 2022 10:34:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6GXT-0000ui-Rd; Sat, 08 Jan 2022 18:34:03 +0000
Date: Sun, 9 Jan 2022 02:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1594/2375]
 usr/include/linux/netlink.h:5:10: fatal error: 'uapi/linux/types.h' file not
 found
Message-ID: <202201090221.qvOVp5rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   351ceeab2ef96ab2fc306934ddb201b44636181b
commit: e1d1301c65f465182ed976c1641d45e9baf7d83d [1594/2375] headers/deps: net: Optimize <uapi/linux/netlink.h>
config: i386-buildonly-randconfig-r006-20220108 (https://download.01.org/0day-ci/archive/20220109/202201090221.qvOVp5rt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=e1d1301c65f465182ed976c1641d45e9baf7d83d
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout e1d1301c65f465182ed976c1641d45e9baf7d83d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/hyperv/ drivers/clk/ samples/connector/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from samples/connector/ucon.c:14:
>> usr/include/linux/netlink.h:5:10: fatal error: 'uapi/linux/types.h' file not found
   #include <uapi/linux/types.h>
            ^~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
