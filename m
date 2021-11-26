Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E15129CA
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 02:39:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235837379"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235837379"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 18:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="539117026"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Nov 2021 18:39:02 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqR8f-0007LE-OZ; Fri, 26 Nov 2021 02:39:01 +0000
Date: Fri, 26 Nov 2021 10:38:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o: warning:
 objtool: dce_i2c_submit_command_sw()+0x670: unreachable instruction
Message-ID: <202111261023.EJCyu7Q7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Lee Jones <lee.jones@linaro.org>
CC: Alex Deucher <alexander.deucher@amd.com>

Hi Lee,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: d56631c58daea614dfb67cc0bf45f5f9f958bfd8 drm/amd/display/dc/dce/dce_i2c_sw: Make a bunch of local functions static
date:   11 months ago
config: x86_64-randconfig-r003-20211008 (https://download.01.org/0day-ci/archive/20211126/202111261023.EJCyu7Q7-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b1a45c62f03ecbeb4544b0c65a01ee4586235a61)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d56631c58daea614dfb67cc0bf45f5f9f958bfd8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d56631c58daea614dfb67cc0bf45f5f9f958bfd8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o: warning: objtool: dce_i2c_submit_command_sw()+0x670: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
