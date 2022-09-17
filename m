Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D72F21
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663422541; x=1694958541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UQEmgGFwCoDXb01xQxoEcXfEgVOV+wiQZrTXROGVeyg=;
  b=Z4+gwGNwQ8ujIKHOTvRmVyAPIVnmF/ydVcIvs+yYUcQA0egVgyFIxWRZ
   Js5W+e8OqtRCQOndyPkMiklidDMo4E9X1keYCJYG3Fpy9rh6ZYcTU9CUa
   Ut4j00jgydV2MYQyhKn1ZBDtqtQSv47svpoxp6Rr0xJSUuQhWCfD/8YdJ
   fJaU7f7H67LaUyR+pNmL3xfJvOyAY6RRjKrZ7owRQhx3PM+6mQLvwsDNg
   eSYJiZFvfH+1QdO6N5JOD0UVsUErqItiH7mFy9DZjoI3+60t51aVfLZT8
   6JS4q8iiS2t3/A+0KaiEvFiq3NlmQdXiUvYuRYglWU6SMGW7/Ux+6kL6A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="325434028"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="325434028"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 06:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="595562658"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Sep 2022 06:48:58 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZYBm-0000N9-0r;
	Sat, 17 Sep 2022 13:48:58 +0000
Date: Sat, 17 Sep 2022 21:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: ld.lld: error: assignment to symbol __init_end does not converge
Message-ID: <202209172159.AjlIRYQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: f70b3a23324a2d31efb83cc01302acb343e4ec1b arm64: head: create a temporary FDT mapping in the initial ID map
date:   3 months ago
config: arm64-randconfig-r006-20220917 (https://download.01.org/0day-ci/archive/20220917/202209172159.AjlIRYQP-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __init_end does not converge

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
