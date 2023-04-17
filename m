Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C65AD2D;
	Mon, 17 Apr 2023 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681768027; x=1713304027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EzOsyFFM6QOJEt8ppPE7FZu8aVW4n94hzGuyUfT2rtY=;
  b=nrwkjdaQJwQWaLceBWMFPhZT9OxinKm0lx7ReQaupxrpoqK/2+tfaqnj
   jWj5Z6TUeY1+YtQyuXkyL//VUntMFFG7GIg94i7nDqf7kFcD7P1tL9yP8
   Cy6t5GyQnV9UlDcL0jFd8J9HoaHC9VHBIDoGhJdz/IvHPJeQzBoS2ZYxW
   97NLPEVB56PsoSXKtKaODiuke6Bs2KuZAzMTl75eUHPuERJEPQg37JozM
   IJ+3N+esDniDlN+xUSZP0WnAIEElAuCkVmIYSFrly+hkeRhvsppDwvmr4
   YA+wRJu5RTC2kk/M3k6KSVdqyJUygEpg8vLIX0+87QvU9OeHg0peMgT91
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407910362"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="407910362"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 14:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="814963201"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="814963201"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Apr 2023 14:47:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poWgi-000cgl-0r;
	Mon, 17 Apr 2023 21:47:04 +0000
Date: Tue, 18 Apr 2023 05:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: ld.lld: error: assignment to symbol __init_end does not converge
Message-ID: <202304180555.xZBCEnvs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
commit: f70b3a23324a2d31efb83cc01302acb343e4ec1b arm64: head: create a temporary FDT mapping in the initial ID map
date:   10 months ago
config: arm64-randconfig-r014-20230417 (https://download.01.org/0day-ci/archive/20230418/202304180555.xZBCEnvs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f70b3a23324a2d31efb83cc01302acb343e4ec1b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f70b3a23324a2d31efb83cc01302acb343e4ec1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180555.xZBCEnvs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __init_end does not converge

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
