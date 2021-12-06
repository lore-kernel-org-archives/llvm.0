Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16632CA8
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 13:55:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="224182669"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="224182669"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 05:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="678990196"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2021 05:55:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muESS-000LJo-7M; Mon, 06 Dec 2021 13:55:08 +0000
Date: Mon, 6 Dec 2021 21:54:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4198/5235]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.o: warning: objtool:
 smu_dpm_set_power_gate()+0x1f4: unreachable instruction
Message-ID: <202112062128.RL096pj7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lijo Lazar <lijo.lazar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Guchun Chen <guchun.chen@amd.com>
CC: Kevin Yang <kevinyang.wang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d02ef4b57f6e7d4dcba14d40cf05373a146a605
commit: 85c1b9bd13b0b298bbbf128e26a470ec54c4d0e3 [4198/5235] drm/amd/pm: Add warning for unexpected PG requests
config: x86_64-randconfig-a015-20211205 (https://download.01.org/0day-ci/archive/20211206/202112062128.RL096pj7-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=85c1b9bd13b0b298bbbf128e26a470ec54c4d0e3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 85c1b9bd13b0b298bbbf128e26a470ec54c4d0e3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash crypto// drivers/ fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.o: warning: objtool: smu_dpm_set_power_gate()+0x1f4: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
