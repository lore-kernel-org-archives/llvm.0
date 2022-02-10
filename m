Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4397D
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 19:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644523028; x=1676059028;
  h=date:from:cc:subject:message-id:mime-version;
  bh=48rds+vohuks24MA+RrAcUe5qJ6NIHdQ8ZLBYc2giF4=;
  b=UWFfHUIVwkV5ZT93RyTsODWocfnNOev8Ft9TRHzAN+TInUTvoIJ/Edsj
   zkdodpr47SIeiDC6Ily/SWYsMAz+RsfU6grOMy+kBRI6Bfk0O7+47t6T4
   tNh8AsLiBUFxH2H32P4t85hyQ+PmgJPtGMukIDQ4KryiABpVX3JNIeGEH
   30gvdBfYBKQSJA9nTOPMWOkJgkOCiHjPo0womBtz9jPQc3J+bHSxTjAee
   6kbmxiOQDug0V+D9q03RhvPJxv4ernGKejdmh83IL6SJvAAIQJHWPGq4n
   86T1gwj74/VZLuO/EiqjMYr1iVNeSI+wK//9bxIcGJKvqhoSVddwcZJ1L
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="229547418"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="229547418"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 11:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="633800040"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Feb 2022 11:57:06 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIFYv-0003gk-VU; Thu, 10 Feb 2022 19:57:05 +0000
Date: Fri, 11 Feb 2022 03:56:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range:
 70368415731712 is not in
Message-ID: <202202110347.xmGwqHjo-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e3c85076d7a6f986445b9008be7e7f83d1b0780a
commit: 63b3f96e1a989846a5a521d4fbef4bc86406929d kvm: Select SCHED_INFO instead of TASK_DELAY_ACCT
date:   9 months ago
config: arm64-randconfig-r035-20220210 (https://download.01.org/0day-ci/archive/20220211/202202110347.xmGwqHjo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d7a245d85c441d0bd44fc7b6c3be8f3de8d)
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

>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368415731712 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368415731712 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368415731712 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368415731712 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368415731712 is not in [-4294967296, 4294967295]

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
