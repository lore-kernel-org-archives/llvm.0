Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B229CA
	for <llvm@lists.linux.dev>; Sat, 15 Jan 2022 14:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642256524; x=1673792524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0fB5+2LlGwFz+nC626bb9OcnsTLxVoOh1VGivG/Iwg=;
  b=dRis9zdtyS8lwYT7C2lqNo58jPLDXy1h0KUP21svKECpqeE8pfJ9GRqd
   s1xxX4wdOdPp52YIQRCggf2vU6JkY5DwUBSzy2hHhI8WdD0nSYY+oJtPB
   kQE/Q2feNM8rV5JfB4nw4txWE6GkmNu4DcxFtIDatn2FNpBxM/vVRfNCY
   9VsjlCxKpq5XQZPo3h7NKyU3NgEY6ktV8a0/BBmD87IT2nXJ2pEGkcsXY
   cGIcCLqbx1FdDuZ3A2g4MZlh7AjtQBZTZRAIyVl2FiDR4VfHAsXge7vLG
   iXxg2tbrHWgUYTJSdPUMsjcGV29Bccaldk2g164uc7Yn4avla/xHMn8tW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="231767730"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="231767730"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2022 06:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="559822118"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jan 2022 06:22:02 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8jwQ-0009sm-8P; Sat, 15 Jan 2022 14:22:02 +0000
Date: Sat, 15 Jan 2022 22:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1595/2384]
 ./usr/include/linux/if_link.h:5:10: fatal error: 'uapi/linux/netlink.h' file
 not found
Message-ID: <202201152228.l7UYAZdZ-lkp@intel.com>
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
head:   4c707c1c0de83967079b4e385012fa5b00e2cd11
commit: 60d16930c980493906092825024aebd0235c0f37 [1595/2384] headers/deps: net: Optimize <uapi/linux/if_link.h>
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220115/202201152228.l7UYAZdZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=60d16930c980493906092825024aebd0235c0f37
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 60d16930c980493906092825024aebd0235c0f37
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/if_arp.h:27:
   In file included from ./usr/include/linux/netdevice.h:32:
>> ./usr/include/linux/if_link.h:5:10: fatal error: 'uapi/linux/netlink.h' file not found
   #include <uapi/linux/netlink.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
