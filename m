Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84922607;
	Sat, 13 May 2023 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683972671; x=1715508671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wuoEhTNkz6x7Ky0vlKK2DdDRgs87AC5Bdcx0Wt1nR0=;
  b=Tjrmwswb2iSWU80GoG/XEP/iZQFXmYVqE7YdqRowAhx1KgEEf6KHR5lJ
   tlwEQAbuDZw4KD3xyOcR4N/QrKYBuMjdFT9/TgAzCgNIf7tof1fuGU6EH
   eGXkj6zSAByRK3wD73eYorL/ngVqgPqb6BHUAsAle8LEPNveQAOZo71MB
   ljcWIQ6eNGqqXMlutWGbryGPyv7Sf/KdrDc1/L3aT5iWad8vXZDNlgM3u
   ljhhSMnLnmN1GwWaM4j6D64T6rpbs2Z04I2J+vcEjSn3HfoiUewbwhYlP
   w1+5INn++zUqe6pvTlNVipSv7A9Q3VtkpxJb2cZY0+rQdsVRnXG2jBt06
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340278993"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="340278993"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 03:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733329070"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="733329070"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 May 2023 03:11:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxmDU-0005Rw-1W;
	Sat, 13 May 2023 10:11:08 +0000
Date: Sat, 13 May 2023 18:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1006/2056] Inconsistent kallsyms data
Message-ID: <202305131818.Lwu0Ylpl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e922ba281a8d84f640d8c8e18a385d032c19e185
commit: cebfa83f1497b3a9a78c19aafb9661e889cb7b4d [1006/2056] maple_tree: update testing code for mas_{next,prev,walk}
config: arm-randconfig-r022-20230513 (https://download.01.org/0day-ci/archive/20230513/202305131818.Lwu0Ylpl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cebfa83f1497b3a9a78c19aafb9661e889cb7b4d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cebfa83f1497b3a9a78c19aafb9661e889cb7b4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131818.Lwu0Ylpl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Inconsistent kallsyms data
   Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
