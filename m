Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA42C9D
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 19:02:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="236121464"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="236121464"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 11:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="461952562"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2021 11:02:16 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muJFf-000Lc2-Uu; Mon, 06 Dec 2021 19:02:15 +0000
Date: Tue, 7 Dec 2021 03:01:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4200/5235]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.o: warning: objtool:
 amdgpu_ih_wait_on_checkpoint_process_ts()+0x1ac: unreachable instruction
Message-ID: <202112070223.yhUkc9YP-lkp@intel.com>
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
TO: Philip Yang <Philip.Yang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <Felix.Kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d02ef4b57f6e7d4dcba14d40cf05373a146a605
commit: 3c2d6ea27955cfac8590884d207353eece8c2cee [4200/5235] drm/amdgpu: handle IH ring1 overflow
config: x86_64-randconfig-a015-20211205 (https://download.01.org/0day-ci/archive/20211207/202112070223.yhUkc9YP-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3c2d6ea27955cfac8590884d207353eece8c2cee
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3c2d6ea27955cfac8590884d207353eece8c2cee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash crypto// drivers/ fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_ih.o: warning: objtool: amdgpu_ih_wait_on_checkpoint_process_ts()+0x1ac: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
