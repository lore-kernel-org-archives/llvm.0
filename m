Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B482CA1
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 18:49:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="223175028"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; 
   d="scan'208";a="223175028"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 10:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; 
   d="scan'208";a="744835039"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2021 10:49:04 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1ms8Bb-000Df9-NL; Tue, 30 Nov 2021 18:49:03 +0000
Date: Wed, 1 Dec 2021 02:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoming Ni <nixiaoming@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4264/4301] ERROR: modpost:
 "unregister_firmware_config_sysctl"
 [drivers/base/firmware_loader/firmware_class.ko] undefined!
Message-ID: <202112010223.eu8GDIdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   34f255a1e91ab44ff8926cf8294ff9144e62e861
commit: cf859436d0e2a12d7c3704ae09dfbf9aba14db38 [4264/4301] firmware_loader: move firmware sysctl to its own files
config: x86_64-randconfig-r022-20211130 (https://download.01.org/0day-ci/archive/20211201/202112010223.eu8GDIdL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cf859436d0e2a12d7c3704ae09dfbf9aba14db38
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cf859436d0e2a12d7c3704ae09dfbf9aba14db38
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "unregister_firmware_config_sysctl" [drivers/base/firmware_loader/firmware_class.ko] undefined!
>> ERROR: modpost: "register_firmware_config_sysctl" [drivers/base/firmware_loader/firmware_class.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
