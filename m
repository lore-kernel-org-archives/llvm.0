Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469736C
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648622625; x=1680158625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tcfB2S2ILUhA3UhWMEyqaxQrE9WW+j9PxezbmQ7LdU0=;
  b=APWkBowoV4oWKdNDKKc8c9tTxZkdlSGBV6dA0jyOsa9PKOH5BmNy2sUf
   EsLaaQbsPaZsYc03UkM946ttziB+Rf0KyYO+rlI5LuXU6KAtQyTBJ95j5
   pGUqGUgY9N2tKm9si6Oafmxe9w4oc43suMednxwP8JV7NRlYNAZ+eciF8
   gVwwo1vt1g3ymt8ekOMesERb1d0dQ/MF+FeE0vnJg/WB+VdacgV7/VRQo
   WhMXbWnvl+zOuMjKwSv1xwOalOMjdOrZilw5JeOnt8fiWEraj8opXDGLw
   h1+/5mT4tOX+JxriXbulJjYjPC0LTnl0nm2dTzmPxH9yaEIhIN1yJeGKz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259645493"
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="259645493"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 23:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="653637195"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2022 23:43:42 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZS3S-000147-0Y; Wed, 30 Mar 2022 06:43:42 +0000
Date: Wed, 30 Mar 2022 14:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range:
 274538708992 is not in
Message-ID: <202203301438.3WBEerVd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c24a186398f59c80adb9a967486b65c1423a59d
commit: 63b3f96e1a989846a5a521d4fbef4bc86406929d kvm: Select SCHED_INFO instead of TASK_DELAY_ACCT
date:   11 months ago
config: arm64-randconfig-r001-20220330 (https://download.01.org/0day-ci/archive/20220330/202203301438.3WBEerVd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=63b3f96e1a989846a5a521d4fbef4bc86406929d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 63b3f96e1a989846a5a521d4fbef4bc86406929d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 274538708992 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 274538708992 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 274538708992 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 274538708992 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 274538708992 is not in [-4294967296, 4294967295]

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
