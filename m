Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41222C99
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639379921; x=1670915921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AIbbmzNZcgzxQKEzVLn/5Cw5O8pw129BW14If9H5KUY=;
  b=aatBznFdS/ue8zCU+wrj+4bI8KFRyd+xkh3gYr9OSXaaogzcv8KK5GCa
   p49nHz6uT4ebW3STXxjn/Y1wfgwFL5xT3tYLsPazOlqcT+BEKIx4AMUxm
   qU0R85zGD09n9DEhJXKZWleqQtpSth6DMYNIn1NRZnmjnsxCN5yrQPlAq
   SW5Yy3/gfXRfW9MghpRNLGTY/yMVlV5nYwNGn72JKpB+v4VGSk/oxLqcu
   D8HFk/TnfJhhavqnL1826Lu4ww9bpkZj78cMqGI5ioDnDG82viYjse1EI
   aHZgFnD6FvfncXKUN4vS39fnqwXtexsYXTa8iUSAGp24Xhq2u/6Csb7bF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="302059235"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="302059235"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2021 23:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="608908851"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2021 23:18:39 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwfbb-0006Qd-8E; Mon, 13 Dec 2021 07:18:39 +0000
Date: Mon, 13 Dec 2021 15:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [asahilinux:asahi-soc/pmgr 1/2] ERROR: modpost:
 "of_phandle_iterator_args" [drivers/soc/apple/apple-pmgr-pwrstate.ko]
 undefined!
Message-ID: <202112131521.YW7Lbttb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/AsahiLinux/linux asahi-soc/pmgr
head:   cc1fe1e54ba565aaec0006796db65b7c3b1ccd69
commit: 6df9d38f9146e83b473f0c9e57fb5fdf3fcc93e2 [1/2] soc: apple: Add driver for Apple PMGR power state controls
config: arm64-randconfig-r006-20211213 (https://download.01.org/0day-ci/archive/20211213/202112131521.YW7Lbttb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/6df9d38f9146e83b473f0c9e57fb5fdf3fcc93e2
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux asahi-soc/pmgr
        git checkout 6df9d38f9146e83b473f0c9e57fb5fdf3fcc93e2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "of_phandle_iterator_args" [drivers/soc/apple/apple-pmgr-pwrstate.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
