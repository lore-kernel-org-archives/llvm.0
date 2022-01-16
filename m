Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC602C82
	for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 03:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642304331; x=1673840331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82Yhw20nnkzurgz2MQxUvFN3bM7YTd6lLh9md2QUsNo=;
  b=Btv7iZ/bSIsQuUrubgVsy60qDx/HbJgJeTN1fEWx6/eWzufq+mzmif6P
   Bu698GCGf//vNdOiwQEDsOkVyAgfErsD4j4xQ7iLc3I4RUiqkwPd3LqHj
   13HfqA/wH+5buwefn6xEagsHV8enAefCSYFpwaOsSgMcOlb5t79RYoFpe
   dOdFSO4I6erMj2w4AKxmV/ceHJmXy6KL8R7VNhzySE41ZFMmiPICVQnNW
   5MMCAgzvNlIeNAu7nwycmtPu3mLwAk/l/jWbJ0US80z+/PA0h2Y7bM4jY
   b/0EzYHSEXuPIUfxELkWN+coOYfdpM7SgSXeaGDQCooM1FltrQrYHYDtO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="244654586"
X-IronPort-AV: E=Sophos;i="5.88,292,1635231600"; 
   d="scan'208";a="244654586"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2022 19:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,292,1635231600"; 
   d="scan'208";a="692686765"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2022 19:38:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8wNS-000AQb-RS; Sun, 16 Jan 2022 03:38:46 +0000
Date: Sun, 16 Jan 2022 11:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1942/2384]
 ./usr/include/linux/neighbour.h:5:10: fatal error: 'uapi/linux/types.h' file
 not found
Message-ID: <202201161121.JU52U7sL-lkp@intel.com>
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
commit: 57aa2dcd6f974cdffe2dcc9e9dd7b9c6379d1183 [1942/2384] headers/deps: net: Optimize <uapi/linux/neighbour.h> dependencies
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220116/202201161121.JU52U7sL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=57aa2dcd6f974cdffe2dcc9e9dd7b9c6379d1183
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 57aa2dcd6f974cdffe2dcc9e9dd7b9c6379d1183
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/neighbour.h:5:10: fatal error: 'uapi/linux/types.h' file not found
   #include <uapi/linux/types.h>
            ^~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
