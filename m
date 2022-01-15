Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F9173
	for <llvm@lists.linux.dev>; Sat, 15 Jan 2022 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642239892; x=1673775892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QND4MUyY31lpyay/oy3VT0yoSi/k/xi8c5d8hhWzIE=;
  b=h7RRNC3Mx7gauOUMcenX/HabObkP11EbKqnS0+JaTJyIL3hN+Gqlsn6t
   i+Otc8D8GzCzb5fCPNo/RY0KrrSs38GnQJhj/1Ij5LAhz4kNHzib1Ixo7
   cbzFUbiR2UfADQr89mO8NI77hWmyYqUivZ4vAeOl3LqZxcoOalrQp21to
   pirAcyous11mLdlPvdnvhPacSIgdbWSVIxj9e7u0Rgf6ZQjE7qdEBISqT
   ccx/HZxYe5d6ltwNtqs6jyGgL7IkwOtRryrQZeYTPrRxagKPCFIexifQe
   FVXgwfSY2EWyIZBkkIn9osvyWH7weTTTcyj9GgJwJQ85HKfJGSPSpFyxi
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="224382182"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="224382182"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2022 01:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="692530403"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2022 01:44:50 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8fc9-0009ba-CT; Sat, 15 Jan 2022 09:44:49 +0000
Date: Sat, 15 Jan 2022 17:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1593/2384]
 ./usr/include/linux/if_bonding.h:47:10: fatal error: 'uapi/linux/sockios.h'
 file not found
Message-ID: <202201151716.5dWSky8j-lkp@intel.com>
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
commit: eb4b43a3bb224895dcd3976b63def55ee42203f5 [1593/2384] headers/deps: net: Optimize the header dependencies of <uapi/linux/if_bonding.h>
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220115/202201151716.5dWSky8j-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=eb4b43a3bb224895dcd3976b63def55ee42203f5
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout eb4b43a3bb224895dcd3976b63def55ee42203f5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/if_bonding.h:47:10: fatal error: 'uapi/linux/sockios.h' file not found
   #include <uapi/linux/sockios.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
