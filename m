Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39F361;
	Fri, 17 Feb 2023 02:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676599438; x=1708135438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQ1JyLYWmQQ9Edy/9UyAtpbJmFajAhYG9prNa3ujYTw=;
  b=oDpf5GotTjDsTiy/F2QGHyr6SIBOb99O0bRE8NB8fROO78zU59gTngix
   owoTq3PlpKlje3mfDjOMcJfuhUYdvzfnnk+QeFa828JmclEMTZ8BkmL3u
   ZdiJUMQ7yc/sjib7KIUq4YD8rv+b1D+sR01UIOASDdZeSgiLayEfxlQjH
   TsZdyheFRHcYgoi2atAGnzRVwJUGhYldnSyRHwH+DZGahMHm9szLmtLWM
   RxBQlIehJErhAubFwWDqNFeqoW4iE7oncJ8giGQ0n2+NpjFQD5OA/nE5J
   i4BKr8SwdcWnhykThN27Ez3yIuDMlJGZ7APiPePUjvLQ8O9Di7pf4MF25
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315601830"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="315601830"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 18:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="739092560"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="739092560"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Feb 2023 18:03:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSq6N-000B2f-1j;
	Fri, 17 Feb 2023 02:03:55 +0000
Date: Fri, 17 Feb 2023 10:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.10.y 2001/9999] ERROR: modpost:
 "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
Message-ID: <202302171013.1HMK7qhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   707c48210a5384a72c82655a37895b7e822755f2
commit: ba02635769f18a9231aba6e032d65f1fa6c537b4 [2001/9999] init/Kconfig: make COMPILE_TEST depend on !S390
config: s390-randconfig-r044-20230216 (https://download.01.org/0day-ci/archive/20230217/202302171013.1HMK7qhy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=ba02635769f18a9231aba6e032d65f1fa6c537b4
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout ba02635769f18a9231aba6e032d65f1fa6c537b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171013.1HMK7qhy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
